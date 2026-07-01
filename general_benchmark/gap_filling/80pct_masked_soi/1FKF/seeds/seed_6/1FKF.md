# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1FKF\seeds\seed_6\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 10.829 A
- tm_score_ca_ordered: 0.17568072808254903
- heavy_atom_rmsd: 11.677 A
- sidechain_heavy_atom_rmsd: 12.504 A
- **all-atom quality (honest):** heavy 11.677 A, sidechain 12.504 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 69
- distogram_pairs: 1086
- bin_accuracy: 0.273

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=57
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.829247239316341
- ga_delta_rmsd: 0.8845817637202007  ga_fitness_mode: energy
- pre_local_rmsd: 10.834495791697908  localized_anchor_rmsd: 10.82923354435167

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G18-K33 → 684 conflicts (46%); V1 → 78 conflicts (5%)
- explained: 762/1471 conflicts by 2 root cause(s)
- metrics: hubs=102 (frac 0.971), conflicts/hub=14.4, max_incompat=18.54Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G18-K33 + V1 — explain ~762/1471 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E30** — severity 203.86, 72 conflict(s); suspect input ~`V97` (group: pull_in)
  - pull-in (wants closer): G82@14.8Å(now 18.2,conf 0.55), Y81@14.4Å(now 18.3,conf 0.55), P77@11.6Å(now 16.7,conf 0.55), A94@8.1Å(now 14.7,conf 0.55), G85@14.2Å(now 19.8,conf 0.55)
  - push-out (wants farther): K33@7.0Å(now 2.7,conf 1.00), S37@15.0Å(now 10.2,conf 1.00), H24@19.0Å(now 4.9,conf 0.99), T26@13.0Å(now 7.5,conf 0.99), K51@27.4Å(now 19.5,conf 0.94), Y25@15.1Å(now 3.1,conf 0.91), G27@9.1Å(now 5.0,conf 0.91), P15@26.9Å(now 11.1,conf 0.82), M48@26.6Å(now 17.2,conf 0.78), F47@23.6Å(now 14.4,conf 0.76), C21@24.4Å(now 9.4,conf 0.71), K34@9.6Å(now 6.9,conf 0.69), V23@20.8Å(now 7.7,conf 0.59), D40@19.7Å(now 17.1,conf 0.57), A71@15.2Å(now 6.0,conf 0.55), W58@16.3Å(now 12.4,conf 0.55), E4@14.4Å(now 9.7,conf 0.55)
  - K33↔H24: targets 7.0/19.0Å but partners are 3.9Å apart → too_close_together by 8.1Å
  - K33↔P15: targets 7.0/26.9Å but partners are 10.6Å apart → too_close_together by 9.3Å
  - F47↔A94: targets 23.6/8.1Å but partners are 3.9Å apart → too_close_together by 11.6Å
- **K33** — severity 177.95, 38 conflict(s); suspect input ~`C21` (group: pull_in)
  - pull-in (wants closer): P92@15.4Å(now 19.4,conf 0.55), G88@14.3Å(now 19.6,conf 0.55)
  - push-out (wants farther): E30@7.0Å(now 2.7,conf 1.00), R17@27.5Å(now 11.3,conf 1.00), G50@27.5Å(now 19.0,conf 1.00), S38@14.9Å(now 11.3,conf 0.91), C21@25.0Å(now 9.8,conf 0.69), V23@20.1Å(now 7.9,conf 0.58), R39@15.4Å(now 12.8,conf 0.55), S37@11.5Å(now 8.7,conf 0.55), T74@13.7Å(now 10.7,conf 0.55), T26@10.2Å(now 6.3,conf 0.55)
  - L29↔R17: targets 5.0/27.5Å but partners are 5.3Å apart → too_close_together by 17.2Å
  - L29↔C21: targets 5.0/25.0Å but partners are 4.3Å apart → too_close_together by 15.7Å
  - R17↔M28: targets 27.5/4.6Å but partners are 10.1Å apart → too_close_together by 12.8Å
- **G18** — severity 145.91, 41 conflict(s); suspect input ~`P15` (group: pull_in)
  - pull-in (wants closer): G50@7.0Å(now 12.5,conf 0.55), Q52@12.1Å(now 15.0,conf 0.55)
  - push-out (wants farther): G32@27.5Å(now 12.4,conf 1.00), F35@27.5Å(now 13.7,conf 0.99), V22@13.0Å(now 9.4,conf 0.99), V23@15.0Å(now 10.0,conf 0.99), H24@19.0Å(now 13.0,conf 0.99), Y25@20.9Å(now 16.1,conf 0.91), I6@26.5Å(now 19.9,conf 0.77), T26@23.3Å(now 13.2,conf 0.76), G27@23.8Å(now 16.0,conf 0.75), S66@15.6Å(now 10.0,conf 0.55), K104@13.6Å(now 9.5,conf 0.55), M65@15.8Å(now 12.4,conf 0.55)
  - G32↔V22: targets 27.5/13.0Å but partners are 3.7Å apart → too_close_together by 10.8Å
  - G32↔P15: targets 27.5/8.4Å but partners are 7.2Å apart → too_close_together by 11.9Å
  - F35↔P15: targets 27.5/8.4Å but partners are 8.6Å apart → too_close_together by 10.5Å
- **V67** — severity 114.65, 37 conflict(s); suspect input ~`A63` (group: pull_in)
  - pull-in (wants closer): G9@5.2Å(now 12.3,conf 0.57)
  - push-out (wants farther): G88@27.5Å(now 14.0,conf 1.00), P91@27.5Å(now 20.6,conf 1.00), H93@27.5Å(now 22.0,conf 1.00), G85@27.5Å(now 20.8,conf 1.00), F98@16.7Å(now 12.2,conf 0.55), V100@11.2Å(now 7.2,conf 0.55), D99@14.6Å(now 10.9,conf 0.55)
  - G88↔A63: targets 27.5/9.1Å but partners are 8.2Å apart → too_close_together by 10.2Å
  - G88↔V62: targets 27.5/9.0Å but partners are 10.7Å apart → too_close_together by 7.8Å
  - G85↔A63: targets 27.5/9.1Å but partners are 11.4Å apart → too_close_together by 7.0Å
- **Q19** — severity 108.13, 33 conflict(s); suspect input ~`P15` (group: pull_in)
  - pull-in (wants closer): R56@16.6Å(now 19.9,conf 0.55), G50@9.4Å(now 14.0,conf 0.55)
  - push-out (wants farther): V23@13.0Å(now 9.7,conf 1.00), I90@27.5Å(now 12.8,conf 0.99), H24@17.0Å(now 10.9,conf 0.99), Y25@19.0Å(now 14.1,conf 0.99), T95@27.4Å(now 13.7,conf 0.94), R12@16.9Å(now 13.4,conf 0.91), T13@13.4Å(now 9.1,conf 0.79), T26@21.6Å(now 12.8,conf 0.79), G27@22.5Å(now 14.8,conf 0.68), K16@7.0Å(now 3.8,conf 0.67), L103@12.9Å(now 3.2,conf 0.55), V22@9.6Å(now 6.5,conf 0.55)
  - V23↔T95: targets 13.0/27.4Å but partners are 5.0Å apart → too_close_together by 9.4Å
  - T95↔P15: targets 27.4/7.4Å but partners are 9.8Å apart → too_close_together by 10.1Å
  - I90↔G50: targets 27.5/9.4Å but partners are 6.6Å apart → too_close_together by 11.4Å
- **L29** — severity 99.49, 33 conflict(s); suspect input ~`V22` (group: pull_in)
  - pull-in (wants closer): Y81@12.4Å(now 15.9,conf 0.55), G82@13.6Å(now 16.4,conf 0.55), P92@11.7Å(now 15.6,conf 0.55), I89@10.2Å(now 12.9,conf 0.55)
  - push-out (wants farther): Y25@13.0Å(now 5.8,conf 0.99), V23@19.0Å(now 3.7,conf 0.94), T26@10.6Å(now 6.2,conf 0.79), V22@22.2Å(now 3.9,conf 0.72), F47@21.8Å(now 9.9,conf 0.62), G32@5.4Å(now 2.3,conf 0.56), I6@17.9Å(now 12.5,conf 0.55), V54@17.5Å(now 13.3,conf 0.55), H24@17.1Å(now 4.1,conf 0.55), W58@15.2Å(now 10.4,conf 0.55), Q2@14.7Å(now 10.1,conf 0.55), E4@16.0Å(now 11.6,conf 0.55)
  - V22↔G32: targets 22.2/5.4Å but partners are 3.7Å apart → too_close_together by 13.1Å
  - K33↔V22: targets 5.0/22.2Å but partners are 7.8Å apart → too_close_together by 9.5Å
  - K33↔V23: targets 5.0/19.0Å but partners are 7.9Å apart → too_close_together by 6.1Å

## Secondary Structure (DSSP-like)

- helix(H)=52 · strand(E)=25 · 3-10(G)=18 · coil(C)=10

```
CEGHGHHHHHGHHGGHHHGHHHHHEHHHHHHHEHHEGGGHHEGECEEGGECCHEHHHHHHEHHHHHEHEHECHGEECEHHHGHCEGEHHEGHHEEGEECECHGHC
```

## Backbone H-bond Network

- total=63 · helix(i→i+4)=27 · sheet=36
  - E4 ↔ P8  (helix)
  - I6 ↔ D10  (helix)
  - P8 ↔ R12  (helix)
  - G9 ↔ T13  (helix)
  - R12 ↔ K16  (helix)
  - T13 ↔ R17  (helix)
  - K16 ↔ T20  (helix)
  - G18 ↔ V22  (helix)
  - T20 ↔ H24  (helix)
  - V22 ↔ T26  (helix)
  - V23 ↔ G27  (helix)
  - H24 ↔ M28  (helix)
  - T26 ↔ E30  (helix)
  - G27 ↔ D31  (helix)
  - M28 ↔ G32  (helix)
  - D31 ↔ F35  (helix)
  - E53 ↔ G57  (helix)
  - I55 ↔ E59  (helix)
  - R56 ↔ E60  (helix)
  - E59 ↔ A63  (helix)
  - … +43 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=39 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=835 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=611 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=7.4781 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=69 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
