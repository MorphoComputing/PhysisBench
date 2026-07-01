# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2ACY\seeds\seed_1\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 7.278 A
- tm_score_ca_ordered: 0.38530577231146695
- heavy_atom_rmsd: 8.306 A
- sidechain_heavy_atom_rmsd: 9.253 A
- **all-atom quality (honest):** heavy 8.306 A, sidechain 9.253 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 34
- distogram_pairs: 1236
- bin_accuracy: 0.405

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.278149212863872
- ga_delta_rmsd: -0.10585208853740369  ga_fitness_mode: energy
- pre_local_rmsd: 7.294059516205575  localized_anchor_rmsd: 7.278068195439181

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V35-L50 → 428 conflicts (54%); P53-K67 → 145 conflicts (18%); P70-H73 → 61 conflicts (8%)
- explained: 634/796 conflicts by 3 root cause(s)
- metrics: hubs=90 (frac 0.938), conflicts/hub=8.8, max_incompat=12.03Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V35-L50 + P53-K67 + P70-H73 — explain ~634/796 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S55** — severity 94.67, 23 conflict(s); suspect input ~`Q39` (group: pull_in)
  - pull-in (wants closer): Q17@27.3Å(now 30.1,conf 0.93), H73@23.9Å(now 26.9,conf 0.74), F20@25.0Å(now 27.9,conf 0.69), G68@18.4Å(now 21.5,conf 0.55)
  - push-out (wants farther): G48@19.0Å(now 12.4,conf 1.00), Q51@11.0Å(now 3.6,conf 1.00), G52@9.0Å(now 5.2,conf 0.99), T41@27.4Å(now 21.0,conf 0.94), Q49@15.1Å(now 10.4,conf 0.91), Q39@22.8Å(now 14.8,conf 0.72), W37@18.1Å(now 9.8,conf 0.55), L50@12.0Å(now 6.7,conf 0.55)
  - G48↔R58: targets 19.0/5.0Å but partners are 5.9Å apart → too_close_together by 8.1Å
  - R58↔T41: targets 5.0/27.4Å but partners are 14.2Å apart → too_close_together by 8.2Å
  - T41↔E62: targets 27.4/10.9Å but partners are 8.6Å apart → too_close_together by 7.9Å
- **H59** — severity 85.89, 22 conflict(s); suspect input ~`Q43` (group: pull_in)
  - pull-in (wants closer): V96@21.9Å(now 24.6,conf 0.62), K15@21.0Å(now 26.2,conf 0.60), Y24@14.6Å(now 19.1,conf 0.55)
  - push-out (wants farther): Q43@26.3Å(now 15.0,conf 0.75), N40@21.3Å(now 14.4,conf 0.60), T45@20.6Å(now 17.7,conf 0.59), Q47@17.1Å(now 10.5,conf 0.55)
  - W63↔Q43: targets 6.9/26.3Å but partners are 8.5Å apart → too_close_together by 11.0Å
  - L64↔Q43: targets 9.0/26.3Å but partners are 6.6Å apart → too_close_together by 10.7Å
  - E62↔Q43: targets 5.0/26.3Å but partners are 10.8Å apart → too_close_together by 10.5Å
- **T41** — severity 69.33, 24 conflict(s); suspect input ~`V38` (group: pull_in)
  - pull-in (wants closer): V16@10.6Å(now 13.5,conf 0.55), R22@11.5Å(now 15.2,conf 0.55)
  - push-out (wants farther): L34@21.0Å(now 18.3,conf 1.00), S55@27.4Å(now 21.0,conf 0.94), G33@24.0Å(now 20.4,conf 0.74), K56@24.5Å(now 19.1,conf 0.71), E62@20.9Å(now 8.6,conf 0.60)
  - Q47↔E62: targets 6.9/20.9Å but partners are 4.0Å apart → too_close_together by 10.0Å
  - S55↔G48: targets 27.4/9.1Å but partners are 12.4Å apart → too_close_together by 5.8Å
  - S55↔Q47: targets 27.4/6.9Å but partners are 15.1Å apart → too_close_together by 5.3Å
- **G29** — severity 55.33, 28 conflict(s); suspect input ~`F21` (group: push_out)
  - pull-in (wants closer): M60@7.0Å(now 11.4,conf 0.55), Y90@12.6Å(now 16.2,conf 0.55), Q51@9.5Å(now 13.2,conf 0.55), P53@11.9Å(now 16.5,conf 0.55), F21@12.0Å(now 14.8,conf 0.55)
  - push-out (wants farther): Q43@22.8Å(now 13.0,conf 0.71)
  - T25↔Q43: targets 6.6/22.8Å but partners are 11.0Å apart → too_close_together by 5.2Å
  - Y24↔P53: targets 8.6/11.9Å but partners are 26.3Å apart → too_far_apart by 5.9Å
  - Q26↔Q43: targets 5.0/22.8Å but partners are 13.5Å apart → too_close_together by 4.3Å
- **K56** — severity 55.22, 23 conflict(s); suspect input ~`T41` (group: pull_in)
  - pull-in (wants closer): P53@5.0Å(now 8.2,conf 0.99), Q17@23.9Å(now 26.8,conf 0.74), Y24@16.2Å(now 19.3,conf 0.55)
  - push-out (wants farther): Q51@9.0Å(now 5.6,conf 1.00), T41@24.5Å(now 19.1,conf 0.71), Q47@18.2Å(now 13.8,conf 0.55), Q49@13.4Å(now 9.6,conf 0.55), L50@9.8Å(now 6.7,conf 0.55)
  - W63↔T41: targets 11.0/24.5Å but partners are 6.5Å apart → too_close_together by 7.0Å
  - E62↔T41: targets 9.4/24.5Å but partners are 8.6Å apart → too_close_together by 6.4Å
  - Q61↔T41: targets 8.9/24.5Å but partners are 11.2Å apart → too_close_together by 4.3Å
- **Q43** — severity 51.52, 22 conflict(s); suspect input ~`Q47` (group: push_out)
  - push-out (wants farther): G36@21.0Å(now 15.5,conf 1.00), V38@15.0Å(now 12.2,conf 1.00), L50@21.0Å(now 18.2,conf 0.99), H59@26.3Å(now 15.0,conf 0.75), E28@23.1Å(now 13.7,conf 0.75), G29@22.8Å(now 13.0,conf 0.71), E62@22.4Å(now 10.8,conf 0.67), Q61@20.9Å(now 13.0,conf 0.59), W37@17.5Å(now 11.5,conf 0.55), S72@16.2Å(now 13.2,conf 0.55)
  - E62↔Q47: targets 22.4/10.4Å but partners are 4.0Å apart → too_close_together by 8.0Å
  - Q39↔E62: targets 11.0/22.4Å but partners are 5.1Å apart → too_close_together by 6.3Å
  - Q39↔H59: targets 11.0/26.3Å but partners are 10.1Å apart → too_close_together by 5.2Å

## Secondary Structure (DSSP-like)

- helix(H)=46 · strand(E)=33 · 3-10(G)=12 · coil(C)=5

```
EHEHCEEEEEEGCHHHEHHHHHEHHHEEHHEGGGHEHHEHHEHEHCEEGGEHHHHHHHEGEEEHHGGEHHHEHHHHHEHEGECHEHHGHEHEGEHC
```

## Backbone H-bond Network

- total=69 · helix(i→i+4)=20 · sheet=49
  - G14 ↔ G18  (helix)
  - K15 ↔ V19  (helix)
  - V16 ↔ F20  (helix)
  - G18 ↔ R22  (helix)
  - F20 ↔ Y24  (helix)
  - F21 ↔ T25  (helix)
  - R22 ↔ Q26  (helix)
  - T25 ↔ G29  (helix)
  - Q26 ↔ K30  (helix)
  - W37 ↔ T41  (helix)
  - T41 ↔ T45  (helix)
  - G52 ↔ K56  (helix)
  - A54 ↔ R58  (helix)
  - E65 ↔ S69  (helix)
  - S69 ↔ H73  (helix)
  - P70 ↔ I74  (helix)
  - K71 ↔ D75  (helix)
  - D75 ↔ F79  (helix)
  - K87 ↔ T91  (helix)
  - T91 ↔ I95  (helix)
  - … +49 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=41 · exposed=33 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=534 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=349 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.7753 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=34 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
