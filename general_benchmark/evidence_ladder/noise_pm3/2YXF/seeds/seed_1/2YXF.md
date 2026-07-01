# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\2YXF\seeds\seed_1\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 3.645 A
- tm_score_ca_ordered: 0.6317172128847099
- heavy_atom_rmsd: 4.899 A
- sidechain_heavy_atom_rmsd: 5.510 A
- **all-atom quality (honest):** heavy 4.899 A, sidechain 5.510 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 4465
- bin_accuracy: 0.378

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=63
- rigid_domain_reconvergence: applied=True accepted=14 rmsd=4.147920032309233 -> 3.462458206293057 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.6448597777939304
- ga_delta_rmsd: -0.38812903986434844  ga_fitness_mode: energy
- pre_local_rmsd: 3.663589557852448  localized_anchor_rmsd: 3.6448629528044836

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F22-P32 → 1608 conflicts (39%); I35-I46 → 941 conflicts (23%); D76-V85 → 537 conflicts (13%)
- explained: 3086/4081 conflicts by 3 root cause(s)
- metrics: hubs=97 (frac 1.0), conflicts/hub=42.1, max_incompat=12.51Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F22-P32 + I35-I46 + D76-V85 — explain ~3086/4081 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L64** — severity 91.88, 123 conflict(s); suspect input ~`L23` (group: pull_in)
  - pull-in (wants closer): L39@8.6Å(now 13.2,conf 0.20), K91@10.2Å(now 14.4,conf 0.15), Q8@8.9Å(now 15.1,conf 0.19), L23@8.0Å(now 13.4,conf 0.22), C25@5.7Å(now 10.1,conf 0.37), V85@10.3Å(now 13.3,conf 0.15), N24@8.6Å(now 11.5,conf 0.20), V9@8.3Å(now 15.2,conf 0.21)
  - push-out (wants farther): K19@25.2Å(now 21.9,conf 0.54), L54@7.9Å(now 5.0,conf 0.23), S88@21.1Å(now 17.9,conf 0.27), D96@23.8Å(now 21.1,conf 0.41), R45@20.8Å(now 15.6,conf 0.25), W95@20.6Å(now 17.5,conf 0.25), I46@18.9Å(now 15.2,conf 0.20), V82@16.7Å(now 10.0,conf 0.16), K48@19.4Å(now 14.1,conf 0.21), D34@10.3Å(now 7.2,conf 0.15), H84@17.3Å(now 11.3,conf 0.17), W60@17.5Å(now 11.9,conf 0.17), S57@19.5Å(now 10.1,conf 0.21), T86@19.0Å(now 15.1,conf 0.20)
  - D96↔C25: targets 23.8/5.7Å but partners are 11.1Å apart → too_close_together by 7.0Å
  - E74↔C25: targets 26.0/5.7Å but partners are 14.3Å apart → too_close_together by 5.9Å
  - K75↔C25: targets 25.9/5.7Å but partners are 15.0Å apart → too_close_together by 5.1Å
- **K6** — severity 86.04, 98 conflict(s); suspect input ~`N24` (group: push_out)
  - pull-in (wants closer): N17@21.0Å(now 25.2,conf 0.26), P72@18.9Å(now 22.7,conf 0.20), V49@18.2Å(now 21.0,conf 0.18), V27@5.6Å(now 8.7,conf 0.38), F62@9.6Å(now 13.6,conf 0.17), Y10@7.3Å(now 12.3,conf 0.26), N24@7.1Å(now 15.8,conf 0.27), Y63@9.4Å(now 12.7,conf 0.17), D34@9.6Å(now 13.9,conf 0.17), S61@10.3Å(now 13.1,conf 0.15), V37@9.8Å(now 14.3,conf 0.16), A79@10.0Å(now 13.6,conf 0.16), C25@6.7Å(now 11.4,conf 0.29)
  - push-out (wants farther): K75@25.6Å(now 22.6,conf 0.59), A15@25.8Å(now 23.0,conf 0.62), P14@24.9Å(now 21.0,conf 0.52), S11@18.9Å(now 16.4,conf 0.20), S88@17.0Å(now 7.5,conf 0.16), I1@17.1Å(now 10.6,conf 0.16)
  - F70↔N24: targets 25.0/7.1Å but partners are 7.1Å apart → too_close_together by 10.8Å
  - E69↔N24: targets 23.1/7.1Å but partners are 5.5Å apart → too_close_together by 10.5Å
  - F22↔N24: targets 21.5/7.1Å but partners are 5.9Å apart → too_close_together by 8.6Å
- **Y10** — severity 76.44, 104 conflict(s); suspect input ~`K6` (group: pull_in)
  - pull-in (wants closer): K58@19.9Å(now 22.8,conf 0.23), S57@17.7Å(now 22.0,conf 0.17), S61@18.1Å(now 20.8,conf 0.18), L54@16.5Å(now 20.2,conf 0.15), K48@16.9Å(now 20.7,conf 0.16), L40@9.3Å(now 13.5,conf 0.18), T68@6.3Å(now 15.3,conf 0.32), K6@7.3Å(now 12.3,conf 0.26), R81@10.3Å(now 14.7,conf 0.15), V27@9.7Å(now 13.8,conf 0.16), D53@10.2Å(now 19.6,conf 0.15), Y78@7.7Å(now 10.8,conf 0.24)
  - push-out (wants farther): I1@25.8Å(now 18.9,conf 0.62), P32@25.3Å(now 20.9,conf 0.55), Q2@23.8Å(now 17.6,conf 0.41), D34@23.8Å(now 21.3,conf 0.42), R3@23.9Å(now 17.5,conf 0.43), Q89@21.9Å(now 18.1,conf 0.30), T4@21.3Å(now 16.0,conf 0.27), F30@23.1Å(now 17.2,conf 0.36), N17@20.8Å(now 15.7,conf 0.25), K75@17.6Å(now 13.2,conf 0.17), V37@20.7Å(now 16.7,conf 0.25), L39@18.0Å(now 14.3,conf 0.18), E77@19.1Å(now 12.2,conf 0.20), K19@16.9Å(now 14.2,conf 0.16), P5@18.5Å(now 14.7,conf 0.19)
  - R3↔K6: targets 23.9/7.3Å but partners are 7.2Å apart → too_close_together by 9.5Å
  - T4↔K6: targets 21.3/7.3Å but partners are 4.5Å apart → too_close_together by 9.5Å
  - Q2↔K6: targets 23.8/7.3Å but partners are 7.8Å apart → too_close_together by 8.6Å
- **D76** — severity 71.00, 82 conflict(s); suspect input ~`R81` (group: push_out)
  - pull-in (wants closer): D59@27.3Å(now 32.1,conf 0.91), I1@27.0Å(now 30.4,conf 0.83), K58@27.4Å(now 32.2,conf 0.94), W60@27.1Å(now 30.8,conf 0.86), S57@26.0Å(now 30.4,conf 0.65), S61@25.9Å(now 29.6,conf 0.64), F56@25.7Å(now 29.5,conf 0.61), S55@22.3Å(now 26.9,conf 0.32), T4@22.7Å(now 25.6,conf 0.34), H84@19.7Å(now 24.9,conf 0.22), E16@18.4Å(now 22.0,conf 0.19), Y67@9.8Å(now 14.2,conf 0.16), V9@9.2Å(now 12.8,conf 0.18), R81@7.5Å(now 15.8,conf 0.24)
  - push-out (wants farther): Q89@24.4Å(now 21.8,conf 0.46), N17@23.8Å(now 21.2,conf 0.41), L65@23.2Å(now 20.6,conf 0.37), P14@19.9Å(now 17.4,conf 0.23), Y26@22.4Å(now 17.6,conf 0.33), V49@18.0Å(now 14.3,conf 0.18), R12@18.8Å(now 13.7,conf 0.20), N21@20.0Å(now 13.2,conf 0.23), R45@16.6Å(now 12.2,conf 0.15), D38@18.2Å(now 14.2,conf 0.18), I92@19.2Å(now 14.6,conf 0.21), W95@10.2Å(now 7.4,conf 0.15), N24@20.4Å(now 11.7,conf 0.24), S11@17.2Å(now 10.9,conf 0.16)
  - I35↔R81: targets 24.1/7.5Å but partners are 7.9Å apart → too_close_together by 8.7Å
  - N83↔R81: targets 20.9/7.5Å but partners are 5.3Å apart → too_close_together by 8.1Å
  - V85↔R81: targets 26.6/7.5Å but partners are 11.9Å apart → too_close_together by 7.2Å
- **N24** — severity 66.51, 79 conflict(s); suspect input ~`K6` (group: pull_in)
  - pull-in (wants closer): H13@7.3Å(now 10.9,conf 0.26), R12@6.7Å(now 9.6,conf 0.29), I35@10.1Å(now 15.2,conf 0.15), K6@7.1Å(now 15.8,conf 0.27), Q8@8.0Å(now 12.0,conf 0.22), L64@8.6Å(now 11.5,conf 0.20), S52@6.9Å(now 9.7,conf 0.28)
  - push-out (wants farther): S88@23.9Å(now 20.5,conf 0.42), Y67@9.7Å(now 4.0,conf 0.17), D34@20.2Å(now 17.2,conf 0.23), K75@16.4Å(now 13.7,conf 0.15), P5@19.9Å(now 17.3,conf 0.23), E69@9.1Å(now 5.5,conf 0.18), N17@18.6Å(now 14.7,conf 0.19), K91@17.2Å(now 14.7,conf 0.17), T73@16.3Å(now 11.1,conf 0.15), D76@20.4Å(now 11.7,conf 0.24), K19@17.3Å(now 13.4,conf 0.17), R45@16.9Å(now 12.0,conf 0.16)
  - S88↔K6: targets 23.9/7.1Å but partners are 7.5Å apart → too_close_together by 9.3Å
  - K6↔F70: targets 7.1/6.7Å but partners are 22.9Å apart → too_far_apart by 9.1Å
  - T86↔K6: targets 22.6/7.1Å but partners are 6.8Å apart → too_close_together by 8.7Å
- **V9** — severity 61.80, 80 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): L23@6.2Å(now 9.7,conf 0.33), D76@9.2Å(now 12.8,conf 0.18), G29@8.2Å(now 15.1,conf 0.21), V27@7.3Å(now 11.0,conf 0.25), Y67@8.8Å(now 12.8,conf 0.19), E69@10.0Å(now 14.2,conf 0.16), R81@8.0Å(now 11.2,conf 0.22), L64@8.3Å(now 15.2,conf 0.21)
  - push-out (wants farther): I1@21.9Å(now 17.8,conf 0.30), P32@21.3Å(now 18.5,conf 0.28), N17@21.3Å(now 18.5,conf 0.27), S88@18.5Å(now 14.8,conf 0.19), H31@20.6Å(now 17.0,conf 0.25), A15@21.8Å(now 16.3,conf 0.29), R3@18.4Å(now 15.7,conf 0.19), Q89@19.4Å(now 14.5,conf 0.21), K75@19.8Å(now 13.7,conf 0.22), H84@18.8Å(now 16.3,conf 0.20), E74@19.0Å(now 12.3,conf 0.20), P90@16.4Å(now 13.4,conf 0.15), E36@20.2Å(now 15.3,conf 0.23), P72@19.3Å(now 13.7,conf 0.21)
  - H31↔G29: targets 20.6/8.2Å but partners are 4.6Å apart → too_close_together by 7.8Å
  - G29↔D96: targets 8.2/6.1Å but partners are 22.0Å apart → too_far_apart by 7.7Å
  - V27↔E36: targets 7.3/20.2Å but partners are 6.3Å apart → too_close_together by 6.5Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=39 · 3-10(G)=17 · coil(C)=14

```
CEEEEECECECEEEHEHHEEGCEGCHHGGHHEGHHECEGHHHHEHHGHHCEEECHHEGHHCGGGGEEGHHEEGHEEHCEGEEEEEHCEECGCEGEHE
```

## Backbone H-bond Network

- total=59 · helix(i→i+4)=10 · sheet=49
  - Y26 ↔ F30  (helix)
  - V27 ↔ H31  (helix)
  - F30 ↔ D34  (helix)
  - H31 ↔ I35  (helix)
  - K41 ↔ R45  (helix)
  - N42 ↔ I46  (helix)
  - R45 ↔ V49  (helix)
  - S55 ↔ D59  (helix)
  - F56 ↔ W60  (helix)
  - F70 ↔ E74  (helix)
  - R3 ↔ Q8  (sheet)
  - Y10 ↔ L23  (sheet)
  - R12 ↔ K19  (sheet)
  - R12 ↔ S20  (sheet)
  - R12 ↔ L23  (sheet)
  - H13 ↔ K19  (sheet)
  - H13 ↔ S20  (sheet)
  - H13 ↔ L23  (sheet)
  - P14 ↔ K19  (sheet)
  - P14 ↔ S20  (sheet)
  - … +39 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=52 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=430 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=268 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3538 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
