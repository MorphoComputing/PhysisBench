# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1FKF\seeds\seed_0\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 4.286 A
- tm_score_ca_ordered: 0.5884085251394463
- heavy_atom_rmsd: 5.336 A
- sidechain_heavy_atom_rmsd: 6.124 A
- **all-atom quality (honest):** heavy 5.336 A, sidechain 6.124 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 30
- distogram_pairs: 3442
- bin_accuracy: 0.300

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=14 rmsd=4.735035157160902 -> 4.418217035979001 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.285541219559266
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 4.2855021098600625  localized_anchor_rmsd: 4.2855021098600625

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q64-G82 → 1525 conflicts (48%); T13-L29 → 946 conflicts (30%); L96-L105 → 384 conflicts (12%)
- explained: 2855/3187 conflicts by 3 root cause(s)
- metrics: hubs=105 (frac 1.0), conflicts/hub=30.4, max_incompat=10.89Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q64-G82 + T13-L29 + L96-L105 — explain ~2855/3187 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G27** — severity 63.81, 80 conflict(s); suspect input ~`L102` (group: pull_in)
  - pull-in (wants closer): G18@20.4Å(now 23.2,conf 0.24), V54@8.3Å(now 11.9,conf 0.21), L102@8.9Å(now 12.7,conf 0.18), V23@9.3Å(now 12.3,conf 0.17), I90@5.7Å(now 12.0,conf 0.37), K72@6.0Å(now 11.3,conf 0.35), G82@8.7Å(now 17.4,conf 0.19), G85@10.0Å(now 14.6,conf 0.16), A94@9.8Å(now 13.7,conf 0.16), T74@6.2Å(now 12.6,conf 0.33)
  - push-out (wants farther): Q19@24.4Å(now 21.4,conf 0.46), K34@9.1Å(now 4.9,conf 0.18), F35@9.2Å(now 5.6,conf 0.18), S37@7.9Å(now 4.8,conf 0.23), S7@18.6Å(now 12.7,conf 0.19), L103@21.5Å(now 15.8,conf 0.28), I6@17.4Å(now 14.4,conf 0.17), R41@16.3Å(now 12.2,conf 0.15), I55@18.2Å(now 13.3,conf 0.18), R70@17.1Å(now 11.7,conf 0.16), P44@16.7Å(now 10.5,conf 0.16), E30@17.6Å(now 9.5,conf 0.17)
  - I90↔K72: targets 5.7/6.0Å but partners are 18.4Å apart → too_far_apart by 6.7Å
  - R39↔T74: targets 6.7/6.2Å but partners are 20.1Å apart → too_far_apart by 7.2Å
  - R39↔I90: targets 6.7/5.7Å but partners are 19.6Å apart → too_far_apart by 7.2Å
- **A71** — severity 53.22, 68 conflict(s); suspect input ~`F45` (group: pull_in)
  - pull-in (wants closer): G82@17.6Å(now 20.2,conf 0.17), V100@6.3Å(now 10.0,conf 0.32), V23@9.1Å(now 12.3,conf 0.18), L102@8.5Å(now 12.5,conf 0.20), S37@7.5Å(now 14.7,conf 0.24), L103@6.3Å(now 15.8,conf 0.32)
  - push-out (wants farther): E53@23.4Å(now 18.1,conf 0.38), P77@21.4Å(now 17.6,conf 0.28), V3@10.2Å(now 3.9,conf 0.15), K33@17.2Å(now 14.4,conf 0.17), Y79@19.7Å(now 16.1,conf 0.22), D31@18.6Å(now 12.6,conf 0.19), V54@18.1Å(now 14.3,conf 0.18), L96@20.3Å(now 14.0,conf 0.24), F45@19.6Å(now 16.6,conf 0.22), Q2@9.8Å(now 5.5,conf 0.16)
  - E53↔V100: targets 23.4/6.3Å but partners are 9.1Å apart → too_close_together by 8.0Å
  - E53↔L103: targets 23.4/6.3Å but partners are 10.0Å apart → too_close_together by 7.0Å
  - T74↔L103: targets 6.8/6.3Å but partners are 20.6Å apart → too_far_apart by 7.5Å
- **L29** — severity 48.33, 63 conflict(s); suspect input ~`I6` (group: pull_in)
  - pull-in (wants closer): G50@16.4Å(now 22.6,conf 0.15), I6@10.3Å(now 15.1,conf 0.15), A94@5.8Å(now 11.4,conf 0.37), S37@6.2Å(now 9.7,conf 0.33), P92@7.3Å(now 15.2,conf 0.26), I90@6.5Å(now 10.9,conf 0.31), I89@6.0Å(now 12.8,conf 0.35)
  - push-out (wants farther): S66@25.3Å(now 19.7,conf 0.55), C21@25.2Å(now 20.9,conf 0.55), F47@22.1Å(now 19.1,conf 0.31), Q64@23.6Å(now 19.2,conf 0.40), K33@6.9Å(now 4.2,conf 0.28), G32@7.9Å(now 5.1,conf 0.22), V97@10.2Å(now 5.1,conf 0.15), D40@18.3Å(now 13.8,conf 0.18), W58@18.0Å(now 11.4,conf 0.18), Y79@17.7Å(now 14.5,conf 0.17), S38@18.4Å(now 14.2,conf 0.19)
  - S66↔F98: targets 25.3/5.6Å but partners are 14.3Å apart → too_close_together by 5.4Å
  - A94↔S37: targets 5.8/6.2Å but partners are 17.8Å apart → too_far_apart by 5.8Å
  - S37↔P92: targets 6.2/7.3Å but partners are 20.8Å apart → too_far_apart by 7.4Å
- **R70** — severity 47.42, 64 conflict(s); suspect input ~`L103` (group: pull_in)
  - pull-in (wants closer): V100@7.6Å(now 10.5,conf 0.24), L102@6.5Å(now 12.6,conf 0.31), D99@6.1Å(now 9.7,conf 0.34), L103@8.6Å(now 15.7,conf 0.20), S37@7.8Å(now 13.7,conf 0.23)
  - push-out (wants farther): Y81@23.5Å(now 20.4,conf 0.40), G82@25.4Å(now 22.8,conf 0.57), I6@7.1Å(now 3.8,conf 0.27), I55@19.6Å(now 17.1,conf 0.22), D36@19.6Å(now 16.5,conf 0.22), V1@17.9Å(now 11.8,conf 0.18), F14@16.6Å(now 12.8,conf 0.15), T26@16.4Å(now 9.2,conf 0.15), M28@17.2Å(now 11.0,conf 0.17), R12@17.0Å(now 13.2,conf 0.16), G27@17.1Å(now 11.7,conf 0.16), V22@19.4Å(now 13.5,conf 0.21)
  - Y81↔D99: targets 23.5/6.1Å but partners are 11.8Å apart → too_close_together by 5.6Å
  - D36↔S37: targets 19.6/7.8Å but partners are 3.3Å apart → too_close_together by 8.6Å
  - L102↔F47: targets 6.5/19.7Å but partners are 5.5Å apart → too_close_together by 7.8Å
- **E59** — severity 45.86, 66 conflict(s); suspect input ~`K104` (group: pull_in)
  - pull-in (wants closer): L49@5.6Å(now 8.4,conf 0.38), P44@10.4Å(now 17.3,conf 0.15), M48@7.0Å(now 9.8,conf 0.27), K16@6.8Å(now 13.9,conf 0.29), E53@5.7Å(now 9.2,conf 0.38), C21@10.4Å(now 13.8,conf 0.15), F14@9.6Å(now 12.3,conf 0.17)
  - push-out (wants farther): R56@9.3Å(now 4.1,conf 0.17), I55@8.0Å(now 5.3,conf 0.22), D99@17.1Å(now 8.9,conf 0.16), Q69@17.0Å(now 14.3,conf 0.16), K104@19.7Å(now 12.6,conf 0.22), T26@18.6Å(now 16.0,conf 0.19), Q19@18.0Å(now 13.0,conf 0.18), L103@18.6Å(now 12.1,conf 0.19), L96@16.6Å(now 11.7,conf 0.15), G18@16.4Å(now 13.7,conf 0.15)
  - L49↔K104: targets 5.6/19.7Å but partners are 5.8Å apart → too_close_together by 8.3Å
  - M48↔K104: targets 7.0/19.7Å but partners are 4.6Å apart → too_close_together by 8.1Å
  - K16↔Q19: targets 6.8/18.0Å but partners are 1.5Å apart → too_close_together by 9.7Å
- **E101** — severity 42.36, 57 conflict(s); suspect input ~`N42` (group: pull_in)
  - pull-in (wants closer): I6@7.7Å(now 12.6,conf 0.24), N42@8.8Å(now 14.8,conf 0.19), S37@8.6Å(now 12.1,conf 0.20), R39@9.0Å(now 13.2,conf 0.18), T74@6.2Å(now 14.3,conf 0.33), T5@6.6Å(now 11.6,conf 0.30)
  - push-out (wants farther): P91@26.1Å(now 22.3,conf 0.66), R56@18.6Å(now 12.7,conf 0.19), F35@20.6Å(now 15.8,conf 0.25), I55@17.2Å(now 11.3,conf 0.16), K16@19.9Å(now 11.6,conf 0.22), E60@18.9Å(now 9.9,conf 0.20), V54@16.5Å(now 8.7,conf 0.15), G61@16.6Å(now 9.7,conf 0.15), Q19@16.6Å(now 10.8,conf 0.15), T13@17.1Å(now 9.0,conf 0.16)
  - V23↔T74: targets 6.2/6.2Å but partners are 18.8Å apart → too_far_apart by 6.4Å
  - N42↔T74: targets 8.8/6.2Å but partners are 24.0Å apart → too_far_apart by 8.9Å
  - P44↔T74: targets 7.9/6.2Å but partners are 21.1Å apart → too_far_apart by 7.0Å

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=37 · 3-10(G)=21 · coil(C)=7

```
CECEHHGEEHHECCCHHHEGEGGGEGHHHHEGEHHHGHEEGHEEEEEEEHEHHEEGHHEHHGHHEGHHEGEEGGGEHCEEGHEHHEHGGHHEHHHGHHEEHGEEC
```

## Backbone H-bond Network

- total=60 · helix(i→i+4)=13 · sheet=47
  - I6 ↔ D10  (helix)
  - E30 ↔ K34  (helix)
  - K34 ↔ S38  (helix)
  - S38 ↔ N42  (helix)
  - E53 ↔ G57  (helix)
  - G57 ↔ G61  (helix)
  - E60 ↔ Q64  (helix)
  - Q64 ↔ G68  (helix)
  - P87 ↔ P91  (helix)
  - I90 ↔ A94  (helix)
  - P91 ↔ T95  (helix)
  - H93 ↔ V97  (helix)
  - V97 ↔ E101  (helix)
  - P8 ↔ C21  (sheet)
  - P8 ↔ Y25  (sheet)
  - G9 ↔ C21  (sheet)
  - G9 ↔ Y25  (sheet)
  - R12 ↔ C21  (sheet)
  - R12 ↔ Y25  (sheet)
  - Y25 ↔ K33  (sheet)
  - … +40 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=56 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=516 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=308 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6575 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=30 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
