# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1POH\seeds\seed_8\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 9.384 A
- tm_score_ca_ordered: 0.2494719529839853
- heavy_atom_rmsd: 10.511 A
- sidechain_heavy_atom_rmsd: 11.615 A
- **all-atom quality (honest):** heavy 10.511 A, sidechain 11.615 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 17
- distogram_pairs: 961
- bin_accuracy: 0.499

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.384280842910522
- ga_delta_rmsd: -1.0636337111387153  ga_fitness_mode: energy
- pre_local_rmsd: 9.39383149494895  localized_anchor_rmsd: 9.384212160825301

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V5-R16 → 348 conflicts (68%); H75-L83 → 101 conflicts (20%)
- explained: 449/514 conflicts by 2 root cause(s)
- metrics: hubs=66 (frac 0.795), conflicts/hub=7.8, max_incompat=12.45Å, chain_span=0.988
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V5-R16 + H75-L83 — explain ~449/514 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F47** — severity 59.04, 19 conflict(s); suspect input ~`V5` (group: push_out)
  - push-out (wants farther): A41@9.0Å(now 6.4,conf 1.00), F1@23.1Å(now 18.1,conf 0.75), T8@21.5Å(now 8.4,conf 0.61), P10@21.0Å(now 9.8,conf 0.60), V5@20.7Å(now 7.0,conf 0.59), K23@12.9Å(now 10.2,conf 0.55), H14@12.9Å(now 7.4,conf 0.55), F21@12.7Å(now 7.0,conf 0.55), G12@16.2Å(now 7.5,conf 0.55), A18@10.3Å(now 4.2,conf 0.55), A25@13.8Å(now 11.0,conf 0.55), P17@14.0Å(now 6.2,conf 0.55)
  - Q50↔T8: targets 5.1/21.5Å but partners are 3.9Å apart → too_close_together by 12.4Å
  - T51↔T8: targets 7.0/21.5Å but partners are 5.3Å apart → too_close_together by 9.2Å
  - A41↔V5: targets 9.0/20.7Å but partners are 3.6Å apart → too_close_together by 8.1Å
- **A9** — severity 49.72, 26 conflict(s); suspect input ~`K48` (group: pull_in)
  - pull-in (wants closer): K71@22.8Å(now 25.4,conf 0.71), E74@18.9Å(now 22.1,conf 0.56), M80@9.1Å(now 12.1,conf 0.55), K78@13.2Å(now 18.8,conf 0.55), E82@8.3Å(now 12.6,conf 0.55), V59@12.0Å(now 18.3,conf 0.55)
  - push-out (wants farther): R16@12.9Å(now 10.0,conf 0.91), S42@20.9Å(now 14.9,conf 0.59), K39@20.4Å(now 17.1,conf 0.59), K44@20.4Å(now 15.0,conf 0.59), K48@20.1Å(now 11.6,conf 0.58), L46@18.0Å(now 6.8,conf 0.55), Q50@16.1Å(now 7.4,conf 0.55)
  - K48↔T6: targets 20.1/9.3Å but partners are 3.8Å apart → too_close_together by 6.9Å
  - L13↔K48: targets 7.4/20.1Å but partners are 6.5Å apart → too_close_together by 6.1Å
  - G12↔K48: targets 5.0/20.1Å but partners are 10.0Å apart → too_close_together by 5.1Å
- **G12** — severity 48.33, 21 conflict(s); suspect input ~`G57` (group: push_out)
  - pull-in (wants closer): T55@4.2Å(now 15.3,conf 0.64), G57@7.5Å(now 20.5,conf 0.55), G53@8.8Å(now 13.6,conf 0.55), L83@8.6Å(now 12.2,conf 0.55), E82@11.4Å(now 17.5,conf 0.55)
  - push-out (wants farther): R16@11.0Å(now 8.1,conf 1.00), S45@17.2Å(now 11.2,conf 0.55), Q50@11.5Å(now 6.9,conf 0.55), F47@16.2Å(now 7.5,conf 0.55)
  - T15↔G57: targets 9.0/7.5Å but partners are 26.2Å apart → too_far_apart by 9.7Å
  - T15↔T55: targets 9.0/4.2Å but partners are 21.3Å apart → too_far_apart by 8.1Å
  - R16↔G57: targets 11.0/7.5Å but partners are 24.4Å apart → too_far_apart by 5.9Å
- **K48** — severity 48.24, 21 conflict(s); suspect input ~`Q3` (group: push_out)
  - push-out (wants farther): A9@20.1Å(now 11.6,conf 0.58), Q3@19.8Å(now 8.3,conf 0.57), L83@19.1Å(now 10.8,conf 0.56), I7@17.6Å(now 6.5,conf 0.55), M80@16.9Å(now 10.5,conf 0.55), P17@15.3Å(now 10.2,conf 0.55), L13@13.3Å(now 6.5,conf 0.55)
  - S42↔Q3: targets 7.0/19.8Å but partners are 4.0Å apart → too_close_together by 8.7Å
  - Q3↔A41: targets 19.8/5.4Å but partners are 7.2Å apart → too_close_together by 7.1Å
  - T51↔I7: targets 5.4/17.6Å but partners are 5.1Å apart → too_close_together by 7.1Å
- **P10** — severity 37.30, 16 conflict(s); suspect input ~`F47` (group: push_out)
  - pull-in (wants closer): E67@27.5Å(now 32.3,conf 1.00), G66@27.5Å(now 30.9,conf 1.00), A72@24.2Å(now 27.6,conf 0.72), V73@22.5Å(now 26.0,conf 0.68), I62@20.1Å(now 23.5,conf 0.58), G57@8.7Å(now 18.7,conf 0.55), T55@7.8Å(now 13.4,conf 0.55)
  - push-out (wants farther): F47@21.0Å(now 9.8,conf 0.60), V22@19.1Å(now 16.4,conf 0.56), L49@17.8Å(now 11.5,conf 0.55), L52@16.4Å(now 13.2,conf 0.55), A18@13.4Å(now 10.7,conf 0.55), P17@11.8Å(now 8.0,conf 0.55)
  - L13↔F47: targets 8.0/21.0Å but partners are 3.8Å apart → too_close_together by 9.3Å
  - F47↔I7: targets 21.0/8.8Å but partners are 4.7Å apart → too_close_together by 7.5Å
  - T15↔G57: targets 11.4/8.7Å but partners are 26.2Å apart → too_far_apart by 6.1Å
- **L46** — severity 35.58, 12 conflict(s); suspect input ~`T6` (group: push_out)
  - push-out (wants farther): T6@18.9Å(now 8.3,conf 0.56), A9@18.0Å(now 6.8,conf 0.55), I7@16.7Å(now 4.6,conf 0.55), L79@15.8Å(now 11.1,conf 0.55)
  - L49↔T6: targets 5.0/18.9Å but partners are 4.8Å apart → too_close_together by 9.2Å
  - T6↔Q50: targets 18.9/6.2Å but partners are 4.0Å apart → too_close_together by 8.8Å
  - L49↔I7: targets 5.0/16.7Å but partners are 3.8Å apart → too_close_together by 7.9Å

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=32 · 3-10(G)=12 · coil(C)=5

```
CEEEHHCEGEHEHEHEHHHEHGEGHEHCEEEGEHGGGHHHHHHHEHHHGHHEEGECEEEGEGEEEEHHEGHEHEHEHHEHHHC
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=17 · sheet=41
  - N11 ↔ T15  (helix)
  - L13 ↔ P17  (helix)
  - T15 ↔ A19  (helix)
  - P17 ↔ F21  (helix)
  - F21 ↔ A25  (helix)
  - V34 ↔ G38  (helix)
  - G38 ↔ S42  (helix)
  - S42 ↔ L46  (helix)
  - A43 ↔ F47  (helix)
  - K44 ↔ K48  (helix)
  - L46 ↔ Q50  (helix)
  - F47 ↔ T51  (helix)
  - E67 ↔ K71  (helix)
  - K71 ↔ H75  (helix)
  - V73 ↔ V77  (helix)
  - V77 ↔ A81  (helix)
  - K78 ↔ E82  (helix)
  - T8 ↔ H14  (sheet)
  - P10 ↔ R16  (sheet)
  - H14 ↔ Q20  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=431 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=261 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.2243 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=17 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
