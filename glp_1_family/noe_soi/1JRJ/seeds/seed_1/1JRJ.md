# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_soi\1JRJ\seeds\seed_1\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.564 A
- tm_score_ca_ordered: 0.14908361120075028
- heavy_atom_rmsd: 7.685 A
- sidechain_heavy_atom_rmsd: 8.795 A
- **all-atom quality (honest):** heavy 7.685 A, sidechain 8.795 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 212
- bin_accuracy: 0.363

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L9-W24 → 530 conflicts (99%)
- explained: 530/537 conflicts by 1 root cause(s)
- metrics: hubs=24 (frac 0.649), conflicts/hub=22.4, max_incompat=14.09Å, chain_span=0.811
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L9-W24 — explain ~530/537 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A17** — severity 136.96, 42 conflict(s); suspect input ~`S10` (group: push_out)
  - pull-in (wants closer): Q12@8.6Å(now 13.5,conf 0.85), W24@10.8Å(now 14.1,conf 0.85), K11@7.8Å(now 16.4,conf 0.74), M13@7.6Å(now 13.5,conf 0.74), S10@9.6Å(now 19.3,conf 0.65), E15@5.4Å(now 7.9,conf 0.37), E14@5.4Å(now 10.8,conf 0.36)
  - push-out (wants farther): R19@5.4Å(now 2.5,conf 0.40)
  - W24↔S10: targets 10.8/9.6Å but partners are 32.5Å apart → too_far_apart by 12.0Å
  - W24↔K11: targets 10.8/7.8Å but partners are 29.2Å apart → too_far_apart by 10.6Å
  - I22↔K11: targets 7.2/7.8Å but partners are 24.8Å apart → too_far_apart by 9.8Å
- **V18** — severity 129.97, 40 conflict(s); suspect input ~`L25` (group: pull_in)
  - pull-in (wants closer): K11@8.8Å(now 16.7,conf 0.85), M13@8.7Å(now 14.7,conf 0.85), W24@10.0Å(now 13.0,conf 0.76), Q12@7.4Å(now 14.1,conf 0.73), L25@9.2Å(now 14.6,conf 0.65), E15@5.0Å(now 9.3,conf 0.39), E14@6.1Å(now 11.9,conf 0.31)
  - K11↔L25: targets 8.8/9.2Å but partners are 31.0Å apart → too_far_apart by 13.0Å
  - K11↔W24: targets 8.8/10.0Å but partners are 29.2Å apart → too_far_apart by 10.4Å
  - Q12↔L25: targets 7.4/9.2Å but partners are 28.5Å apart → too_far_apart by 11.9Å
- **R19** — severity 129.83, 35 conflict(s); suspect input ~`K26` (group: push_out)
  - pull-in (wants closer): E14@7.0Å(now 13.0,conf 0.96), E15@6.4Å(now 10.4,conf 0.74), M13@8.0Å(now 15.9,conf 0.73), L25@9.3Å(now 13.7,conf 0.59), Q12@8.3Å(now 15.9,conf 0.57), K26@8.5Å(now 14.5,conf 0.53)
  - push-out (wants farther): A17@5.4Å(now 2.5,conf 0.40)
  - M13↔K26: targets 8.0/8.5Å but partners are 30.4Å apart → too_far_apart by 13.9Å
  - W24↔M13: targets 9.6/8.0Å but partners are 27.4Å apart → too_far_apart by 9.8Å
  - Q12↔K26: targets 8.3/8.5Å but partners are 30.1Å apart → too_far_apart by 13.3Å
- **E15** — severity 129.77, 45 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): L20@7.3Å(now 13.6,conf 0.85), R19@6.4Å(now 10.4,conf 0.74), S10@7.0Å(now 11.7,conf 0.73), F21@10.6Å(now 14.2,conf 0.73), L9@9.0Å(now 14.1,conf 0.71), D8@11.4Å(now 14.7,conf 0.59), I22@10.0Å(now 16.8,conf 0.43), V18@5.0Å(now 9.3,conf 0.39), A17@5.4Å(now 7.9,conf 0.37)
  - L20↔S10: targets 7.3/7.0Å but partners are 24.9Å apart → too_far_apart by 10.6Å
  - L20↔L9: targets 7.3/9.0Å but partners are 26.9Å apart → too_far_apart by 10.6Å
  - R19↔S10: targets 6.4/7.0Å but partners are 21.7Å apart → too_far_apart by 8.3Å
- **E16** — severity 120.24, 41 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): I22@8.4Å(now 12.9,conf 0.74), S10@8.8Å(now 15.4,conf 0.59), E23@9.3Å(now 15.3,conf 0.59), K11@7.2Å(now 12.7,conf 0.59), L9@11.2Å(now 17.6,conf 0.57), M13@5.4Å(now 9.5,conf 0.36), Q12@6.1Å(now 9.7,conf 0.31), L20@6.1Å(now 9.6,conf 0.31)
  - S10↔E23: targets 8.8/9.3Å but partners are 29.6Å apart → too_far_apart by 11.5Å
  - E23↔L9: targets 9.3/11.2Å but partners are 31.6Å apart → too_far_apart by 11.1Å
  - I22↔S10: targets 8.4/8.8Å but partners are 27.9Å apart → too_far_apart by 10.7Å
- **L20** — severity 114.46, 36 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): E15@7.3Å(now 13.6,conf 0.85), E14@8.8Å(now 16.1,conf 0.59), L25@7.3Å(now 10.6,conf 0.59), N27@8.8Å(now 13.4,conf 0.57), M13@9.4Å(now 19.1,conf 0.48), K26@7.4Å(now 11.3,conf 0.48), E16@6.1Å(now 9.6,conf 0.31)
  - E14↔N27: targets 8.8/8.8Å but partners are 29.4Å apart → too_far_apart by 11.9Å
  - N27↔M13: targets 8.8/9.4Å but partners are 32.3Å apart → too_far_apart by 14.1Å
  - M13↔K26: targets 9.4/7.4Å but partners are 30.4Å apart → too_far_apart by 13.5Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=19 · 3-10(G)=3 · coil(C)=4

```
EEGHHEHHECEEHEEECHGEHCEECHEHHEGEHEEEE
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=2 · sheet=37
  - T4 ↔ D8  (helix)
  - G29 ↔ G33  (helix)
  - G1 ↔ T6  (sheet)
  - G1 ↔ L9  (sheet)
  - G1 ↔ K11  (sheet)
  - G1 ↔ Q12  (sheet)
  - E2 ↔ L9  (sheet)
  - E2 ↔ K11  (sheet)
  - E2 ↔ Q12  (sheet)
  - E2 ↔ E14  (sheet)
  - E2 ↔ E15  (sheet)
  - T6 ↔ K11  (sheet)
  - T6 ↔ Q12  (sheet)
  - T6 ↔ E14  (sheet)
  - L9 ↔ E14  (sheet)
  - L20 ↔ P35  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - E23 ↔ P30  (sheet)
  - E23 ↔ S32  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=101 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=30 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.9652 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
