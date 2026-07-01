# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1FKF\seeds\seed_1\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 3.422 A
- tm_score_ca_ordered: 0.6543236483916389
- heavy_atom_rmsd: 4.603 A
- sidechain_heavy_atom_rmsd: 5.445 A
- **all-atom quality (honest):** heavy 4.603 A, sidechain 5.445 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 24
- distogram_pairs: 3442
- bin_accuracy: 0.325

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=11 rmsd=4.2779895468581035 -> 3.7088635979657596 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.421959455874209
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 3.421904668017829  localized_anchor_rmsd: 3.421904668017829

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q64-T84 → 1482 conflicts (51%); V22-G32 → 636 conflicts (22%); L96-K104 → 302 conflicts (10%)
- explained: 2420/2906 conflicts by 3 root cause(s)
- metrics: hubs=105 (frac 1.0), conflicts/hub=27.7, max_incompat=11.7Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q64-T84 + V22-G32 + L96-K104 — explain ~2420/2906 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G27** — severity 61.90, 79 conflict(s); suspect input ~`R39` (group: pull_in)
  - pull-in (wants closer): V54@8.3Å(now 11.4,conf 0.21), R39@6.7Å(now 9.7,conf 0.29), I90@5.7Å(now 11.7,conf 0.37), K72@6.0Å(now 10.9,conf 0.35), G82@8.7Å(now 14.9,conf 0.19), G85@10.0Å(now 14.0,conf 0.16), T74@6.2Å(now 12.4,conf 0.33)
  - push-out (wants farther): R17@23.5Å(now 20.6,conf 0.40), Q19@24.4Å(now 19.8,conf 0.46), K34@9.1Å(now 5.5,conf 0.18), F35@9.2Å(now 5.7,conf 0.18), S37@7.9Å(now 5.2,conf 0.23), L103@21.5Å(now 12.7,conf 0.28), R41@16.3Å(now 13.4,conf 0.15), I55@18.2Å(now 12.2,conf 0.18), R70@17.1Å(now 12.2,conf 0.16), P44@16.7Å(now 11.1,conf 0.16), P77@18.1Å(now 15.6,conf 0.18), E30@17.6Å(now 9.4,conf 0.17)
  - R39↔I90: targets 6.7/5.7Å but partners are 20.9Å apart → too_far_apart by 8.5Å
  - R39↔T74: targets 6.7/6.2Å but partners are 19.8Å apart → too_far_apart by 6.9Å
  - D36↔T74: targets 5.7/6.2Å but partners are 18.0Å apart → too_far_apart by 6.1Å
- **E101** — severity 45.13, 66 conflict(s); suspect input ~`N42` (group: push_out)
  - pull-in (wants closer): P92@20.5Å(now 24.3,conf 0.24), G9@7.7Å(now 11.1,conf 0.24), V62@6.2Å(now 10.3,conf 0.33), N42@8.8Å(now 13.4,conf 0.19), V67@6.7Å(now 9.6,conf 0.30), P44@7.9Å(now 11.2,conf 0.23), L49@9.1Å(now 17.1,conf 0.18), T74@6.2Å(now 12.1,conf 0.33)
  - push-out (wants farther): I89@22.1Å(now 19.6,conf 0.31), A94@21.3Å(now 18.8,conf 0.27), R70@9.6Å(now 3.1,conf 0.17), Q69@9.1Å(now 5.9,conf 0.18), F35@20.6Å(now 15.2,conf 0.25), E60@18.9Å(now 15.0,conf 0.20), K34@16.5Å(now 13.0,conf 0.15), G61@16.6Å(now 13.2,conf 0.15), D40@18.0Å(now 14.0,conf 0.18)
  - N42↔T74: targets 8.8/6.2Å but partners are 24.2Å apart → too_far_apart by 9.2Å
  - V23↔T74: targets 6.2/6.2Å but partners are 17.7Å apart → too_far_apart by 5.3Å
  - H93↔T74: targets 22.7/6.2Å but partners are 11.7Å apart → too_close_together by 4.8Å
- **L96** — severity 42.91, 51 conflict(s); suspect input ~`A83` (group: push_out)
  - pull-in (wants closer): T20@20.9Å(now 23.4,conf 0.26), C21@19.0Å(now 21.7,conf 0.20), L49@17.1Å(now 20.0,conf 0.16), P92@6.1Å(now 10.1,conf 0.34), G32@8.2Å(now 10.9,conf 0.21), T84@7.4Å(now 11.4,conf 0.25)
  - push-out (wants farther): E53@19.6Å(now 16.6,conf 0.22), A83@20.9Å(now 11.5,conf 0.26), I90@10.3Å(now 6.8,conf 0.15), G82@10.2Å(now 7.5,conf 0.15), A71@20.3Å(now 13.5,conf 0.24), V54@16.3Å(now 13.0,conf 0.15), E59@16.6Å(now 13.9,conf 0.15)
  - A83↔P92: targets 20.9/6.1Å but partners are 4.1Å apart → too_close_together by 10.7Å
  - A83↔T84: targets 20.9/7.4Å but partners are 3.9Å apart → too_close_together by 9.6Å
  - P77↔A83: targets 6.7/20.9Å but partners are 6.1Å apart → too_close_together by 8.1Å
- **L73** — severity 41.20, 52 conflict(s); suspect input ~`T5` (group: pull_in)
  - pull-in (wants closer): G32@7.8Å(now 12.6,conf 0.23), T5@9.2Å(now 12.6,conf 0.18), Y79@8.1Å(now 10.8,conf 0.21), D78@8.5Å(now 11.5,conf 0.20), Q69@8.6Å(now 11.2,conf 0.20)
  - push-out (wants farther): F98@6.4Å(now 3.5,conf 0.32), V97@8.6Å(now 6.0,conf 0.20), G85@19.6Å(now 13.0,conf 0.22), D99@9.9Å(now 6.6,conf 0.16), I90@18.0Å(now 14.4,conf 0.18), G9@18.2Å(now 15.2,conf 0.18), V54@16.5Å(now 11.8,conf 0.15), S66@18.1Å(now 13.8,conf 0.18), D31@19.9Å(now 11.8,conf 0.23)
  - G32↔D31: targets 7.8/19.9Å but partners are 3.3Å apart → too_close_together by 8.8Å
  - E30↔D31: targets 8.3/19.9Å but partners are 4.0Å apart → too_close_together by 7.7Å
  - G85↔T95: targets 19.6/7.0Å but partners are 5.6Å apart → too_close_together by 7.0Å
- **G61** — severity 40.21, 69 conflict(s); suspect input ~`R17` (group: pull_in)
  - pull-in (wants closer): T20@10.4Å(now 16.7,conf 0.15), D99@9.5Å(now 13.6,conf 0.17), R17@10.1Å(now 15.8,conf 0.16), V100@8.5Å(now 11.6,conf 0.20), M28@9.7Å(now 16.4,conf 0.17), Q69@9.2Å(now 12.3,conf 0.18), T95@8.3Å(now 12.3,conf 0.21)
  - push-out (wants farther): G57@10.2Å(now 3.8,conf 0.15), G82@17.3Å(now 14.6,conf 0.17), E30@19.9Å(now 16.7,conf 0.23), K51@17.9Å(now 15.0,conf 0.18), V97@16.3Å(now 13.3,conf 0.15), K104@20.5Å(now 13.4,conf 0.24), G68@17.5Å(now 12.8,conf 0.17), T13@17.2Å(now 12.6,conf 0.16), E101@16.6Å(now 13.2,conf 0.15), H24@20.2Å(now 17.7,conf 0.24), E53@17.1Å(now 14.4,conf 0.16), G9@17.2Å(now 13.4,conf 0.17)
  - L73↔E30: targets 5.6/19.9Å but partners are 9.1Å apart → too_close_together by 5.3Å
  - R17↔T95: targets 10.1/8.3Å but partners are 25.1Å apart → too_far_apart by 6.7Å
  - G68↔Q69: targets 17.5/9.2Å but partners are 2.1Å apart → too_close_together by 6.1Å
- **L29** — severity 39.26, 55 conflict(s); suspect input ~`I6` (group: pull_in)
  - pull-in (wants closer): G50@16.4Å(now 23.4,conf 0.15), I6@10.3Å(now 17.2,conf 0.15), A94@5.8Å(now 8.6,conf 0.37), S37@6.2Å(now 9.4,conf 0.33), A71@10.0Å(now 12.9,conf 0.16), P92@7.3Å(now 15.3,conf 0.26), I90@6.5Å(now 9.7,conf 0.31), I89@6.0Å(now 10.0,conf 0.35)
  - push-out (wants farther): S66@25.3Å(now 22.0,conf 0.55), C21@25.2Å(now 21.1,conf 0.55), L103@21.1Å(now 16.9,conf 0.27), F47@22.1Å(now 19.6,conf 0.31), Q64@23.6Å(now 20.7,conf 0.40), G32@7.9Å(now 5.2,conf 0.22), V97@10.2Å(now 4.8,conf 0.15), D40@18.3Å(now 14.3,conf 0.18), W58@18.0Å(now 12.4,conf 0.18), D99@9.9Å(now 6.5,conf 0.16), S38@18.4Å(now 14.5,conf 0.19)
  - S37↔P92: targets 6.2/7.3Å but partners are 23.2Å apart → too_far_apart by 9.7Å
  - A94↔S37: targets 5.8/6.2Å but partners are 16.8Å apart → too_far_apart by 4.9Å
  - S66↔F98: targets 25.3/5.6Å but partners are 16.1Å apart → too_close_together by 3.6Å

## Secondary Structure (DSSP-like)

- helix(H)=46 · strand(E)=30 · 3-10(G)=21 · coil(C)=8

```
CECHHHEGHEGEGGCGEEGCEGEHEHGGHHEHEHHHGHHGGHHEGEEGEHEHHEGGHHEHHHHHHHGEECEEHHHHHECEGEHHHEHECGGEHEHGHHHHHHHEC
```

## Backbone H-bond Network

- total=45 · helix(i→i+4)=20 · sheet=25
  - T5 ↔ G9  (helix)
  - T26 ↔ E30  (helix)
  - E30 ↔ K34  (helix)
  - K34 ↔ S38  (helix)
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - R39 ↔ K43  (helix)
  - E53 ↔ G57  (helix)
  - G57 ↔ G61  (helix)
  - W58 ↔ V62  (helix)
  - E60 ↔ Q64  (helix)
  - G61 ↔ M65  (helix)
  - V62 ↔ S66  (helix)
  - L73 ↔ P77  (helix)
  - A83 ↔ P87  (helix)
  - H93 ↔ V97  (helix)
  - T95 ↔ D99  (helix)
  - V97 ↔ E101  (helix)
  - F98 ↔ L102  (helix)
  - D99 ↔ L103  (helix)
  - … +25 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=46 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=506 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=296 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6102 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=24 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
