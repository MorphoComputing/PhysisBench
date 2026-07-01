# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1POH\seeds\seed_0\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 1.594 A
- tm_score_ca_ordered: 0.8268874731579374
- heavy_atom_rmsd: 3.151 A
- sidechain_heavy_atom_rmsd: 3.988 A
- **all-atom quality (honest):** heavy 3.151 A, sidechain 3.988 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 3240
- bin_accuracy: 0.323

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.5940639873177347
- ga_delta_rmsd: 0.2579076875871471  ga_fitness_mode: energy
- pre_local_rmsd: 1.6376942961555052  localized_anchor_rmsd: 1.5940733755502339

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G57-E82 → 1640 conflicts (67%); A25-G53 → 693 conflicts (28%)
- explained: 2333/2449 conflicts by 2 root cause(s)
- metrics: hubs=83 (frac 1.0), conflicts/hub=29.5, max_incompat=11.06Å, chain_span=0.988
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G57-E82 + A25-G53 — explain ~2333/2449 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F21** — severity 47.40, 61 conflict(s); suspect input ~`E4` (group: push_out)
  - pull-in (wants closer): E65@16.3Å(now 18.8,conf 0.15), V34@7.7Å(now 11.0,conf 0.23), V60@8.9Å(now 14.2,conf 0.19), E4@7.8Å(now 14.6,conf 0.23), T35@9.2Å(now 14.6,conf 0.18), F28@7.6Å(now 11.0,conf 0.24), V73@6.4Å(now 10.9,conf 0.32), T15@7.0Å(now 10.7,conf 0.27)
  - push-out (wants farther): A25@8.6Å(now 6.0,conf 0.20), D68@18.8Å(now 16.1,conf 0.20), Q2@20.4Å(now 14.8,conf 0.24), T33@16.4Å(now 13.2,conf 0.15), T61@20.9Å(now 13.6,conf 0.26)
  - V73↔T15: targets 6.4/7.0Å but partners are 20.3Å apart → too_far_apart by 7.0Å
  - Q2↔V73: targets 20.4/6.4Å but partners are 6.1Å apart → too_close_together by 7.9Å
  - E4↔T61: targets 7.8/20.9Å but partners are 5.5Å apart → too_close_together by 7.6Å
- **E69** — severity 42.94, 54 conflict(s); suspect input ~`I62` (group: pull_in)
  - pull-in (wants closer): P10@21.7Å(now 27.3,conf 0.29), N11@24.7Å(now 27.2,conf 0.49), A9@22.1Å(now 25.3,conf 0.31), T58@19.8Å(now 22.4,conf 0.22), A19@18.2Å(now 20.8,conf 0.18), I62@6.7Å(now 10.2,conf 0.29), F28@6.0Å(now 9.8,conf 0.35), K44@8.2Å(now 11.5,conf 0.21)
  - push-out (wants farther): F47@24.1Å(now 21.1,conf 0.44), L13@25.7Å(now 22.6,conf 0.60), N37@24.8Å(now 20.2,conf 0.51), E82@22.5Å(now 19.5,conf 0.33), G66@9.0Å(now 3.3,conf 0.18), L49@23.1Å(now 18.1,conf 0.37), E65@7.8Å(now 4.9,conf 0.23), S40@21.9Å(now 16.0,conf 0.30), V77@18.5Å(now 13.0,conf 0.19), S42@16.5Å(now 11.9,conf 0.15)
  - N37↔I62: targets 24.8/6.7Å but partners are 10.6Å apart → too_close_together by 7.5Å
  - S40↔I62: targets 21.9/6.7Å but partners are 8.0Å apart → too_close_together by 7.2Å
  - L49↔I62: targets 23.1/6.7Å but partners are 10.1Å apart → too_close_together by 6.3Å
- **A18** — severity 37.86, 50 conflict(s); suspect input ~`G27` (group: push_out)
  - pull-in (wants closer): F1@19.2Å(now 21.8,conf 0.21), Q70@17.1Å(now 20.5,conf 0.16), Q56@9.7Å(now 13.9,conf 0.16), S40@10.4Å(now 15.9,conf 0.15), V77@7.1Å(now 12.8,conf 0.27), G27@9.3Å(now 14.0,conf 0.18), A43@5.6Å(now 12.1,conf 0.38), L76@9.1Å(now 12.5,conf 0.18)
  - push-out (wants farther): L13@9.2Å(now 6.0,conf 0.18), V22@10.3Å(now 4.9,conf 0.15), T6@19.2Å(now 14.7,conf 0.21), T8@17.6Å(now 14.0,conf 0.17), I62@17.5Å(now 14.7,conf 0.17)
  - D68↔A43: targets 23.5/5.6Å but partners are 11.9Å apart → too_close_together by 6.0Å
  - G66↔A43: targets 22.4/5.6Å but partners are 10.8Å apart → too_close_together by 6.0Å
  - E31↔A43: targets 20.4/5.6Å but partners are 6.9Å apart → too_close_together by 7.8Å
- **L13** — severity 36.74, 62 conflict(s); suspect input ~`T33` (group: pull_in)
  - pull-in (wants closer): E31@17.6Å(now 20.4,conf 0.17), L46@7.8Å(now 11.7,conf 0.23), N37@9.7Å(now 14.7,conf 0.16), T33@8.9Å(now 15.6,conf 0.19), T61@10.2Å(now 13.5,conf 0.15), A41@7.7Å(now 14.9,conf 0.23)
  - push-out (wants farther): E69@25.7Å(now 22.6,conf 0.60), A18@9.2Å(now 6.0,conf 0.18), T55@8.7Å(now 5.8,conf 0.19), F47@16.5Å(now 11.8,conf 0.15), A43@19.1Å(now 13.6,conf 0.20), K78@17.2Å(now 14.5,conf 0.16), A25@18.2Å(now 13.8,conf 0.18), K39@18.8Å(now 15.7,conf 0.20), K23@16.5Å(now 13.9,conf 0.15)
  - T33↔A43: targets 8.9/19.1Å but partners are 3.5Å apart → too_close_together by 6.7Å
  - E69↔T33: targets 25.7/8.9Å but partners are 10.1Å apart → too_close_together by 6.7Å
  - R16↔A41: targets 6.4/7.7Å but partners are 18.7Å apart → too_far_apart by 4.6Å
- **T29** — severity 36.38, 47 conflict(s); suspect input ~`S45` (group: pull_in)
  - pull-in (wants closer): T8@22.6Å(now 25.1,conf 0.34), I7@18.3Å(now 22.6,conf 0.18), V59@18.7Å(now 21.6,conf 0.19), G12@21.3Å(now 23.8,conf 0.27), V5@16.9Å(now 20.1,conf 0.16), S63@8.7Å(now 11.9,conf 0.19), S42@7.8Å(now 11.2,conf 0.23), S45@6.1Å(now 11.5,conf 0.34)
  - push-out (wants farther): T15@24.0Å(now 21.4,conf 0.43), L83@22.0Å(now 18.7,conf 0.30), Q50@24.4Å(now 20.2,conf 0.47), S40@20.2Å(now 17.3,conf 0.23), L49@19.3Å(now 16.7,conf 0.21), K78@17.5Å(now 13.9,conf 0.17), Q3@19.4Å(now 16.7,conf 0.21), Q20@16.7Å(now 14.2,conf 0.16), H75@16.7Å(now 10.0,conf 0.16), I62@16.5Å(now 12.8,conf 0.15), A72@8.0Å(now 5.0,conf 0.22), A43@19.0Å(now 9.6,conf 0.20)
  - Q50↔S45: targets 24.4/6.1Å but partners are 9.4Å apart → too_close_together by 8.9Å
  - T15↔S45: targets 24.0/6.1Å but partners are 12.6Å apart → too_close_together by 5.3Å
  - S42↔A43: targets 7.8/19.0Å but partners are 3.7Å apart → too_close_together by 7.5Å
- **K39** — severity 34.46, 45 conflict(s); suspect input ~`T33` (group: pull_in)
  - pull-in (wants closer): K26@17.4Å(now 20.2,conf 0.17), N11@17.3Å(now 20.3,conf 0.17), A43@8.7Å(now 11.6,conf 0.19), T33@6.8Å(now 9.7,conf 0.29)
  - push-out (wants farther): Q70@23.9Å(now 20.7,conf 0.42), H75@24.2Å(now 20.8,conf 0.45), K78@24.6Å(now 21.8,conf 0.49), V73@22.7Å(now 18.0,conf 0.34), G12@20.6Å(now 17.3,conf 0.25), T51@10.4Å(now 7.6,conf 0.15), A64@19.3Å(now 14.3,conf 0.21), L13@18.8Å(now 15.7,conf 0.20), I32@18.6Å(now 14.3,conf 0.19), T55@16.9Å(now 14.1,conf 0.16)
  - V73↔T33: targets 22.7/6.8Å but partners are 9.4Å apart → too_close_together by 6.5Å
  - T35↔V73: targets 6.0/22.7Å but partners are 12.1Å apart → too_close_together by 4.6Å
  - Q70↔T33: targets 23.9/6.8Å but partners are 11.6Å apart → too_close_together by 5.5Å

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=28 · 3-10(G)=14 · coil(C)=7

```
CEECGEHEECEEGEHHHHHEHGHHHHEEGEGGGHGCCGHEECGHEEHHHHHEHHEGGEGEEGEEHEHHHEHHEHHHHHEHEHC
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=15 · sheet=35
  - T15 ↔ A19  (helix)
  - P17 ↔ F21  (helix)
  - A19 ↔ K23  (helix)
  - F21 ↔ A25  (helix)
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
  - T8 ↔ H14  (sheet)
  - A9 ↔ H14  (sheet)
  - H14 ↔ Q20  (sheet)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=374 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=192 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.726 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
