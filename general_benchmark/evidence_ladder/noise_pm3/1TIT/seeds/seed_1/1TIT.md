# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1TIT\seeds\seed_1\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 1.942 A
- tm_score_ca_ordered: 0.7976775495107996
- heavy_atom_rmsd: 3.370 A
- sidechain_heavy_atom_rmsd: 4.214 A
- **all-atom quality (honest):** heavy 3.370 A, sidechain 4.214 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.023
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 3570
- bin_accuracy: 0.335

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.9420333813064534
- ga_delta_rmsd: -0.23710365655649435  ga_fitness_mode: energy
- pre_local_rmsd: 2.0046959806370146  localized_anchor_rmsd: 1.9420545743937705

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q32-L59 → 1683 conflicts (62%); A18-V29 → 473 conflicts (18%); K78-K84 → 266 conflicts (10%)
- explained: 2422/2700 conflicts by 3 root cause(s)
- metrics: hubs=87 (frac 1.0), conflicts/hub=31.0, max_incompat=10.43Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q32-L59 + A18-V29 + K78-K84 — explain ~2422/2700 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V70** — severity 57.29, 76 conflict(s); suspect input ~`V12` (group: pull_in)
  - pull-in (wants closer): P27@18.4Å(now 22.2,conf 0.19), V29@16.6Å(now 19.2,conf 0.15), I49@9.9Å(now 15.7,conf 0.16), V12@7.3Å(now 13.6,conf 0.26), E21@8.2Å(now 11.0,conf 0.21), Q32@6.8Å(now 12.2,conf 0.28), H19@6.2Å(now 9.6,conf 0.33), E47@6.8Å(now 13.9,conf 0.28), K84@6.2Å(now 8.9,conf 0.33)
  - push-out (wants farther): A81@8.0Å(now 5.0,conf 0.22), K36@7.6Å(now 4.6,conf 0.24), L83@8.3Å(now 5.5,conf 0.21), A75@19.4Å(now 16.3,conf 0.21), M66@10.2Å(now 7.5,conf 0.15), E16@18.8Å(now 15.5,conf 0.20), E4@20.9Å(now 18.0,conf 0.26), N76@18.8Å(now 16.1,conf 0.20), G37@10.1Å(now 6.9,conf 0.16), P6@16.5Å(now 11.2,conf 0.15), V14@22.3Å(now 15.4,conf 0.32)
  - V12↔V14: targets 7.3/22.3Å but partners are 4.6Å apart → too_close_together by 10.4Å
  - Q32↔K84: targets 6.8/6.2Å but partners are 20.0Å apart → too_far_apart by 7.0Å
  - V12↔Q32: targets 7.3/6.8Å but partners are 21.1Å apart → too_far_apart by 7.0Å
- **H55** — severity 57.03, 78 conflict(s); suspect input ~`E69` (group: pull_in)
  - pull-in (wants closer): F13@19.0Å(now 22.6,conf 0.20), G65@19.1Å(now 22.5,conf 0.20), Q63@17.9Å(now 20.9,conf 0.18), K84@17.1Å(now 20.5,conf 0.16), E69@9.4Å(now 17.0,conf 0.17), F72@6.7Å(now 9.7,conf 0.29), P39@9.9Å(now 13.6,conf 0.16)
  - push-out (wants farther): E50@7.9Å(now 3.4,conf 0.23), E16@22.5Å(now 19.8,conf 0.33), K36@20.0Å(now 16.4,conf 0.23), Q38@19.9Å(now 15.5,conf 0.23), G37@18.1Å(now 15.0,conf 0.18), L40@17.8Å(now 14.0,conf 0.17), E2@16.5Å(now 11.9,conf 0.15), H30@8.9Å(now 5.9,conf 0.19), N76@17.3Å(now 12.2,conf 0.17), K34@18.8Å(now 10.4,conf 0.20), Q32@8.7Å(now 5.6,conf 0.20), I48@9.7Å(now 7.0,conf 0.17), A18@17.4Å(now 14.3,conf 0.17), I1@21.4Å(now 11.9,conf 0.28)
  - E23↔I1: targets 5.9/21.4Å but partners are 5.1Å apart → too_close_together by 10.4Å
  - I22↔I1: targets 6.5/21.4Å but partners are 7.6Å apart → too_close_together by 7.2Å
  - K34↔W33: targets 18.8/6.6Å but partners are 4.0Å apart → too_close_together by 8.1Å
- **P6** — severity 52.67, 73 conflict(s); suspect input ~`L83` (group: pull_in)
  - pull-in (wants closer): S43@17.8Å(now 22.5,conf 0.17), D45@19.3Å(now 22.1,conf 0.21), A42@17.4Å(now 20.9,conf 0.17), A18@9.5Å(now 14.9,conf 0.17), W33@9.5Å(now 12.8,conf 0.17), E69@9.1Å(now 13.1,conf 0.18), L83@7.3Å(now 13.1,conf 0.26)
  - push-out (wants farther): F13@25.1Å(now 21.6,conf 0.53), S79@8.2Å(now 5.2,conf 0.21), P39@20.9Å(now 17.9,conf 0.26), V3@7.6Å(now 4.8,conf 0.24), K84@21.2Å(now 16.5,conf 0.27), D51@20.6Å(now 15.9,conf 0.25), E11@18.6Å(now 16.1,conf 0.19), H30@19.6Å(now 15.5,conf 0.22), V70@16.5Å(now 11.2,conf 0.15), G31@18.9Å(now 14.2,conf 0.20)
  - K84↔L83: targets 21.2/7.3Å but partners are 3.8Å apart → too_close_together by 10.1Å
  - V85↔L83: targets 21.1/7.3Å but partners are 6.8Å apart → too_close_together by 7.1Å
  - Q63↔L83: targets 23.9/7.3Å but partners are 9.9Å apart → too_close_together by 6.8Å
- **G9** — severity 48.07, 68 conflict(s); suspect input ~`I22` (group: pull_in)
  - pull-in (wants closer): D28@22.2Å(now 25.3,conf 0.32), L59@9.6Å(now 12.8,conf 0.17), E69@6.5Å(now 10.0,conf 0.30), V85@6.8Å(now 10.7,conf 0.29), S79@6.8Å(now 11.7,conf 0.29), S71@8.2Å(now 11.6,conf 0.21), I22@8.3Å(now 12.1,conf 0.21), V12@6.8Å(now 9.5,conf 0.29), F13@9.0Å(now 12.8,conf 0.18)
  - push-out (wants farther): E26@25.1Å(now 21.5,conf 0.54), N82@7.9Å(now 4.4,conf 0.22), S43@23.7Å(now 20.4,conf 0.41), K53@22.4Å(now 19.5,conf 0.33), A81@8.3Å(now 5.3,conf 0.21), D45@21.6Å(now 18.1,conf 0.29), K54@20.3Å(now 17.4,conf 0.24), C46@19.8Å(now 17.1,conf 0.22), Q38@20.7Å(now 17.0,conf 0.25), L64@16.6Å(now 14.0,conf 0.15), E16@16.9Å(now 14.0,conf 0.16), Q63@17.6Å(now 14.2,conf 0.17)
  - S79↔V12: targets 6.8/6.8Å but partners are 20.0Å apart → too_far_apart by 6.4Å
  - V85↔S79: targets 6.8/6.8Å but partners are 19.1Å apart → too_far_apart by 5.6Å
  - E26↔I22: targets 25.1/8.3Å but partners are 9.7Å apart → too_close_together by 7.1Å
- **V12** — severity 40.70, 50 conflict(s); suspect input ~`V70` (group: push_out)
  - pull-in (wants closer): D28@26.0Å(now 29.4,conf 0.65), P27@25.0Å(now 28.2,conf 0.53), V29@24.1Å(now 26.8,conf 0.44), G31@20.9Å(now 24.1,conf 0.26), V3@19.8Å(now 22.4,conf 0.22), A74@21.9Å(now 24.6,conf 0.30), Q73@17.1Å(now 21.7,conf 0.16), Q32@18.3Å(now 21.1,conf 0.19), H60@6.0Å(now 10.1,conf 0.35), V70@7.3Å(now 13.6,conf 0.26), G9@6.8Å(now 9.5,conf 0.29), L59@5.6Å(now 10.0,conf 0.38), M66@6.4Å(now 10.3,conf 0.31)
  - push-out (wants farther): E50@24.0Å(now 21.4,conf 0.43), K5@23.8Å(now 20.1,conf 0.42), I22@21.7Å(now 18.8,conf 0.29), G37@21.8Å(now 19.3,conf 0.30), Y8@16.6Å(now 12.7,conf 0.15), E87@9.1Å(now 6.6,conf 0.18)
  - G37↔V70: targets 21.8/7.3Å but partners are 6.9Å apart → too_close_together by 7.7Å
  - E50↔L59: targets 24.0/5.6Å but partners are 13.9Å apart → too_close_together by 4.5Å
  - G37↔M66: targets 21.8/6.4Å but partners are 10.5Å apart → too_close_together by 4.9Å
- **L83** — severity 39.63, 47 conflict(s); suspect input ~`P6` (group: push_out)
  - pull-in (wants closer): D28@23.1Å(now 26.6,conf 0.37), L24@16.8Å(now 20.2,conf 0.16), N61@9.6Å(now 13.5,conf 0.17), C46@7.7Å(now 14.9,conf 0.24), P6@7.3Å(now 13.1,conf 0.26), Y8@5.6Å(now 8.2,conf 0.38), D45@9.7Å(now 15.4,conf 0.17), V14@9.3Å(now 12.1,conf 0.17)
  - push-out (wants farther): E2@24.9Å(now 20.3,conf 0.52), E69@9.1Å(now 6.1,conf 0.18), E11@10.3Å(now 6.7,conf 0.15), V70@8.3Å(now 5.5,conf 0.21), Q73@18.7Å(now 15.4,conf 0.20), I58@19.6Å(now 12.5,conf 0.22), E47@19.1Å(now 15.4,conf 0.20)
  - E2↔P6: targets 24.9/7.3Å but partners are 7.7Å apart → too_close_together by 10.0Å
  - S43↔C46: targets 19.7/7.7Å but partners are 3.5Å apart → too_close_together by 8.6Å
  - E2↔Y8: targets 24.9/5.6Å but partners are 14.4Å apart → too_close_together by 4.9Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=38 · 3-10(G)=11 · coil(C)=16

```
CHEHEECEEGHEHCEGEEEEGGCCHEEHCEHEEGEHHEHEECEHHCCCECHGHEHEEEGGCEEEHHHECGEECCHGHEEEEGCEHHE
```

## Backbone H-bond Network

- total=65 · helix(i→i+4)=1 · sheet=64
  - D51 ↔ H55  (helix)
  - V3 ↔ Y8  (sheet)
  - V3 ↔ F20  (sheet)
  - K5 ↔ F20  (sheet)
  - P6 ↔ H19  (sheet)
  - P6 ↔ F20  (sheet)
  - Y8 ↔ A18  (sheet)
  - Y8 ↔ H19  (sheet)
  - Y8 ↔ F20  (sheet)
  - G9 ↔ T17  (sheet)
  - G9 ↔ A18  (sheet)
  - G9 ↔ H19  (sheet)
  - G9 ↔ F20  (sheet)
  - V12 ↔ T17  (sheet)
  - V12 ↔ A18  (sheet)
  - V12 ↔ H19  (sheet)
  - V12 ↔ F20  (sheet)
  - A18 ↔ L35  (sheet)
  - H19 ↔ W33  (sheet)
  - H19 ↔ L35  (sheet)
  - … +45 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=33 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=376 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=239 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.507 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.023

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
