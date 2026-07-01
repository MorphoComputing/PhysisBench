# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2KNM\seeds\seed_4\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.034 A
- tm_score_ca_ordered: 0.13254294682043324
- heavy_atom_rmsd: 6.834 A
- sidechain_heavy_atom_rmsd: 7.410 A
- **all-atom quality (honest):** heavy 6.834 A, sidechain 7.410 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 133
- bin_accuracy: 0.406

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.036), conflicts/hub=1.0, max_incompat=1.52Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S14** — severity 0.88, 1 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 6.6,conf 0.58)
  - push-out (wants farther): C21@10.7Å(now 7.3,conf 0.82), S20@7.6Å(now 4.9,conf 0.69)
  - E5↔I17: targets 3.8/3.8Å but partners are 9.1Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=7 · 3-10(G)=3 · coil(C)=3

```
CHHHEHEHHHHHHHEHCECEHHGHEGGE
```

## Backbone H-bond Network

- total=21 · helix(i→i+4)=7 · sheet=14
  - P2 ↔ S6  (helix)
  - G4 ↔ V8  (helix)
  - S6 ↔ I10  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - I10 ↔ S14  (helix)
  - C12 ↔ A16  (helix)
  - E5 ↔ S15  (sheet)
  - E5 ↔ G18  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ V25  (sheet)
  - C7 ↔ S15  (sheet)
  - C7 ↔ S20  (sheet)
  - C7 ↔ V25  (sheet)
  - S15 ↔ S20  (sheet)
  - S15 ↔ V25  (sheet)
  - S15 ↔ R28  (sheet)
  - G18 ↔ V25  (sheet)
  - G18 ↔ R28  (sheet)
  - S20 ↔ V25  (sheet)
  - … +1 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=7 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=136 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=73 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.6223 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
