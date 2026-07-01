# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_soi\1JRJ\seeds\seed_0\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.824 A
- tm_score_ca_ordered: 0.0862839166840167
- heavy_atom_rmsd: 8.040 A
- sidechain_heavy_atom_rmsd: 9.313 A
- **all-atom quality (honest):** heavy 8.040 A, sidechain 9.313 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 167
- bin_accuracy: 0.365

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D8-E23 → 308 conflicts (98%)
- explained: 308/315 conflicts by 1 root cause(s)
- metrics: hubs=20 (frac 0.541), conflicts/hub=15.8, max_incompat=14.65Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D8-E23 — explain ~308/315 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E14** — severity 121.70, 25 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): R19@7.8Å(now 12.8,conf 0.74), S7@7.7Å(now 14.8,conf 0.73), L20@10.7Å(now 15.7,conf 0.73), F21@10.6Å(now 18.3,conf 0.73), D8@7.5Å(now 14.1,conf 0.57), L9@7.2Å(now 13.0,conf 0.57), A17@5.4Å(now 8.0,conf 0.36), V18@6.1Å(now 10.3,conf 0.31)
  - S7↔F21: targets 7.7/10.6Å but partners are 32.7Å apart → too_far_apart by 14.4Å
  - R19↔S7: targets 7.8/7.7Å but partners are 27.5Å apart → too_far_apart by 12.0Å
  - S7↔L20: targets 7.7/10.7Å but partners are 30.3Å apart → too_far_apart by 11.9Å
- **E15** — severity 105.67, 25 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): L20@8.9Å(now 13.0,conf 0.73), K11@7.2Å(now 10.5,conf 0.65), R19@6.4Å(now 10.2,conf 0.65), F21@9.6Å(now 15.7,conf 0.65), I22@9.8Å(now 15.1,conf 0.59), D8@8.1Å(now 17.1,conf 0.48), L9@9.1Å(now 15.8,conf 0.48), S10@9.8Å(now 13.3,conf 0.43), V18@5.0Å(now 8.1,conf 0.39)
  - F21↔D8: targets 9.6/8.1Å but partners are 32.4Å apart → too_far_apart by 14.7Å
  - I22↔D8: targets 9.8/8.1Å but partners are 31.2Å apart → too_far_apart by 13.4Å
  - L20↔D8: targets 8.9/8.1Å but partners are 29.8Å apart → too_far_apart by 12.8Å
- **A17** — severity 103.31, 25 conflict(s); suspect input ~`E23` (group: pull_in)
  - pull-in (wants closer): Q12@5.1Å(now 12.8,conf 0.88), M13@7.0Å(now 10.8,conf 0.73), I22@6.8Å(now 9.8,conf 0.65), S10@8.0Å(now 18.5,conf 0.57), W24@10.6Å(now 13.2,conf 0.57), K11@7.0Å(now 15.6,conf 0.48), E23@8.2Å(now 11.0,conf 0.48), L20@5.0Å(now 7.8,conf 0.39), E14@5.4Å(now 8.0,conf 0.36), F21@6.1Å(now 10.3,conf 0.31)
  - I22↔S10: targets 6.8/8.0Å but partners are 27.8Å apart → too_far_apart by 13.0Å
  - S10↔W24: targets 8.0/10.6Å but partners are 31.3Å apart → too_far_apart by 12.7Å
  - Q12↔I22: targets 5.1/6.8Å but partners are 22.0Å apart → too_far_apart by 10.1Å
- **E16** — severity 91.41, 25 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): S10@10.4Å(now 16.5,conf 0.85), K11@8.2Å(now 13.7,conf 0.74), I22@9.0Å(now 12.7,conf 0.71), F21@9.0Å(now 12.7,conf 0.64), E23@9.8Å(now 14.3,conf 0.57), L9@9.0Å(now 18.8,conf 0.51), M13@5.4Å(now 8.7,conf 0.36), Q12@6.1Å(now 10.8,conf 0.31), L20@6.1Å(now 9.8,conf 0.31)
  - F21↔L9: targets 9.0/9.0Å but partners are 31.2Å apart → too_far_apart by 13.2Å
  - I22↔L9: targets 9.0/9.0Å but partners are 30.4Å apart → too_far_apart by 12.4Å
  - E23↔L9: targets 9.8/9.0Å but partners are 30.7Å apart → too_far_apart by 11.9Å
- **Q12** — severity 86.85, 24 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): A17@5.1Å(now 12.8,conf 0.88), S7@7.4Å(now 10.5,conf 0.73), T6@10.1Å(now 13.2,conf 0.71), R19@9.3Å(now 17.6,conf 0.59), V18@8.0Å(now 15.1,conf 0.43), L9@5.0Å(now 8.7,conf 0.39), D8@6.1Å(now 9.7,conf 0.31), E16@6.1Å(now 10.8,conf 0.31)
  - A17↔S7: targets 5.1/7.4Å but partners are 22.5Å apart → too_far_apart by 10.0Å
  - A17↔T6: targets 5.1/10.1Å but partners are 24.8Å apart → too_far_apart by 9.6Å
  - S7↔R19: targets 7.4/9.3Å but partners are 27.5Å apart → too_far_apart by 10.8Å
- **M13** — severity 84.08, 25 conflict(s); suspect input ~`T6` (group: pull_in)
  - pull-in (wants closer): A17@7.0Å(now 10.8,conf 0.73), S7@7.5Å(now 13.0,conf 0.59), R19@10.0Å(now 15.3,conf 0.59), D8@6.6Å(now 11.8,conf 0.48), V18@8.2Å(now 12.7,conf 0.48), T6@10.0Å(now 15.2,conf 0.43), L20@12.2Å(now 18.3,conf 0.43), S10@5.4Å(now 8.0,conf 0.36), E16@5.4Å(now 8.7,conf 0.36), L9@6.8Å(now 10.1,conf 0.22)
  - S7↔R19: targets 7.5/10.0Å but partners are 27.5Å apart → too_far_apart by 10.0Å
  - R19↔D8: targets 10.0/6.6Å but partners are 26.9Å apart → too_far_apart by 10.3Å
  - D8↔L20: targets 6.6/12.2Å but partners are 29.8Å apart → too_far_apart by 11.0Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=19 · 3-10(G)=6 · coil(C)=2

```
EEEEGEHEHEEHHEEEGCEEGCHEGHEHGGHHHEEEE
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=2 · sheet=18
  - L9 ↔ M13  (helix)
  - G28 ↔ S32  (helix)
  - G3 ↔ D8  (sheet)
  - T6 ↔ K11  (sheet)
  - R19 ↔ W24  (sheet)
  - R19 ↔ P36  (sheet)
  - R19 ↔ P37  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ A34  (sheet)
  - L20 ↔ P35  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - W24 ↔ A34  (sheet)
  - W24 ↔ P35  (sheet)
  - W24 ↔ P36  (sheet)
  - W24 ↔ P37  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P35  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=101 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=30 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.6609 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
