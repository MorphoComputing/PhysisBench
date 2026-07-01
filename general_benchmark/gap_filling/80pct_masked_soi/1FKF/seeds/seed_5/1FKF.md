# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1FKF\seeds\seed_5\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 10.425 A
- tm_score_ca_ordered: 0.24497448373072697
- heavy_atom_rmsd: 11.317 A
- sidechain_heavy_atom_rmsd: 12.093 A
- **all-atom quality (honest):** heavy 11.317 A, sidechain 12.093 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 47
- distogram_pairs: 1093
- bin_accuracy: 0.355

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.42481650170416
- ga_delta_rmsd: 2.1635890754633724  ga_fitness_mode: energy
- pre_local_rmsd: 10.424793354875607  localized_anchor_rmsd: 10.424793354875607

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y25-F35 → 528 conflicts (48%); S38-P44 → 187 conflicts (17%); G18-C21 → 109 conflicts (10%)
- explained: 824/1098 conflicts by 3 root cause(s)
- metrics: hubs=93 (frac 0.886), conflicts/hub=11.8, max_incompat=15.45Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y25-F35 + S38-P44 + G18-C21 — explain ~824/1098 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K33** — severity 141.23, 31 conflict(s); suspect input ~`R17` (group: pull_in)
  - pull-in (wants closer): V97@9.6Å(now 12.3,conf 0.55)
  - push-out (wants farther): D40@15.0Å(now 4.8,conf 1.00), R17@27.5Å(now 6.0,conf 1.00), G50@27.5Å(now 18.0,conf 1.00), G27@7.0Å(now 3.9,conf 0.99), S38@15.0Å(now 9.3,conf 0.99), C21@25.0Å(now 12.7,conf 0.69), V23@20.1Å(now 14.8,conf 0.58), R41@17.6Å(now 8.5,conf 0.55), R39@15.4Å(now 8.0,conf 0.55), S37@11.5Å(now 7.0,conf 0.55), P77@16.3Å(now 10.5,conf 0.55), T74@13.7Å(now 10.8,conf 0.55)
  - M28↔R17: targets 5.0/27.5Å but partners are 7.2Å apart → too_close_together by 15.3Å
  - R17↔L29: targets 27.5/5.0Å but partners are 8.0Å apart → too_close_together by 14.5Å
  - R17↔G27: targets 27.5/7.0Å but partners are 8.3Å apart → too_close_together by 12.1Å
- **G50** — severity 137.50, 32 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): G57@11.0Å(now 15.1,conf 1.00), I55@9.0Å(now 11.7,conf 0.99), G18@7.0Å(now 18.9,conf 0.55), Q19@9.4Å(now 23.5,conf 0.55)
  - push-out (wants farther): K43@23.5Å(now 18.7,conf 1.00), K33@27.5Å(now 18.0,conf 1.00), P44@19.0Å(now 16.0,conf 0.99), F45@16.6Å(now 12.8,conf 0.79), R41@26.1Å(now 22.2,conf 0.73), S38@21.6Å(now 19.0,conf 0.61)
  - K33↔I55: targets 27.5/9.0Å but partners are 8.0Å apart → too_close_together by 10.4Å
  - G57↔K33: targets 11.0/27.5Å but partners are 7.0Å apart → too_close_together by 9.5Å
  - K33↔R56: targets 27.5/9.0Å but partners are 8.7Å apart → too_close_together by 9.8Å
- **G27** — severity 118.17, 41 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): D36@5.3Å(now 9.3,conf 0.56)
  - push-out (wants farther): C21@17.0Å(now 12.2,conf 0.99), K33@7.0Å(now 3.9,conf 0.99), G18@23.8Å(now 9.3,conf 0.75), K16@23.0Å(now 12.5,conf 0.73), T20@20.0Å(now 7.7,conf 0.72), Q19@22.5Å(now 12.0,conf 0.68), K43@14.9Å(now 7.6,conf 0.55), P87@15.3Å(now 10.9,conf 0.55), G88@14.7Å(now 11.4,conf 0.55), I55@12.6Å(now 5.8,conf 0.55), D40@11.4Å(now 8.7,conf 0.55), V62@14.2Å(now 8.4,conf 0.55), V1@14.0Å(now 5.8,conf 0.55)
  - K34↔G18: targets 6.6/23.8Å but partners are 5.6Å apart → too_close_together by 11.6Å
  - K33↔G18: targets 7.0/23.8Å but partners are 6.3Å apart → too_close_together by 10.4Å
  - G18↔D36: targets 23.8/5.3Å but partners are 6.2Å apart → too_close_together by 12.2Å
- **D40** — severity 117.34, 31 conflict(s); suspect input ~`E60` (group: pull_in)
  - pull-in (wants closer): I89@16.8Å(now 19.4,conf 0.55), D99@13.1Å(now 15.7,conf 0.55), T26@8.7Å(now 12.7,conf 0.55), L103@16.1Å(now 21.8,conf 0.55)
  - push-out (wants farther): K33@15.0Å(now 4.8,conf 1.00), K34@11.0Å(now 5.6,conf 0.99), D36@8.9Å(now 5.9,conf 0.91), F35@12.6Å(now 6.9,conf 0.79), V1@23.7Å(now 8.5,conf 0.75), S66@23.1Å(now 18.7,conf 0.74), Q2@24.0Å(now 14.0,conf 0.74), E60@24.1Å(now 10.8,conf 0.73), E30@19.7Å(now 8.4,conf 0.57), L29@17.1Å(now 4.5,conf 0.55), G27@11.4Å(now 8.7,conf 0.55), P44@9.8Å(now 7.2,conf 0.55)
  - S37↔E60: targets 6.6/24.1Å but partners are 5.7Å apart → too_close_together by 11.9Å
  - K34↔V1: targets 11.0/23.7Å but partners are 3.6Å apart → too_close_together by 9.1Å
  - V1↔K43: targets 23.7/8.0Å but partners are 5.0Å apart → too_close_together by 10.8Å
- **G18** — severity 102.36, 26 conflict(s); suspect input ~`P15` (group: pull_in)
  - pull-in (wants closer): G50@7.0Å(now 18.9,conf 0.55), K104@13.6Å(now 16.9,conf 0.55), F47@9.6Å(now 14.4,conf 0.55)
  - push-out (wants farther): H24@19.0Å(now 13.2,conf 1.00), G32@27.5Å(now 8.3,conf 1.00), F35@27.5Å(now 7.8,conf 0.99), Y25@21.0Å(now 11.9,conf 0.99), I6@26.5Å(now 19.8,conf 0.77), T26@23.3Å(now 10.9,conf 0.76), G27@23.8Å(now 9.3,conf 0.75), M65@15.8Å(now 12.1,conf 0.55)
  - G32↔P15: targets 27.5/7.1Å but partners are 10.1Å apart → too_close_together by 10.3Å
  - F35↔P15: targets 27.5/7.1Å but partners are 10.1Å apart → too_close_together by 10.3Å
  - P15↔T26: targets 7.1/23.3Å but partners are 4.8Å apart → too_close_together by 11.4Å
- **S38** — severity 100.64, 37 conflict(s); suspect input ~`Q64` (group: pull_in)
  - pull-in (wants closer): Y25@5.7Å(now 11.3,conf 0.55), F98@11.3Å(now 16.6,conf 0.55), V100@10.0Å(now 13.3,conf 0.55)
  - push-out (wants farther): K33@15.0Å(now 9.3,conf 0.99), D31@19.2Å(now 14.1,conf 0.82), G32@16.6Å(now 11.7,conf 0.79), G50@21.6Å(now 19.0,conf 0.61), Q64@20.6Å(now 7.9,conf 0.59), R56@19.0Å(now 14.3,conf 0.56), G61@17.8Å(now 13.3,conf 0.55), L105@17.0Å(now 11.7,conf 0.55), T20@16.3Å(now 5.8,conf 0.55), K34@11.6Å(now 8.0,conf 0.55)
  - P44↔Q64: targets 5.4/20.6Å but partners are 3.2Å apart → too_close_together by 12.0Å
  - K43↔Q64: targets 5.0/20.6Å but partners are 4.4Å apart → too_close_together by 11.2Å
  - Q64↔Y25: targets 20.6/5.7Å but partners are 4.8Å apart → too_close_together by 10.1Å

## Secondary Structure (DSSP-like)

- helix(H)=54 · strand(E)=28 · 3-10(G)=15 · coil(C)=8

```
CCCHEHGEHHHHGHHHHHHGGGHEHEHHHEHEGHHGHHGHHEHHEEEHHHGGGEHHHHHHHHHHCECEHEHEHEGGHHHHHHHEHEEHEEECEEHHCEGEGEHEC
```

## Backbone H-bond Network

- total=62 · helix(i→i+4)=25 · sheet=37
  - I6 ↔ D10  (helix)
  - D10 ↔ F14  (helix)
  - G11 ↔ P15  (helix)
  - R12 ↔ K16  (helix)
  - F14 ↔ G18  (helix)
  - P15 ↔ Q19  (helix)
  - Q19 ↔ V23  (helix)
  - V23 ↔ G27  (helix)
  - G27 ↔ D31  (helix)
  - D31 ↔ F35  (helix)
  - K34 ↔ S38  (helix)
  - S37 ↔ R41  (helix)
  - D40 ↔ P44  (helix)
  - P44 ↔ M48  (helix)
  - I55 ↔ E59  (helix)
  - R56 ↔ E60  (helix)
  - G57 ↔ G61  (helix)
  - E59 ↔ A63  (helix)
  - E60 ↔ Q64  (helix)
  - Q69 ↔ L73  (helix)
  - … +42 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=31 · exposed=37 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=735 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=536 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.9845 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=47 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
