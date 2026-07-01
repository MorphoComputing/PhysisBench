# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TEN\seeds\seed_8\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 8.031 A
- tm_score_ca_ordered: 0.3049741314147018
- heavy_atom_rmsd: 9.035 A
- sidechain_heavy_atom_rmsd: 10.018 A
- **all-atom quality (honest):** heavy 9.035 A, sidechain 10.018 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 34
- distogram_pairs: 1074
- bin_accuracy: 0.614

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=57
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.03066389304583
- ga_delta_rmsd: -0.5229515890318073  ga_fitness_mode: energy
- pre_local_rmsd: 8.063442649844369  localized_anchor_rmsd: 8.030699386105619

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T86-T88 → 123 conflicts (70%); A83 → 20 conflicts (11%)
- explained: 143/177 conflicts by 2 root cause(s)
- metrics: hubs=37 (frac 0.42), conflicts/hub=4.8, max_incompat=8.94Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T86-T88 + A83 — explain ~143/177 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S79** — severity 49.15, 15 conflict(s); suspect input ~`T88` (group: pull_in)
  - pull-in (wants closer): P63@27.5Å(now 31.4,conf 1.00)
  - push-out (wants farther): G76@7.0Å(now 4.4,conf 0.99), T86@21.0Å(now 15.7,conf 0.99), T88@27.4Å(now 18.1,conf 0.94), K84@14.9Å(now 12.4,conf 0.91), A83@12.0Å(now 7.5,conf 0.72), R75@6.3Å(now 3.3,conf 0.55), E53@16.9Å(now 13.6,conf 0.55), D52@16.8Å(now 12.9,conf 0.55)
  - S73↔T88: targets 5.0/27.4Å but partners are 15.0Å apart → too_close_together by 7.4Å
  - T88↔I72: targets 27.4/6.0Å but partners are 12.4Å apart → too_close_together by 8.9Å
  - R74↔T88: targets 5.0/27.4Å but partners are 16.7Å apart → too_close_together by 5.7Å
- **D77** — severity 36.77, 12 conflict(s); suspect input ~`T86` (group: pull_in)
  - pull-in (wants closer): D64@27.5Å(now 33.3,conf 1.00), D14@27.5Å(now 34.3,conf 1.00), T65@27.5Å(now 30.1,conf 1.00)
  - push-out (wants farther): N81@13.0Å(now 7.9,conf 0.99), T86@27.4Å(now 16.5,conf 0.95), A83@17.0Å(now 10.0,conf 0.94), K84@19.4Å(now 12.7,conf 0.79), P41@25.5Å(now 22.6,conf 0.70), T46@17.6Å(now 14.9,conf 0.55), P82@15.1Å(now 6.3,conf 0.55), S80@10.6Å(now 7.9,conf 0.55)
  - I72↔T86: targets 11.0/27.4Å but partners are 10.4Å apart → too_close_together by 6.0Å
  - T86↔R74: targets 27.4/7.4Å but partners are 14.1Å apart → too_close_together by 5.8Å
  - S70↔T86: targets 17.0/27.4Å but partners are 6.3Å apart → too_close_together by 4.1Å
- **T65** — severity 30.56, 14 conflict(s); suspect input ~`T88` (group: push_out)
  - pull-in (wants closer): D77@27.5Å(now 30.1,conf 1.00), D29@27.5Å(now 30.7,conf 1.00), T88@5.4Å(now 12.0,conf 0.56)
  - push-out (wants farther): K62@5.0Å(now 0.5,conf 0.99)
  - D48↔T88: targets 23.4/5.4Å but partners are 10.8Å apart → too_close_together by 7.2Å
  - L49↔T88: targets 24.3/5.4Å but partners are 11.9Å apart → too_close_together by 6.9Å
  - I72↔T88: targets 23.5/5.4Å but partners are 12.4Å apart → too_close_together by 5.6Å
- **P63** — severity 21.75, 11 conflict(s); suspect input ~`T88` (group: push_out)
  - pull-in (wants closer): S79@27.5Å(now 31.4,conf 1.00), T88@8.3Å(now 13.5,conf 0.55)
  - push-out (wants farther): Y67@10.6Å(now 7.8,conf 0.79)
  - L71↔T88: targets 22.5/8.3Å but partners are 9.3Å apart → too_close_together by 5.0Å
  - E53↔T88: targets 27.1/8.3Å but partners are 14.3Å apart → too_close_together by 4.6Å
  - A83↔T88: targets 23.5/8.3Å but partners are 11.1Å apart → too_close_together by 4.1Å
- **D29** — severity 19.35, 7 conflict(s); suspect input ~`F87` (group: pull_in)
  - pull-in (wants closer): T65@27.5Å(now 30.7,conf 1.00)
  - push-out (wants farther): F87@27.2Å(now 22.0,conf 0.90), K84@19.9Å(now 15.3,conf 0.58), L1@11.1Å(now 7.0,conf 0.55)
  - L33↔F87: targets 13.0/27.2Å but partners are 9.9Å apart → too_close_together by 4.3Å
  - F87↔E32: targets 27.2/10.0Å but partners are 12.4Å apart → too_close_together by 4.8Å
  - F87↔Y35: targets 27.2/19.4Å but partners are 3.4Å apart → too_close_together by 4.4Å
- **M78** — severity 18.42, 10 conflict(s); suspect input ~`F87` (group: pull_in)
  - pull-in (wants closer): K62@27.5Å(now 30.9,conf 1.00)
  - push-out (wants farther): A83@15.0Å(now 10.1,conf 1.00), P82@11.0Å(now 7.7,conf 0.99), F87@27.4Å(now 22.0,conf 0.97), K84@17.6Å(now 14.2,conf 0.69)
  - I72↔F87: targets 9.0/27.4Å but partners are 14.1Å apart → too_close_together by 4.3Å
  - F87↔R74: targets 27.4/6.8Å but partners are 18.1Å apart → too_close_together by 2.5Å
  - A83↔R74: targets 15.0/6.8Å but partners are 5.9Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=29 · 3-10(G)=9 · coil(C)=13

```
EEHEEHHCHECCEGHEECEEEEEEHHHHHEHHHEECCEGHEHGGCEGCECHHHHEHHHEHCHHGGEHGHCECCEHEHHHEHHHHGHHE
```

## Backbone H-bond Network

- total=45 · helix(i→i+4)=10 · sheet=35
  - A3 ↔ I7  (helix)
  - L25 ↔ D29  (helix)
  - D29 ↔ L33  (helix)
  - D52 ↔ Y56  (helix)
  - Y56 ↔ N60  (helix)
  - P63 ↔ Y67  (helix)
  - R75 ↔ S79  (helix)
  - D77 ↔ N81  (helix)
  - S79 ↔ A83  (helix)
  - A83 ↔ F87  (helix)
  - D2 ↔ W21  (sheet)
  - D2 ↔ F22  (sheet)
  - P4 ↔ I19  (sheet)
  - P4 ↔ T20  (sheet)
  - P4 ↔ W21  (sheet)
  - P4 ↔ F22  (sheet)
  - P4 ↔ K23  (sheet)
  - P4 ↔ P24  (sheet)
  - S5 ↔ I19  (sheet)
  - S5 ↔ T20  (sheet)
  - … +25 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=43 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=442 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=318 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0773 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=34 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
