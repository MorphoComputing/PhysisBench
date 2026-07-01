# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\4INS\seeds\seed_1\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 8.290 A
- tm_score_ca_ordered: 0.3187333689315779
- heavy_atom_rmsd: 9.371 A
- sidechain_heavy_atom_rmsd: 10.170 A
- **all-atom quality (honest):** heavy 9.371 A, sidechain 10.170 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 23
- distogram_pairs: 4186
- bin_accuracy: 0.423

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.289981138911273
- ga_delta_rmsd: 0.2843027016135924  ga_fitness_mode: energy
- pre_local_rmsd: 8.290047522510633  localized_anchor_rmsd: 8.290047522510633

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F43-K47 → 1782 conflicts (45%); L71-L80 → 1026 conflicts (26%); R87-F90 → 237 conflicts (6%)
- explained: 3045/3969 conflicts by 3 root cause(s)
- metrics: hubs=94 (frac 1.0), conflicts/hub=42.2, max_incompat=10.32Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F43-K47 + L71-L80 + R87-F90 — explain ~3045/3969 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K47** — severity 153.79, 132 conflict(s); suspect input ~`Y44` (group: pull_in)
  - pull-in (wants closer): E3@8.0Å(now 10.7,conf 0.35), T7@12.1Å(now 15.8,conf 0.34), V2@7.2Å(now 9.8,conf 0.37), Y44@8.4Å(now 12.9,conf 0.35)
  - push-out (wants farther): I56@27.4Å(now 23.8,conf 0.96), N68@27.4Å(now 21.2,conf 0.94), V67@27.4Å(now 20.4,conf 0.94), H70@27.1Å(now 21.1,conf 0.87), E50@27.4Å(now 23.4,conf 0.95), Q69@26.4Å(now 20.7,conf 0.73), C53@27.1Å(now 22.7,conf 0.87), Q51@27.0Å(now 22.7,conf 0.83), C57@25.7Å(now 22.9,conf 0.65), C52@26.9Å(now 21.8,conf 0.82), C72@24.9Å(now 18.4,conf 0.57), S58@25.8Å(now 20.8,conf 0.65), L71@25.9Å(now 17.1,conf 0.66), P93@23.4Å(now 19.3,conf 0.51), K94@25.9Å(now 21.7,conf 0.66), Q61@22.9Å(now 19.3,conf 0.49), E39@25.6Å(now 22.8,conf 0.64), H75@23.0Å(now 11.3,conf 0.49), Y60@24.2Å(now 18.8,conf 0.54), L59@20.9Å(now 17.8,conf 0.43), G73@22.8Å(now 14.8,conf 0.49), S74@22.7Å(now 10.9,conf 0.48), L76@21.1Å(now 13.7,conf 0.44), V36@21.9Å(now 18.5,conf 0.46), T92@20.1Å(now 17.1,conf 0.41), L62@20.6Å(now 16.0,conf 0.42), N64@19.0Å(now 15.5,conf 0.38), Q22@19.5Å(now 16.2,conf 0.39), A79@19.8Å(now 10.9,conf 0.40), E78@19.6Å(now 7.9,conf 0.39), E63@18.7Å(now 14.6,conf 0.37), V77@17.4Å(now 10.0,conf 0.36), Y91@18.4Å(now 12.6,conf 0.37), Y65@18.0Å(now 12.6,conf 0.36), L80@14.9Å(now 9.6,conf 0.34), E86@7.2Å(now 3.6,conf 0.37), V83@15.2Å(now 10.2,conf 0.34), C84@13.7Å(now 7.3,conf 0.34), G88@7.7Å(now 4.9,conf 0.36), F90@15.6Å(now 11.0,conf 0.34), G85@9.8Å(now 4.5,conf 0.34), N17@17.8Å(now 14.9,conf 0.36), R87@9.2Å(now 5.4,conf 0.34), F89@10.5Å(now 7.5,conf 0.34), L82@16.5Å(now 7.9,conf 0.35), Y81@14.8Å(now 6.6,conf 0.34), C66@12.9Å(now 10.1,conf 0.34)
  - S74↔G88: targets 22.7/7.7Å but partners are 6.7Å apart → too_close_together by 8.3Å
  - H75↔G88: targets 23.0/7.7Å but partners are 7.1Å apart → too_close_together by 8.3Å
  - S74↔F89: targets 22.7/10.5Å but partners are 3.7Å apart → too_close_together by 8.5Å
- **L71** — severity 147.51, 104 conflict(s); suspect input ~`V77` (group: pull_in)
  - pull-in (wants closer): C53@4.6Å(now 7.5,conf 0.53), H28@15.9Å(now 19.2,conf 0.34), S55@8.4Å(now 12.0,conf 0.35), T54@8.2Å(now 11.4,conf 0.35)
  - push-out (wants farther): K47@25.9Å(now 17.1,conf 0.66), N17@25.9Å(now 23.1,conf 0.67), P46@21.5Å(now 15.4,conf 0.45), T45@20.4Å(now 11.9,conf 0.42), E86@21.1Å(now 16.4,conf 0.44), C19@21.6Å(now 18.9,conf 0.45), R87@20.6Å(now 14.1,conf 0.42), F43@18.9Å(now 11.4,conf 0.38), G88@17.8Å(now 13.3,conf 0.36), Y44@18.3Å(now 12.0,conf 0.37), G85@17.1Å(now 14.5,conf 0.35), F42@16.4Å(now 13.1,conf 0.35), N64@16.5Å(now 6.2,conf 0.35), Y91@13.8Å(now 9.8,conf 0.34), P93@13.8Å(now 10.5,conf 0.34), T92@15.0Å(now 10.5,conf 0.34), F90@15.1Å(now 11.2,conf 0.34), G41@16.3Å(now 13.6,conf 0.35), I48@9.4Å(now 3.1,conf 0.34), C66@16.2Å(now 8.7,conf 0.35), F89@15.1Å(now 10.8,conf 0.34), L62@9.8Å(now 6.7,conf 0.34), E63@14.8Å(now 8.9,conf 0.34), Q61@12.2Å(now 9.0,conf 0.34), Y65@13.1Å(now 4.9,conf 0.34)
  - K47↔H75: targets 25.9/5.8Å but partners are 11.3Å apart → too_close_together by 8.8Å
  - T45↔V77: targets 20.4/6.5Å but partners are 4.4Å apart → too_close_together by 9.4Å
  - K47↔V77: targets 25.9/6.5Å but partners are 10.0Å apart → too_close_together by 9.4Å
- **C53** — severity 128.43, 93 conflict(s); suspect input ~`S74` (group: pull_in)
  - pull-in (wants closer): S8@27.5Å(now 31.3,conf 0.98), I9@27.5Å(now 30.7,conf 0.98), C10@27.2Å(now 29.8,conf 0.89), L71@4.6Å(now 7.5,conf 0.53), S74@8.0Å(now 13.5,conf 0.35), H75@10.1Å(now 12.8,conf 0.34), G73@8.3Å(now 11.6,conf 0.35)
  - push-out (wants farther): K47@27.1Å(now 22.7,conf 0.87), T45@21.0Å(now 15.8,conf 0.43), P46@25.3Å(now 20.0,conf 0.61), G26@23.5Å(now 19.5,conf 0.51), Y44@19.8Å(now 13.4,conf 0.40), F43@20.2Å(now 12.7,conf 0.41), L33@20.6Å(now 16.7,conf 0.42), E50@5.9Å(now 1.9,conf 0.42), F42@16.4Å(now 13.1,conf 0.35), R40@17.4Å(now 14.4,conf 0.36), G41@16.6Å(now 12.1,conf 0.35), E63@16.8Å(now 14.0,conf 0.35), I48@8.3Å(now 4.5,conf 0.35)
  - K47↔S74: targets 27.1/8.0Å but partners are 10.9Å apart → too_close_together by 8.3Å
  - K47↔L71: targets 27.1/4.6Å but partners are 17.1Å apart → too_close_together by 5.4Å
  - P46↔L71: targets 25.3/4.6Å but partners are 15.4Å apart → too_close_together by 5.2Å
- **R87** — severity 113.79, 94 conflict(s); suspect input ~`C66` (group: pull_in)
  - pull-in (wants closer): S8@18.6Å(now 21.8,conf 0.37), R40@19.1Å(now 22.5,conf 0.38), C37@18.0Å(now 20.9,conf 0.36), G41@15.4Å(now 19.8,conf 0.34), C6@16.3Å(now 19.0,conf 0.35), Y44@9.5Å(now 14.2,conf 0.34), G26@11.7Å(now 16.0,conf 0.34), F43@11.8Å(now 14.9,conf 0.34), F42@14.6Å(now 17.1,conf 0.34), V2@10.6Å(now 14.8,conf 0.34), S27@13.8Å(now 16.6,conf 0.34)
  - push-out (wants farther): Q22@24.3Å(now 20.9,conf 0.54), H70@23.9Å(now 18.2,conf 0.52), Q69@22.0Å(now 17.9,conf 0.46), N68@20.6Å(now 18.0,conf 0.42), V67@22.5Å(now 17.3,conf 0.48), C72@21.3Å(now 16.1,conf 0.45), G73@21.0Å(now 12.6,conf 0.43), L71@20.6Å(now 14.1,conf 0.42), S74@19.3Å(now 8.8,conf 0.39), H75@19.2Å(now 8.6,conf 0.38), L76@16.8Å(now 11.7,conf 0.35), K47@9.2Å(now 5.4,conf 0.34), Y91@14.9Å(now 11.7,conf 0.34), L82@10.9Å(now 5.6,conf 0.34), L80@11.0Å(now 7.3,conf 0.34), A79@14.1Å(now 9.0,conf 0.34), E78@15.4Å(now 7.0,conf 0.34), V77@13.8Å(now 8.8,conf 0.34)
  - H75↔C66: targets 19.2/6.6Å but partners are 5.6Å apart → too_close_together by 7.0Å
  - G73↔F90: targets 21.0/9.0Å but partners are 5.1Å apart → too_close_together by 7.0Å
  - S74↔F90: targets 19.3/9.0Å but partners are 3.7Å apart → too_close_together by 6.6Å
- **C72** — severity 109.62, 68 conflict(s); suspect input ~`V77` (group: pull_in)
  - pull-in (wants closer): H75@4.9Å(now 7.6,conf 0.50), H28@15.8Å(now 19.2,conf 0.34), I56@9.6Å(now 12.2,conf 0.34)
  - push-out (wants farther): K47@24.9Å(now 18.4,conf 0.57), P46@23.1Å(now 16.2,conf 0.50), R87@21.3Å(now 16.1,conf 0.45), T45@21.5Å(now 11.0,conf 0.45), Y44@18.4Å(now 10.8,conf 0.37), F43@17.9Å(now 8.7,conf 0.36), C66@15.4Å(now 12.0,conf 0.34), V49@10.0Å(now 3.9,conf 0.34), N64@16.8Å(now 11.0,conf 0.35), Y65@16.2Å(now 8.4,conf 0.35), P93@10.3Å(now 5.8,conf 0.34), T92@11.9Å(now 6.5,conf 0.34), F90@15.1Å(now 9.9,conf 0.34), R40@15.2Å(now 12.2,conf 0.34), G41@13.4Å(now 9.8,conf 0.34), F42@15.8Å(now 10.0,conf 0.34), K94@15.3Å(now 8.5,conf 0.34), F89@15.8Å(now 11.5,conf 0.34), I48@9.6Å(now 3.8,conf 0.34), Y91@11.5Å(now 7.8,conf 0.34)
  - T45↔H75: targets 21.5/4.9Å but partners are 6.7Å apart → too_close_together by 10.0Å
  - K47↔H75: targets 24.9/4.9Å but partners are 11.3Å apart → too_close_together by 8.7Å
  - P46↔H75: targets 23.1/4.9Å but partners are 10.1Å apart → too_close_together by 8.1Å
- **I1** — severity 108.61, 94 conflict(s); suspect input ~`T45` (group: pull_in)
  - pull-in (wants closer): Y44@8.6Å(now 12.9,conf 0.35), F43@10.8Å(now 15.2,conf 0.34), G41@15.8Å(now 18.6,conf 0.34), T45@7.7Å(now 12.0,conf 0.36)
  - push-out (wants farther): Y60@26.8Å(now 24.1,conf 0.80), G73@22.3Å(now 19.7,conf 0.47), A79@20.1Å(now 17.5,conf 0.41), S74@21.7Å(now 16.7,conf 0.46), L82@19.1Å(now 16.5,conf 0.38), E78@17.3Å(now 14.2,conf 0.35), N21@13.8Å(now 10.2,conf 0.34), H23@13.3Å(now 7.1,conf 0.34), V20@16.2Å(now 13.1,conf 0.35), Y13@14.1Å(now 10.2,conf 0.34), Q22@10.3Å(now 6.5,conf 0.34)
  - S74↔T45: targets 21.7/7.7Å but partners are 5.2Å apart → too_close_together by 8.9Å
  - G73↔T45: targets 22.3/7.7Å but partners are 7.7Å apart → too_close_together by 7.0Å
  - S74↔P46: targets 21.7/6.4Å but partners are 9.6Å apart → too_close_together by 5.7Å

## Secondary Structure (DSSP-like)

- helix(H)=48 · strand(E)=27 · 3-10(G)=10 · coil(C)=9

```
CHHHHEHEECEHHHGHHEHHEECCCEGHHHGHHHHHEEHHHHHEGGHHEGHHEHEEEEHHHHHHHHHEEGHGEHEHHGHHHEHEEHGECCECCE
```

## Backbone H-bond Network

- total=62 · helix(i→i+4)=18 · sheet=44
  - E3 ↔ T7  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - E16 ↔ V20  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - V36 ↔ R40  (helix)
  - E39 ↔ F43  (helix)
  - F43 ↔ K47  (helix)
  - K47 ↔ Q51  (helix)
  - L59 ↔ E63  (helix)
  - Q61 ↔ Y65  (helix)
  - E63 ↔ V67  (helix)
  - V67 ↔ L71  (helix)
  - L76 ↔ L80  (helix)
  - A79 ↔ V83  (helix)
  - C6 ↔ S11  (sheet)
  - C6 ↔ N21  (sheet)
  - … +42 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=507 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=271 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3854 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=23 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
