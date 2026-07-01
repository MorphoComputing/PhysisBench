# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1TIT\seeds\seed_0\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 1.637 A
- tm_score_ca_ordered: 0.8344852227210601
- heavy_atom_rmsd: 3.036 A
- sidechain_heavy_atom_rmsd: 3.854 A
- **all-atom quality (honest):** heavy 3.036 A, sidechain 3.854 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.011
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 3570
- bin_accuracy: 0.334

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.6373305399056628
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.6711813422557324  localized_anchor_rmsd: 1.6373422547493164

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S43-L59 → 1143 conflicts (42%); M66-A75 → 679 conflicts (25%); A18-V29 → 448 conflicts (16%)
- explained: 2270/2729 conflicts by 3 root cause(s)
- metrics: hubs=87 (frac 1.0), conflicts/hub=31.4, max_incompat=10.23Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S43-L59 + M66-A75 + A18-V29 — explain ~2270/2729 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H55** — severity 58.22, 79 conflict(s); suspect input ~`E69` (group: pull_in)
  - pull-in (wants closer): F13@19.0Å(now 23.3,conf 0.20), G65@19.1Å(now 22.6,conf 0.20), Q63@17.9Å(now 21.0,conf 0.18), K84@17.1Å(now 20.9,conf 0.16), E23@5.9Å(now 8.6,conf 0.35), E69@9.4Å(now 17.2,conf 0.17), F72@6.7Å(now 9.7,conf 0.29), P39@9.9Å(now 13.5,conf 0.16)
  - push-out (wants farther): E50@7.9Å(now 3.3,conf 0.23), K36@20.0Å(now 16.3,conf 0.23), Q38@19.9Å(now 15.5,conf 0.23), G37@18.1Å(now 15.0,conf 0.18), L40@17.8Å(now 13.9,conf 0.17), E2@16.5Å(now 11.5,conf 0.15), H30@8.9Å(now 6.0,conf 0.19), N76@17.3Å(now 12.4,conf 0.17), K34@18.8Å(now 10.5,conf 0.20), Q32@8.7Å(now 5.6,conf 0.20), I48@9.7Å(now 7.0,conf 0.17), A18@17.4Å(now 14.7,conf 0.17), I1@21.4Å(now 12.2,conf 0.28)
  - E23↔I1: targets 5.9/21.4Å but partners are 7.4Å apart → too_close_together by 8.1Å
  - K34↔W33: targets 18.8/6.6Å but partners are 4.0Å apart → too_close_together by 8.1Å
  - E69↔D28: targets 9.4/8.5Å but partners are 26.2Å apart → too_far_apart by 8.3Å
- **V70** — severity 57.24, 78 conflict(s); suspect input ~`V12` (group: push_out)
  - pull-in (wants closer): E26@18.5Å(now 21.1,conf 0.19), P27@18.4Å(now 22.5,conf 0.19), V29@16.6Å(now 19.4,conf 0.15), I49@9.9Å(now 15.5,conf 0.16), V12@7.3Å(now 13.5,conf 0.26), A18@8.6Å(now 11.2,conf 0.20), E21@8.2Å(now 11.5,conf 0.21), Q32@6.8Å(now 12.3,conf 0.28), H19@6.2Å(now 10.1,conf 0.33), E47@6.8Å(now 13.6,conf 0.28), K84@6.2Å(now 9.1,conf 0.33)
  - push-out (wants farther): A81@8.0Å(now 4.8,conf 0.22), K36@7.6Å(now 4.3,conf 0.24), L83@8.3Å(now 5.6,conf 0.21), A75@19.4Å(now 16.2,conf 0.21), M66@10.2Å(now 7.2,conf 0.15), E16@18.8Å(now 15.9,conf 0.20), E4@20.9Å(now 17.5,conf 0.26), N76@18.8Å(now 16.1,conf 0.20), G37@10.1Å(now 6.7,conf 0.16), P6@16.5Å(now 10.8,conf 0.15), V14@22.3Å(now 15.6,conf 0.32), H60@17.0Å(now 14.4,conf 0.16)
  - V12↔V14: targets 7.3/22.3Å but partners are 4.8Å apart → too_close_together by 10.2Å
  - Q32↔K84: targets 6.8/6.2Å but partners are 20.3Å apart → too_far_apart by 7.3Å
  - V12↔Q32: targets 7.3/6.8Å but partners are 21.1Å apart → too_far_apart by 7.0Å
- **P6** — severity 54.89, 78 conflict(s); suspect input ~`L83` (group: pull_in)
  - pull-in (wants closer): S43@17.8Å(now 22.2,conf 0.17), A42@17.4Å(now 20.4,conf 0.17), A18@9.5Å(now 14.4,conf 0.17), W33@9.5Å(now 12.5,conf 0.17), S25@9.1Å(now 12.3,conf 0.18), E69@9.1Å(now 12.7,conf 0.18), L83@7.3Å(now 12.8,conf 0.26)
  - push-out (wants farther): Q63@23.9Å(now 20.9,conf 0.42), F13@25.1Å(now 21.9,conf 0.53), S79@8.2Å(now 5.3,conf 0.21), P39@20.9Å(now 17.4,conf 0.26), K84@21.2Å(now 16.2,conf 0.27), L59@18.7Å(now 16.2,conf 0.20), D51@20.6Å(now 16.0,conf 0.25), E50@17.0Å(now 14.4,conf 0.16), H30@19.6Å(now 15.9,conf 0.22), V70@16.5Å(now 10.8,conf 0.15), G31@18.9Å(now 14.6,conf 0.20)
  - K84↔L83: targets 21.2/7.3Å but partners are 3.8Å apart → too_close_together by 10.1Å
  - V85↔L83: targets 21.1/7.3Å but partners are 6.6Å apart → too_close_together by 7.2Å
  - Q63↔L83: targets 23.9/7.3Å but partners are 9.6Å apart → too_close_together by 7.1Å
- **G9** — severity 49.10, 72 conflict(s); suspect input ~`I22` (group: pull_in)
  - pull-in (wants closer): D28@22.2Å(now 26.1,conf 0.32), A75@18.0Å(now 21.1,conf 0.18), S25@17.9Å(now 21.1,conf 0.18), E69@6.5Å(now 9.9,conf 0.30), V85@6.8Å(now 10.2,conf 0.29), S79@6.8Å(now 11.9,conf 0.29), S71@8.2Å(now 11.6,conf 0.21), I22@8.3Å(now 12.3,conf 0.21), V12@6.8Å(now 9.5,conf 0.29), F13@9.0Å(now 12.9,conf 0.18)
  - push-out (wants farther): E26@25.1Å(now 22.4,conf 0.54), N82@7.9Å(now 4.5,conf 0.22), S43@23.7Å(now 19.9,conf 0.41), A81@8.3Å(now 5.5,conf 0.21), D45@21.6Å(now 17.6,conf 0.29), K54@20.3Å(now 17.7,conf 0.24), C46@19.8Å(now 16.4,conf 0.22), Q38@20.7Å(now 16.4,conf 0.25), L64@16.6Å(now 13.4,conf 0.15), E16@16.9Å(now 13.4,conf 0.16), Q63@17.6Å(now 13.5,conf 0.17), N61@17.5Å(now 14.9,conf 0.17), K84@9.9Å(now 7.3,conf 0.16)
  - S79↔V12: targets 6.8/6.8Å but partners are 20.1Å apart → too_far_apart by 6.6Å
  - V85↔S79: targets 6.8/6.8Å but partners are 18.9Å apart → too_far_apart by 5.4Å
  - S79↔F13: targets 6.8/9.0Å but partners are 23.3Å apart → too_far_apart by 7.6Å
- **F13** — severity 38.73, 54 conflict(s); suspect input ~`H19` (group: push_out)
  - pull-in (wants closer): E26@27.2Å(now 31.4,conf 0.89), I1@24.7Å(now 31.9,conf 0.49), D28@27.1Å(now 33.0,conf 0.86), P27@26.9Å(now 32.3,conf 0.81), S25@26.8Å(now 30.8,conf 0.78), N76@26.9Å(now 31.0,conf 0.81), A75@25.1Å(now 30.4,conf 0.53), V29@26.6Å(now 30.1,conf 0.76), E2@25.4Å(now 29.3,conf 0.57), K53@25.2Å(now 28.5,conf 0.55), G52@24.9Å(now 27.7,conf 0.51), L24@23.6Å(now 27.6,conf 0.40), H30@25.2Å(now 28.3,conf 0.55), V3@23.7Å(now 26.2,conf 0.41), G31@22.9Å(now 26.8,conf 0.36), K78@23.0Å(now 25.7,conf 0.36), H55@19.0Å(now 23.3,conf 0.20), Q73@20.7Å(now 24.7,conf 0.25), I49@18.1Å(now 21.3,conf 0.18), A80@17.6Å(now 20.5,conf 0.17), H19@8.5Å(now 12.2,conf 0.20), G65@9.7Å(now 13.7,conf 0.17), T67@9.1Å(now 13.7,conf 0.18), L59@7.3Å(now 10.8,conf 0.26), G9@9.0Å(now 12.9,conf 0.18)
  - push-out (wants farther): P6@25.1Å(now 21.9,conf 0.53), W33@24.9Å(now 20.5,conf 0.51), I56@25.7Å(now 20.6,conf 0.61), E16@7.5Å(now 4.7,conf 0.25), A81@20.0Å(now 16.8,conf 0.23), L57@21.7Å(now 16.9,conf 0.29), I58@16.8Å(now 13.7,conf 0.16)
  - I56↔L59: targets 25.7/7.3Å but partners are 11.2Å apart → too_close_together by 7.2Å
  - L57↔L59: targets 21.7/7.3Å but partners are 7.3Å apart → too_close_together by 7.2Å
  - W33↔L59: targets 24.9/7.3Å but partners are 10.5Å apart → too_close_together by 7.1Å
- **V12** — severity 38.12, 45 conflict(s); suspect input ~`V70` (group: push_out)
  - pull-in (wants closer): D28@26.0Å(now 30.3,conf 0.65), P27@25.0Å(now 29.4,conf 0.53), N76@24.8Å(now 27.9,conf 0.50), V29@24.1Å(now 27.4,conf 0.44), G31@20.9Å(now 24.4,conf 0.26), V3@19.8Å(now 22.8,conf 0.22), E4@19.5Å(now 22.1,conf 0.21), A74@21.9Å(now 24.7,conf 0.30), Q73@17.1Å(now 22.0,conf 0.16), Q32@18.3Å(now 21.1,conf 0.19), H60@6.0Å(now 9.0,conf 0.35), V70@7.3Å(now 13.5,conf 0.26), G9@6.8Å(now 9.5,conf 0.29), L59@5.6Å(now 9.2,conf 0.38), M66@6.4Å(now 9.9,conf 0.31)
  - push-out (wants farther): K5@23.8Å(now 20.2,conf 0.42), Q38@20.9Å(now 18.0,conf 0.26), I22@21.7Å(now 19.0,conf 0.29), G37@21.8Å(now 18.8,conf 0.30), S43@19.9Å(now 16.9,conf 0.23), E16@8.2Å(now 5.0,conf 0.21), Y8@16.6Å(now 12.9,conf 0.15)
  - G37↔V70: targets 21.8/7.3Å but partners are 6.7Å apart → too_close_together by 7.9Å
  - E50↔L59: targets 24.0/5.6Å but partners are 13.9Å apart → too_close_together by 4.4Å
  - G37↔M66: targets 21.8/6.4Å but partners are 10.2Å apart → too_close_together by 5.2Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=38 · 3-10(G)=15 · coil(C)=8

```
CEEHEEEGEGGEHEHEEGEEGGECHEEHCEHEEEEHHEHEEHEHHEGCECHHHHHEEEGGCEEGHHHEHHGECGHGHEGEEGCEHHE
```

## Backbone H-bond Network

- total=80 · helix(i→i+4)=2 · sheet=78
  - D51 ↔ H55  (helix)
  - M66 ↔ V70  (helix)
  - E2 ↔ L7  (sheet)
  - V3 ↔ F20  (sheet)
  - V3 ↔ E23  (sheet)
  - K5 ↔ H19  (sheet)
  - K5 ↔ F20  (sheet)
  - K5 ↔ E23  (sheet)
  - P6 ↔ H19  (sheet)
  - P6 ↔ F20  (sheet)
  - P6 ↔ E23  (sheet)
  - L7 ↔ H19  (sheet)
  - L7 ↔ F20  (sheet)
  - L7 ↔ E23  (sheet)
  - G9 ↔ T17  (sheet)
  - G9 ↔ H19  (sheet)
  - G9 ↔ F20  (sheet)
  - V12 ↔ T17  (sheet)
  - V12 ↔ H19  (sheet)
  - V12 ↔ F20  (sheet)
  - … +60 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=369 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=234 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4942 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0115

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1TIT.ensemble.pdb`)
- RMSF mean=0.304Å max=1.545Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 87, 14, 16, 15

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1TIT.pae.csv`
- mean=0.183Å · max=1.515Å · AlphaFold-PAE analog (low block = rigid unit/domain)
