# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\experimental_restraints\nmr_star\5WOW\seeds\seed_0\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.217 A
- tm_score_ca_ordered: 0.10486578481524651
- heavy_atom_rmsd: 8.473 A
- sidechain_heavy_atom_rmsd: 9.249 A
- **all-atom quality (honest):** heavy 8.473 A, sidechain 9.249 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 20
- distogram_pairs: 36
- bin_accuracy: 0.472

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=1.0, max_incompat=2.1Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C28** — severity 0.85, 1 conflict(s); suspect input ~`G24` (group: pull_in)
  - pull-in (wants closer): C10@4.1Å(now 6.7,conf 0.43)
  - C10↔G24: targets 4.1/4.4Å but partners are 10.6Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=5 · 3-10(G)=3 · coil(C)=1

```
CHHHEHHHHHHHHHHHHHHHHHGEHEHHHHHGEHHGE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=12 · sheet=4
  - V2 ↔ I6  (helix)
  - P4 ↔ Q8  (helix)
  - I6 ↔ C10  (helix)
  - Q8 ↔ R12  (helix)
  - C10 ↔ S14  (helix)
  - R11 ↔ D15  (helix)
  - R12 ↔ C16  (helix)
  - D15 ↔ A19  (helix)
  - C16 ↔ C20  (helix)
  - I21 ↔ N25  (helix)
  - N25 ↔ G29  (helix)
  - Y30 ↔ V34  (helix)
  - G24 ↔ D33  (sheet)
  - G24 ↔ Y37  (sheet)
  - G26 ↔ D33  (sheet)
  - G26 ↔ Y37  (sheet)

## Solvent Accessibility (burial)

- buried=22 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=262 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=147 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2503 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=20 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
