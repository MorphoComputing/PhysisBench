# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1FKF\seeds\seed_2\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 9.988 A
- tm_score_ca_ordered: 0.2634478979855252
- heavy_atom_rmsd: 10.956 A
- sidechain_heavy_atom_rmsd: 11.895 A
- **all-atom quality (honest):** heavy 10.956 A, sidechain 11.895 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 67
- distogram_pairs: 1093
- bin_accuracy: 0.331

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.988475550247673
- ga_delta_rmsd: 1.015774973727794  ga_fitness_mode: energy
- pre_local_rmsd: 9.998999736865002  localized_anchor_rmsd: 9.988473510146571

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T13-M48 → 1078 conflicts (78%); G88-P91 → 68 conflicts (5%)
- explained: 1146/1378 conflicts by 2 root cause(s)
- metrics: hubs=99 (frac 0.943), conflicts/hub=13.9, max_incompat=16.76Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T13-M48 + G88-P91 — explain ~1146/1378 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K33** — severity 159.74, 38 conflict(s); suspect input ~`G27` (group: pull_in)
  - pull-in (wants closer): D99@12.3Å(now 16.4,conf 0.55)
  - push-out (wants farther): R17@27.5Å(now 9.3,conf 1.00), G50@27.5Å(now 16.7,conf 1.00), D40@15.0Å(now 11.8,conf 0.94), D36@9.1Å(now 3.2,conf 0.91), C21@25.0Å(now 18.5,conf 0.69), V23@20.1Å(now 17.3,conf 0.58), R41@17.6Å(now 11.7,conf 0.55), R39@15.4Å(now 12.5,conf 0.55), S37@11.5Å(now 8.0,conf 0.55), P77@16.3Å(now 11.1,conf 0.55)
  - R17↔G27: targets 27.5/7.1Å but partners are 3.8Å apart → too_close_together by 16.6Å
  - R17↔M28: targets 27.5/4.9Å but partners are 7.2Å apart → too_close_together by 15.4Å
  - R17↔L29: targets 27.5/4.6Å but partners are 8.6Å apart → too_close_together by 14.3Å
- **V67** — severity 144.83, 39 conflict(s); suspect input ~`V62` (group: pull_in)
  - pull-in (wants closer): V62@9.1Å(now 12.8,conf 0.91), G9@5.2Å(now 9.8,conf 0.57), E4@15.0Å(now 19.0,conf 0.55), F47@14.6Å(now 20.0,conf 0.55), T20@12.1Å(now 17.7,conf 0.55)
  - push-out (wants farther): G88@27.5Å(now 13.9,conf 1.00), P91@27.5Å(now 22.9,conf 1.00), G85@27.5Å(now 22.3,conf 1.00), D78@27.1Å(now 22.7,conf 0.88)
  - G88↔V62: targets 27.5/9.1Å but partners are 3.4Å apart → too_close_together by 15.0Å
  - G88↔A63: targets 27.5/9.0Å but partners are 9.3Å apart → too_close_together by 9.2Å
  - G88↔R70: targets 27.5/9.0Å but partners are 10.7Å apart → too_close_together by 7.8Å
- **E30** — severity 140.80, 64 conflict(s); suspect input ~`P15` (group: pull_in)
  - pull-in (wants closer): V97@6.2Å(now 9.3,conf 0.55)
  - push-out (wants farther): T26@13.0Å(now 9.5,conf 1.00), K51@27.4Å(now 19.7,conf 0.94), D36@13.1Å(now 6.3,conf 0.91), P15@26.9Å(now 18.8,conf 0.82), S37@15.2Å(now 7.0,conf 0.82), M48@26.6Å(now 21.6,conf 0.78), F47@23.6Å(now 17.4,conf 0.76), C21@24.4Å(now 19.4,conf 0.71), V23@20.8Å(now 17.9,conf 0.59), D40@19.7Å(now 3.1,conf 0.57)
  - K51↔K33: targets 27.4/6.9Å but partners are 14.6Å apart → too_close_together by 5.9Å
  - G27↔P15: targets 9.1/26.9Å but partners are 11.3Å apart → too_close_together by 6.4Å
  - P15↔V97: targets 26.9/6.2Å but partners are 11.9Å apart → too_close_together by 8.7Å
- **P91** — severity 129.68, 33 conflict(s); suspect input ~`G88` (group: pull_in)
  - pull-in (wants closer): G88@7.9Å(now 10.6,conf 0.55)
  - push-out (wants farther): L105@27.5Å(now 19.9,conf 1.00), F14@27.5Å(now 18.6,conf 1.00), K16@27.5Å(now 14.4,conf 1.00), V67@27.5Å(now 22.9,conf 1.00), V100@21.2Å(now 18.1,conf 0.60), S76@12.8Å(now 8.6,conf 0.55), D36@14.3Å(now 11.5,conf 0.55), I75@14.1Å(now 7.2,conf 0.55)
  - F98↔K16: targets 15.0/27.5Å but partners are 4.8Å apart → too_close_together by 7.7Å
  - K16↔V97: targets 27.5/12.9Å but partners are 6.3Å apart → too_close_together by 8.4Å
  - K16↔G85: targets 27.5/3.4Å but partners are 16.3Å apart → too_close_together by 7.8Å
- **G27** — severity 128.56, 48 conflict(s); suspect input ~`F35` (group: pull_in)
  - pull-in (wants closer): L103@16.9Å(now 19.8,conf 0.55), E101@12.0Å(now 16.9,conf 0.55)
  - push-out (wants farther): C21@17.0Å(now 13.2,conf 1.00), G18@23.8Å(now 7.1,conf 0.75), K16@23.0Å(now 7.1,conf 0.73), T20@20.0Å(now 8.1,conf 0.72), K34@6.0Å(now 3.4,conf 0.72), Q19@22.5Å(now 7.7,conf 0.68), K43@14.9Å(now 12.2,conf 0.55), E4@14.8Å(now 10.6,conf 0.55), P87@15.3Å(now 11.8,conf 0.55), G88@14.7Å(now 9.5,conf 0.55), I55@12.6Å(now 5.7,conf 0.55), V62@14.2Å(now 11.4,conf 0.55), V1@14.0Å(now 7.5,conf 0.55)
  - K16↔K34: targets 23.0/6.0Å but partners are 7.6Å apart → too_close_together by 9.4Å
  - K16↔H24: targets 23.0/10.0Å but partners are 4.2Å apart → too_close_together by 8.8Å
  - G18↔F35: targets 23.8/5.9Å but partners are 7.5Å apart → too_close_together by 10.4Å
- **Q19** — severity 107.98, 25 conflict(s); suspect input ~`K16` (group: pull_in)
  - pull-in (wants closer): G50@9.4Å(now 14.3,conf 0.55)
  - push-out (wants farther): I90@27.5Å(now 5.5,conf 0.99), V23@13.0Å(now 4.2,conf 0.99), Y25@19.0Å(now 3.3,conf 0.99), T26@21.0Å(now 6.1,conf 0.94), T95@27.4Å(now 7.8,conf 0.94), H24@16.9Å(now 4.1,conf 0.91), G27@22.5Å(now 7.7,conf 0.68), I55@16.9Å(now 7.5,conf 0.55), R56@16.6Å(now 9.9,conf 0.55), G61@15.3Å(now 5.2,conf 0.55), Q64@14.2Å(now 8.6,conf 0.55), V62@12.0Å(now 5.8,conf 0.55)
  - T95↔K16: targets 27.4/6.8Å but partners are 9.1Å apart → too_close_together by 11.4Å
  - I90↔P15: targets 27.5/7.0Å but partners are 10.7Å apart → too_close_together by 9.8Å
  - I90↔K16: targets 27.5/6.8Å but partners are 10.4Å apart → too_close_together by 10.3Å

## Secondary Structure (DSSP-like)

- helix(H)=61 · strand(E)=22 · 3-10(G)=15 · coil(C)=7

```
CECHHHGHHHHHHCGHEGGHGHHEEHEHHEHEHHHHEHEHECCEHHEHHHEHEHHHHHHGHHHGHHHHHEEGGEGGEHHHHHHHHECHHHHHHHHEGEGGEGHHC
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=26 · sheet=35
  - E4 ↔ P8  (helix)
  - T5 ↔ G9  (helix)
  - I6 ↔ D10  (helix)
  - G9 ↔ T13  (helix)
  - K16 ↔ T20  (helix)
  - V22 ↔ T26  (helix)
  - L29 ↔ K33  (helix)
  - D31 ↔ F35  (helix)
  - K34 ↔ S38  (helix)
  - D36 ↔ D40  (helix)
  - F45 ↔ L49  (helix)
  - K46 ↔ G50  (helix)
  - M48 ↔ Q52  (helix)
  - G50 ↔ V54  (helix)
  - Q52 ↔ R56  (helix)
  - I55 ↔ E59  (helix)
  - G57 ↔ G61  (helix)
  - E59 ↔ A63  (helix)
  - G61 ↔ M65  (helix)
  - V62 ↔ S66  (helix)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=44 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=866 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=684 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.3001 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=67 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
