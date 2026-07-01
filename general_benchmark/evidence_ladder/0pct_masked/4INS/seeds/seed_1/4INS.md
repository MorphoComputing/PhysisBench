# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/4INS/sequence/4INS.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/4INS/seeds/seed_1/4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 4.642 A
- tm_score_ca_ordered: 0.5455581642472624
- heavy_atom_rmsd: 5.836 A
- sidechain_heavy_atom_rmsd: 6.656 A
- **all-atom quality (honest):** heavy 5.836 A, sidechain 6.656 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 4184
- bin_accuracy: 0.475

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.6421772923758295
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 4.679133922389639  localized_anchor_rmsd: 4.642155935121695

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q69-L80 → 1550 conflicts (64%); F43-K47 → 345 conflicts (14%)
- explained: 1895/2407 conflicts by 2 root cause(s)
- metrics: hubs=88 (frac 0.936), conflicts/hub=27.4, max_incompat=8.24Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q69-L80 + F43-K47 — explain ~1895/2407 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L71** — severity 162.97, 82 conflict(s); suspect input ~`H75` (group: pull_in)
  - pull-in (wants closer): S8@27.5Å(now 30.2,conf 1.00), V20@27.5Å(now 30.8,conf 1.00), I56@7.4Å(now 11.3,conf 0.55), S55@8.9Å(now 12.0,conf 0.55), L35@16.3Å(now 19.1,conf 0.55), T54@8.5Å(now 12.0,conf 0.55)
  - push-out (wants farther): K47@26.8Å(now 19.4,conf 0.82), P46@22.6Å(now 17.4,conf 0.69), T45@21.3Å(now 15.1,conf 0.60), E86@20.6Å(now 16.8,conf 0.59), R87@20.2Å(now 14.6,conf 0.58), F43@18.4Å(now 12.8,conf 0.55), G88@18.3Å(now 13.6,conf 0.55), Y44@18.2Å(now 12.9,conf 0.55), G85@17.3Å(now 14.5,conf 0.55), F42@17.2Å(now 14.1,conf 0.55), N64@14.9Å(now 5.0,conf 0.55), V83@13.1Å(now 10.4,conf 0.55), Y91@12.9Å(now 10.1,conf 0.55), C84@15.2Å(now 12.3,conf 0.55), Y60@13.4Å(now 10.7,conf 0.55), T92@14.5Å(now 11.5,conf 0.55), F90@15.6Å(now 11.4,conf 0.55), I48@9.7Å(now 3.9,conf 0.55), C66@16.1Å(now 8.7,conf 0.55), F89@15.8Å(now 11.0,conf 0.55), L62@10.3Å(now 5.2,conf 0.55), E63@13.8Å(now 7.5,conf 0.55), Q61@11.9Å(now 8.0,conf 0.55), Y65@14.0Å(now 4.3,conf 0.55)
  - K47↔E78: targets 26.8/9.2Å but partners are 10.0Å apart → too_close_together by 7.7Å
  - K47↔H75: targets 26.8/5.7Å but partners are 13.8Å apart → too_close_together by 7.4Å
  - K47↔L76: targets 26.8/4.9Å but partners are 15.5Å apart → too_close_together by 6.5Å
- **R87** — severity 143.92, 85 conflict(s); suspect input ~`C66` (group: pull_in)
  - pull-in (wants closer): T7@19.1Å(now 22.2,conf 0.56), C6@17.2Å(now 19.9,conf 0.55), H28@16.9Å(now 20.3,conf 0.55), Y44@8.9Å(now 12.5,conf 0.55), L29@15.1Å(now 17.8,conf 0.55), G26@13.2Å(now 17.9,conf 0.55), F43@11.2Å(now 14.5,conf 0.55), V2@12.3Å(now 15.6,conf 0.55), C25@15.9Å(now 18.4,conf 0.55), S27@13.9Å(now 16.8,conf 0.55), E3@14.0Å(now 17.3,conf 0.55)
  - push-out (wants farther): H70@22.9Å(now 18.3,conf 0.72), Q69@22.2Å(now 18.1,conf 0.65), N68@22.2Å(now 19.2,conf 0.65), V67@22.1Å(now 18.7,conf 0.64), C72@21.3Å(now 17.6,conf 0.60), G73@20.7Å(now 12.7,conf 0.59), L71@20.2Å(now 14.6,conf 0.58), S74@19.1Å(now 9.3,conf 0.56), H75@18.8Å(now 8.6,conf 0.56), L76@16.7Å(now 11.6,conf 0.55), Y81@9.3Å(now 6.2,conf 0.55), L82@10.6Å(now 6.1,conf 0.55), L80@10.5Å(now 7.7,conf 0.55), A79@13.6Å(now 8.8,conf 0.55), E78@14.3Å(now 8.5,conf 0.55), V77@14.1Å(now 9.3,conf 0.55)
  - H75↔C66: targets 18.8/6.4Å but partners are 4.2Å apart → too_close_together by 8.2Å
  - S74↔C66: targets 19.1/6.4Å but partners are 6.1Å apart → too_close_together by 6.6Å
  - H75↔C84: targets 18.8/5.6Å but partners are 7.5Å apart → too_close_together by 5.7Å
- **C72** — severity 142.01, 65 conflict(s); suspect input ~`V77` (group: pull_in)
  - pull-in (wants closer): S8@27.5Å(now 30.3,conf 1.00), H75@5.5Å(now 9.0,conf 0.56)
  - push-out (wants farther): K47@27.1Å(now 21.3,conf 0.87), P46@22.7Å(now 18.5,conf 0.70), R87@21.3Å(now 17.6,conf 0.60), T45@21.1Å(now 15.1,conf 0.60), G88@18.9Å(now 15.7,conf 0.56), Y44@17.7Å(now 11.8,conf 0.55), F43@17.5Å(now 10.4,conf 0.55), C66@17.3Å(now 12.5,conf 0.55), V49@7.2Å(now 3.1,conf 0.55), N64@16.6Å(now 10.3,conf 0.55), Y65@15.0Å(now 8.7,conf 0.55), P93@11.0Å(now 7.7,conf 0.55), T92@13.1Å(now 8.8,conf 0.55), F90@15.3Å(now 11.4,conf 0.55), L62@12.5Å(now 9.8,conf 0.55), R40@15.5Å(now 12.4,conf 0.55), G41@13.6Å(now 10.0,conf 0.55), F42@15.6Å(now 11.1,conf 0.55), K94@14.4Å(now 10.7,conf 0.55), F89@16.1Å(now 12.6,conf 0.55), E50@9.7Å(now 6.2,conf 0.55), I48@9.7Å(now 3.2,conf 0.55), E63@16.0Å(now 12.4,conf 0.55), Y91@12.0Å(now 9.0,conf 0.55)
  - K47↔H75: targets 27.1/5.5Å but partners are 13.8Å apart → too_close_together by 7.9Å
  - H75↔C66: targets 5.5/17.3Å but partners are 4.2Å apart → too_close_together by 7.6Å
  - R87↔H75: targets 21.3/5.5Å but partners are 8.6Å apart → too_close_together by 7.2Å
- **K47** — severity 129.02, 76 conflict(s); suspect input ~`Y44` (group: pull_in)
  - pull-in (wants closer): F43@12.8Å(now 15.3,conf 0.55)
  - push-out (wants farther): I56@27.5Å(now 23.9,conf 1.00), N68@27.5Å(now 23.1,conf 1.00), V67@27.5Å(now 22.3,conf 1.00), H70@27.5Å(now 22.8,conf 1.00), E50@27.5Å(now 24.7,conf 1.00), Q69@27.5Å(now 22.4,conf 1.00), C53@27.5Å(now 24.3,conf 0.99), Q51@27.5Å(now 23.7,conf 0.98), C57@27.4Å(now 23.5,conf 0.97), C52@27.3Å(now 23.1,conf 0.92), C72@27.1Å(now 21.3,conf 0.87), S58@26.9Å(now 21.1,conf 0.83), L71@26.8Å(now 19.4,conf 0.82), K94@26.4Å(now 23.9,conf 0.76), Q61@23.2Å(now 19.9,conf 0.75), H75@22.9Å(now 13.8,conf 0.73), Y60@22.8Å(now 19.0,conf 0.71), L59@22.8Å(now 18.8,conf 0.71), G73@24.6Å(now 17.0,conf 0.70), S74@22.4Å(now 13.6,conf 0.67), L76@21.8Å(now 15.5,conf 0.62), L62@20.5Å(now 17.2,conf 0.59), Q22@19.4Å(now 16.5,conf 0.57), A79@19.4Å(now 12.6,conf 0.57), E78@18.6Å(now 10.0,conf 0.55), E63@18.6Å(now 15.6,conf 0.55), V77@18.5Å(now 12.2,conf 0.55), L80@16.7Å(now 11.2,conf 0.55), V83@16.5Å(now 11.6,conf 0.55), C84@13.1Å(now 8.3,conf 0.55), G85@10.8Å(now 6.6,conf 0.55), L82@16.1Å(now 9.4,conf 0.55), Y81@14.2Å(now 8.0,conf 0.55)
  - H75↔G88: targets 22.9/8.9Å but partners are 7.1Å apart → too_close_together by 7.0Å
  - S74↔G88: targets 22.4/8.9Å but partners are 7.1Å apart → too_close_together by 6.4Å
  - H75↔F89: targets 22.9/12.3Å but partners are 4.4Å apart → too_close_together by 6.2Å
- **H70** — severity 125.72, 70 conflict(s); suspect input ~`H75` (group: pull_in)
  - pull-in (wants closer): S8@27.5Å(now 32.8,conf 1.00), T7@27.5Å(now 31.1,conf 1.00), I9@27.5Å(now 32.3,conf 1.00), V20@27.5Å(now 33.2,conf 1.00), N21@27.5Å(now 32.0,conf 1.00), Q4@27.5Å(now 30.2,conf 1.00), C10@27.5Å(now 31.5,conf 1.00), S11@27.5Å(now 31.7,conf 1.00), Y13@27.5Å(now 31.6,conf 1.00), Q14@27.5Å(now 30.6,conf 1.00), I56@4.9Å(now 9.2,conf 0.58), S55@6.7Å(now 9.9,conf 0.55), T54@7.2Å(now 10.0,conf 0.55)
  - push-out (wants farther): K47@27.5Å(now 22.8,conf 1.00), P46@26.8Å(now 21.0,conf 0.81), E86@23.3Å(now 20.4,conf 0.76), R87@22.9Å(now 18.3,conf 0.72), T45@24.5Å(now 19.0,conf 0.71), F43@21.7Å(now 16.3,conf 0.62), Y44@21.6Å(now 16.4,conf 0.61), G88@21.3Å(now 17.6,conf 0.60), F42@20.5Å(now 17.4,conf 0.59), F89@18.9Å(now 15.1,conf 0.56), F90@18.7Å(now 15.6,conf 0.56), C66@18.6Å(now 12.2,conf 0.55), N64@16.5Å(now 7.0,conf 0.55), I48@11.3Å(now 4.2,conf 0.55), Y65@16.3Å(now 7.9,conf 0.55), E63@15.5Å(now 9.2,conf 0.55), Q61@12.3Å(now 7.0,conf 0.55), L62@11.9Å(now 6.4,conf 0.55), Y60@13.9Å(now 10.3,conf 0.55)
  - T45↔H75: targets 24.5/9.2Å but partners are 9.3Å apart → too_close_together by 6.0Å
  - P46↔E78: targets 26.8/12.8Å but partners are 8.1Å apart → too_close_together by 5.9Å
  - P46↔H75: targets 26.8/9.2Å but partners are 11.8Å apart → too_close_together by 5.8Å
- **T45** — severity 111.02, 68 conflict(s); suspect input ~`F89` (group: pull_in)
  - pull-in (wants closer): V2@7.1Å(now 10.5,conf 0.55), S8@17.0Å(now 19.5,conf 0.55), T7@15.5Å(now 18.8,conf 0.55), E3@9.9Å(now 13.5,conf 0.55), Q4@12.0Å(now 14.8,conf 0.55)
  - push-out (wants farther): S55@27.2Å(now 22.1,conf 0.90), V67@27.2Å(now 22.9,conf 0.89), T54@26.8Å(now 22.1,conf 0.81), N68@26.6Å(now 22.1,conf 0.79), E50@23.1Å(now 19.5,conf 0.74), C53@22.9Å(now 19.2,conf 0.72), I56@26.0Å(now 21.6,conf 0.72), H70@24.5Å(now 19.0,conf 0.71), Q69@25.0Å(now 20.1,conf 0.69), Q51@22.5Å(now 19.9,conf 0.68), L71@21.3Å(now 15.1,conf 0.60), C72@21.1Å(now 15.1,conf 0.60), V49@20.2Å(now 16.9,conf 0.58), G73@19.4Å(now 10.2,conf 0.57), K94@19.3Å(now 15.5,conf 0.56), H75@18.7Å(now 9.3,conf 0.55), E39@18.0Å(now 15.4,conf 0.55), S74@17.5Å(now 7.8,conf 0.55), P93@17.4Å(now 13.3,conf 0.55), L76@16.9Å(now 10.8,conf 0.55), Y81@10.8Å(now 7.4,conf 0.55), Y91@11.3Å(now 7.5,conf 0.55), E78@14.6Å(now 8.0,conf 0.55), V77@13.4Å(now 7.1,conf 0.55), A79@15.6Å(now 11.2,conf 0.55), L80@12.4Å(now 8.6,conf 0.55), L82@13.9Å(now 11.2,conf 0.55), T92@14.1Å(now 10.9,conf 0.55)
  - H75↔F89: targets 18.7/6.9Å but partners are 4.4Å apart → too_close_together by 7.3Å
  - S74↔F89: targets 17.5/6.9Å but partners are 4.0Å apart → too_close_together by 6.7Å
  - G88↔H75: targets 5.1/18.7Å but partners are 7.1Å apart → too_close_together by 6.5Å

## Secondary Structure (DSSP-like)

- helix(H)=46 · strand(E)=26 · 3-10(G)=17 · coil(C)=5

```
CGGHHEHECEEGHHGHHEHHEEHHHEHHHHHHHHGHCEHEGGEGCEHEEGHHHHEHHGEHHHHHGHHEEEGHEHHHGHHGHHHCEHEGEGEEGE
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=21 · sheet=31
  - Y13 ↔ N17  (helix)
  - E16 ↔ V20  (helix)
  - C19 ↔ H23  (helix)
  - V20 ↔ L24  (helix)
  - H23 ↔ S27  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - K47 ↔ Q51  (helix)
  - C53 ↔ C57  (helix)
  - C57 ↔ Q61  (helix)
  - Y60 ↔ N64  (helix)
  - E63 ↔ V67  (helix)
  - C72 ↔ L76  (helix)
  - S74 ↔ E78  (helix)
  - H75 ↔ A79  (helix)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=35 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=456 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=236 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6393 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
