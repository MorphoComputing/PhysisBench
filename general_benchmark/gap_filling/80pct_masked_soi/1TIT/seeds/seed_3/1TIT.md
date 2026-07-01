# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TIT\seeds\seed_3\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 6.899 A
- tm_score_ca_ordered: 0.3385459642837767
- heavy_atom_rmsd: 8.282 A
- sidechain_heavy_atom_rmsd: 9.497 A
- **all-atom quality (honest):** heavy 8.282 A, sidechain 9.497 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 33
- distogram_pairs: 1027
- bin_accuracy: 0.487

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=15 rmsd=8.35767728669846 -> 7.349241318413179 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.899416445634457
- ga_delta_rmsd: 0.2639815239436807  ga_fitness_mode: energy
- pre_local_rmsd: 6.948696363013393  localized_anchor_rmsd: 6.8994168350964

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G37-E50 → 283 conflicts (54%); K5-G9 → 105 conflicts (20%); K53-I56 → 42 conflicts (8%)
- explained: 430/523 conflicts by 3 root cause(s)
- metrics: hubs=74 (frac 0.851), conflicts/hub=7.1, max_incompat=10.43Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G37-E50 + K5-G9 + K53-I56 — explain ~430/523 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P44** — severity 95.00, 24 conflict(s); suspect input ~`P6` (group: push_out)
  - push-out (wants farther): I1@27.5Å(now 20.2,conf 1.00), E2@27.5Å(now 21.8,conf 1.00), P6@25.9Å(now 16.0,conf 0.71), E23@24.6Å(now 21.5,conf 0.70), G9@22.4Å(now 11.4,conf 0.66), V14@14.9Å(now 7.3,conf 0.55), T17@13.1Å(now 4.7,conf 0.55)
  - I48↔P6: targets 9.3/25.9Å but partners are 6.2Å apart → too_close_together by 10.4Å
  - E47↔P6: targets 7.0/25.9Å but partners are 9.3Å apart → too_close_together by 9.5Å
  - I1↔I49: targets 27.5/12.8Å but partners are 6.8Å apart → too_close_together by 7.8Å
- **S43** — severity 54.60, 15 conflict(s); suspect input ~`K5` (group: push_out)
  - push-out (wants farther): K5@25.9Å(now 14.1,conf 0.71), E11@20.8Å(now 11.0,conf 0.59), F13@19.8Å(now 12.8,conf 0.57), V14@16.8Å(now 10.7,conf 0.55), E16@16.4Å(now 8.1,conf 0.55), H19@16.3Å(now 7.7,conf 0.55)
  - I49↔K5: targets 11.1/25.9Å but partners are 4.4Å apart → too_close_together by 10.4Å
  - I48↔K5: targets 9.0/25.9Å but partners are 7.9Å apart → too_close_together by 9.0Å
  - E47↔K5: targets 6.0/25.9Å but partners are 11.6Å apart → too_close_together by 8.3Å
- **A42** — severity 50.83, 17 conflict(s); suspect input ~`I48` (group: push_out)
  - push-out (wants farther): E4@23.9Å(now 12.6,conf 0.74), P6@20.7Å(now 9.6,conf 0.59), L7@18.5Å(now 7.4,conf 0.55), I49@9.6Å(now 7.0,conf 0.55)
  - P6↔I48: targets 20.7/6.3Å but partners are 6.2Å apart → too_close_together by 8.3Å
  - E4↔I49: targets 23.9/9.6Å but partners are 6.0Å apart → too_close_together by 8.3Å
  - L7↔I48: targets 18.5/6.3Å but partners are 4.6Å apart → too_close_together by 7.5Å
- **T41** — severity 46.60, 18 conflict(s); suspect input ~`Y8` (group: pull_in)
  - pull-in (wants closer): G68@16.9Å(now 20.3,conf 0.55)
  - push-out (wants farther): S25@24.5Å(now 21.6,conf 0.71), L24@21.6Å(now 19.0,conf 0.61), P6@21.5Å(now 13.1,conf 0.61), Y8@20.9Å(now 6.3,conf 0.59), E16@19.2Å(now 8.7,conf 0.56)
  - C46↔Y8: targets 7.1/20.9Å but partners are 6.7Å apart → too_close_together by 7.0Å
  - P6↔W33: targets 21.5/9.2Å but partners are 4.7Å apart → too_close_together by 7.6Å
  - Y8↔W33: targets 20.9/9.2Å but partners are 4.6Å apart → too_close_together by 7.1Å
- **I49** — severity 45.35, 22 conflict(s); suspect input ~`P6` (group: pull_in)
  - pull-in (wants closer): I56@5.1Å(now 8.4,conf 0.91), N61@16.9Å(now 19.6,conf 0.55)
  - push-out (wants farther): I1@20.2Å(now 6.8,conf 0.58), E11@19.9Å(now 17.0,conf 0.58), A75@17.7Å(now 13.8,conf 0.55), Y8@17.0Å(now 7.6,conf 0.55), K5@16.9Å(now 4.4,conf 0.55), P6@16.9Å(now 5.6,conf 0.55), A42@9.6Å(now 7.0,conf 0.55), P39@15.8Å(now 11.2,conf 0.55)
  - I56↔P6: targets 5.1/16.9Å but partners are 3.1Å apart → too_close_together by 8.6Å
  - H55↔P6: targets 7.0/16.9Å but partners are 3.5Å apart → too_close_together by 6.4Å
  - G52↔I1: targets 9.0/20.2Å but partners are 5.8Å apart → too_close_together by 5.4Å
- **G37** — severity 36.74, 18 conflict(s); suspect input ~`W33` (group: pull_in)
  - pull-in (wants closer): S71@6.9Å(now 10.6,conf 0.55), A75@16.7Å(now 19.5,conf 0.55), A77@15.3Å(now 17.8,conf 0.55)
  - push-out (wants farther): P27@23.7Å(now 20.2,conf 0.75), E26@23.8Å(now 19.0,conf 0.75), D51@22.6Å(now 18.6,conf 0.68), K54@21.0Å(now 15.1,conf 0.60), E21@17.3Å(now 9.4,conf 0.55), I22@17.2Å(now 9.1,conf 0.55)
  - K34↔E21: targets 5.0/17.3Å but partners are 6.8Å apart → too_close_together by 5.5Å
  - K54↔S71: targets 21.0/6.9Å but partners are 8.9Å apart → too_close_together by 5.2Å
  - I22↔W33: targets 17.2/8.5Å but partners are 3.8Å apart → too_close_together by 4.9Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=35 · 3-10(G)=10 · coil(C)=10

```
CEHHEHHHEHHHHGHGEEEEGHCHHEHEHHEEEEGHHEHEEHEGECGCHEHHHEEEECCEHCEGCEEHCHHHHEHHEGGCEEGEEEE
```

## Backbone H-bond Network

- total=64 · helix(i→i+4)=6 · sheet=58
  - E4 ↔ Y8  (helix)
  - Y8 ↔ V12  (helix)
  - E11 ↔ G15  (helix)
  - S25 ↔ V29  (helix)
  - I49 ↔ K53  (helix)
  - S71 ↔ A75  (helix)
  - K5 ↔ F20  (sheet)
  - G9 ↔ T17  (sheet)
  - G9 ↔ A18  (sheet)
  - G9 ↔ H19  (sheet)
  - G9 ↔ F20  (sheet)
  - T17 ↔ K34  (sheet)
  - A18 ↔ Q32  (sheet)
  - A18 ↔ W33  (sheet)
  - A18 ↔ K34  (sheet)
  - A18 ↔ Q38  (sheet)
  - H19 ↔ Q32  (sheet)
  - H19 ↔ W33  (sheet)
  - H19 ↔ K34  (sheet)
  - H19 ↔ Q38  (sheet)
  - … +44 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=31 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=490 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=362 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.4266 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=33 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
