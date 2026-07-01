# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\2ACY\seeds\seed_0\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 1.570 A
- tm_score_ca_ordered: 0.8495285527561355
- heavy_atom_rmsd: 3.005 A
- sidechain_heavy_atom_rmsd: 3.733 A
- **all-atom quality (honest):** heavy 3.005 A, sidechain 3.733 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 4371
- bin_accuracy: 0.337

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.570469670882067
- ga_delta_rmsd: 0.8646793100031509  ga_fitness_mode: energy
- pre_local_rmsd: 1.5963221197325557  localized_anchor_rmsd: 1.5704256512858306

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T45-A77 → 2308 conflicts (61%); F21-T41 → 1026 conflicts (27%); D3-F13 → 221 conflicts (6%)
- explained: 3555/3761 conflicts by 3 root cause(s)
- metrics: hubs=96 (frac 1.0), conflicts/hub=39.2, max_incompat=10.14Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T45-A77 + F21-T41 + D3-F13 — explain ~3555/3761 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A77** — severity 70.66, 104 conflict(s); suspect input ~`L50` (group: pull_in)
  - pull-in (wants closer): G68@8.7Å(now 11.8,conf 0.19), T25@5.9Å(now 12.7,conf 0.35), D9@8.5Å(now 11.2,conf 0.20), Q49@9.9Å(now 12.8,conf 0.16), L50@9.8Å(now 14.1,conf 0.16), Q61@6.2Å(now 9.4,conf 0.33), Q47@6.8Å(now 10.7,conf 0.29), V8@9.6Å(now 12.4,conf 0.17)
  - push-out (wants farther): L5@23.8Å(now 19.9,conf 0.42), I12@6.4Å(now 3.8,conf 0.31), K31@23.6Å(now 19.9,conf 0.40), V84@22.1Å(now 19.6,conf 0.31), P53@22.1Å(now 19.3,conf 0.31), V96@22.3Å(now 18.7,conf 0.32), F13@9.3Å(now 4.8,conf 0.17), V19@17.5Å(now 14.2,conf 0.17), S72@17.8Å(now 12.4,conf 0.17), P70@19.2Å(now 15.3,conf 0.21), G44@17.8Å(now 13.2,conf 0.17), Q39@18.7Å(now 14.1,conf 0.20), G29@21.1Å(now 14.9,conf 0.27), Y24@17.9Å(now 14.2,conf 0.18)
  - T25↔G29: targets 5.9/21.1Å but partners are 6.4Å apart → too_close_together by 8.8Å
  - K31↔T25: targets 23.6/5.9Å but partners are 11.4Å apart → too_close_together by 6.3Å
  - V96↔T25: targets 22.3/5.9Å but partners are 10.2Å apart → too_close_together by 6.2Å
- **G36** — severity 56.94, 94 conflict(s); suspect input ~`F21` (group: pull_in)
  - pull-in (wants closer): K71@19.6Å(now 23.0,conf 0.22), H73@19.3Å(now 22.1,conf 0.21), S72@16.9Å(now 21.1,conf 0.16), Q43@16.3Å(now 20.2,conf 0.15), F21@9.0Å(now 15.7,conf 0.18), E28@8.4Å(now 11.8,conf 0.20), R22@9.5Å(now 13.2,conf 0.17), A54@10.1Å(now 12.8,conf 0.16), V96@7.0Å(now 12.1,conf 0.27), K83@8.9Å(now 12.5,conf 0.19)
  - push-out (wants farther): D75@24.2Å(now 21.5,conf 0.45), F93@9.6Å(now 5.1,conf 0.17), Q51@9.0Å(now 4.1,conf 0.18), Y90@6.9Å(now 4.1,conf 0.28), D92@8.1Å(now 5.3,conf 0.22), T45@19.8Å(now 16.9,conf 0.22), I12@17.8Å(now 15.1,conf 0.18), K56@16.9Å(now 12.7,conf 0.16), V86@18.8Å(now 12.5,conf 0.20), I6@17.9Å(now 9.4,conf 0.18), E82@16.7Å(now 12.0,conf 0.16), T41@19.6Å(now 15.7,conf 0.22), N40@17.5Å(now 14.7,conf 0.17), Y24@17.4Å(now 14.4,conf 0.17)
  - G52↔V96: targets 5.9/7.0Å but partners are 19.3Å apart → too_far_apart by 6.4Å
  - Q17↔F21: targets 20.7/9.0Å but partners are 4.3Å apart → too_close_together by 7.4Å
  - S7↔I6: targets 7.0/17.9Å but partners are 4.1Å apart → too_close_together by 6.9Å
- **Q51** — severity 55.24, 82 conflict(s); suspect input ~`Q47` (group: pull_in)
  - pull-in (wants closer): D42@17.4Å(now 22.5,conf 0.17), S72@19.5Å(now 22.9,conf 0.21), K15@19.0Å(now 23.6,conf 0.20), F79@9.0Å(now 14.4,conf 0.18), Q61@8.2Å(now 10.8,conf 0.21), A27@10.2Å(now 13.3,conf 0.15), E62@8.8Å(now 14.4,conf 0.19), Q47@9.2Å(now 13.4,conf 0.18), Q94@8.7Å(now 11.9,conf 0.20)
  - push-out (wants farther): Q43@25.4Å(now 22.8,conf 0.56), S69@22.2Å(now 19.6,conf 0.32), V35@8.0Å(now 4.2,conf 0.22), G36@9.0Å(now 4.1,conf 0.18), G68@22.5Å(now 17.8,conf 0.33), K23@20.8Å(now 16.3,conf 0.26), V38@19.7Å(now 11.1,conf 0.22)
  - W37↔V38: targets 6.2/19.7Å but partners are 4.5Å apart → too_close_together by 9.1Å
  - G48↔V38: targets 8.0/19.7Å but partners are 4.3Å apart → too_close_together by 7.4Å
  - G68↔G29: targets 22.5/6.7Å but partners are 10.6Å apart → too_close_together by 5.2Å
- **D9** — severity 52.66, 80 conflict(s); suspect input ~`R76` (group: pull_in)
  - pull-in (wants closer): F20@16.8Å(now 19.7,conf 0.16), V57@8.2Å(now 11.4,conf 0.21), I85@7.4Å(now 11.7,conf 0.25), A77@8.5Å(now 11.2,conf 0.20), V84@8.0Å(now 11.3,conf 0.22), G29@9.1Å(now 12.8,conf 0.18), E62@8.3Å(now 14.4,conf 0.21), R76@9.0Å(now 13.5,conf 0.18), M60@9.6Å(now 13.8,conf 0.17)
  - push-out (wants farther): G18@23.8Å(now 19.7,conf 0.41), S72@22.5Å(now 19.8,conf 0.33), K15@21.8Å(now 17.8,conf 0.29), G2@21.0Å(now 18.3,conf 0.26), D3@21.3Å(now 16.6,conf 0.27), G48@10.1Å(now 4.9,conf 0.16), Q17@22.6Å(now 17.8,conf 0.34), D75@20.3Å(now 16.6,conf 0.24), V86@18.4Å(now 15.5,conf 0.19), V16@20.0Å(now 16.2,conf 0.23), E28@19.2Å(now 16.3,conf 0.21), A54@18.7Å(now 15.1,conf 0.19), F13@16.9Å(now 12.9,conf 0.16), L5@16.4Å(now 12.5,conf 0.15), L88@18.6Å(now 13.5,conf 0.19)
  - I85↔R76: targets 7.4/9.0Å but partners are 24.2Å apart → too_far_apart by 7.9Å
  - K15↔I12: targets 21.8/7.6Å but partners are 8.5Å apart → too_close_together by 5.6Å
  - D75↔R76: targets 20.3/9.0Å but partners are 4.2Å apart → too_close_together by 7.2Å
- **L50** — severity 46.80, 67 conflict(s); suspect input ~`N81` (group: pull_in)
  - pull-in (wants closer): K15@17.1Å(now 19.9,conf 0.16), S72@16.3Å(now 19.1,conf 0.15), N81@7.4Å(now 12.0,conf 0.25), E62@9.0Å(now 12.1,conf 0.18), A77@9.8Å(now 14.1,conf 0.16), Q94@6.8Å(now 9.7,conf 0.29), T4@9.4Å(now 13.8,conf 0.17), K56@6.3Å(now 9.8,conf 0.32)
  - push-out (wants farther): D42@24.3Å(now 19.6,conf 0.45), V35@9.1Å(now 5.1,conf 0.18), W37@9.0Å(now 5.7,conf 0.18), V57@10.0Å(now 6.5,conf 0.16), S69@19.0Å(now 16.0,conf 0.20), T41@19.0Å(now 15.9,conf 0.20), V46@16.7Å(now 12.0,conf 0.16), W63@17.4Å(now 12.1,conf 0.17), G29@9.2Å(now 5.5,conf 0.18), V86@17.6Å(now 13.1,conf 0.17), L88@16.7Å(now 9.4,conf 0.16)
  - D42↔V38: targets 24.3/5.8Å but partners are 12.2Å apart → too_close_together by 6.2Å
  - N81↔K30: targets 7.4/7.2Å but partners are 20.3Å apart → too_far_apart by 5.8Å
  - V38↔K56: targets 5.8/6.3Å but partners are 16.7Å apart → too_far_apart by 4.5Å
- **R22** — severity 44.67, 77 conflict(s); suspect input ~`G36` (group: push_out)
  - pull-in (wants closer): E1@21.5Å(now 25.1,conf 0.28), I85@18.7Å(now 23.8,conf 0.19), N81@17.9Å(now 20.5,conf 0.18), L88@17.6Å(now 20.2,conf 0.17), I12@8.8Å(now 11.8,conf 0.19), Q43@10.1Å(now 15.0,conf 0.15), K15@9.3Å(now 13.1,conf 0.17), L32@9.3Å(now 15.2,conf 0.18), M60@8.8Å(now 13.1,conf 0.19), K30@9.3Å(now 12.2,conf 0.18), K71@8.9Å(now 11.6,conf 0.19), G36@9.5Å(now 13.2,conf 0.17)
  - push-out (wants farther): Q26@10.3Å(now 5.1,conf 0.15), T91@18.9Å(now 16.1,conf 0.20), Y90@19.1Å(now 16.1,conf 0.20), D75@19.1Å(now 14.8,conf 0.20), W63@17.6Å(now 12.9,conf 0.17), Q61@16.9Å(now 13.5,conf 0.16), Q49@18.5Å(now 11.9,conf 0.19), F93@18.3Å(now 9.6,conf 0.19), E65@17.8Å(now 13.7,conf 0.17), E62@18.9Å(now 15.4,conf 0.20)
  - V38↔Q49: targets 5.6/18.5Å but partners are 5.5Å apart → too_close_together by 7.4Å
  - H59↔M60: targets 18.7/8.8Å but partners are 3.5Å apart → too_close_together by 6.3Å
  - S55↔M60: targets 23.2/8.8Å but partners are 8.5Å apart → too_close_together by 5.8Å

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=37 · 3-10(G)=13 · coil(C)=6

```
EHEEEGGGGEGGGECEEHHHHEHHEHHHHEHHHEGEECECEHEGEHEEEGEEEEHHHEHHHHHHHEEEGGEHECECHGHEHHEHHHEHHEHHHEHC
```

## Backbone H-bond Network

- total=71 · helix(i→i+4)=17 · sheet=54
  - V19 ↔ K23  (helix)
  - F20 ↔ Y24  (helix)
  - Y24 ↔ E28  (helix)
  - E28 ↔ L32  (helix)
  - G29 ↔ G33  (helix)
  - D42 ↔ V46  (helix)
  - S55 ↔ H59  (helix)
  - K56 ↔ M60  (helix)
  - V57 ↔ Q61  (helix)
  - H59 ↔ W63  (helix)
  - Q61 ↔ E65  (helix)
  - A77 ↔ N81  (helix)
  - N81 ↔ I85  (helix)
  - E82 ↔ V86  (helix)
  - I85 ↔ D89  (helix)
  - D89 ↔ F93  (helix)
  - T91 ↔ I95  (helix)
  - Y10 ↔ V16  (sheet)
  - Y10 ↔ T25  (sheet)
  - V16 ↔ R22  (sheet)
  - … +51 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=38 · exposed=32 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=421 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=239 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5309 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
