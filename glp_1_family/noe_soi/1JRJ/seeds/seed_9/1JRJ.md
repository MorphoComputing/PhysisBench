# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_soi\1JRJ\seeds\seed_9\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 5.540 A
- tm_score_ca_ordered: 0.15565164228967787
- heavy_atom_rmsd: 6.805 A
- sidechain_heavy_atom_rmsd: 7.716 A
- **all-atom quality (honest):** heavy 6.805 A, sidechain 7.716 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 208
- bin_accuracy: 0.524

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L9-W24 → 308 conflicts (98%)
- explained: 308/316 conflicts by 1 root cause(s)
- metrics: hubs=21 (frac 0.568), conflicts/hub=15.0, max_incompat=15.66Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L9-W24 — explain ~308/316 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A17** — severity 87.67, 32 conflict(s); suspect input ~`W24` (group: pull_in)
  - pull-in (wants closer): S10@10.8Å(now 16.0,conf 0.88), Q12@7.3Å(now 12.0,conf 0.85), W24@9.6Å(now 13.4,conf 0.74), E23@8.2Å(now 11.8,conf 0.74), K11@9.0Å(now 14.0,conf 0.73), M13@6.8Å(now 9.9,conf 0.59)
  - S10↔W24: targets 10.8/9.6Å but partners are 29.4Å apart → too_far_apart by 8.9Å
  - W24↔K11: targets 9.6/9.0Å but partners are 27.3Å apart → too_far_apart by 8.7Å
  - Q12↔W24: targets 7.3/9.6Å but partners are 25.4Å apart → too_far_apart by 8.5Å
- **E16** — severity 80.22, 34 conflict(s); suspect input ~`E23` (group: pull_in)
  - pull-in (wants closer): K11@8.7Å(now 11.3,conf 0.85), L9@9.4Å(now 14.7,conf 0.82), E23@10.1Å(now 14.7,conf 0.74), I22@7.7Å(now 11.4,conf 0.73), S10@9.0Å(now 12.9,conf 0.59), F21@7.2Å(now 9.9,conf 0.59), Q12@6.1Å(now 9.2,conf 0.31)
  - L9↔E23: targets 9.4/10.1Å but partners are 29.1Å apart → too_far_apart by 9.6Å
  - L9↔I22: targets 9.4/7.7Å but partners are 26.0Å apart → too_far_apart by 8.8Å
  - K11↔E23: targets 8.7/10.1Å but partners are 25.8Å apart → too_far_apart by 6.9Å
- **V18** — severity 67.32, 30 conflict(s); suspect input ~`K11` (group: pull_in)
  - pull-in (wants closer): W24@9.2Å(now 12.4,conf 0.59), L25@8.0Å(now 10.5,conf 0.57), K11@8.9Å(now 16.1,conf 0.57), M13@6.3Å(now 11.7,conf 0.48), Q12@8.0Å(now 13.6,conf 0.43), E14@6.1Å(now 9.1,conf 0.31)
  - W24↔K11: targets 9.2/8.9Å but partners are 27.3Å apart → too_far_apart by 9.2Å
  - E23↔K11: targets 7.8/8.9Å but partners are 25.8Å apart → too_far_apart by 9.1Å
  - L25↔K11: targets 8.0/8.9Å but partners are 25.7Å apart → too_far_apart by 8.8Å
- **M13** — severity 64.80, 30 conflict(s); suspect input ~`V18` (group: pull_in)
  - pull-in (wants closer): T6@9.8Å(now 13.2,conf 0.74), L20@9.3Å(now 15.0,conf 0.59), A17@6.8Å(now 9.9,conf 0.59), V18@6.3Å(now 11.7,conf 0.48), R19@8.2Å(now 12.3,conf 0.43)
  - T6↔L20: targets 9.8/9.3Å but partners are 28.2Å apart → too_far_apart by 9.0Å
  - T6↔V18: targets 9.8/6.3Å but partners are 24.8Å apart → too_far_apart by 8.7Å
  - S7↔L20: targets 10.2/9.3Å but partners are 26.6Å apart → too_far_apart by 7.0Å
- **Q12** — severity 60.76, 28 conflict(s); suspect input ~`V18` (group: pull_in)
  - pull-in (wants closer): A17@7.3Å(now 12.0,conf 0.85), F5@9.8Å(now 12.7,conf 0.73), R19@8.9Å(now 14.8,conf 0.43), V18@8.0Å(now 13.6,conf 0.43), E16@6.1Å(now 9.2,conf 0.31)
  - A17↔F5: targets 7.3/9.8Å but partners are 23.6Å apart → too_far_apart by 6.4Å
  - A17↔T6: targets 7.3/9.0Å but partners are 23.1Å apart → too_far_apart by 6.8Å
  - A17↔S7: targets 7.3/8.6Å but partners are 21.4Å apart → too_far_apart by 5.6Å
- **E14** — severity 49.99, 27 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): S7@11.0Å(now 14.5,conf 0.65), D8@9.2Å(now 12.0,conf 0.65), R19@6.6Å(now 10.1,conf 0.59), F21@10.6Å(now 13.8,conf 0.57), V18@6.1Å(now 9.1,conf 0.31)
  - S7↔R19: targets 11.0/6.6Å but partners are 24.2Å apart → too_far_apart by 6.6Å
  - S7↔F21: targets 11.0/10.6Å but partners are 28.2Å apart → too_far_apart by 6.6Å
  - L20↔S7: targets 10.3/11.0Å but partners are 26.6Å apart → too_far_apart by 5.3Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=10 · 3-10(G)=8 · coil(C)=5

```
ECCEEGHHHHHGGGHCGHCHHGEHHHEHEGHEGCEEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=4 · sheet=12
  - S7 ↔ K11  (helix)
  - K11 ↔ E15  (helix)
  - L20 ↔ W24  (helix)
  - W24 ↔ G28  (helix)
  - E23 ↔ G29  (sheet)
  - E23 ↔ S32  (sheet)
  - E23 ↔ P35  (sheet)
  - E23 ↔ P36  (sheet)
  - E23 ↔ P37  (sheet)
  - N27 ↔ S32  (sheet)
  - N27 ↔ P35  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)
  - G29 ↔ P35  (sheet)
  - G29 ↔ P36  (sheet)
  - G29 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=111 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=29 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.6581 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
