# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\fusion\disulfides+noe\5WOW\seeds\seed_0\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.605 A
- tm_score_ca_ordered: 0.1254215921465867
- heavy_atom_rmsd: 7.416 A
- sidechain_heavy_atom_rmsd: 7.915 A
- **all-atom quality (honest):** heavy 7.416 A, sidechain 7.915 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 30
- bin_accuracy: 0.600

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=1.0, max_incompat=2.26Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C28** — severity 0.92, 1 conflict(s); suspect input ~`R23` (group: pull_in)
  - pull-in (wants closer): Q8@3.8Å(now 8.6,conf 0.58)
  - Q8↔R23: targets 3.8/4.4Å but partners are 10.4Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=7 · 3-10(G)=4 · coil(C)=1

```
CHHEEHGHHHHGEHHHHHHHHEGHHEHHEHHHHHGHE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=15 · sheet=11
  - V2 ↔ I6  (helix)
  - I6 ↔ C10  (helix)
  - C10 ↔ S14  (helix)
  - R11 ↔ D15  (helix)
  - S14 ↔ G18  (helix)
  - D15 ↔ A19  (helix)
  - C16 ↔ C20  (helix)
  - P17 ↔ I21  (helix)
  - C20 ↔ G24  (helix)
  - I21 ↔ N25  (helix)
  - G24 ↔ C28  (helix)
  - Y27 ↔ P31  (helix)
  - C28 ↔ Y32  (helix)
  - Y30 ↔ V34  (helix)
  - Y32 ↔ D36  (helix)
  - P4 ↔ D13  (sheet)
  - P4 ↔ C22  (sheet)
  - K5 ↔ D13  (sheet)
  - K5 ↔ C22  (sheet)
  - D13 ↔ C22  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=328 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=204 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3267 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
