# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1TIT\seeds\seed_1\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 13.093 A
- tm_score_ca_ordered: 0.12963098133382753
- heavy_atom_rmsd: 14.211 A
- sidechain_heavy_atom_rmsd: 15.347 A
- **all-atom quality (honest):** heavy 14.211 A, sidechain 15.347 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 54
- distogram_pairs: 513
- bin_accuracy: 0.322

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q63-A74 → 397 conflicts (50%); F20-P27 → 223 conflicts (28%); H55-H60 → 61 conflicts (8%)
- explained: 681/790 conflicts by 3 root cause(s)
- metrics: hubs=66 (frac 0.759), conflicts/hub=12.0, max_incompat=17.89Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q63-A74 + F20-P27 + H55-H60 — explain ~681/790 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W33** — severity 73.62, 51 conflict(s); suspect input ~`Q73` (group: push_out)
  - pull-in (wants closer): F72@3.8Å(now 7.1,conf 0.47), Q73@4.7Å(now 13.1,conf 0.38), L7@5.2Å(now 10.6,conf 0.26), I22@5.2Å(now 8.4,conf 0.26), I56@5.2Å(now 9.3,conf 0.26)
  - push-out (wants farther): E26@21.2Å(now 12.3,conf 0.49), P27@17.6Å(now 13.1,conf 0.34)
  - H30↔E26: targets 8.9/21.2Å but partners are 3.4Å apart → too_close_together by 8.9Å
  - E26↔E21: targets 21.2/4.9Å but partners are 7.7Å apart → too_close_together by 8.6Å
  - K36↔Q73: targets 9.0/4.7Å but partners are 21.6Å apart → too_far_apart by 8.0Å
- **V70** — severity 71.92, 36 conflict(s); suspect input ~`L35` (group: pull_in)
  - pull-in (wants closer): L35@4.0Å(now 14.7,conf 0.45), A81@4.1Å(now 9.7,conf 0.43), N82@4.2Å(now 8.5,conf 0.43), L7@4.5Å(now 8.7,conf 0.39), K34@5.1Å(now 9.6,conf 0.27)
  - L35↔A81: targets 4.0/4.1Å but partners are 21.6Å apart → too_far_apart by 13.4Å
  - L35↔N82: targets 4.0/4.2Å but partners are 20.2Å apart → too_far_apart by 12.0Å
  - Q73↔L35: targets 8.2/4.0Å but partners are 21.1Å apart → too_far_apart by 8.8Å
- **F72** — severity 70.54, 40 conflict(s); suspect input ~`K34` (group: push_out)
  - pull-in (wants closer): K78@9.5Å(now 12.8,conf 0.58), W33@3.8Å(now 7.1,conf 0.47), A80@4.3Å(now 10.6,conf 0.41), S79@4.3Å(now 11.0,conf 0.41), K34@4.5Å(now 10.2,conf 0.39), L24@5.1Å(now 10.6,conf 0.27), I22@5.6Å(now 9.1,conf 0.23), H55@5.8Å(now 12.5,conf 0.23)
  - push-out (wants farther): E69@8.1Å(now 4.6,conf 0.67), G68@9.4Å(now 4.5,conf 0.49), M66@9.9Å(now 7.2,conf 0.26)
  - S79↔K34: targets 4.3/4.5Å but partners are 20.7Å apart → too_far_apart by 11.9Å
  - A80↔K34: targets 4.3/4.5Å but partners are 19.9Å apart → too_far_apart by 11.1Å
  - W33↔S79: targets 3.8/4.3Å but partners are 17.6Å apart → too_far_apart by 9.5Å
- **E26** — severity 51.11, 20 conflict(s); suspect input ~`W33` (group: pull_in)
  - pull-in (wants closer): I1@4.9Å(now 11.2,conf 0.35)
  - push-out (wants farther): V29@10.9Å(now 6.6,conf 0.84), G31@18.3Å(now 8.0,conf 0.84), H30@14.4Å(now 3.4,conf 0.82), Q32@21.8Å(now 11.5,conf 0.82), W33@21.2Å(now 12.3,conf 0.49)
  - G31↔I22: targets 18.3/7.2Å but partners are 3.0Å apart → too_close_together by 8.0Å
  - Q32↔I22: targets 21.8/7.2Å but partners are 6.6Å apart → too_close_together by 8.0Å
  - Q32↔E21: targets 21.8/8.3Å but partners are 7.4Å apart → too_close_together by 6.1Å
- **I58** — severity 48.43, 23 conflict(s); suspect input ~`G65` (group: pull_in)
  - pull-in (wants closer): H19@3.8Å(now 8.1,conf 0.47), E47@4.2Å(now 8.7,conf 0.43), F20@4.5Å(now 8.3,conf 0.39)
  - push-out (wants farther): Q63@15.5Å(now 9.2,conf 0.66), L64@19.1Å(now 5.9,conf 0.49), G65@21.6Å(now 3.4,conf 0.49)
  - L64↔H19: targets 19.1/3.8Å but partners are 6.6Å apart → too_close_together by 8.8Å
  - G65↔H19: targets 21.6/3.8Å but partners are 9.1Å apart → too_close_together by 8.7Å
  - G52↔G65: targets 7.1/21.6Å but partners are 7.2Å apart → too_close_together by 7.3Å
- **M66** — severity 45.73, 23 conflict(s); suspect input ~`L35` (group: pull_in)
  - pull-in (wants closer): L35@4.5Å(now 11.6,conf 0.39), V85@5.5Å(now 9.6,conf 0.24)
  - push-out (wants farther): C62@13.4Å(now 9.3,conf 0.67), L59@20.6Å(now 5.2,conf 0.52), N61@15.3Å(now 9.1,conf 0.52), H60@19.1Å(now 6.9,conf 0.49), F72@9.9Å(now 7.2,conf 0.26)
  - E69↔L59: targets 5.8/20.6Å but partners are 3.5Å apart → too_close_together by 11.3Å
  - E69↔H60: targets 5.8/19.1Å but partners are 3.8Å apart → too_close_together by 9.6Å
  - V70↔L59: targets 8.1/20.6Å but partners are 6.2Å apart → too_close_together by 6.3Å

## Secondary Structure (DSSP-like)

- helix(H)=39 · strand(E)=30 · 3-10(G)=11 · coil(C)=7

```
CHEGEGGHHHEGHCHHEEHHHHHHHEHHHEEECEHEHHGEEEEEHHECEGEHHGHHGEGCECCEHHHGHHEHEGHHHEEEHEHHHEE
```

## Backbone H-bond Network

- total=118 · helix(i→i+4)=13 · sheet=105
  - G9 ↔ F13  (helix)
  - E16 ↔ F20  (helix)
  - F20 ↔ L24  (helix)
  - E21 ↔ S25  (helix)
  - E23 ↔ P27  (helix)
  - L24 ↔ D28  (helix)
  - S25 ↔ V29  (helix)
  - G52 ↔ I56  (helix)
  - G65 ↔ E69  (helix)
  - M66 ↔ V70  (helix)
  - F72 ↔ N76  (helix)
  - A77 ↔ A81  (helix)
  - A81 ↔ V85  (helix)
  - V3 ↔ E11  (sheet)
  - V3 ↔ T17  (sheet)
  - V3 ↔ A18  (sheet)
  - K5 ↔ E11  (sheet)
  - K5 ↔ T17  (sheet)
  - K5 ↔ A18  (sheet)
  - E11 ↔ T17  (sheet)
  - … +98 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=35 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=769 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=591 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.3559 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=54 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
