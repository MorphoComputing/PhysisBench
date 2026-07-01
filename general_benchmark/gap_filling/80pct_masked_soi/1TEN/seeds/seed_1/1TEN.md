# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TEN\seeds\seed_1\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 6.756 A
- tm_score_ca_ordered: 0.3906730213060366
- heavy_atom_rmsd: 7.615 A
- sidechain_heavy_atom_rmsd: 8.469 A
- **all-atom quality (honest):** heavy 7.615 A, sidechain 8.469 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 44
- distogram_pairs: 1074
- bin_accuracy: 0.488

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.756256049463533
- ga_delta_rmsd: 3.500711058392235  ga_fitness_mode: energy
- pre_local_rmsd: 6.770849048710359  localized_anchor_rmsd: 6.7562692480157835

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G36-T45 → 286 conflicts (78%); T50-Q55 → 29 conflicts (8%)
- explained: 315/369 conflicts by 2 root cause(s)
- metrics: hubs=58 (frac 0.659), conflicts/hub=6.4, max_incompat=10.17Å, chain_span=0.955
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G36-T45 + T50-Q55 — explain ~315/369 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V40** — severity 148.12, 47 conflict(s); suspect input ~`N54` (group: push_out)
  - push-out (wants farther): E51@27.5Å(now 19.0,conf 0.99), T50@27.4Å(now 18.9,conf 0.95), T46@15.1Å(now 11.3,conf 0.91), N54@27.1Å(now 15.4,conf 0.86), I47@18.6Å(now 11.7,conf 0.79), W21@24.2Å(now 20.3,conf 0.73), E8@21.8Å(now 15.4,conf 0.62), L18@20.8Å(now 14.0,conf 0.59), V12@20.0Å(now 17.0,conf 0.58), D14@18.4Å(now 15.2,conf 0.55), I58@17.8Å(now 10.1,conf 0.55), T34@13.2Å(now 10.7,conf 0.55)
  - R44↔N54: targets 8.9/27.1Å but partners are 9.7Å apart → too_close_together by 8.5Å
  - G36↔N54: targets 7.1/27.1Å but partners are 11.8Å apart → too_close_together by 8.2Å
  - N54↔D43: targets 27.1/6.6Å but partners are 12.5Å apart → too_close_together by 8.0Å
- **D52** — severity 71.28, 18 conflict(s); suspect input ~`R44` (group: pull_in)
  - pull-in (wants closer): I58@17.1Å(now 19.9,conf 0.91)
  - push-out (wants farther): K38@27.4Å(now 18.1,conf 0.95), T45@21.1Å(now 14.2,conf 0.91), L49@8.9Å(now 3.7,conf 0.91), T46@17.4Å(now 14.0,conf 0.79), R44@23.0Å(now 11.8,conf 0.73), P82@18.8Å(now 16.2,conf 0.56), A83@18.6Å(now 15.7,conf 0.55), A3@14.8Å(now 8.6,conf 0.55), P4@12.3Å(now 7.7,conf 0.55), I47@14.2Å(now 8.4,conf 0.55)
  - Q55↔K38: targets 9.0/27.4Å but partners are 9.4Å apart → too_close_together by 9.0Å
  - Q55↔R44: targets 9.0/23.0Å but partners are 3.8Å apart → too_close_together by 10.2Å
  - Q55↔T45: targets 9.0/21.1Å but partners are 5.1Å apart → too_close_together by 7.0Å
- **T50** — severity 60.85, 17 conflict(s); suspect input ~`Q55` (group: push_out)
  - push-out (wants farther): D43@23.5Å(now 16.4,conf 1.00), V40@27.4Å(now 18.9,conf 0.95), N54@9.0Å(now 5.7,conf 0.94), R44@19.4Å(now 12.8,conf 0.79), N81@17.9Å(now 13.2,conf 0.55), T45@16.5Å(now 14.0,conf 0.55), P4@12.9Å(now 7.0,conf 0.55), L25@14.8Å(now 7.4,conf 0.55), A26@14.0Å(now 7.0,conf 0.55)
  - V40↔Q55: targets 27.4/11.0Å but partners are 10.8Å apart → too_close_together by 5.6Å
  - D43↔Q55: targets 23.5/11.0Å but partners are 7.1Å apart → too_close_together by 5.4Å
  - V40↔E53: targets 27.4/5.1Å but partners are 17.0Å apart → too_close_together by 5.3Å
- **K38** — severity 48.22, 19 conflict(s); suspect input ~`G59` (group: pull_in)
  - pull-in (wants closer): Y67@4.8Å(now 8.1,conf 0.59), T86@7.6Å(now 10.2,conf 0.55), E85@10.0Å(now 14.6,conf 0.55)
  - push-out (wants farther): D52@27.4Å(now 18.1,conf 0.95), E32@17.1Å(now 14.6,conf 0.91), D43@7.1Å(now 3.8,conf 0.91), T45@11.1Å(now 6.4,conf 0.91), I31@20.2Å(now 17.6,conf 0.58), D11@18.9Å(now 15.9,conf 0.56), T34@11.2Å(now 8.3,conf 0.55), T16@15.6Å(now 9.2,conf 0.55), G59@16.2Å(now 6.0,conf 0.55)
  - D52↔R44: targets 27.4/8.9Å but partners are 11.8Å apart → too_close_together by 6.7Å
  - D52↔P41: targets 27.4/7.1Å but partners are 14.9Å apart → too_close_together by 5.3Å
  - G42↔D52: targets 9.0/27.4Å but partners are 13.6Å apart → too_close_together by 4.8Å
- **E51** — severity 46.79, 17 conflict(s); suspect input ~`R44` (group: push_out)
  - push-out (wants farther): V40@27.5Å(now 19.0,conf 0.99), T45@19.0Å(now 13.9,conf 0.99), T46@15.0Å(now 11.5,conf 0.99), I47@13.0Å(now 7.7,conf 0.99), E66@27.4Å(now 23.7,conf 0.97), R44@21.1Å(now 14.2,conf 0.91), Y35@18.6Å(now 15.6,conf 0.55), D77@15.5Å(now 12.4,conf 0.55)
  - V40↔N54: targets 27.5/7.0Å but partners are 15.4Å apart → too_close_together by 5.1Å
  - R44↔Y56: targets 21.1/12.9Å but partners are 3.8Å apart → too_close_together by 4.5Å
  - N54↔R44: targets 7.0/21.1Å but partners are 9.7Å apart → too_close_together by 4.5Å
- **D11** — severity 43.44, 18 conflict(s); suspect input ~`D43` (group: pull_in)
  - pull-in (wants closer): R75@27.5Å(now 31.0,conf 1.00), N54@15.4Å(now 20.6,conf 0.55)
  - push-out (wants farther): N81@26.6Å(now 23.6,conf 0.79), D39@22.1Å(now 14.4,conf 0.64), D43@21.9Å(now 13.6,conf 0.63), K38@18.9Å(now 15.9,conf 0.56), I37@17.8Å(now 12.0,conf 0.55)
  - A17↔D43: targets 5.0/21.9Å but partners are 9.2Å apart → too_close_together by 7.7Å
  - L18↔D43: targets 6.0/21.9Å but partners are 9.1Å apart → too_close_together by 6.8Å
  - A17↔D39: targets 5.0/22.1Å but partners are 10.8Å apart → too_close_together by 6.3Å

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=34 · 3-10(G)=15 · coil(C)=1

```
CEEEEGGGHEEGEHHEEEEEEHGEHHHHHEHHHEHGHGHHEHEHEHHEGHHHGHEEEGHHHGHHEHGGHGHHHHHEHHEGEEEEEEEE
```

## Backbone H-bond Network

- total=62 · helix(i→i+4)=15 · sheet=47
  - L25 ↔ D29  (helix)
  - E27 ↔ I31  (helix)
  - D29 ↔ L33  (helix)
  - I31 ↔ Y35  (helix)
  - L33 ↔ I37  (helix)
  - Y35 ↔ D39  (helix)
  - V40 ↔ R44  (helix)
  - G42 ↔ T46  (helix)
  - T46 ↔ T50  (helix)
  - I47 ↔ E51  (helix)
  - T50 ↔ N54  (helix)
  - G59 ↔ P63  (helix)
  - N60 ↔ D64  (helix)
  - V69 ↔ S73  (helix)
  - S73 ↔ D77  (helix)
  - D2 ↔ W21  (sheet)
  - A3 ↔ T20  (sheet)
  - A3 ↔ W21  (sheet)
  - P4 ↔ I19  (sheet)
  - P4 ↔ T20  (sheet)
  - … +42 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=33 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=503 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=376 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.755 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=44 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
