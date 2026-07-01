# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TEN\seeds\seed_6\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 7.406 A
- tm_score_ca_ordered: 0.3599602831222057
- heavy_atom_rmsd: 8.135 A
- sidechain_heavy_atom_rmsd: 8.899 A
- **all-atom quality (honest):** heavy 8.135 A, sidechain 8.899 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 39
- distogram_pairs: 1076
- bin_accuracy: 0.460

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.40643770823807
- ga_delta_rmsd: 0.1742007866804247  ga_fitness_mode: energy
- pre_local_rmsd: 7.406398715967943  localized_anchor_rmsd: 7.406398715967943

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L49-D64 → 308 conflicts (82%)
- explained: 308/378 conflicts by 1 root cause(s)
- metrics: hubs=66 (frac 0.75), conflicts/hub=5.7, max_incompat=8.28Å, chain_span=0.966
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L49-D64 — explain ~308/378 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V40** — severity 77.62, 30 conflict(s); suspect input ~`N54` (group: push_out)
  - push-out (wants farther): E51@27.5Å(now 22.3,conf 0.99), T50@27.4Å(now 20.1,conf 0.95), T45@12.9Å(now 9.7,conf 0.91), I47@18.9Å(now 14.5,conf 0.91), N54@27.1Å(now 19.5,conf 0.86), I58@17.8Å(now 13.8,conf 0.55)
  - L33↔N54: targets 17.0/27.1Å but partners are 4.0Å apart → too_close_together by 6.1Å
  - N54↔R44: targets 27.1/8.8Å but partners are 12.6Å apart → too_close_together by 5.7Å
  - Y35↔N54: targets 11.0/27.1Å but partners are 10.7Å apart → too_close_together by 5.3Å
- **A17** — severity 51.05, 18 conflict(s); suspect input ~`Y56` (group: pull_in)
  - pull-in (wants closer): S57@6.0Å(now 14.3,conf 0.55), Y56@8.5Å(now 16.2,conf 0.55)
  - K10↔S57: targets 5.1/6.0Å but partners are 19.2Å apart → too_far_apart by 8.1Å
  - D11↔S57: targets 6.0/6.0Å but partners are 19.7Å apart → too_far_apart by 7.7Å
  - S79↔Y56: targets 24.8/8.5Å but partners are 9.0Å apart → too_close_together by 7.3Å
- **K38** — severity 42.94, 17 conflict(s); suspect input ~`D52` (group: pull_in)
  - pull-in (wants closer): T86@7.6Å(now 10.7,conf 0.55), E85@10.0Å(now 13.8,conf 0.55)
  - push-out (wants farther): D52@27.4Å(now 17.6,conf 0.95), D43@7.1Å(now 4.3,conf 0.91), R44@9.2Å(now 4.6,conf 0.82), T45@11.4Å(now 8.2,conf 0.79), T34@11.2Å(now 7.6,conf 0.55), P63@13.4Å(now 10.6,conf 0.55), T16@15.6Å(now 11.0,conf 0.55), G59@16.2Å(now 13.2,conf 0.55)
  - E32↔D52: targets 17.0/27.4Å but partners are 3.8Å apart → too_close_together by 6.6Å
  - D52↔Y35: targets 27.4/8.6Å but partners are 12.8Å apart → too_close_together by 6.1Å
  - D52↔E68: targets 27.4/5.0Å but partners are 14.1Å apart → too_close_together by 8.3Å
- **P63** — severity 32.20, 14 conflict(s); suspect input ~`P82` (group: pull_in)
  - pull-in (wants closer): T13@8.2Å(now 11.0,conf 0.55)
  - push-out (wants farther): E53@27.1Å(now 23.3,conf 0.87), A83@23.5Å(now 18.9,conf 0.76), P82@26.2Å(now 20.9,conf 0.74), Q55@21.4Å(now 18.5,conf 0.61), K84@20.4Å(now 15.1,conf 0.59), K38@13.4Å(now 10.6,conf 0.55), T86@14.6Å(now 8.2,conf 0.55), T88@8.3Å(now 5.3,conf 0.55)
  - G59↔K84: targets 10.9/20.4Å but partners are 3.4Å apart → too_close_together by 6.2Å
  - G59↔A83: targets 10.9/23.5Å but partners are 7.9Å apart → too_close_together by 4.7Å
  - G59↔P82: targets 10.9/26.2Å but partners are 10.5Å apart → too_close_together by 4.8Å
- **D52** — severity 29.05, 10 conflict(s); suspect input ~`K38` (group: pull_in)
  - pull-in (wants closer): L18@16.5Å(now 19.0,conf 0.55), T20@12.4Å(now 15.2,conf 0.55)
  - push-out (wants farther): T45@21.0Å(now 14.5,conf 1.00), K62@27.5Å(now 24.6,conf 0.99), T46@17.0Å(now 12.2,conf 0.99), K38@27.4Å(now 17.6,conf 0.95), L49@8.6Å(now 3.8,conf 0.79), R44@23.0Å(now 13.5,conf 0.73), D77@19.2Å(now 15.6,conf 0.56), P82@18.8Å(now 14.1,conf 0.56), S79@16.8Å(now 13.4,conf 0.55), A3@14.8Å(now 3.5,conf 0.55), L71@14.7Å(now 10.9,conf 0.55), E32@12.7Å(now 3.8,conf 0.55), P4@12.3Å(now 6.0,conf 0.55), I47@14.2Å(now 6.1,conf 0.55)
  - Q55↔K38: targets 9.0/27.4Å but partners are 10.9Å apart → too_close_together by 7.5Å
  - Q55↔R44: targets 9.0/23.0Å but partners are 8.2Å apart → too_close_together by 5.8Å
  - S57↔K38: targets 15.0/27.4Å but partners are 8.1Å apart → too_close_together by 4.3Å
- **P82** — severity 27.59, 11 conflict(s); suspect input ~`T86` (group: pull_in)
  - pull-in (wants closer): L1@11.0Å(now 15.0,conf 0.99), D2@9.6Å(now 13.2,conf 0.55)
  - push-out (wants farther): N60@23.6Å(now 13.5,conf 0.76), P63@26.2Å(now 20.9,conf 0.74), G59@22.3Å(now 10.5,conf 0.66), T65@22.0Å(now 19.4,conf 0.63), D52@18.8Å(now 14.1,conf 0.56), T50@16.8Å(now 14.1,conf 0.55)
  - E85↔G59: targets 10.9/22.3Å but partners are 3.8Å apart → too_close_together by 7.6Å
  - E85↔N60: targets 10.9/23.6Å but partners are 7.3Å apart → too_close_together by 5.5Å
  - N60↔T86: targets 23.6/13.3Å but partners are 5.1Å apart → too_close_together by 5.3Å

## Secondary Structure (DSSP-like)

- helix(H)=45 · strand(E)=20 · 3-10(G)=21 · coil(C)=2

```
CECEHEHGEEEHHHHEEGGGGEEGHHHEHHGGHGGGEHHHHHHGHGHHGHHHHHEHHEHHHHHGGGHHHGHHHHHEHGEHGEEGEHHE
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=17 · sheet=17
  - L25 ↔ D29  (helix)
  - D29 ↔ L33  (helix)
  - D39 ↔ D43  (helix)
  - P41 ↔ T45  (helix)
  - D43 ↔ I47  (helix)
  - I47 ↔ E51  (helix)
  - D48 ↔ D52  (helix)
  - T50 ↔ N54  (helix)
  - D52 ↔ Y56  (helix)
  - Y56 ↔ N60  (helix)
  - G59 ↔ P63  (helix)
  - P63 ↔ Y67  (helix)
  - Y67 ↔ L71  (helix)
  - E68 ↔ I72  (helix)
  - V69 ↔ S73  (helix)
  - L71 ↔ R75  (helix)
  - S73 ↔ D77  (helix)
  - D2 ↔ F22  (sheet)
  - P4 ↔ V9  (sheet)
  - P4 ↔ F22  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=40 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=444 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=311 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.0251 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=39 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
