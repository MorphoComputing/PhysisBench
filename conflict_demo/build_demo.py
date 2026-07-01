"""
build_demo.py — reproducible builder for the Input Self-Consistency Auditing demo.

Demonstrates a capability a single-output structure predictor (AlphaFold2, ESMFold)
does NOT provide: the engine audits the internal consistency of its own distance
evidence and, when the evidence is self-contradictory, raises a conflict signature
and localizes the offending residues — blind to the experimental structure.

Two named GLP-1-family drugs are used as scaffolds:
    3IOL  — GLP-1 (the incretin target itself)
    1JRJ  — exendin-4 / exenatide (a marketed GLP-1 receptor agonist)

For each scaffold we fold three inputs under one identical production configuration:
    clean   the dense, internally-consistent 0pct distance-restraint input
    inj1    the same input + 1 deliberately contradictory crosslink
    inj2    the same input + 2 deliberately contradictory crosslinks

Each injected crosslink claims a short (2-6 A) contact between a residue pair that
the rest of the evidence places ~20-28 A apart — a plausible-looking but wrong
mid-range restraint, not a trivially-detectable 50 A terminus pair. The injected
pairs are the known ground truth (tagged `crosslink_FALSE_injected` in the input),
so the engine's localization is scored against them. The consistency assessment is
reference-free; the native structure is consulted only afterwards for CA-RMSD.

Folding configuration (mirrors the GLP-1 benchmark's 0pct_hicap condition):
    raised distance-bin ceiling --disto-max-bin 65, --helix-prior
    --helix-prior-ensemble, best-of-10, FULL Phase B, blind GA (energy) objective.

Run (from the repo root, with a Python 3.11 environment that has OpenMM installed so
Phase B all-atom refinement is available):
    python PhysisBench/conflict_demo/build_demo.py
    # flags: --best-of N  --refold (re-run folds even if a report exists)
    #        --only 3IOL   (subset)   --dry-run (build inputs + print plan, no fold)

Drives the metered production CLI (consumes fold credits).
"""
from __future__ import annotations

import argparse
import csv
import json
import os
import re
import subprocess
import sys
import types
from pathlib import Path

# ── Layout ────────────────────────────────────────────────────────────────────
DEMO_DIR = Path(__file__).resolve().parent
REPO_ROOT = DEMO_DIR.parents[1]
BENCH = REPO_ROOT / "PhysisFold" / "benchmark"
SYS_DIR = BENCH.parent / "system"
GENERIC = SYS_DIR / "physis_fold_oracle_generic.py"

CAP = 65                                                  # A, raised distance-bin ceiling
EXTRA = ",".join(str(e) for e in range(35, CAP + 1, 5))  # 35..65

SCAFFOLDS = {
    "3IOL": "GLP-1 (incretin target)",
    "1JRJ": "exendin-4 / exenatide (marketed GLP-1R agonist)",
}

# Contradiction selection band: a crosslink claims a 2-6 A contact, so any real pair
# this far apart is a genuine contradiction. We avoid trivial >40 A terminus pairs
# and pick plausible mid-range pairs (sensitivity, not just catching the obvious).
BAND_LO, BAND_HI = 20.0, 28.0
MIN_SEQ_SEP = 8

# ── bench_builder import (in-process artifact build at the raised ceiling) ───────
os.environ["PHYSIS_DISTO_EXTRA_EDGES"] = EXTRA
sys.path.insert(0, str(BENCH / "code_parts"))
sys.path.insert(0, str(SYS_DIR))
for _a in ("physis_fold_oracle", "OrganicFlow"):
    if _a not in sys.modules:
        _m = types.ModuleType(_a)
        _m.__path__ = [str(SYS_DIR)]
        _m.__package__ = _a
        sys.modules[_a] = _m
import bench_builder  # noqa: E402


def _bin_centers(edges: list) -> list:
    return [(edges[b] + edges[b + 1]) / 2 for b in range(len(edges) - 1)]


def _expected_d(probs: list, centers: list) -> float:
    return sum(p * c for p, c in zip(probs, centers))


def _short_contact_probs(edges: list) -> list:
    """A crosslink-style claim: all mass on the 2-6 A bins."""
    nb = len(edges) - 1
    probs = [1.0 if (edges[b] >= 2.0 and edges[b + 1] <= 6.0) else 0.0 for b in range(nb)]
    if sum(probs) == 0:
        probs[0] = 1.0
    s = sum(probs)
    return [p / s for p in probs]


def _pick_contradictions(artifact: dict, k: int = 2) -> list:
    """Greedy: the k farthest-apart real pairs (in the BAND) that share no residue —
    so each contradiction is a distinct, localizable site."""
    edges = artifact["meta"]["bin_edges"]
    centers = _bin_centers(edges)
    cand = []
    for p in artifact["pairs"]:
        if p.get("provenance") == "crosslink_FALSE_injected":
            continue
        i, j = int(p["i"]), int(p["j"])
        if j - i < MIN_SEQ_SEP:
            continue
        ed = _expected_d(p["probs"], centers)
        if BAND_LO <= ed <= BAND_HI:
            cand.append((i, j, ed))
    cand.sort(key=lambda x: -x[2])  # farthest within the band first
    chosen, used = [], set()
    for i, j, ed in cand:
        if i in used or j in used:
            continue
        chosen.append((i, j, round(ed, 1)))
        used.update((i, j))
        if len(chosen) == k:
            break
    return chosen


def _inject(clean: dict, pairs: list) -> dict:
    """Return a copy of `clean` with `pairs` added as FALSE short-contact crosslinks."""
    out = json.loads(json.dumps(clean))
    probs = _short_contact_probs(out["meta"]["bin_edges"])
    for (i, j, _ed) in pairs:
        out["pairs"].append({
            "i": i, "j": j, "probs": list(probs), "confidence": 0.44,
            "provenance": "crosslink_FALSE_injected",
        })
    out.setdefault("source_stats", {})
    out["meta"]["mode_label"] = (out["meta"].get("mode_label", "") +
                                 f" +{len(pairs)} FALSE crosslink(s)")
    return out


def _res_label(seq: str, idx0: int) -> str:
    """1-based fold-index label with the residue letter, e.g. 'F2'."""
    aa = seq[idx0] if 0 <= idx0 < len(seq) else "X"
    return f"{aa}{idx0 + 1}"


def _focus_residues(focus: str) -> set:
    """Residue numbers named by a root_cause focus. 'T4-A12' -> {4..12}; 'F2' -> {2}."""
    nums = [int(n) for n in re.findall(r"(\d+)", focus or "")]
    if len(nums) >= 2 and ("-" in (focus or "")):
        lo, hi = min(nums[:2]), max(nums[:2])
        return set(range(lo, hi + 1))
    return set(nums)


# ── Folding (production CLI, metered) ───────────────────────────────────────────
def _fold(artifact_path: Path, ref: Path, out_dir: Path, tag: str, best_of: int) -> Path:
    out_dir.mkdir(parents=True, exist_ok=True)
    rep = out_dir.parent / "reports" / f"{tag}.json"
    rep.parent.mkdir(parents=True, exist_ok=True)
    cmd = [
        sys.executable, str(GENERIC),
        "--sequence", str(ref),
        "--distogram-artifact", str(artifact_path),
        "--disto-max-bin", str(CAP),
        "--out", str(out_dir / f"{tag}.pdb"),
        "--report-json", str(rep),
        "--report-md", str(out_dir.parent / "reports" / f"{tag}.md"),
        "--best-of", str(best_of), "--workers", "2", "--cores-per-job", "2",
        "--local-anchors", "--ga-fitness", "energy", "--sidechain-mode", "rotamer",
        "--helix-prior", "--helix-prior-ensemble",
        "--run",
    ]
    env = dict(os.environ)
    env.pop("PHYSIS_DISTO_EXTRA_EDGES", None)  # the CLI flag re-derives it from --disto-max-bin
    proc = subprocess.run(cmd, capture_output=True, text=True, encoding="utf-8",
                          errors="replace", env=env)
    (out_dir / f"{tag}.stdout.log").write_text(
        (proc.stdout or "") + "\n--- STDERR ---\n" + (proc.stderr or ""), encoding="utf-8")
    if not rep.exists():
        raise RuntimeError(f"fold FAILED for {tag} (rc={proc.returncode}); see {tag}.stdout.log")
    return rep


def _score(rep_path: Path, planted: set, seq: str) -> dict:
    r = json.loads(rep_path.read_text())
    cs = r.get("conflict_summary", {}) or {}
    m = cs.get("metrics", {}) or {}
    roots = cs.get("root_causes", []) or []
    flagged = set()
    for rc in roots:
        flagged |= _focus_residues(rc.get("focus", ""))
    inter = flagged & planted
    return {
        "ca_rmsd": round(r.get("ca_rmsd"), 2) if r.get("ca_rmsd") is not None else None,
        "signature": cs.get("signature", "NONE"),
        "total_conflicts": cs.get("total_conflicts", 0),
        "conflicts_explained_by_roots": cs.get("conflicts_explained_by_roots", 0),
        "max_incompatibility_ang": m.get("max_incompatibility_ang"),
        "n_hub_residues": m.get("n_hub_residues"),
        "root_cause_foci": ";".join(rc.get("focus", "") for rc in roots),
        "planted": ";".join(_res_label(seq, p - 1) for p in sorted(planted)) if planted else "",
        "localized": (bool(inter) if planted else None),
        "precision": (round(len(inter) / len(flagged), 3) if flagged and planted else None),
        "recall": (round(len(inter) / len(planted), 3) if planted else None),
    }


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("--best-of", type=int, default=10)
    ap.add_argument("--refold", action="store_true", help="re-fold even if a report exists")
    ap.add_argument("--only", nargs="*", default=None, help="subset of scaffolds")
    ap.add_argument("--dry-run", action="store_true", help="build inputs + print plan, no fold")
    args = ap.parse_args()

    ids = args.only or list(SCAFFOLDS)
    rows = []
    for pid in ids:
        print(f"\n########## {pid} — {SCAFFOLDS[pid]} ##########", flush=True)
        ref = BENCH / "set_glp1" / pid / "sequence" / f"{pid}.pdb"
        in_dir = DEMO_DIR / pid / "inputs"
        in_dir.mkdir(parents=True, exist_ok=True)

        # 1. clean 0pct artifact at the raised ceiling
        clean_path = in_dir / "clean.distogram.json"
        bench_builder.build_artifact_file(str(ref), "L0", str(clean_path), seed=0)
        clean = json.loads(clean_path.read_text())
        seq = clean["meta"]["sequence"]
        n = clean["meta"]["n_residues"]

        # 2. choose 2 contradictions and write inj1 / inj2
        contra = _pick_contradictions(clean, k=2)
        if len(contra) < 2:
            raise RuntimeError(f"{pid}: could not find 2 in-band contradictions ({contra})")
        labels = [f"{_res_label(seq, i)}-{_res_label(seq, j)} (~{ed} A apart)" for i, j, ed in contra]
        print(f"  n_residues={n}  contradictions: {labels}")
        (in_dir / "inj1.distogram.json").write_text(json.dumps(_inject(clean, contra[:1]), indent=2))
        (in_dir / "inj2.distogram.json").write_text(json.dumps(_inject(clean, contra[:2]), indent=2))

        # planted residue sets (1-based fold index = 0-based endpoint + 1)
        planted = {
            "clean": set(),
            "inj1": {contra[0][0] + 1, contra[0][1] + 1},
            "inj2": {contra[0][0] + 1, contra[0][1] + 1, contra[1][0] + 1, contra[1][1] + 1},
        }
        if args.dry_run:
            continue

        # 3. fold the three cases and score
        for tag in ("clean", "inj1", "inj2"):
            art = in_dir / f"{tag}.distogram.json"
            rep = DEMO_DIR / pid / "reports" / f"{tag}.json"
            if rep.exists() and not args.refold:
                print(f"  [{tag}] report exists — reusing (use --refold to redo)")
            else:
                print(f"  [{tag}] folding (best-of-{args.best_of}, full Phase B)…", flush=True)
                rep = _fold(art, ref, DEMO_DIR / pid / "fold", tag, args.best_of)
            sc = _score(rep, planted[tag], seq)
            sc.update({"scaffold": pid, "case": tag,
                       "n_contradictions": {"clean": 0, "inj1": 1, "inj2": 2}[tag]})
            rows.append(sc)
            print(f"    sig={sc['signature']:20s} total={sc['total_conflicts']:>3} "
                  f"roots={sc['root_cause_foci'] or '-':12s} planted={sc['planted'] or '-':12s} "
                  f"loc={sc['localized']} P={sc['precision']} ca={sc['ca_rmsd']}")

    if args.dry_run or not rows:
        return

    cols = ["scaffold", "case", "n_contradictions", "signature", "total_conflicts",
            "conflicts_explained_by_roots", "max_incompatibility_ang", "n_hub_residues",
            "root_cause_foci", "planted", "localized", "precision", "recall", "ca_rmsd"]
    with open(DEMO_DIR / "summary.csv", "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=cols)
        w.writeheader()
        for r in rows:
            w.writerow({c: r.get(c) for c in cols})
    print(f"\nwrote {DEMO_DIR / 'summary.csv'} ({len(rows)} rows)")


if __name__ == "__main__":
    main()
