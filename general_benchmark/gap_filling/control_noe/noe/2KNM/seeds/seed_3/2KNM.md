# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2KNM\seeds\seed_3\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.121 A
- tm_score_ca_ordered: 0.11985744313452466
- heavy_atom_rmsd: 7.907 A
- sidechain_heavy_atom_rmsd: 9.617 A
- **all-atom quality (honest):** heavy 7.907 A, sidechain 9.617 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 29
- bin_accuracy: 0.448

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** S20 → 7 conflicts (78%)
- explained: 7/9 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.143), conflicts/hub=2.2, max_incompat=7.39Å, chain_span=0.107
- **fix-first:** [LOW_CONFLICT] Root cause(s): S20 — explain ~7/9 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y27** — severity 7.37, 3 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): S20@3.7Å(now 11.9,conf 0.61)
  - S20↔I1: targets 3.7/4.7Å but partners are 15.7Å apart → too_far_apart by 7.4Å
  - S20↔C3: targets 3.7/3.7Å but partners are 11.4Å apart → too_far_apart by 4.1Å
  - S20↔P2: targets 3.7/4.5Å but partners are 13.6Å apart → too_far_apart by 5.4Å
- **R28** — severity 2.88, 3 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): I1@3.7Å(now 6.3,conf 0.60), P2@4.3Å(now 6.9,conf 0.41), S20@6.1Å(now 11.3,conf 0.21)
  - I1↔S20: targets 3.7/6.1Å but partners are 15.7Å apart → too_far_apart by 5.9Å
  - I1↔C19: targets 3.7/4.7Å but partners are 11.1Å apart → too_far_apart by 2.7Å
  - P2↔S20: targets 4.3/6.1Å but partners are 13.6Å apart → too_far_apart by 3.2Å
- **C26** — severity 1.88, 2 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 6.5,conf 0.58), S20@4.5Å(now 7.7,conf 0.39)
  - C3↔S20: targets 3.8/4.5Å but partners are 11.4Å apart → too_far_apart by 3.1Å
  - S6↔S20: targets 4.2/4.5Å but partners are 10.4Å apart → too_far_apart by 1.7Å
- **V25** — severity 0.88, 1 conflict(s); suspect input ~`S6` (group: pull_in)
  - pull-in (wants closer): K22@3.8Å(now 8.9,conf 0.58)
  - K22↔S6: targets 3.8/5.2Å but partners are 12.4Å apart → too_far_apart by 3.4Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=5 · 3-10(G)=0 · coil(C)=0

```
EEHHHHHHHHEHHHHHHHHHHHHHHEHE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=15 · sheet=4
  - C3 ↔ C7  (helix)
  - G4 ↔ V8  (helix)
  - E5 ↔ W9  (helix)
  - S6 ↔ I10  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - C12 ↔ A16  (helix)
  - I13 ↔ I17  (helix)
  - S15 ↔ C19  (helix)
  - A16 ↔ S20  (helix)
  - I17 ↔ C21  (helix)
  - G18 ↔ K22  (helix)
  - C19 ↔ S23  (helix)
  - S20 ↔ K24  (helix)
  - S23 ↔ Y27  (helix)
  - I1 ↔ P11  (sheet)
  - P2 ↔ P11  (sheet)
  - P11 ↔ C26  (sheet)
  - P11 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=12 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=216 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=129 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0285 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
