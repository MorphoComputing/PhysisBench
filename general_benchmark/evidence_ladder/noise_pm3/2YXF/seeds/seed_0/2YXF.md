# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\2YXF\seeds\seed_0\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 3.196 A
- tm_score_ca_ordered: 0.6798289942024304
- heavy_atom_rmsd: 4.332 A
- sidechain_heavy_atom_rmsd: 5.020 A
- **all-atom quality (honest):** heavy 4.332 A, sidechain 5.020 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 4465
- bin_accuracy: 0.362

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=11 rmsd=3.8934082100900853 -> 3.383325861005902 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.1957407800942645
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 3.2072838494634506  localized_anchor_rmsd: 3.1957408826276135

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y63-S88 → 2210 conflicts (57%); F22-P32 → 903 conflicts (23%); I35-I46 → 380 conflicts (10%)
- explained: 3493/3894 conflicts by 3 root cause(s)
- metrics: hubs=97 (frac 1.0), conflicts/hub=40.1, max_incompat=13.0Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y63-S88 + F22-P32 + I35-I46 — explain ~3493/3894 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L64** — severity 78.25, 113 conflict(s); suspect input ~`L23` (group: pull_in)
  - pull-in (wants closer): L39@8.6Å(now 12.9,conf 0.20), K91@10.2Å(now 14.4,conf 0.15), Q8@8.9Å(now 12.2,conf 0.19), L23@8.0Å(now 12.4,conf 0.22), C25@5.7Å(now 9.0,conf 0.37), V85@10.3Å(now 13.7,conf 0.15), V9@8.3Å(now 12.8,conf 0.21)
  - push-out (wants farther): G18@23.4Å(now 20.8,conf 0.39), N17@23.3Å(now 20.1,conf 0.38), K19@25.2Å(now 21.4,conf 0.54), A15@22.7Å(now 19.8,conf 0.34), L54@7.9Å(now 5.0,conf 0.23), S88@21.1Å(now 18.4,conf 0.27), D96@23.8Å(now 20.2,conf 0.41), I1@19.0Å(now 16.4,conf 0.20), R45@20.8Å(now 15.5,conf 0.25), W95@20.6Å(now 17.3,conf 0.25), I46@18.9Å(now 15.3,conf 0.20), V82@16.7Å(now 10.5,conf 0.16), K48@19.4Å(now 14.2,conf 0.21), H84@17.3Å(now 11.8,conf 0.17), W60@17.5Å(now 12.0,conf 0.17), S57@19.5Å(now 11.1,conf 0.21), T86@19.0Å(now 16.0,conf 0.20)
  - D96↔C25: targets 23.8/5.7Å but partners are 11.2Å apart → too_close_together by 6.8Å
  - E74↔C25: targets 26.0/5.7Å but partners are 15.6Å apart → too_close_together by 4.6Å
  - W95↔C25: targets 20.6/5.7Å but partners are 8.3Å apart → too_close_together by 6.5Å
- **K6** — severity 77.40, 84 conflict(s); suspect input ~`N24` (group: pull_in)
  - pull-in (wants closer): N17@21.0Å(now 24.4,conf 0.26), P72@18.9Å(now 22.9,conf 0.20), V27@5.6Å(now 8.3,conf 0.38), Y10@7.3Å(now 12.0,conf 0.26), N24@7.1Å(now 14.6,conf 0.27), D34@9.6Å(now 12.5,conf 0.17), V37@9.8Å(now 14.2,conf 0.16), A79@10.0Å(now 13.9,conf 0.16), C25@6.7Å(now 10.3,conf 0.29)
  - push-out (wants farther): A15@25.8Å(now 21.9,conf 0.62), P14@24.9Å(now 21.2,conf 0.52), F70@25.0Å(now 22.1,conf 0.53), E69@23.1Å(now 20.6,conf 0.37), D59@18.8Å(now 15.3,conf 0.20), S11@18.9Å(now 15.3,conf 0.20), F30@10.2Å(now 7.2,conf 0.15), S88@17.0Å(now 8.2,conf 0.16), K58@17.6Å(now 14.2,conf 0.17), I1@17.1Å(now 9.9,conf 0.16)
  - F70↔N24: targets 25.0/7.1Å but partners are 7.8Å apart → too_close_together by 10.2Å
  - E69↔N24: targets 23.1/7.1Å but partners are 6.9Å apart → too_close_together by 9.2Å
  - F22↔N24: targets 21.5/7.1Å but partners are 5.8Å apart → too_close_together by 8.6Å
- **Y10** — severity 73.88, 95 conflict(s); suspect input ~`K6` (group: pull_in)
  - pull-in (wants closer): S57@17.7Å(now 20.3,conf 0.17), L40@9.3Å(now 12.8,conf 0.18), E74@9.1Å(now 11.8,conf 0.18), T68@6.3Å(now 12.8,conf 0.32), K6@7.3Å(now 12.0,conf 0.26), V27@9.7Å(now 12.9,conf 0.16), D53@10.2Å(now 17.6,conf 0.15)
  - push-out (wants farther): I1@25.8Å(now 20.4,conf 0.62), V85@21.6Å(now 18.9,conf 0.29), P32@25.3Å(now 20.1,conf 0.55), T86@21.3Å(now 18.3,conf 0.27), Q2@23.8Å(now 18.0,conf 0.41), D34@23.8Å(now 19.8,conf 0.42), S33@21.1Å(now 18.4,conf 0.27), R3@23.9Å(now 18.5,conf 0.43), Q89@21.9Å(now 17.0,conf 0.30), T4@21.3Å(now 16.8,conf 0.27), F30@23.1Å(now 16.6,conf 0.36), E47@21.7Å(now 18.8,conf 0.29), E36@20.0Å(now 16.1,conf 0.23), E44@20.3Å(now 17.3,conf 0.24), C25@9.0Å(now 6.1,conf 0.18), N17@20.8Å(now 14.9,conf 0.25), K75@17.6Å(now 13.8,conf 0.17), V37@20.7Å(now 15.3,conf 0.25), L39@18.0Å(now 13.4,conf 0.18), E77@19.1Å(now 11.7,conf 0.20), K19@16.9Å(now 13.2,conf 0.16), P5@18.5Å(now 15.0,conf 0.19), K91@17.1Å(now 14.0,conf 0.16)
  - R3↔K6: targets 23.9/7.3Å but partners are 7.3Å apart → too_close_together by 9.3Å
  - Q2↔K6: targets 23.8/7.3Å but partners are 7.3Å apart → too_close_together by 9.2Å
  - T4↔K6: targets 21.3/7.3Å but partners are 4.9Å apart → too_close_together by 9.0Å
- **D76** — severity 72.31, 91 conflict(s); suspect input ~`R81` (group: push_out)
  - pull-in (wants closer): D59@27.3Å(now 32.5,conf 0.91), I1@27.0Å(now 31.3,conf 0.83), K58@27.4Å(now 32.2,conf 0.94), W60@27.1Å(now 31.3,conf 0.86), S57@26.0Å(now 31.0,conf 0.65), S61@25.9Å(now 29.3,conf 0.64), F56@25.7Å(now 29.8,conf 0.61), S55@22.3Å(now 27.2,conf 0.32), T4@22.7Å(now 26.5,conf 0.34), H84@19.7Å(now 24.8,conf 0.22), E16@18.4Å(now 22.7,conf 0.19), Y67@9.8Å(now 15.1,conf 0.16), V9@9.2Å(now 12.5,conf 0.18), R81@7.5Å(now 15.4,conf 0.24)
  - push-out (wants farther): Q89@24.4Å(now 21.5,conf 0.46), N17@23.8Å(now 20.5,conf 0.41), Y26@22.4Å(now 18.0,conf 0.33), K19@19.6Å(now 17.1,conf 0.22), R12@18.8Å(now 13.2,conf 0.20), N21@20.0Å(now 12.5,conf 0.23), R45@16.6Å(now 13.7,conf 0.15), D38@18.2Å(now 14.7,conf 0.18), I92@19.2Å(now 14.6,conf 0.21), W95@10.2Å(now 7.2,conf 0.15), N24@20.4Å(now 12.4,conf 0.24), S11@17.2Å(now 11.2,conf 0.16)
  - Q89↔R81: targets 24.4/7.5Å but partners are 9.2Å apart → too_close_together by 7.7Å
  - V85↔R81: targets 26.6/7.5Å but partners are 11.5Å apart → too_close_together by 7.7Å
  - I35↔R81: targets 24.1/7.5Å but partners are 9.0Å apart → too_close_together by 7.6Å
- **R81** — severity 65.70, 87 conflict(s); suspect input ~`H31` (group: pull_in)
  - pull-in (wants closer): S57@17.8Å(now 20.7,conf 0.17), S20@19.3Å(now 22.3,conf 0.21), H31@9.3Å(now 15.0,conf 0.17), R45@6.9Å(now 9.7,conf 0.28), I46@8.1Å(now 12.6,conf 0.22), G43@7.0Å(now 10.9,conf 0.27), D76@7.5Å(now 15.4,conf 0.24)
  - push-out (wants farther): K58@26.4Å(now 21.4,conf 0.71), I1@22.4Å(now 19.1,conf 0.33), F56@21.4Å(now 18.9,conf 0.28), N21@21.7Å(now 18.8,conf 0.29), K75@23.4Å(now 17.9,conf 0.39), P72@21.6Å(now 17.9,conf 0.29), K41@18.1Å(now 12.4,conf 0.18), Y67@16.4Å(now 13.1,conf 0.15), D53@19.3Å(now 16.5,conf 0.21), S11@19.2Å(now 14.0,conf 0.21)
  - K75↔D76: targets 23.4/7.5Å but partners are 2.9Å apart → too_close_together by 13.0Å
  - H31↔D76: targets 9.3/7.5Å but partners are 28.2Å apart → too_far_apart by 11.4Å
  - P72↔D76: targets 21.6/7.5Å but partners are 6.4Å apart → too_close_together by 7.7Å
- **V9** — severity 59.55, 75 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): D76@9.2Å(now 12.5,conf 0.18), G29@8.2Å(now 14.1,conf 0.21), V27@7.3Å(now 10.0,conf 0.25), E69@10.0Å(now 13.4,conf 0.16), L64@8.3Å(now 12.8,conf 0.21)
  - push-out (wants farther): I1@21.9Å(now 18.9,conf 0.30), P32@21.3Å(now 17.6,conf 0.28), N17@21.3Å(now 18.3,conf 0.27), S88@18.5Å(now 14.0,conf 0.19), H31@20.6Å(now 16.2,conf 0.25), A15@21.8Å(now 16.6,conf 0.29), Q89@19.4Å(now 13.3,conf 0.21), K75@19.8Å(now 14.4,conf 0.22), H84@18.8Å(now 14.7,conf 0.20), A79@9.1Å(now 5.8,conf 0.18), E74@19.0Å(now 13.6,conf 0.20), P90@16.4Å(now 12.2,conf 0.15), E36@20.2Å(now 12.8,conf 0.23), H51@19.4Å(now 15.9,conf 0.21), P72@19.3Å(now 13.5,conf 0.21)
  - V27↔E36: targets 7.3/20.2Å but partners are 4.8Å apart → too_close_together by 8.0Å
  - D59↔G29: targets 23.4/8.2Å but partners are 7.4Å apart → too_close_together by 7.7Å
  - G29↔D96: targets 8.2/6.1Å but partners are 21.5Å apart → too_far_apart by 7.2Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=41 · 3-10(G)=18 · coil(C)=10

```
CEHECGGEGEEEEGHHEEHEEECEGGHEHHHEGGEECEGGHHHEGHHCEGEEECEHEGHHGGEHHEEHHEEEEHCEHCEGGEEEEHHEEHHCHGEHC
```

## Backbone H-bond Network

- total=71 · helix(i→i+4)=8 · sheet=63
  - A15 ↔ K19  (helix)
  - V27 ↔ H31  (helix)
  - N42 ↔ I46  (helix)
  - G43 ↔ E47  (helix)
  - F56 ↔ W60  (helix)
  - W60 ↔ L64  (helix)
  - L65 ↔ E69  (helix)
  - L87 ↔ K91  (helix)
  - Q8 ↔ N24  (sheet)
  - Q8 ↔ S28  (sheet)
  - Y10 ↔ N21  (sheet)
  - Y10 ↔ F22  (sheet)
  - Y10 ↔ N24  (sheet)
  - S11 ↔ N17  (sheet)
  - S11 ↔ G18  (sheet)
  - S11 ↔ S20  (sheet)
  - S11 ↔ N21  (sheet)
  - S11 ↔ F22  (sheet)
  - S11 ↔ N24  (sheet)
  - R12 ↔ N17  (sheet)
  - … +51 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=53 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=433 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=276 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3415 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
