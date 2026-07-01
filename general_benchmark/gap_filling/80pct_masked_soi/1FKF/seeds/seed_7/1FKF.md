# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1FKF\seeds\seed_7\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 9.195 A
- tm_score_ca_ordered: 0.23373003946578855
- heavy_atom_rmsd: 10.070 A
- sidechain_heavy_atom_rmsd: 11.001 A
- **all-atom quality (honest):** heavy 10.070 A, sidechain 11.001 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 53
- distogram_pairs: 1093
- bin_accuracy: 0.300

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=57
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.194537660669921
- ga_delta_rmsd: 0.3310719179248185  ga_fitness_mode: energy
- pre_local_rmsd: 9.196890119738793  localized_anchor_rmsd: 9.194539185254188

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G27-F35 → 492 conflicts (35%); G57-M65 → 293 conflicts (21%); V1-I6 → 204 conflicts (14%)
- explained: 989/1406 conflicts by 3 root cause(s)
- metrics: hubs=101 (frac 0.962), conflicts/hub=13.9, max_incompat=14.45Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G27-F35 + G57-M65 + V1-I6 — explain ~989/1406 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I75** — severity 123.75, 42 conflict(s); suspect input ~`Q2` (group: pull_in)
  - pull-in (wants closer): V1@4.6Å(now 8.8,conf 0.59), Q2@6.8Å(now 18.9,conf 0.55), T5@14.5Å(now 22.1,conf 0.55), L29@10.2Å(now 13.5,conf 0.55), Y25@13.9Å(now 17.2,conf 0.55), E30@9.9Å(now 14.1,conf 0.55)
  - push-out (wants farther): G68@21.0Å(now 13.3,conf 1.00), Y79@7.0Å(now 3.0,conf 1.00), A71@13.0Å(now 6.2,conf 0.99), Y81@9.4Å(now 3.6,conf 0.79), F47@17.9Å(now 15.4,conf 0.55), Q69@17.8Å(now 8.1,conf 0.55), G85@13.0Å(now 9.1,conf 0.55), R56@8.9Å(now 4.3,conf 0.55), V54@12.4Å(now 8.9,conf 0.55), R70@15.8Å(now 10.1,conf 0.55), P91@14.1Å(now 7.3,conf 0.55)
  - D78↔Q2: targets 9.0/6.8Å but partners are 29.5Å apart → too_far_apart by 13.7Å
  - A80↔Q2: targets 7.6/6.8Å but partners are 27.1Å apart → too_far_apart by 12.7Å
  - G68↔V1: targets 21.0/4.6Å but partners are 5.8Å apart → too_close_together by 10.6Å
- **M48** — severity 108.93, 37 conflict(s); suspect input ~`T20` (group: pull_in)
  - pull-in (wants closer): T20@4.8Å(now 14.2,conf 0.58), T13@15.2Å(now 17.8,conf 0.55)
  - push-out (wants farther): D31@27.5Å(now 23.3,conf 0.99), G32@27.2Å(now 18.7,conf 0.90), V54@8.6Å(now 5.7,conf 0.79), E30@26.6Å(now 18.7,conf 0.78), K34@23.6Å(now 16.3,conf 0.76), Q69@17.4Å(now 6.3,conf 0.55)
  - F45↔G32: targets 11.0/27.2Å but partners are 8.5Å apart → too_close_together by 7.8Å
  - F45↔K34: targets 11.0/23.6Å but partners are 4.2Å apart → too_close_together by 8.5Å
  - E53↔T20: targets 6.0/4.8Å but partners are 20.0Å apart → too_far_apart by 9.2Å
- **S76** — severity 101.15, 33 conflict(s); suspect input ~`V1` (group: pull_in)
  - pull-in (wants closer): Q2@9.0Å(now 19.5,conf 0.55), T26@16.5Å(now 19.2,conf 0.55)
  - push-out (wants farther): K72@13.0Å(now 8.1,conf 0.99), R70@19.1Å(now 10.1,conf 0.91), A71@16.9Å(now 5.1,conf 0.91), Q69@21.6Å(now 5.8,conf 0.79), V67@23.6Å(now 13.2,conf 0.76), L73@10.0Å(now 6.1,conf 0.72), S66@21.9Å(now 8.9,conf 0.63), Y81@8.0Å(now 4.8,conf 0.59), Y79@5.6Å(now 3.0,conf 0.56), M65@18.4Å(now 11.6,conf 0.55), P91@12.8Å(now 9.2,conf 0.55), E59@13.2Å(now 8.3,conf 0.55), V100@16.2Å(now 13.5,conf 0.55)
  - S66↔V1: targets 21.9/6.5Å but partners are 3.4Å apart → too_close_together by 12.1Å
  - Q2↔A80: targets 9.0/6.2Å but partners are 27.1Å apart → too_far_apart by 11.9Å
  - V67↔V1: targets 23.6/6.5Å but partners are 6.7Å apart → too_close_together by 10.4Å
- **A63** — severity 89.47, 29 conflict(s); suspect input ~`R17` (group: pull_in)
  - pull-in (wants closer): E60@5.0Å(now 9.7,conf 0.99), E59@5.1Å(now 8.0,conf 0.91), F14@6.4Å(now 14.6,conf 0.55), R17@8.9Å(now 20.3,conf 0.55), C21@9.6Å(now 14.0,conf 0.55), D10@13.8Å(now 17.3,conf 0.55)
  - push-out (wants farther): R70@13.0Å(now 8.0,conf 1.00), G68@12.9Å(now 9.3,conf 0.91), S66@8.6Å(now 5.5,conf 0.79), Q69@12.6Å(now 7.3,conf 0.79), D36@21.3Å(now 16.9,conf 0.60), M28@20.3Å(now 15.4,conf 0.59), P44@17.5Å(now 13.7,conf 0.55), R56@10.8Å(now 4.0,conf 0.55), F45@15.6Å(now 12.1,conf 0.55)
  - E60↔R17: targets 5.0/8.9Å but partners are 28.3Å apart → too_far_apart by 14.4Å
  - E60↔F14: targets 5.0/6.4Å but partners are 23.7Å apart → too_far_apart by 12.3Å
  - R17↔A80: targets 8.9/16.1Å but partners are 35.8Å apart → too_far_apart by 10.9Å
- **E30** — severity 82.47, 38 conflict(s); suspect input ~`A94` (group: pull_in)
  - pull-in (wants closer): V97@6.2Å(now 10.4,conf 0.55), G82@14.8Å(now 22.0,conf 0.55), T74@8.4Å(now 13.9,conf 0.55), Y81@14.4Å(now 17.2,conf 0.55), P77@11.6Å(now 20.3,conf 0.55), A94@8.1Å(now 19.4,conf 0.55), G85@14.2Å(now 20.1,conf 0.55), I75@9.9Å(now 14.1,conf 0.55)
  - push-out (wants farther): H24@19.0Å(now 13.8,conf 1.00), Y25@15.0Å(now 11.1,conf 1.00), K51@27.4Å(now 21.1,conf 0.94), T26@12.9Å(now 8.8,conf 0.91), G27@9.1Å(now 5.9,conf 0.91), F35@10.9Å(now 3.1,conf 0.91), P15@26.9Å(now 22.1,conf 0.82), D36@12.8Å(now 7.6,conf 0.82), S37@15.2Å(now 6.0,conf 0.82), K33@6.6Å(now 1.3,conf 0.79), M48@26.6Å(now 18.7,conf 0.78), F47@23.6Å(now 15.6,conf 0.76), C21@24.4Å(now 20.5,conf 0.71), V23@20.8Å(now 18.1,conf 0.59), D40@19.7Å(now 8.2,conf 0.57), G57@15.0Å(now 9.1,conf 0.55), W58@16.3Å(now 9.5,conf 0.55)
  - S37↔K34: targets 15.2/7.8Å but partners are 0.6Å apart → too_close_together by 6.8Å
  - K51↔I75: targets 27.4/9.9Å but partners are 10.6Å apart → too_close_together by 6.8Å
  - K51↔T74: targets 27.4/8.4Å but partners are 12.1Å apart → too_close_together by 6.8Å
- **F47** — severity 80.52, 39 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): T20@5.5Å(now 11.9,conf 0.56), E53@6.7Å(now 9.3,conf 0.55), V22@6.9Å(now 11.7,conf 0.55), G18@9.6Å(now 18.0,conf 0.55)
  - push-out (wants farther): E30@23.6Å(now 15.6,conf 0.76), L29@21.8Å(now 14.7,conf 0.62), E4@21.0Å(now 11.2,conf 0.60), K72@18.0Å(now 11.4,conf 0.55), I75@17.9Å(now 15.4,conf 0.55), V67@14.6Å(now 6.6,conf 0.55), M65@14.6Å(now 9.5,conf 0.55), D99@16.1Å(now 12.1,conf 0.55)
  - E53↔G18: targets 6.7/9.6Å but partners are 25.8Å apart → too_far_apart by 9.4Å
  - T20↔E53: targets 5.5/6.7Å but partners are 20.0Å apart → too_far_apart by 7.9Å
  - Q52↔G18: targets 10.0/9.6Å but partners are 26.4Å apart → too_far_apart by 6.7Å

## Secondary Structure (DSSP-like)

- helix(H)=60 · strand(E)=30 · 3-10(G)=10 · coil(C)=5

```
CEEHHHHEHHHHHHEHHHHHEHHEEGHHHHHHHHHGGHEHGHECEEEEGECEHGGHHGHHHEEHHHHGHHHHHHHHEHHHHEHECEGEHHHEHHEEHHEEEHEEC
```

## Backbone H-bond Network

- total=86 · helix(i→i+4)=36 · sheet=50
  - I6 ↔ D10  (helix)
  - S7 ↔ G11  (helix)
  - D10 ↔ F14  (helix)
  - R12 ↔ K16  (helix)
  - F14 ↔ G18  (helix)
  - K16 ↔ T20  (helix)
  - G18 ↔ V22  (helix)
  - Q19 ↔ V23  (helix)
  - V23 ↔ G27  (helix)
  - G27 ↔ D31  (helix)
  - L29 ↔ K33  (helix)
  - E30 ↔ K34  (helix)
  - D31 ↔ F35  (helix)
  - K34 ↔ S38  (helix)
  - S38 ↔ N42  (helix)
  - E53 ↔ G57  (helix)
  - R56 ↔ E60  (helix)
  - G57 ↔ G61  (helix)
  - E60 ↔ Q64  (helix)
  - G61 ↔ M65  (helix)
  - … +66 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=680 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=463 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.9896 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=53 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
