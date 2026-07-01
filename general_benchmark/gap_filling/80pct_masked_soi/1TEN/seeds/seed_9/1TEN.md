# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TEN\seeds\seed_9\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 5.548 A
- tm_score_ca_ordered: 0.5153841110781111
- heavy_atom_rmsd: 6.529 A
- sidechain_heavy_atom_rmsd: 7.350 A
- **all-atom quality (honest):** heavy 6.529 A, sidechain 7.350 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 41
- distogram_pairs: 1075
- bin_accuracy: 0.546

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.547648906924581
- ga_delta_rmsd: -1.1585317767129366  ga_fitness_mode: energy
- pre_local_rmsd: 5.561256536036769  localized_anchor_rmsd: 5.547595149019983

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T46-S57 → 120 conflicts (74%); A83-T86 → 24 conflicts (15%)
- explained: 144/163 conflicts by 2 root cause(s)
- metrics: hubs=46 (frac 0.523), conflicts/hub=3.5, max_incompat=6.7Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T46-S57 + A83-T86 — explain ~144/163 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V40** — severity 33.41, 14 conflict(s); suspect input ~`N54` (group: pull_in)
  - pull-in (wants closer): T34@13.2Å(now 16.0,conf 0.55)
  - push-out (wants farther): I47@19.0Å(now 15.7,conf 1.00), N54@27.1Å(now 22.0,conf 0.86), I58@17.8Å(now 14.6,conf 0.55), P63@15.1Å(now 11.3,conf 0.55), K62@12.7Å(now 7.7,conf 0.55)
  - I37↔N54: targets 5.1/27.1Å but partners are 16.8Å apart → too_close_together by 5.2Å
  - G36↔N54: targets 7.0/27.1Å but partners are 15.3Å apart → too_close_together by 4.8Å
  - I47↔G36: targets 19.0/7.0Å but partners are 8.3Å apart → too_close_together by 3.7Å
- **D52** — severity 25.52, 10 conflict(s); suspect input ~`K38` (group: pull_in)
  - pull-in (wants closer): D77@19.2Å(now 22.1,conf 0.56)
  - push-out (wants farther): K38@27.4Å(now 19.0,conf 0.95), P82@18.8Å(now 16.1,conf 0.56), A83@18.6Å(now 14.5,conf 0.55), A3@14.8Å(now 8.0,conf 0.55), W21@11.5Å(now 7.7,conf 0.55), F22@10.5Å(now 7.8,conf 0.55), P4@12.3Å(now 5.2,conf 0.55), I47@14.2Å(now 11.2,conf 0.55)
  - Q55↔K38: targets 9.0/27.4Å but partners are 11.7Å apart → too_close_together by 6.7Å
  - S57↔K38: targets 15.0/27.4Å but partners are 8.2Å apart → too_close_together by 4.2Å
  - K38↔Y56: targets 27.4/12.0Å but partners are 11.5Å apart → too_close_together by 3.9Å
- **D64** — severity 14.77, 7 conflict(s); suspect input ~`L49` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 34.7,conf 1.00), L25@27.5Å(now 34.0,conf 1.00)
  - push-out (wants farther): S57@17.0Å(now 12.6,conf 1.00), E53@27.5Å(now 24.5,conf 0.98), L49@27.3Å(now 24.4,conf 0.92), I58@14.6Å(now 12.0,conf 0.79), N54@26.6Å(now 22.4,conf 0.78), G42@19.0Å(now 16.4,conf 0.56), R44@18.0Å(now 15.3,conf 0.55)
  - S57↔Y67: targets 17.0/9.0Å but partners are 5.1Å apart → too_close_together by 2.9Å
  - Y67↔N54: targets 9.0/26.6Å but partners are 14.0Å apart → too_close_together by 3.6Å
  - Y67↔L49: targets 9.0/27.3Å but partners are 15.3Å apart → too_close_together by 3.0Å
- **E53** — severity 14.19, 7 conflict(s); suspect input ~`A3` (group: push_out)
  - push-out (wants farther): D64@27.5Å(now 24.5,conf 0.98), I47@12.9Å(now 9.0,conf 0.91), G36@20.2Å(now 16.8,conf 0.58), L1@17.1Å(now 13.5,conf 0.55), I7@13.1Å(now 3.2,conf 0.55), S5@13.4Å(now 4.6,conf 0.55), E8@14.5Å(now 7.3,conf 0.55), A3@14.3Å(now 8.4,conf 0.55)
  - S57↔D64: targets 11.0/27.5Å but partners are 12.6Å apart → too_close_together by 3.9Å
  - T50↔A3: targets 5.8/14.3Å but partners are 4.5Å apart → too_close_together by 4.0Å
  - D64↔Y56: targets 27.5/7.9Å but partners are 16.2Å apart → too_close_together by 3.4Å
- **T50** — severity 12.07, 6 conflict(s); suspect input ~`Y67` (group: push_out)
  - push-out (wants farther): F87@23.3Å(now 19.6,conf 0.76), T13@26.3Å(now 23.7,conf 0.74), Y67@22.9Å(now 18.9,conf 0.72), N81@17.9Å(now 10.1,conf 0.55), P82@16.8Å(now 12.0,conf 0.55), P4@12.9Å(now 3.3,conf 0.55), L33@10.9Å(now 6.9,conf 0.55), L25@14.8Å(now 8.8,conf 0.55), K23@10.8Å(now 5.5,conf 0.55), T20@13.9Å(now 9.9,conf 0.55), A26@14.0Å(now 9.5,conf 0.55)
  - I47↔Y67: targets 9.4/22.9Å but partners are 9.1Å apart → too_close_together by 4.3Å
  - S57↔Y67: targets 14.6/22.9Å but partners are 5.1Å apart → too_close_together by 3.2Å
  - E53↔P4: targets 5.8/12.9Å but partners are 3.4Å apart → too_close_together by 3.7Å
- **E51** — severity 11.82, 7 conflict(s); suspect input ~`D29` (group: pull_in)
  - pull-in (wants closer): D29@5.6Å(now 12.9,conf 0.56), I28@6.2Å(now 10.3,conf 0.55), D77@15.5Å(now 18.1,conf 0.55)
  - push-out (wants farther): E66@27.4Å(now 23.5,conf 0.97), L25@11.2Å(now 6.0,conf 0.55), I7@15.3Å(now 8.8,conf 0.55), I72@11.6Å(now 8.3,conf 0.55)
  - N54↔I7: targets 7.0/15.3Å but partners are 3.5Å apart → too_close_together by 4.8Å
  - N54↔D29: targets 7.0/5.6Å but partners are 17.0Å apart → too_far_apart by 4.4Å
  - S57↔E66: targets 15.0/27.4Å but partners are 10.4Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=36 · 3-10(G)=17 · coil(C)=7

```
CEEEGHHEGECGEHGEECCCEEEEHGHEHEGHGEEEHHHHHHHEEHHEGHCHHEEHHEEHEGGGEGGEGGEEGEGEHHEEHHHHEEEC
```

## Backbone H-bond Network

- total=75 · helix(i→i+4)=8 · sheet=67
  - L25 ↔ D29  (helix)
  - I37 ↔ P41  (helix)
  - K38 ↔ G42  (helix)
  - D43 ↔ I47  (helix)
  - D52 ↔ Y56  (helix)
  - E53 ↔ S57  (helix)
  - Y56 ↔ N60  (helix)
  - M78 ↔ P82  (helix)
  - D2 ↔ F22  (sheet)
  - A3 ↔ W21  (sheet)
  - A3 ↔ F22  (sheet)
  - A3 ↔ K23  (sheet)
  - P4 ↔ W21  (sheet)
  - P4 ↔ F22  (sheet)
  - P4 ↔ K23  (sheet)
  - P4 ↔ P24  (sheet)
  - E8 ↔ A17  (sheet)
  - E8 ↔ W21  (sheet)
  - E8 ↔ F22  (sheet)
  - E8 ↔ K23  (sheet)
  - … +55 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=39 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=434 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=319 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.3607 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=41 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
