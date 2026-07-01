# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2KNM\seeds\seed_8\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.078 A
- tm_score_ca_ordered: 0.0711482374871332
- heavy_atom_rmsd: 7.159 A
- sidechain_heavy_atom_rmsd: 8.047 A
- **all-atom quality (honest):** heavy 7.159 A, sidechain 8.047 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 135
- bin_accuracy: 0.563

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G18-C21 → 8 conflicts (67%); I1-C3 → 4 conflicts (33%)
- explained: 12/12 conflicts by 2 root cause(s)
- metrics: hubs=6 (frac 0.214), conflicts/hub=2.0, max_incompat=3.88Å, chain_span=0.893
- **fix-first:** [LOW_CONFLICT] Root cause(s): G18-C21 + I1-C3 — explain ~12/12 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C19** — severity 3.74, 3 conflict(s); suspect input ~`S14` (group: pull_in)
  - pull-in (wants closer): R28@4.7Å(now 7.3,conf 0.37)
  - push-out (wants farther): C12@9.4Å(now 4.0,conf 0.79)
  - C12↔S14: targets 9.4/3.8Å but partners are 3.0Å apart → too_close_together by 2.6Å
  - C12↔S15: targets 9.4/4.0Å but partners are 2.7Å apart → too_close_together by 2.7Å
  - S15↔R28: targets 4.0/4.7Å but partners are 11.5Å apart → too_far_apart by 2.7Å
- **C3** — severity 2.97, 3 conflict(s); suspect input ~`C26` (group: pull_in)
  - pull-in (wants closer): C26@3.8Å(now 6.4,conf 0.58)
  - C26↔V8: targets 3.8/12.1Å but partners are 6.2Å apart → too_close_together by 2.1Å
  - W9↔C26: targets 13.1/3.8Å but partners are 7.7Å apart → too_close_together by 1.6Å
  - C7↔C26: targets 9.1/3.8Å but partners are 3.7Å apart → too_close_together by 1.6Å
- **G18** — severity 2.94, 2 conflict(s); suspect input ~`C12` (group: pull_in)
  - pull-in (wants closer): V25@10.2Å(now 13.2,conf 0.52)
  - push-out (wants farther): P11@11.0Å(now 8.0,conf 0.67), C12@9.0Å(now 3.8,conf 0.67)
  - S14↔C12: targets 3.8/9.0Å but partners are 3.0Å apart → too_close_together by 2.2Å
  - C12↔S15: targets 9.0/3.8Å but partners are 2.7Å apart → too_close_together by 2.5Å
- **Y27** — severity 2.43, 2 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): C21@5.5Å(now 8.0,conf 0.67), S20@3.7Å(now 6.2,conf 0.61)
  - C21↔I1: targets 5.5/4.7Å but partners are 14.0Å apart → too_far_apart by 3.9Å
  - S20↔I1: targets 3.7/4.7Å but partners are 10.9Å apart → too_far_apart by 2.6Å
- **C12** — severity 1.94, 1 conflict(s); suspect input ~`S15` (group: push_out)
  - push-out (wants farther): C19@9.4Å(now 4.0,conf 0.79), G18@9.0Å(now 3.8,conf 0.67)
  - G18↔S15: targets 9.0/3.8Å but partners are 1.9Å apart → too_close_together by 3.4Å
- **R28** — severity 1.02, 1 conflict(s); suspect input ~`C21` (group: pull_in)
  - pull-in (wants closer): I1@3.7Å(now 6.4,conf 0.60), C19@4.7Å(now 7.3,conf 0.37)
  - I1↔C21: targets 3.7/8.5Å but partners are 14.0Å apart → too_far_apart by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=13 · 3-10(G)=3 · coil(C)=2

```
CEHEHEGHHEEHHHGHHEEEEEHCEEGE
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=5 · sheet=47
  - E5 ↔ W9  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - C12 ↔ A16  (helix)
  - I13 ↔ I17  (helix)
  - P2 ↔ P11  (sheet)
  - P2 ↔ G18  (sheet)
  - P2 ↔ C19  (sheet)
  - P2 ↔ S20  (sheet)
  - P2 ↔ C21  (sheet)
  - G4 ↔ I10  (sheet)
  - G4 ↔ P11  (sheet)
  - G4 ↔ G18  (sheet)
  - G4 ↔ C19  (sheet)
  - G4 ↔ S20  (sheet)
  - G4 ↔ C21  (sheet)
  - G4 ↔ K22  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ G18  (sheet)
  - S6 ↔ C19  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=159 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=100 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6845 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
