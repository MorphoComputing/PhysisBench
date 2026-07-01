# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1POH\seeds\seed_1\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 1.436 A
- tm_score_ca_ordered: 0.8559924566296844
- heavy_atom_rmsd: 2.751 A
- sidechain_heavy_atom_rmsd: 3.460 A
- **all-atom quality (honest):** heavy 2.751 A, sidechain 3.460 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 3240
- bin_accuracy: 0.316

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=2.0702886724158813 -> 1.8102576904434222 A
- topology_reconvergence: applied=True accepted=4/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.4362225233591364
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.4715311179732913  localized_anchor_rmsd: 1.4362705739432677

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G57-E82 → 1528 conflicts (64%); A25-L46 → 678 conflicts (28%)
- explained: 2206/2389 conflicts by 2 root cause(s)
- metrics: hubs=83 (frac 1.0), conflicts/hub=28.8, max_incompat=10.93Å, chain_span=0.988
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G57-E82 + A25-L46 — explain ~2206/2389 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F21** — severity 47.38, 61 conflict(s); suspect input ~`E4` (group: push_out)
  - pull-in (wants closer): V34@7.7Å(now 11.0,conf 0.23), V60@8.9Å(now 13.8,conf 0.19), E4@7.8Å(now 14.4,conf 0.23), T35@9.2Å(now 14.5,conf 0.18), F28@7.6Å(now 11.2,conf 0.24), V73@6.4Å(now 10.5,conf 0.32), T15@7.0Å(now 10.7,conf 0.27)
  - push-out (wants farther): A25@8.6Å(now 5.8,conf 0.20), D68@18.8Å(now 15.8,conf 0.20), Q2@20.4Å(now 14.6,conf 0.24), T33@16.4Å(now 13.2,conf 0.15), T61@20.9Å(now 13.2,conf 0.26)
  - Q2↔V73: targets 20.4/6.4Å but partners are 6.1Å apart → too_close_together by 7.9Å
  - V73↔T15: targets 6.4/7.0Å but partners are 20.2Å apart → too_far_apart by 6.8Å
  - E4↔T61: targets 7.8/20.9Å but partners are 5.2Å apart → too_close_together by 7.9Å
- **E69** — severity 38.87, 47 conflict(s); suspect input ~`I62` (group: pull_in)
  - pull-in (wants closer): P10@21.7Å(now 27.5,conf 0.29), N11@24.7Å(now 27.5,conf 0.49), A9@22.1Å(now 25.4,conf 0.31), T15@22.6Å(now 25.1,conf 0.34), T58@19.8Å(now 22.9,conf 0.22), G38@17.0Å(now 19.7,conf 0.16), A19@18.2Å(now 20.9,conf 0.18), I62@6.7Å(now 10.6,conf 0.29), F28@6.0Å(now 9.2,conf 0.35), K44@8.2Å(now 12.3,conf 0.21)
  - push-out (wants farther): L13@25.7Å(now 22.6,conf 0.60), N37@24.8Å(now 20.6,conf 0.51), E82@22.5Å(now 19.8,conf 0.33), G66@9.0Å(now 3.5,conf 0.18), L49@23.1Å(now 18.5,conf 0.37), E65@7.8Å(now 4.9,conf 0.23), S40@21.9Å(now 16.5,conf 0.30), V77@18.5Å(now 13.2,conf 0.19), S42@16.5Å(now 12.8,conf 0.15)
  - N37↔I62: targets 24.8/6.7Å but partners are 10.7Å apart → too_close_together by 7.3Å
  - S40↔I62: targets 21.9/6.7Å but partners are 8.4Å apart → too_close_together by 6.8Å
  - L49↔I62: targets 23.1/6.7Å but partners are 10.4Å apart → too_close_together by 6.0Å
- **T35** — severity 38.53, 54 conflict(s); suspect input ~`K71` (group: pull_in)
  - pull-in (wants closer): K71@9.9Å(now 17.3,conf 0.16), T51@7.6Å(now 10.7,conf 0.24), A64@7.4Å(now 10.3,conf 0.25), V73@9.8Å(now 12.4,conf 0.16), F21@9.2Å(now 14.5,conf 0.18), V22@7.9Å(now 13.7,conf 0.23), G57@10.2Å(now 12.8,conf 0.15)
  - push-out (wants farther): D68@22.3Å(now 17.2,conf 0.32), V60@9.6Å(now 5.3,conf 0.17), T15@20.4Å(now 17.9,conf 0.24), F28@20.4Å(now 17.7,conf 0.24), T55@17.8Å(now 12.6,conf 0.17), A72@19.2Å(now 13.9,conf 0.21), H75@18.3Å(now 15.1,conf 0.18), E65@16.7Å(now 13.4,conf 0.16)
  - D68↔A64: targets 22.3/7.4Å but partners are 7.4Å apart → too_close_together by 7.5Å
  - D68↔K71: targets 22.3/9.9Å but partners are 3.9Å apart → too_close_together by 8.5Å
  - A19↔V22: targets 18.9/7.9Å but partners are 4.5Å apart → too_close_together by 6.5Å
- **L13** — severity 36.77, 61 conflict(s); suspect input ~`T33` (group: pull_in)
  - pull-in (wants closer): E31@17.6Å(now 20.2,conf 0.17), L46@7.8Å(now 11.6,conf 0.23), T6@8.5Å(now 11.2,conf 0.20), N37@9.7Å(now 15.0,conf 0.16), T33@8.9Å(now 15.7,conf 0.19), T61@10.2Å(now 13.3,conf 0.15), A41@7.7Å(now 14.7,conf 0.23)
  - push-out (wants farther): E69@25.7Å(now 22.6,conf 0.60), A18@9.2Å(now 5.8,conf 0.18), T55@8.7Å(now 6.1,conf 0.19), F47@16.5Å(now 12.0,conf 0.15), A43@19.1Å(now 13.1,conf 0.20), K78@17.2Å(now 14.3,conf 0.16), A25@18.2Å(now 13.7,conf 0.18), K39@18.8Å(now 15.9,conf 0.20), K23@16.5Å(now 13.7,conf 0.15)
  - E69↔T33: targets 25.7/8.9Å but partners are 10.6Å apart → too_close_together by 6.2Å
  - R16↔A41: targets 6.4/7.7Å but partners are 18.8Å apart → too_far_apart by 4.7Å
  - T33↔A43: targets 8.9/19.1Å but partners are 4.4Å apart → too_close_together by 5.8Å
- **T33** — severity 36.21, 60 conflict(s); suspect input ~`L13` (group: pull_in)
  - pull-in (wants closer): Q3@7.8Å(now 12.2,conf 0.23), F47@7.9Å(now 13.1,conf 0.23), Q50@10.2Å(now 13.4,conf 0.15), L13@8.9Å(now 15.7,conf 0.19), F1@8.7Å(now 12.4,conf 0.19), K39@6.8Å(now 9.6,conf 0.29), K23@8.2Å(now 14.3,conf 0.21)
  - push-out (wants farther): A43@8.7Å(now 4.4,conf 0.19), T15@21.2Å(now 18.3,conf 0.27), I62@9.2Å(now 4.9,conf 0.18), H14@21.3Å(now 17.9,conf 0.27), A64@8.9Å(now 6.1,conf 0.19), E67@17.7Å(now 14.3,conf 0.17), G53@16.7Å(now 13.9,conf 0.16), F21@16.4Å(now 13.2,conf 0.15), G27@17.6Å(now 14.5,conf 0.17)
  - H14↔L13: targets 21.3/8.9Å but partners are 3.5Å apart → too_close_together by 8.9Å
  - F47↔F1: targets 7.9/8.7Å but partners are 24.3Å apart → too_far_apart by 7.7Å
  - Q3↔F47: targets 7.8/7.9Å but partners are 22.1Å apart → too_far_apart by 6.3Å
- **A18** — severity 35.54, 51 conflict(s); suspect input ~`G27` (group: push_out)
  - pull-in (wants closer): F1@19.2Å(now 21.8,conf 0.21), Q70@17.1Å(now 20.3,conf 0.16), Q56@9.7Å(now 13.7,conf 0.16), S40@10.4Å(now 15.7,conf 0.15), V77@7.1Å(now 12.7,conf 0.27), G27@9.3Å(now 13.8,conf 0.18), A43@5.6Å(now 11.3,conf 0.38), L76@9.1Å(now 12.3,conf 0.18), A9@9.1Å(now 11.8,conf 0.18)
  - push-out (wants farther): D68@23.5Å(now 20.9,conf 0.39), L13@9.2Å(now 5.8,conf 0.18), V22@10.3Å(now 5.0,conf 0.15), E31@20.4Å(now 17.9,conf 0.24), T6@19.2Å(now 14.9,conf 0.21), T61@18.1Å(now 15.3,conf 0.18), T8@17.6Å(now 14.3,conf 0.17), I62@17.5Å(now 14.5,conf 0.17)
  - D68↔A43: targets 23.5/5.6Å but partners are 12.8Å apart → too_close_together by 5.1Å
  - E31↔A43: targets 20.4/5.6Å but partners are 7.2Å apart → too_close_together by 7.5Å
  - G66↔A43: targets 22.4/5.6Å but partners are 11.6Å apart → too_close_together by 5.2Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=29 · 3-10(G)=12 · coil(C)=9

```
CEEGEEHCECEEGEHHGHHEHHHHHHEECEGGGHGEGGGEECGHEEHHHHHEHHECGECEECEEHEHHHEHHEHHHHHEHEHC
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=15 · sheet=37
  - T15 ↔ A19  (helix)
  - A19 ↔ K23  (helix)
  - F21 ↔ A25  (helix)
  - V22 ↔ K26  (helix)
  - K44 ↔ K48  (helix)
  - F47 ↔ T51  (helix)
  - Q50 ↔ L54  (helix)
  - E65 ↔ E69  (helix)
  - E67 ↔ K71  (helix)
  - D68 ↔ A72  (helix)
  - K71 ↔ H75  (helix)
  - A72 ↔ L76  (helix)
  - E74 ↔ K78  (helix)
  - L76 ↔ M80  (helix)
  - K78 ↔ E82  (helix)
  - T6 ↔ N11  (sheet)
  - T6 ↔ G12  (sheet)
  - A9 ↔ H14  (sheet)
  - H14 ↔ Q20  (sheet)
  - Q20 ↔ G27  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=365 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=183 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7188 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
