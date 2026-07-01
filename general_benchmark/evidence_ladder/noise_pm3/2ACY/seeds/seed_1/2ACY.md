# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\2ACY\seeds\seed_1\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 1.470 A
- tm_score_ca_ordered: 0.8658485732955642
- heavy_atom_rmsd: 2.998 A
- sidechain_heavy_atom_rmsd: 3.684 A
- **all-atom quality (honest):** heavy 2.998 A, sidechain 3.684 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 4371
- bin_accuracy: 0.343

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=57
- rigid_domain_reconvergence: applied=True accepted=11 rmsd=1.8991596100793458 -> 1.6674471808063145 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.4700423783749144
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.4822408156798965  localized_anchor_rmsd: 1.4700435210676426

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F21-T41 → 1950 conflicts (53%); T45-L64 → 1142 conflicts (31%); D3-F13 → 286 conflicts (8%)
- explained: 3378/3667 conflicts by 3 root cause(s)
- metrics: hubs=96 (frac 1.0), conflicts/hub=38.2, max_incompat=10.09Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F21-T41 + T45-L64 + D3-F13 — explain ~3378/3667 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A77** — severity 70.87, 104 conflict(s); suspect input ~`L50` (group: pull_in)
  - pull-in (wants closer): L88@20.4Å(now 23.0,conf 0.24), G68@8.7Å(now 11.7,conf 0.19), T25@5.9Å(now 13.9,conf 0.35), D9@8.5Å(now 11.9,conf 0.20), Q49@9.9Å(now 13.3,conf 0.16), L50@9.8Å(now 14.6,conf 0.16), Q61@6.2Å(now 9.4,conf 0.33), Q47@6.8Å(now 11.2,conf 0.29), V8@9.6Å(now 12.8,conf 0.17)
  - push-out (wants farther): L5@23.8Å(now 19.6,conf 0.42), K31@23.6Å(now 20.5,conf 0.40), V84@22.1Å(now 18.5,conf 0.31), P53@22.1Å(now 19.5,conf 0.31), V96@22.3Å(now 19.3,conf 0.32), F13@9.3Å(now 5.2,conf 0.17), V19@17.5Å(now 14.9,conf 0.17), S72@17.8Å(now 11.6,conf 0.17), P70@19.2Å(now 15.0,conf 0.21), G44@17.8Å(now 13.5,conf 0.17), Q39@18.7Å(now 14.8,conf 0.20), G29@21.1Å(now 15.8,conf 0.27), Y24@17.9Å(now 15.1,conf 0.18)
  - T25↔G29: targets 5.9/21.1Å but partners are 6.4Å apart → too_close_together by 8.8Å
  - K31↔T25: targets 23.6/5.9Å but partners are 11.2Å apart → too_close_together by 6.5Å
  - V96↔T25: targets 22.3/5.9Å but partners are 10.0Å apart → too_close_together by 6.4Å
- **Q51** — severity 54.59, 81 conflict(s); suspect input ~`Q47` (group: pull_in)
  - pull-in (wants closer): D42@17.4Å(now 22.2,conf 0.17), S72@19.5Å(now 22.4,conf 0.21), K15@19.0Å(now 23.4,conf 0.20), F79@9.0Å(now 14.5,conf 0.18), Q61@8.2Å(now 10.8,conf 0.21), A27@10.2Å(now 13.7,conf 0.15), E62@8.8Å(now 14.5,conf 0.19), Q47@9.2Å(now 13.4,conf 0.18), Q94@8.7Å(now 11.8,conf 0.20)
  - push-out (wants farther): Q43@25.4Å(now 22.5,conf 0.56), S69@22.2Å(now 19.3,conf 0.32), V35@8.0Å(now 4.9,conf 0.22), G36@9.0Å(now 4.2,conf 0.18), G68@22.5Å(now 17.7,conf 0.33), K23@20.8Å(now 16.6,conf 0.26), V38@19.7Å(now 11.3,conf 0.22)
  - W37↔V38: targets 6.2/19.7Å but partners are 4.5Å apart → too_close_together by 9.0Å
  - G68↔G29: targets 22.5/6.7Å but partners are 10.6Å apart → too_close_together by 5.2Å
  - G48↔V38: targets 8.0/19.7Å but partners are 4.9Å apart → too_close_together by 6.8Å
- **G36** — severity 53.70, 83 conflict(s); suspect input ~`F21` (group: pull_in)
  - pull-in (wants closer): K71@19.6Å(now 22.4,conf 0.22), S72@16.9Å(now 20.5,conf 0.16), Q43@16.3Å(now 20.0,conf 0.15), F21@9.0Å(now 15.7,conf 0.18), E28@8.4Å(now 11.9,conf 0.20), R22@9.5Å(now 13.2,conf 0.17), V96@7.0Å(now 11.7,conf 0.27), K83@8.9Å(now 13.1,conf 0.19)
  - push-out (wants farther): D75@24.2Å(now 21.4,conf 0.45), F93@9.6Å(now 5.0,conf 0.17), Q51@9.0Å(now 4.2,conf 0.18), D92@8.1Å(now 5.3,conf 0.22), T45@19.8Å(now 17.0,conf 0.22), I12@17.8Å(now 14.9,conf 0.18), K56@16.9Å(now 12.4,conf 0.16), V86@18.8Å(now 12.7,conf 0.20), I6@17.9Å(now 9.5,conf 0.18), E82@16.7Å(now 12.2,conf 0.16), T41@19.6Å(now 15.7,conf 0.22), N40@17.5Å(now 14.4,conf 0.17), Y24@17.4Å(now 14.1,conf 0.17)
  - G52↔V96: targets 5.9/7.0Å but partners are 19.0Å apart → too_far_apart by 6.0Å
  - Q17↔F21: targets 20.7/9.0Å but partners are 4.6Å apart → too_close_together by 7.1Å
  - V19↔F21: targets 20.3/9.0Å but partners are 4.4Å apart → too_close_together by 6.8Å
- **D9** — severity 49.22, 74 conflict(s); suspect input ~`I12` (group: pull_in)
  - pull-in (wants closer): F20@16.8Å(now 20.0,conf 0.16), V57@8.2Å(now 11.5,conf 0.21), I85@7.4Å(now 11.6,conf 0.25), A77@8.5Å(now 11.9,conf 0.20), G29@9.1Å(now 13.5,conf 0.18), E62@8.3Å(now 14.6,conf 0.21), R76@9.0Å(now 13.7,conf 0.18), M60@9.6Å(now 13.7,conf 0.17)
  - push-out (wants farther): G18@23.8Å(now 19.6,conf 0.41), S72@22.5Å(now 19.4,conf 0.33), K15@21.8Å(now 18.0,conf 0.29), G2@21.0Å(now 17.8,conf 0.26), D3@21.3Å(now 16.5,conf 0.27), G48@10.1Å(now 4.5,conf 0.16), Q17@22.6Å(now 17.4,conf 0.34), D75@20.3Å(now 16.8,conf 0.24), D42@18.2Å(now 15.4,conf 0.18), V86@18.4Å(now 15.3,conf 0.19), V16@20.0Å(now 16.5,conf 0.23), E1@18.1Å(now 15.3,conf 0.18), A54@18.7Å(now 15.0,conf 0.19), F13@16.9Å(now 13.4,conf 0.16), L5@16.4Å(now 12.2,conf 0.15), L88@18.6Å(now 13.3,conf 0.19)
  - I85↔I12: targets 7.4/7.6Å but partners are 20.8Å apart → too_far_apart by 5.8Å
  - K15↔I12: targets 21.8/7.6Å but partners are 8.3Å apart → too_close_together by 5.8Å
  - I85↔R76: targets 7.4/9.0Å but partners are 23.7Å apart → too_far_apart by 7.4Å
- **L50** — severity 47.20, 68 conflict(s); suspect input ~`N81` (group: pull_in)
  - pull-in (wants closer): K15@17.1Å(now 19.8,conf 0.16), N81@7.4Å(now 12.2,conf 0.25), E62@9.0Å(now 12.6,conf 0.18), A77@9.8Å(now 14.6,conf 0.16), Q94@6.8Å(now 9.4,conf 0.29), T4@9.4Å(now 13.2,conf 0.17), K56@6.3Å(now 10.1,conf 0.32)
  - push-out (wants farther): P70@22.0Å(now 19.3,conf 0.30), D42@24.3Å(now 19.1,conf 0.45), V35@9.1Å(now 5.3,conf 0.18), W37@9.0Å(now 5.7,conf 0.18), V57@10.0Å(now 6.8,conf 0.16), S69@19.0Å(now 15.8,conf 0.20), T41@19.0Å(now 15.6,conf 0.20), V46@16.7Å(now 11.9,conf 0.16), W63@17.4Å(now 12.4,conf 0.17), G29@9.2Å(now 6.3,conf 0.18), V86@17.6Å(now 13.0,conf 0.17), L88@16.7Å(now 9.1,conf 0.16)
  - D42↔V38: targets 24.3/5.8Å but partners are 11.9Å apart → too_close_together by 6.5Å
  - N81↔K30: targets 7.4/7.2Å but partners are 21.2Å apart → too_far_apart by 6.6Å
  - V38↔K56: targets 5.8/6.3Å but partners are 16.9Å apart → too_far_apart by 4.7Å
- **E62** — severity 43.82, 64 conflict(s); suspect input ~`Q51` (group: pull_in)
  - pull-in (wants closer): K87@19.4Å(now 21.9,conf 0.21), T91@17.6Å(now 20.9,conf 0.17), G44@17.1Å(now 20.8,conf 0.16), I85@16.5Å(now 19.7,conf 0.15), N40@16.5Å(now 19.8,conf 0.15), Q51@8.8Å(now 14.5,conf 0.19), I74@7.4Å(now 11.3,conf 0.25), L50@9.0Å(now 12.6,conf 0.18), E28@6.2Å(now 12.2,conf 0.33), D9@8.3Å(now 14.6,conf 0.21), G29@8.3Å(now 11.9,conf 0.21)
  - push-out (wants farther): L88@22.7Å(now 20.1,conf 0.34), H59@8.9Å(now 4.8,conf 0.19), T66@10.2Å(now 6.2,conf 0.15), F20@22.4Å(now 18.0,conf 0.33), T4@19.1Å(now 16.1,conf 0.20), L5@18.6Å(now 15.5,conf 0.19), Q26@17.4Å(now 14.6,conf 0.17), E82@21.0Å(now 13.6,conf 0.26), I6@17.0Å(now 14.5,conf 0.16), K67@10.4Å(now 7.9,conf 0.15), K31@18.5Å(now 14.2,conf 0.19), V16@22.4Å(now 15.2,conf 0.32), R22@18.9Å(now 15.9,conf 0.20), T25@17.1Å(now 13.4,conf 0.16)
  - I74↔V16: targets 7.4/22.4Å but partners are 5.8Å apart → too_close_together by 9.2Å
  - E65↔V16: targets 6.4/22.4Å but partners are 10.3Å apart → too_close_together by 5.7Å
  - F20↔E28: targets 22.4/6.2Å but partners are 11.2Å apart → too_close_together by 5.1Å

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=39 · 3-10(G)=15 · coil(C)=6

```
EHEEEGGEGEGGGCCEEHHHHEHHEHEHHEHHHEGEECEEEHHHEGEEEGEEEEHHHEHHHHHEHEEEGGCHECEGHGHEHHEHEHEGGEHHHEHC
```

## Backbone H-bond Network

- total=81 · helix(i→i+4)=12 · sheet=69
  - V19 ↔ K23  (helix)
  - F20 ↔ Y24  (helix)
  - Y24 ↔ E28  (helix)
  - E28 ↔ L32  (helix)
  - G29 ↔ G33  (helix)
  - S55 ↔ H59  (helix)
  - V57 ↔ Q61  (helix)
  - H59 ↔ W63  (helix)
  - Q61 ↔ E65  (helix)
  - A77 ↔ N81  (helix)
  - E82 ↔ V86  (helix)
  - T91 ↔ I95  (helix)
  - E1 ↔ V8  (sheet)
  - Y10 ↔ V16  (sheet)
  - Y10 ↔ T25  (sheet)
  - V16 ↔ R22  (sheet)
  - V16 ↔ T25  (sheet)
  - Q17 ↔ R22  (sheet)
  - Q17 ↔ T25  (sheet)
  - R22 ↔ A27  (sheet)
  - … +61 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=36 · exposed=33 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=419 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=232 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.529 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
