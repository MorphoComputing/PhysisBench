# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1TEN\seeds\seed_0\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 4.013 A
- tm_score_ca_ordered: 0.6777644867715226
- heavy_atom_rmsd: 4.811 A
- sidechain_heavy_atom_rmsd: 5.594 A
- **all-atom quality (honest):** heavy 4.811 A, sidechain 5.594 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 2454
- bin_accuracy: 0.773

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.012591841213867
- ga_delta_rmsd: 2.47364926855216  ga_fitness_mode: energy
- pre_local_rmsd: 4.087529589833279  localized_anchor_rmsd: 4.012644595512571

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L1-P4 → 772 conflicts (85%)
- explained: 772/911 conflicts by 1 root cause(s)
- metrics: hubs=56 (frac 0.636), conflicts/hub=16.3, max_incompat=14.26Å, chain_span=0.92
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L1-P4 — explain ~772/911 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I72** — severity 69.99, 35 conflict(s); suspect input ~`P82` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 13.2,conf 1.00), A3@27.5Å(now 16.9,conf 1.00), P4@23.2Å(now 13.2,conf 0.50), S5@20.3Å(now 17.2,conf 0.41), Q6@19.9Å(now 17.3,conf 0.40), L25@10.4Å(now 7.7,conf 0.20), A26@12.0Å(now 8.5,conf 0.19)
  - L1↔P82: targets 27.5/5.3Å but partners are 9.3Å apart → too_close_together by 12.9Å
  - L1↔N81: targets 27.5/6.5Å but partners are 6.7Å apart → too_close_together by 14.3Å
  - L1↔S80: targets 27.5/5.9Å but partners are 10.4Å apart → too_close_together by 11.2Å
- **L71** — severity 69.70, 34 conflict(s); suspect input ~`A83` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 14.3,conf 1.00), A3@27.5Å(now 16.6,conf 1.00), P4@21.2Å(now 12.1,conf 0.44), S5@18.3Å(now 15.3,conf 0.37), A26@13.7Å(now 11.0,conf 0.19)
  - L1↔A83: targets 27.5/5.6Å but partners are 9.3Å apart → too_close_together by 12.6Å
  - L1↔P82: targets 27.5/6.0Å but partners are 9.3Å apart → too_close_together by 12.2Å
  - A3↔A83: targets 27.5/5.6Å but partners are 10.8Å apart → too_close_together by 11.1Å
- **E85** — severity 66.05, 42 conflict(s); suspect input ~`I7` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 15.1,conf 1.00), A3@27.5Å(now 13.8,conf 1.00), P4@23.6Å(now 12.5,conf 0.51), Q6@22.3Å(now 18.7,conf 0.47), S5@20.9Å(now 14.8,conf 0.43)
  - P4↔I7: targets 23.6/7.2Å but partners are 5.3Å apart → too_close_together by 11.1Å
  - P4↔E8: targets 23.6/7.7Å but partners are 6.6Å apart → too_close_together by 9.3Å
  - A3↔I7: targets 27.5/7.2Å but partners are 11.4Å apart → too_close_together by 8.8Å
- **A83** — severity 64.42, 36 conflict(s); suspect input ~`I7` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 9.3,conf 1.00), A3@27.5Å(now 10.8,conf 1.00), P4@24.6Å(now 10.2,conf 0.56), Q6@22.0Å(now 17.7,conf 0.47), S5@21.6Å(now 15.3,conf 0.45), L25@10.2Å(now 7.0,conf 0.20), A26@13.2Å(now 10.5,conf 0.18)
  - P4↔I7: targets 24.6/7.4Å but partners are 5.3Å apart → too_close_together by 11.9Å
  - P4↔W21: targets 24.6/9.9Å but partners are 3.1Å apart → too_close_together by 11.6Å
  - L1↔L71: targets 27.5/5.6Å but partners are 14.3Å apart → too_close_together by 7.6Å
- **V69** — severity 54.88, 31 conflict(s); suspect input ~`E85` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 18.0,conf 1.00), A3@27.5Å(now 18.2,conf 1.00), P4@21.6Å(now 14.2,conf 0.45), S5@18.7Å(now 15.3,conf 0.38)
  - L1↔K84: targets 27.5/6.1Å but partners are 12.7Å apart → too_close_together by 8.7Å
  - A3↔E85: targets 27.5/5.6Å but partners are 13.8Å apart → too_close_together by 8.1Å
  - L1↔A83: targets 27.5/8.5Å but partners are 9.3Å apart → too_close_together by 9.7Å
- **I7** — severity 54.07, 27 conflict(s); suspect input ~`A83` (group: push_out)
  - push-out (wants farther): L1@27.5Å(now 13.1,conf 1.00), A3@27.5Å(now 11.4,conf 1.00), P4@19.9Å(now 5.3,conf 0.40)
  - W21↔P4: targets 5.1/19.9Å but partners are 3.1Å apart → too_close_together by 11.7Å
  - A3↔W21: targets 27.5/5.1Å but partners are 14.0Å apart → too_close_together by 8.4Å
  - L1↔A83: targets 27.5/7.4Å but partners are 9.3Å apart → too_close_together by 10.8Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=38 · 3-10(G)=16 · coil(C)=9

```
CHHEGHHEHEHCEHEEGGGEHEHGEEHHHGEGGEEECCHHCECEEGGCEEEHHHHEECEHEHEHECEEGEGHHEGHHEEEGGGEEEEE
```

## Backbone H-bond Network

- total=67 · helix(i→i+4)=6 · sheet=61
  - D2 ↔ Q6  (helix)
  - A3 ↔ I7  (helix)
  - I7 ↔ D11  (helix)
  - K23 ↔ E27  (helix)
  - N60 ↔ D64  (helix)
  - S73 ↔ D77  (helix)
  - P4 ↔ K10  (sheet)
  - P4 ↔ T20  (sheet)
  - P4 ↔ F22  (sheet)
  - E8 ↔ T20  (sheet)
  - E8 ↔ F22  (sheet)
  - K10 ↔ T15  (sheet)
  - K10 ↔ T16  (sheet)
  - K10 ↔ T20  (sheet)
  - K10 ↔ F22  (sheet)
  - T16 ↔ Y35  (sheet)
  - T16 ↔ G36  (sheet)
  - T20 ↔ I31  (sheet)
  - F22 ↔ I31  (sheet)
  - F22 ↔ T34  (sheet)
  - … +47 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=38 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=415 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=295 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.9553 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
