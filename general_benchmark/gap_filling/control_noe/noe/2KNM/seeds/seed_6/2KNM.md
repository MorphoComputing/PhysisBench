# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2KNM\seeds\seed_6\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.100 A
- tm_score_ca_ordered: 0.06526306288621285
- heavy_atom_rmsd: 7.688 A
- sidechain_heavy_atom_rmsd: 8.559 A
- **all-atom quality (honest):** heavy 7.688 A, sidechain 8.559 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 29
- bin_accuracy: 0.448

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C19-K22 → 9 conflicts (90%)
- explained: 9/10 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.143), conflicts/hub=2.5, max_incompat=5.26Å, chain_span=0.5
- **fix-first:** [LOW_CONFLICT] Root cause(s): C19-K22 — explain ~9/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y27** — severity 6.81, 4 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): S20@3.7Å(now 7.1,conf 0.61), C3@3.7Å(now 6.3,conf 0.60), I1@4.7Å(now 7.6,conf 0.38)
  - S20↔C3: targets 3.7/3.7Å but partners are 11.1Å apart → too_far_apart by 3.7Å
  - S20↔I1: targets 3.7/4.7Å but partners are 13.6Å apart → too_far_apart by 5.3Å
  - S20↔P2: targets 3.7/4.5Å but partners are 11.7Å apart → too_far_apart by 3.6Å
- **S14** — severity 2.60, 2 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 7.2,conf 0.58)
  - E5↔I17: targets 3.8/3.8Å but partners are 10.3Å apart → too_far_apart by 2.7Å
  - E5↔C19: targets 3.8/3.8Å but partners are 9.4Å apart → too_far_apart by 1.8Å
- **R28** — severity 2.23, 2 conflict(s); suspect input ~`C19` (group: pull_in)
  - pull-in (wants closer): I1@3.7Å(now 6.8,conf 0.60)
  - I1↔C19: targets 3.7/4.7Å but partners are 12.4Å apart → too_far_apart by 3.9Å
  - I1↔S20: targets 3.7/6.1Å but partners are 13.6Å apart → too_far_apart by 3.8Å
- **V25** — severity 1.30, 2 conflict(s); suspect input ~`C7` (group: pull_in)
  - pull-in (wants closer): K22@3.8Å(now 6.7,conf 0.58)
  - K22↔C7: targets 3.8/4.2Å but partners are 9.6Å apart → too_far_apart by 1.6Å
  - K22↔S6: targets 3.8/5.2Å but partners are 11.4Å apart → too_far_apart by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=6 · 3-10(G)=1 · coil(C)=1

```
CEHHHEHHHHEHHHHHHHHHHHEGEHHE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=10 · sheet=8
  - C3 ↔ C7  (helix)
  - G4 ↔ V8  (helix)
  - E5 ↔ W9  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - C12 ↔ A16  (helix)
  - S15 ↔ C19  (helix)
  - A16 ↔ S20  (helix)
  - G18 ↔ K22  (helix)
  - K22 ↔ C26  (helix)
  - P2 ↔ P11  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ S23  (sheet)
  - S6 ↔ V25  (sheet)
  - P11 ↔ S23  (sheet)
  - P11 ↔ V25  (sheet)
  - P11 ↔ R28  (sheet)
  - S23 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=7 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=219 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=134 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4896 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
