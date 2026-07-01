# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1TIT\seeds\seed_0\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 15.312 A
- tm_score_ca_ordered: 0.1002109398647474
- heavy_atom_rmsd: 15.832 A
- sidechain_heavy_atom_rmsd: 16.348 A
- **all-atom quality (honest):** heavy 15.832 A, sidechain 16.348 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 3156
- bin_accuracy: 0.359

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=42
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=12.987090069797553 -> 11.866486225061225 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 15.311654328967643
- ga_delta_rmsd: -4.093586295468155  ga_fitness_mode: energy
- pre_local_rmsd: 15.623945044793157  localized_anchor_rmsd: 15.31167602063217

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I1-L7 → 1446 conflicts (37%); D45-K53 → 958 conflicts (24%); W33-Q38 → 448 conflicts (12%)
- explained: 2852/3904 conflicts by 3 root cause(s)
- metrics: hubs=87 (frac 1.0), conflicts/hub=44.9, max_incompat=14.45Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I1-L7 + D45-K53 + W33-Q38 — explain ~2852/3904 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L24** — severity 231.72, 137 conflict(s); suspect input ~`V3` (group: pull_in)
  - pull-in (wants closer): L64@27.5Å(now 33.0,conf 1.00), G65@27.5Å(now 34.7,conf 1.00), Q63@27.5Å(now 32.4,conf 1.00), N61@27.5Å(now 30.3,conf 1.00), T67@27.5Å(now 33.1,conf 1.00), M66@27.5Å(now 33.1,conf 1.00), G68@27.5Å(now 32.4,conf 1.00), H60@27.5Å(now 30.8,conf 1.00), E69@27.5Å(now 31.1,conf 0.99), Q73@27.3Å(now 30.4,conf 0.91), V3@5.3Å(now 14.1,conf 0.46), A74@21.4Å(now 25.3,conf 0.45), F72@20.9Å(now 24.6,conf 0.43), E2@6.1Å(now 13.4,conf 0.41), I1@7.0Å(now 11.4,conf 0.37), G9@17.1Å(now 20.4,conf 0.35), P6@8.4Å(now 14.7,conf 0.35), L7@10.6Å(now 14.8,conf 0.34), Y8@13.9Å(now 18.0,conf 0.34)
  - push-out (wants farther): C46@27.5Å(now 23.9,conf 1.00), D51@27.5Å(now 21.4,conf 1.00), T41@27.5Å(now 23.5,conf 0.99), S43@27.5Å(now 24.8,conf 0.99), A42@27.4Å(now 20.4,conf 0.97), A77@27.4Å(now 19.8,conf 0.95), K78@27.4Å(now 23.7,conf 0.95), A81@27.3Å(now 24.3,conf 0.91), V14@27.2Å(now 23.1,conf 0.90), G15@27.2Å(now 22.9,conf 0.89), L57@26.8Å(now 23.5,conf 0.80), L40@26.5Å(now 20.8,conf 0.74), E16@26.1Å(now 23.5,conf 0.68), I56@25.0Å(now 20.9,conf 0.58), P39@24.6Å(now 18.5,conf 0.56), I49@23.6Å(now 17.6,conf 0.51), G37@21.9Å(now 14.4,conf 0.46), H55@21.5Å(now 17.8,conf 0.45), K34@21.0Å(now 17.1,conf 0.43), K54@20.5Å(now 14.9,conf 0.42), L35@19.2Å(now 13.5,conf 0.39), K53@17.6Å(now 12.1,conf 0.36), G52@16.9Å(now 12.2,conf 0.35), D45@16.9Å(now 12.8,conf 0.35), I48@14.8Å(now 12.2,conf 0.34), G31@10.3Å(now 5.4,conf 0.34), H30@10.5Å(now 6.6,conf 0.34), W33@13.8Å(now 10.8,conf 0.34), E50@13.6Å(now 10.5,conf 0.34), Q32@12.9Å(now 8.2,conf 0.34)
  - A77↔V3: targets 27.4/5.3Å but partners are 9.1Å apart → too_close_together by 13.1Å
  - K78↔V3: targets 27.4/5.3Å but partners are 11.2Å apart → too_close_together by 11.0Å
  - A77↔E2: targets 27.4/6.1Å but partners are 9.8Å apart → too_close_together by 11.4Å
- **S25** — severity 223.84, 118 conflict(s); suspect input ~`E2` (group: push_out)
  - pull-in (wants closer): L64@27.5Å(now 33.9,conf 1.00), G65@27.5Å(now 35.4,conf 1.00), Q63@27.5Å(now 32.9,conf 1.00), N61@27.5Å(now 30.3,conf 1.00), T67@27.5Å(now 33.7,conf 1.00), M66@27.5Å(now 33.5,conf 1.00), H60@27.5Å(now 30.4,conf 1.00), G68@27.5Å(now 32.9,conf 1.00), E69@27.5Å(now 31.3,conf 0.98), N82@27.5Å(now 30.9,conf 0.98), K84@27.5Å(now 30.7,conf 0.98), Q73@27.4Å(now 31.0,conf 0.95), S71@23.7Å(now 27.5,conf 0.51), A74@22.0Å(now 25.8,conf 0.47), V10@21.9Å(now 24.5,conf 0.46), E2@5.7Å(now 14.8,conf 0.43), E4@6.0Å(now 9.0,conf 0.41), G9@20.0Å(now 23.5,conf 0.41), I1@6.2Å(now 12.2,conf 0.40), V3@6.4Å(now 15.8,conf 0.39), Y8@16.9Å(now 21.1,conf 0.35), L7@13.8Å(now 18.0,conf 0.34), P6@11.0Å(now 17.5,conf 0.34)
  - push-out (wants farther): C46@27.5Å(now 24.1,conf 1.00), D51@27.5Å(now 20.8,conf 1.00), T41@27.5Å(now 23.3,conf 1.00), S43@27.5Å(now 24.1,conf 0.99), K78@27.5Å(now 24.9,conf 0.98), A77@27.5Å(now 20.5,conf 0.98), A42@27.4Å(now 19.3,conf 0.97), L57@26.6Å(now 22.7,conf 0.76), L40@25.6Å(now 19.7,conf 0.63), G37@25.4Å(now 17.3,conf 0.61), I56@24.3Å(now 19.8,conf 0.54), K34@24.3Å(now 19.6,conf 0.54), P39@22.9Å(now 17.3,conf 0.49), L35@22.3Å(now 15.9,conf 0.47), I49@22.1Å(now 16.1,conf 0.47), H55@20.7Å(now 16.8,conf 0.43), K54@19.4Å(now 13.2,conf 0.39), W33@17.2Å(now 13.3,conf 0.35), D45@17.2Å(now 11.7,conf 0.35), K53@16.1Å(now 10.2,conf 0.34), G52@16.1Å(now 10.4,conf 0.34), Q32@15.9Å(now 10.3,conf 0.34), V29@9.2Å(now 3.9,conf 0.34), D28@10.1Å(now 5.5,conf 0.34), E50@11.4Å(now 8.9,conf 0.34), G31@12.9Å(now 6.5,conf 0.34), H30@12.4Å(now 5.4,conf 0.34)
  - A77↔E2: targets 27.5/5.7Å but partners are 9.8Å apart → too_close_together by 11.9Å
  - A77↔V3: targets 27.5/6.4Å but partners are 9.1Å apart → too_close_together by 12.1Å
  - G37↔E4: targets 25.4/6.0Å but partners are 8.2Å apart → too_close_together by 11.1Å
- **E23** — severity 176.67, 117 conflict(s); suspect input ~`V3` (group: pull_in)
  - pull-in (wants closer): L64@27.5Å(now 30.5,conf 1.00), Q63@27.5Å(now 30.1,conf 1.00), G65@27.5Å(now 32.5,conf 1.00), T67@27.5Å(now 31.1,conf 1.00), M66@27.5Å(now 31.2,conf 1.00), G68@27.5Å(now 30.7,conf 1.00), Q73@26.1Å(now 28.9,conf 0.69), V3@6.4Å(now 12.8,conf 0.39), A74@19.1Å(now 23.9,conf 0.38), P6@6.9Å(now 12.3,conf 0.38), F72@17.9Å(now 22.4,conf 0.36), L7@8.3Å(now 12.1,conf 0.35), E2@8.9Å(now 12.7,conf 0.34), A75@15.5Å(now 18.7,conf 0.34), G9@14.5Å(now 17.4,conf 0.34), Y8@11.1Å(now 15.2,conf 0.34)
  - push-out (wants farther): C46@27.5Å(now 23.4,conf 1.00), T41@27.5Å(now 24.1,conf 1.00), D51@27.5Å(now 20.8,conf 0.99), A42@27.5Å(now 21.7,conf 0.99), L40@27.4Å(now 22.5,conf 0.94), A77@27.1Å(now 18.7,conf 0.87), P39@27.0Å(now 20.8,conf 0.83), E87@27.0Å(now 24.2,conf 0.83), K78@26.9Å(now 22.1,conf 0.82), L57@26.5Å(now 22.7,conf 0.74), K86@26.4Å(now 23.7,conf 0.73), V14@26.1Å(now 19.7,conf 0.69), G15@25.9Å(now 19.5,conf 0.66), A81@25.8Å(now 21.6,conf 0.66), I56@24.7Å(now 20.4,conf 0.56), F13@24.6Å(now 21.0,conf 0.56), I49@23.8Å(now 17.7,conf 0.52), E16@23.0Å(now 20.1,conf 0.49), H55@21.4Å(now 17.3,conf 0.45), K54@20.9Å(now 15.4,conf 0.43), G37@20.5Å(now 13.4,conf 0.42), K34@20.3Å(now 16.2,conf 0.41), D45@18.6Å(now 14.4,conf 0.37), L35@18.6Å(now 13.2,conf 0.37), K53@18.4Å(now 12.9,conf 0.37), G52@17.8Å(now 13.4,conf 0.36), E50@14.8Å(now 11.8,conf 0.34), Q32@13.4Å(now 9.1,conf 0.34), W33@13.4Å(now 10.5,conf 0.34), G31@11.6Å(now 7.6,conf 0.34), H30@12.3Å(now 9.6,conf 0.34)
  - A77↔V3: targets 27.1/6.4Å but partners are 9.1Å apart → too_close_together by 11.7Å
  - K78↔V3: targets 26.9/6.4Å but partners are 11.2Å apart → too_close_together by 9.3Å
  - A77↔K36: targets 27.1/5.3Å but partners are 14.2Å apart → too_close_together by 7.7Å
- **E26** — severity 167.68, 102 conflict(s); suspect input ~`I1` (group: push_out)
  - pull-in (wants closer): L64@27.5Å(now 34.1,conf 1.00), G65@27.5Å(now 35.4,conf 1.00), Q63@27.5Å(now 32.9,conf 1.00), T67@27.5Å(now 33.6,conf 1.00), M66@27.5Å(now 33.3,conf 1.00), E87@27.5Å(now 31.2,conf 1.00), G68@27.5Å(now 32.6,conf 1.00), K86@27.5Å(now 31.1,conf 0.99), K84@27.5Å(now 32.1,conf 0.99), N82@27.5Å(now 32.1,conf 0.99), V85@27.5Å(now 31.4,conf 0.98), E69@27.4Å(now 30.7,conf 0.97), L83@27.4Å(now 30.9,conf 0.96), Q73@27.4Å(now 30.8,conf 0.95), V10@23.6Å(now 26.6,conf 0.51), F72@23.5Å(now 26.4,conf 0.51), S71@22.8Å(now 26.7,conf 0.49), A74@22.0Å(now 25.5,conf 0.47), G9@21.9Å(now 25.5,conf 0.46), Y8@19.0Å(now 23.1,conf 0.38), I1@6.8Å(now 12.7,conf 0.38), E2@8.0Å(now 15.5,conf 0.35), L7@15.9Å(now 20.1,conf 0.34), V3@9.1Å(now 16.7,conf 0.34), P6@13.8Å(now 19.3,conf 0.34)
  - push-out (wants farther): E47@27.5Å(now 19.6,conf 1.00), C46@27.5Å(now 23.8,conf 1.00), D51@27.5Å(now 19.7,conf 0.99), T41@27.4Å(now 22.7,conf 0.97), S43@27.4Å(now 23.0,conf 0.96), A77@27.4Å(now 20.4,conf 0.94), A42@27.0Å(now 17.9,conf 0.83), G37@26.5Å(now 19.3,conf 0.75), K34@25.3Å(now 21.4,conf 0.61), L57@24.8Å(now 21.8,conf 0.57), L40@22.6Å(now 18.6,conf 0.48), L35@22.0Å(now 17.7,conf 0.46), I56@21.8Å(now 18.6,conf 0.46), P39@20.5Å(now 16.2,conf 0.42), I49@20.3Å(now 14.6,conf 0.41), V29@6.8Å(now 2.6,conf 0.38), H55@18.6Å(now 15.8,conf 0.37), K54@16.9Å(now 11.6,conf 0.35), Q32@15.4Å(now 12.2,conf 0.34), H30@10.3Å(now 5.6,conf 0.34), D45@13.6Å(now 10.7,conf 0.34), K53@13.4Å(now 8.7,conf 0.34), G52@12.8Å(now 8.7,conf 0.34), G31@11.9Å(now 8.1,conf 0.34)
  - E47↔I1: targets 27.5/6.8Å but partners are 9.2Å apart → too_close_together by 11.5Å
  - E47↔E2: targets 27.5/8.0Å but partners are 7.2Å apart → too_close_together by 12.2Å
  - E47↔V3: targets 27.5/9.1Å but partners are 6.2Å apart → too_close_together by 12.2Å
- **I22** — severity 144.93, 113 conflict(s); suspect input ~`V3` (group: pull_in)
  - pull-in (wants closer): G65@27.5Å(now 32.0,conf 1.00), T67@27.5Å(now 30.8,conf 1.00), M66@27.5Å(now 31.1,conf 1.00), G68@27.5Å(now 30.5,conf 1.00), H60@27.5Å(now 30.1,conf 1.00), L7@5.6Å(now 8.9,conf 0.44), P6@5.7Å(now 9.8,conf 0.43), A74@20.3Å(now 23.9,conf 0.41), V3@7.5Å(now 12.1,conf 0.36), Y8@8.1Å(now 12.0,conf 0.35), F72@16.4Å(now 21.4,conf 0.35), G9@11.1Å(now 14.1,conf 0.34)
  - push-out (wants farther): C46@27.5Å(now 23.6,conf 1.00), T41@27.5Å(now 24.9,conf 1.00), D51@27.5Å(now 22.2,conf 1.00), A42@27.5Å(now 23.5,conf 0.99), L40@27.5Å(now 24.2,conf 0.98), P39@27.4Å(now 22.7,conf 0.94), L57@27.2Å(now 24.1,conf 0.90), A77@27.2Å(now 18.7,conf 0.90), K78@26.7Å(now 21.4,conf 0.79), I56@26.7Å(now 22.2,conf 0.78), I49@26.6Å(now 20.0,conf 0.76), E87@26.0Å(now 22.1,conf 0.67), S79@25.8Å(now 23.1,conf 0.65), A80@25.5Å(now 22.9,conf 0.62), K86@24.7Å(now 21.4,conf 0.56), A81@24.4Å(now 19.4,conf 0.55), H55@24.0Å(now 19.1,conf 0.53), K54@23.7Å(now 18.0,conf 0.52), V14@22.6Å(now 17.5,conf 0.48), G15@22.5Å(now 17.6,conf 0.48), F13@21.2Å(now 18.5,conf 0.44), K53@21.2Å(now 15.7,conf 0.44), G52@20.3Å(now 16.1,conf 0.41), D45@20.0Å(now 16.5,conf 0.41), I48@18.6Å(now 15.6,conf 0.37), E50@18.2Å(now 14.5,conf 0.37), K34@17.2Å(now 14.4,conf 0.35), G37@17.2Å(now 11.4,conf 0.35), L35@15.9Å(now 12.0,conf 0.34)
  - A77↔V3: targets 27.2/7.5Å but partners are 9.1Å apart → too_close_together by 10.7Å
  - A77↔P6: targets 27.2/5.7Å but partners are 14.2Å apart → too_close_together by 7.3Å
  - A77↔A75: targets 27.2/17.0Å but partners are 1.4Å apart → too_close_together by 8.8Å
- **Q38** — severity 141.42, 103 conflict(s); suspect input ~`V3` (group: pull_in)
  - pull-in (wants closer): H60@27.5Å(now 35.4,conf 1.00), E69@27.5Å(now 31.7,conf 1.00), L59@27.5Å(now 33.2,conf 1.00), V70@27.5Å(now 30.9,conf 1.00), I58@27.5Å(now 31.0,conf 1.00), E87@27.5Å(now 32.0,conf 0.99), K86@27.5Å(now 30.6,conf 0.99), F13@25.5Å(now 28.6,conf 0.63), E16@24.5Å(now 27.3,conf 0.55), V12@22.2Å(now 26.3,conf 0.47), E11@20.9Å(now 25.0,conf 0.43), V10@18.0Å(now 21.5,conf 0.36), G9@16.0Å(now 19.3,conf 0.34), L7@10.9Å(now 13.5,conf 0.34)
  - push-out (wants farther): E47@27.5Å(now 16.2,conf 1.00), D51@27.5Å(now 24.6,conf 1.00), C46@27.5Å(now 20.1,conf 1.00), A77@27.5Å(now 18.7,conf 1.00), S43@27.5Å(now 19.8,conf 0.99), K78@27.5Å(now 21.5,conf 0.99), P44@27.5Å(now 19.8,conf 0.99), S79@27.5Å(now 24.1,conf 0.99), A42@27.5Å(now 17.0,conf 0.99), I49@27.5Å(now 22.3,conf 0.98), A81@27.5Å(now 22.8,conf 0.98), T41@27.5Å(now 17.4,conf 0.98), H55@27.3Å(now 23.0,conf 0.92), K54@27.0Å(now 20.6,conf 0.85), A75@25.7Å(now 19.5,conf 0.64), N76@25.4Å(now 17.1,conf 0.62), K53@25.1Å(now 17.7,conf 0.59), I48@24.1Å(now 12.5,conf 0.53), G52@23.3Å(now 15.9,conf 0.50), E50@21.9Å(now 13.5,conf 0.46), W33@6.9Å(now 4.2,conf 0.38), D45@18.6Å(now 11.0,conf 0.37), K34@13.5Å(now 8.9,conf 0.34), K5@13.0Å(now 8.7,conf 0.34), E4@12.8Å(now 5.2,conf 0.34), L35@12.2Å(now 5.0,conf 0.34)
  - E47↔V3: targets 27.5/9.3Å but partners are 6.2Å apart → too_close_together by 12.1Å
  - E47↔E2: targets 27.5/10.0Å but partners are 7.2Å apart → too_close_together by 10.2Å
  - N76↔V3: targets 25.4/9.3Å but partners are 6.7Å apart → too_close_together by 9.5Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=39 · 3-10(G)=12 · coil(C)=11

```
CECEHEGEEECEEHGEEEECEGEGECHGCEEEEHEHHECEGHEGHHGHHHHHEEEECCCHHHEHCHGEHHGHHEGHHEEEEEGEEEE
```

## Backbone H-bond Network

- total=57 · helix(i→i+4)=8 · sheet=49
  - A42 ↔ C46  (helix)
  - D45 ↔ I49  (helix)
  - C46 ↔ E50  (helix)
  - I48 ↔ G52  (helix)
  - H60 ↔ L64  (helix)
  - M66 ↔ V70  (helix)
  - F72 ↔ N76  (helix)
  - Q73 ↔ A77  (helix)
  - E2 ↔ H19  (sheet)
  - E2 ↔ E21  (sheet)
  - E4 ↔ H19  (sheet)
  - E4 ↔ E21  (sheet)
  - E4 ↔ E23  (sheet)
  - P6 ↔ T17  (sheet)
  - P6 ↔ A18  (sheet)
  - P6 ↔ H19  (sheet)
  - P6 ↔ E21  (sheet)
  - P6 ↔ E23  (sheet)
  - Y8 ↔ T17  (sheet)
  - Y8 ↔ A18  (sheet)
  - … +37 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=42 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=214 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=94 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.5285 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
