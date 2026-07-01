# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1TEN\seeds\seed_0\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 2.007 A
- tm_score_ca_ordered: 0.7716279868623231
- heavy_atom_rmsd: 3.388 A
- sidechain_heavy_atom_rmsd: 4.202 A
- **all-atom quality (honest):** heavy 3.388 A, sidechain 4.202 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 3655
- bin_accuracy: 0.354

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.0065289589903603
- ga_delta_rmsd: 0.007990323607205418  ga_fitness_mode: energy
- pre_local_rmsd: 2.0273021447771296  localized_anchor_rmsd: 2.0066020897238026

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L33-G36 → 606 conflicts (21%); L71-S73 → 383 conflicts (13%); P82-T86 → 319 conflicts (11%)
- explained: 1308/2878 conflicts by 3 root cause(s)
- metrics: hubs=88 (frac 1.0), conflicts/hub=32.7, max_incompat=11.03Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L33-G36 + L71-S73 + P82-T86 — explain ~1308/2878 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y35** — severity 73.24, 124 conflict(s); suspect input ~`D64` (group: push_out)
  - pull-in (wants closer): Y56@9.5Å(now 12.0,conf 0.17), S73@10.2Å(now 13.7,conf 0.15), L49@8.2Å(now 12.9,conf 0.21), K62@8.0Å(now 11.0,conf 0.22), D39@8.8Å(now 12.1,conf 0.19), F87@9.1Å(now 11.7,conf 0.18), K84@7.4Å(now 11.5,conf 0.25), Q55@9.4Å(now 14.4,conf 0.17), D64@10.4Å(now 13.8,conf 0.15), I19@6.7Å(now 10.4,conf 0.29), N60@8.4Å(now 11.3,conf 0.20), P82@9.6Å(now 12.9,conf 0.17), A83@7.4Å(now 12.6,conf 0.25), I72@8.8Å(now 11.5,conf 0.19)
  - push-out (wants farther): V69@9.3Å(now 6.3,conf 0.18), M78@21.4Å(now 18.7,conf 0.28), R74@19.3Å(now 15.5,conf 0.21), E53@19.1Å(now 16.3,conf 0.20), V12@17.3Å(now 13.2,conf 0.17)
  - N60↔A83: targets 8.4/7.4Å but partners are 23.2Å apart → too_far_apart by 7.4Å
  - L49↔D39: targets 8.2/8.8Å but partners are 24.6Å apart → too_far_apart by 7.6Å
  - K62↔A83: targets 8.0/7.4Å but partners are 21.8Å apart → too_far_apart by 6.3Å
- **I72** — severity 63.65, 98 conflict(s); suspect input ~`L18` (group: pull_in)
  - pull-in (wants closer): T65@17.4Å(now 21.3,conf 0.17), D11@17.1Å(now 20.8,conf 0.16), L18@10.4Å(now 16.5,conf 0.15), A26@6.8Å(now 11.8,conf 0.29), E51@9.5Å(now 13.1,conf 0.17), T45@7.5Å(now 13.1,conf 0.24), T50@10.3Å(now 13.5,conf 0.15), Y35@8.8Å(now 11.5,conf 0.19)
  - push-out (wants farther): T15@26.0Å(now 22.3,conf 0.65), T88@22.2Å(now 19.6,conf 0.31), G59@23.8Å(now 20.6,conf 0.41), S79@10.0Å(now 5.8,conf 0.16), K38@19.0Å(now 16.4,conf 0.20), A83@10.4Å(now 6.8,conf 0.15), S57@21.0Å(now 18.2,conf 0.26), I47@17.4Å(now 11.8,conf 0.17), G36@18.1Å(now 14.1,conf 0.18), I7@17.4Å(now 12.7,conf 0.17)
  - A26↔T45: targets 6.8/7.5Å but partners are 22.7Å apart → too_far_apart by 8.4Å
  - L1↔T45: targets 7.2/7.5Å but partners are 21.1Å apart → too_far_apart by 6.3Å
  - D64↔A26: targets 21.9/6.8Å but partners are 33.8Å apart → too_far_apart by 5.2Å
- **W21** — severity 44.19, 72 conflict(s); suspect input ~`A17` (group: push_out)
  - pull-in (wants closer): K62@17.1Å(now 22.3,conf 0.16), D43@17.5Å(now 22.1,conf 0.17), V9@7.2Å(now 10.0,conf 0.26), E27@10.1Å(now 13.8,conf 0.16), T50@8.3Å(now 12.2,conf 0.21), Y56@7.5Å(now 10.1,conf 0.24), D48@8.1Å(now 14.7,conf 0.22), A17@9.7Å(now 13.7,conf 0.17), S73@7.7Å(now 10.4,conf 0.23), E85@8.7Å(now 11.8,conf 0.20), L25@8.0Å(now 10.8,conf 0.22)
  - push-out (wants farther): D14@23.6Å(now 21.1,conf 0.40), R74@17.2Å(now 13.9,conf 0.16), I28@17.4Å(now 14.5,conf 0.17), V12@22.1Å(now 15.8,conf 0.31), L49@16.9Å(now 13.2,conf 0.16), T34@18.6Å(now 14.8,conf 0.19)
  - V9↔V12: targets 7.2/22.1Å but partners are 7.6Å apart → too_close_together by 7.3Å
  - A17↔V12: targets 9.7/22.1Å but partners are 3.5Å apart → too_close_together by 8.9Å
  - D14↔V9: targets 23.6/7.2Å but partners are 12.2Å apart → too_close_together by 4.2Å
- **I19** — severity 43.63, 67 conflict(s); suspect input ~`D52` (group: pull_in)
  - pull-in (wants closer): D29@16.4Å(now 19.1,conf 0.15), E53@7.8Å(now 11.2,conf 0.23), K23@9.0Å(now 12.2,conf 0.18), D52@8.9Å(now 13.9,conf 0.19), T46@10.1Å(now 14.6,conf 0.16), L61@9.2Å(now 13.6,conf 0.18), Y35@6.7Å(now 10.4,conf 0.29), F87@7.9Å(now 10.9,conf 0.23), Y67@8.5Å(now 11.6,conf 0.20)
  - push-out (wants farther): L1@24.2Å(now 18.3,conf 0.45), S79@22.3Å(now 19.0,conf 0.32), L25@21.8Å(now 17.4,conf 0.30), D43@20.2Å(now 17.6,conf 0.23), K10@10.1Å(now 6.7,conf 0.16), P63@20.8Å(now 17.4,conf 0.25), T13@17.4Å(now 12.5,conf 0.17), L49@16.5Å(now 13.5,conf 0.15)
  - D52↔F87: targets 8.9/7.9Å but partners are 24.4Å apart → too_far_apart by 7.6Å
  - D43↔Y35: targets 20.2/6.7Å but partners are 7.4Å apart → too_close_together by 6.0Å
  - E53↔F87: targets 7.8/7.9Å but partners are 21.9Å apart → too_far_apart by 6.2Å
- **P4** — severity 43.24, 67 conflict(s); suspect input ~`V69` (group: push_out)
  - pull-in (wants closer): K62@19.0Å(now 24.1,conf 0.20), N60@20.8Å(now 23.7,conf 0.25), D43@19.0Å(now 21.7,conf 0.20), G59@18.8Å(now 21.4,conf 0.20), E8@5.8Å(now 10.1,conf 0.36), I28@9.4Å(now 13.0,conf 0.17), V69@8.2Å(now 10.8,conf 0.21), E32@8.1Å(now 11.5,conf 0.22), L25@5.9Å(now 8.6,conf 0.35), D48@9.7Å(now 15.4,conf 0.17), L49@10.3Å(now 14.5,conf 0.15)
  - push-out (wants farther): G42@26.1Å(now 23.6,conf 0.67), K38@22.9Å(now 19.9,conf 0.35), D11@22.3Å(now 17.9,conf 0.32), D77@20.0Å(now 17.2,conf 0.23), Y56@18.1Å(now 14.3,conf 0.18), T34@16.3Å(now 13.7,conf 0.15), K10@17.8Å(now 15.0,conf 0.17), T46@19.1Å(now 16.3,conf 0.20)
  - D11↔E8: targets 22.3/5.8Å but partners are 9.6Å apart → too_close_together by 6.9Å
  - E8↔L25: targets 5.8/5.9Å but partners are 17.7Å apart → too_far_apart by 6.0Å
  - E8↔L1: targets 5.8/7.1Å but partners are 17.9Å apart → too_far_apart by 5.0Å
- **T45** — severity 40.59, 59 conflict(s); suspect input ~`I72` (group: pull_in)
  - pull-in (wants closer): L1@17.8Å(now 21.1,conf 0.18), Q6@18.3Å(now 21.7,conf 0.19), E85@7.7Å(now 15.0,conf 0.23), E66@9.8Å(now 14.2,conf 0.16), Y56@9.8Å(now 14.8,conf 0.16), I58@8.2Å(now 12.3,conf 0.21), V69@8.6Å(now 11.2,conf 0.20), I72@7.5Å(now 13.1,conf 0.24), A83@9.5Å(now 15.8,conf 0.17)
  - push-out (wants farther): F22@26.1Å(now 21.1,conf 0.67), G76@21.6Å(now 18.7,conf 0.29), K10@23.1Å(now 19.9,conf 0.37), D64@20.4Å(now 16.7,conf 0.24), E53@22.1Å(now 18.2,conf 0.31), R74@18.5Å(now 15.8,conf 0.19), P82@19.4Å(now 15.2,conf 0.21), T16@17.7Å(now 15.1,conf 0.17), T15@21.4Å(now 15.6,conf 0.28), D39@17.6Å(now 13.5,conf 0.17)
  - G36↔T15: targets 5.6/21.4Å but partners are 10.4Å apart → too_close_together by 5.4Å
  - P82↔I72: targets 19.4/7.5Å but partners are 5.4Å apart → too_close_together by 6.4Å
  - F22↔I72: targets 26.1/7.5Å but partners are 13.1Å apart → too_close_together by 5.5Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=45 · 3-10(G)=15 · coil(C)=10

```
CEHGHHHECECEGHEEEEGEECCGGEEGHCHGGGEEHEHHEHHEGGEEEEHEEHCEEEEHEECEEEEHHEEGGEGEHEECCGEEEEEE
```

## Backbone H-bond Network

- total=66 · helix(i→i+4)=2 · sheet=64
  - A3 ↔ I7  (helix)
  - D39 ↔ D43  (helix)
  - D2 ↔ W21  (sheet)
  - E8 ↔ A17  (sheet)
  - E8 ↔ L18  (sheet)
  - E8 ↔ T20  (sheet)
  - E8 ↔ W21  (sheet)
  - K10 ↔ T15  (sheet)
  - K10 ↔ T16  (sheet)
  - K10 ↔ A17  (sheet)
  - K10 ↔ L18  (sheet)
  - K10 ↔ T20  (sheet)
  - K10 ↔ W21  (sheet)
  - V12 ↔ A17  (sheet)
  - V12 ↔ L18  (sheet)
  - V12 ↔ T20  (sheet)
  - T15 ↔ Y35  (sheet)
  - T16 ↔ Y35  (sheet)
  - T16 ↔ G36  (sheet)
  - A17 ↔ Y35  (sheet)
  - … +46 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=37 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=328 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=202 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4229 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1TEN.ensemble.pdb`)
- RMSF mean=0.069Å max=0.272Å (per-residue in .per_residue.csv)
- most flexible residues: 88, 75, 65, 66, 67

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1TEN.pae.csv`
- mean=0.045Å · max=0.406Å · AlphaFold-PAE analog (low block = rigid unit/domain)
