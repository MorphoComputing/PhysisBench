# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\4INS\seeds\seed_0\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 4.926 A
- tm_score_ca_ordered: 0.49875044591792
- heavy_atom_rmsd: 5.987 A
- sidechain_heavy_atom_rmsd: 6.759 A
- **all-atom quality (honest):** heavy 5.987 A, sidechain 6.759 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 20
- distogram_pairs: 4186
- bin_accuracy: 0.306

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.926116548815657
- ga_delta_rmsd: 0.40410127660884143  ga_fitness_mode: energy
- pre_local_rmsd: 4.926099851912889  localized_anchor_rmsd: 4.926099851912889

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L62-Y91 → 3617 conflicts (74%); G41-V49 → 524 conflicts (11%); E31-Y34 → 278 conflicts (6%)
- explained: 4419/4890 conflicts by 3 root cause(s)
- metrics: hubs=94 (frac 1.0), conflicts/hub=52.0, max_incompat=11.56Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L62-Y91 + G41-V49 + E31-Y34 — explain ~4419/4890 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S74** — severity 100.64, 112 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): E31@7.0Å(now 14.4,conf 0.27), C53@5.6Å(now 13.1,conf 0.38), H28@7.2Å(now 16.6,conf 0.26), V30@8.2Å(now 11.9,conf 0.21), G38@7.8Å(now 16.0,conf 0.23), L82@7.3Å(now 10.0,conf 0.26), A32@9.6Å(now 16.1,conf 0.17), L35@8.6Å(now 15.9,conf 0.20), L33@8.1Å(now 12.8,conf 0.22)
  - push-out (wants farther): K47@22.7Å(now 8.7,conf 0.34), Q4@23.3Å(now 18.4,conf 0.38), E3@19.3Å(now 16.5,conf 0.21), C10@23.8Å(now 20.7,conf 0.42), I1@24.5Å(now 15.4,conf 0.47), N17@20.1Å(now 16.0,conf 0.23), R87@19.2Å(now 8.3,conf 0.21), V77@6.2Å(now 3.0,conf 0.33), P46@16.7Å(now 8.4,conf 0.16), E86@21.9Å(now 10.0,conf 0.30), T45@17.5Å(now 4.9,conf 0.17), Q61@21.8Å(now 10.8,conf 0.29), N68@18.7Å(now 13.8,conf 0.20), E63@19.5Å(now 10.5,conf 0.21), Y91@10.1Å(now 5.3,conf 0.16), C84@21.6Å(now 7.4,conf 0.29), Y18@18.1Å(now 14.0,conf 0.18), E39@18.9Å(now 15.4,conf 0.20), S55@21.6Å(now 17.4,conf 0.28), K94@20.1Å(now 13.0,conf 0.23), L80@9.7Å(now 5.1,conf 0.17)
  - E78↔C84: targets 5.9/21.6Å but partners are 5.4Å apart → too_close_together by 10.3Å
  - C53↔S55: targets 5.6/21.6Å but partners are 6.5Å apart → too_close_together by 9.4Å
  - C84↔L82: targets 21.6/7.3Å but partners are 3.8Å apart → too_close_together by 10.5Å
- **C53** — severity 92.72, 99 conflict(s); suspect input ~`S74` (group: pull_in)
  - pull-in (wants closer): S8@26.2Å(now 29.5,conf 0.67), C10@24.6Å(now 27.4,conf 0.49), G85@17.8Å(now 20.7,conf 0.17), L71@5.6Å(now 8.4,conf 0.38), Y60@9.0Å(now 12.9,conf 0.18), S74@5.6Å(now 13.1,conf 0.38), V77@9.9Å(now 12.6,conf 0.16)
  - push-out (wants farther): K47@25.5Å(now 21.4,conf 0.58), E16@24.0Å(now 21.4,conf 0.43), P46@24.2Å(now 19.4,conf 0.45), G26@24.0Å(now 19.1,conf 0.43), Y44@19.5Å(now 14.7,conf 0.21), F43@21.6Å(now 12.5,conf 0.29), L33@23.2Å(now 15.7,conf 0.37), E50@6.9Å(now 3.6,conf 0.28), C37@19.7Å(now 15.5,conf 0.22), C84@20.9Å(now 17.8,conf 0.26), R40@17.9Å(now 12.9,conf 0.18), G41@18.6Å(now 10.4,conf 0.19), E63@19.0Å(now 14.3,conf 0.20), I48@9.9Å(now 6.3,conf 0.16), A79@18.6Å(now 13.9,conf 0.19)
  - K47↔S74: targets 25.5/5.6Å but partners are 8.7Å apart → too_close_together by 11.2Å
  - P46↔S74: targets 24.2/5.6Å but partners are 8.4Å apart → too_close_together by 10.2Å
  - R87↔S74: targets 22.8/5.6Å but partners are 8.3Å apart → too_close_together by 8.8Å
- **H28** — severity 83.43, 103 conflict(s); suspect input ~`L76` (group: pull_in)
  - pull-in (wants closer): V67@17.8Å(now 21.1,conf 0.17), R87@17.2Å(now 20.9,conf 0.16), E78@7.4Å(now 12.4,conf 0.25), V77@9.4Å(now 13.9,conf 0.17), S74@7.2Å(now 16.6,conf 0.26), Q4@8.6Å(now 12.3,conf 0.20), C10@9.6Å(now 12.2,conf 0.17), L76@7.4Å(now 14.2,conf 0.25), L82@9.4Å(now 15.7,conf 0.17), C5@8.0Å(now 12.0,conf 0.22)
  - push-out (wants farther): I56@20.1Å(now 17.5,conf 0.23), T54@21.1Å(now 18.5,conf 0.27), S55@24.6Å(now 16.9,conf 0.49), C57@23.1Å(now 18.9,conf 0.37), Q61@23.8Å(now 17.4,conf 0.42), C52@21.9Å(now 17.9,conf 0.30), L59@20.7Å(now 17.2,conf 0.25), E63@20.0Å(now 17.4,conf 0.23), E31@7.7Å(now 4.5,conf 0.24), Y65@22.0Å(now 19.4,conf 0.30), L24@7.0Å(now 3.9,conf 0.27), L80@16.9Å(now 13.9,conf 0.16), A79@16.8Å(now 14.0,conf 0.16), T45@18.2Å(now 15.1,conf 0.18)
  - Q61↔L76: targets 23.8/7.4Å but partners are 5.0Å apart → too_close_together by 11.5Å
  - Y65↔S74: targets 22.0/7.2Å but partners are 5.5Å apart → too_close_together by 9.3Å
  - S74↔F90: targets 7.2/20.6Å but partners are 4.9Å apart → too_close_together by 8.4Å
- **A32** — severity 79.27, 111 conflict(s); suspect input ~`H75` (group: pull_in)
  - pull-in (wants closer): N64@17.2Å(now 20.5,conf 0.16), E78@8.2Å(now 14.3,conf 0.21), V2@7.1Å(now 12.1,conf 0.26), H75@8.1Å(now 16.7,conf 0.22), V20@6.5Å(now 9.3,conf 0.30), L76@9.7Å(now 14.8,conf 0.16), S74@9.6Å(now 16.1,conf 0.17), T92@10.1Å(now 15.8,conf 0.16)
  - push-out (wants farther): I56@22.3Å(now 18.4,conf 0.32), Y60@23.9Å(now 19.6,conf 0.42), T54@22.2Å(now 16.9,conf 0.32), S55@26.2Å(now 17.2,conf 0.68), E50@22.4Å(now 18.4,conf 0.33), E63@24.7Å(now 20.3,conf 0.49), L35@7.6Å(now 3.5,conf 0.24), E39@16.9Å(now 12.1,conf 0.16), S11@17.7Å(now 9.6,conf 0.17), T45@16.7Å(now 13.1,conf 0.16)
  - H75↔V20: targets 8.1/6.5Å but partners are 23.4Å apart → too_far_apart by 8.8Å
  - E63↔E78: targets 24.7/8.2Å but partners are 7.6Å apart → too_close_together by 8.9Å
  - E63↔H75: targets 24.7/8.1Å but partners are 8.4Å apart → too_close_together by 8.3Å
- **K47** — severity 76.80, 84 conflict(s); suspect input ~`Y44` (group: pull_in)
  - pull-in (wants closer): E3@9.5Å(now 12.3,conf 0.17), V2@7.5Å(now 12.6,conf 0.25)
  - push-out (wants farther): T54@26.9Å(now 24.0,conf 0.80), I56@26.5Å(now 23.7,conf 0.72), N68@26.2Å(now 21.0,conf 0.68), V67@26.4Å(now 20.8,conf 0.70), H70@24.6Å(now 20.5,conf 0.48), E50@26.6Å(now 21.5,conf 0.75), C53@25.5Å(now 21.4,conf 0.58), Q51@25.1Å(now 22.2,conf 0.54), C52@25.9Å(now 21.6,conf 0.63), C72@21.4Å(now 16.1,conf 0.28), L71@24.0Å(now 16.0,conf 0.43), P93@22.4Å(now 15.4,conf 0.32), K94@24.4Å(now 17.7,conf 0.46), Q61@21.6Å(now 19.0,conf 0.29), E39@25.4Å(now 20.8,conf 0.56), H75@22.5Å(now 9.9,conf 0.33), Y60@24.8Å(now 21.5,conf 0.50), G73@19.4Å(now 11.4,conf 0.21), S74@22.7Å(now 8.7,conf 0.34), L76@19.7Å(now 14.7,conf 0.22), V36@23.0Å(now 17.9,conf 0.36), T92@19.1Å(now 13.7,conf 0.20), C37@23.0Å(now 18.0,conf 0.36), L62@20.4Å(now 16.9,conf 0.24), G41@19.8Å(now 17.3,conf 0.22), A79@20.0Å(now 13.8,conf 0.23), E78@20.9Å(now 10.6,conf 0.26), Y91@19.1Å(now 8.9,conf 0.20), C19@17.6Å(now 14.5,conf 0.17), Y65@18.7Å(now 12.9,conf 0.19), G88@7.0Å(now 4.1,conf 0.27), F90@16.7Å(now 6.9,conf 0.16), N17@19.8Å(now 12.5,conf 0.22), L82@16.9Å(now 12.5,conf 0.16), L15@17.9Å(now 13.8,conf 0.18), L29@17.9Å(now 15.3,conf 0.18)
  - S74↔G88: targets 22.7/7.0Å but partners are 5.8Å apart → too_close_together by 9.9Å
  - S74↔Y44: targets 22.7/6.8Å but partners are 6.7Å apart → too_close_together by 9.1Å
  - S74↔F89: targets 22.7/7.9Å but partners are 3.8Å apart → too_close_together by 11.0Å
- **S27** — severity 73.23, 104 conflict(s); suspect input ~`Q22` (group: pull_in)
  - pull-in (wants closer): E78@5.6Å(now 9.3,conf 0.38), Y81@5.6Å(now 9.9,conf 0.38), G85@8.0Å(now 15.2,conf 0.22), F89@8.2Å(now 16.8,conf 0.21), L82@9.0Å(now 12.5,conf 0.18)
  - push-out (wants farther): S55@24.3Å(now 15.7,conf 0.45), E50@24.2Å(now 19.0,conf 0.44), I56@22.1Å(now 15.6,conf 0.31), Q51@24.3Å(now 17.2,conf 0.46), V67@21.5Å(now 17.9,conf 0.28), N68@21.3Å(now 18.6,conf 0.28), S58@19.9Å(now 15.1,conf 0.23), Q61@23.8Å(now 14.7,conf 0.42), V30@6.8Å(now 3.6,conf 0.28), Y60@18.0Å(now 13.2,conf 0.18), Q69@19.3Å(now 16.5,conf 0.21), C52@21.2Å(now 15.9,conf 0.27), N64@20.6Å(now 15.2,conf 0.25), V20@19.8Å(now 15.9,conf 0.22), I48@20.2Å(now 16.7,conf 0.24), Y13@22.9Å(now 15.8,conf 0.35), E39@20.3Å(now 16.9,conf 0.24), Q14@18.8Å(now 15.8,conf 0.20), N21@20.1Å(now 13.4,conf 0.23), L59@18.5Å(now 14.2,conf 0.19), E63@16.6Å(now 14.1,conf 0.15), Q4@16.4Å(now 12.3,conf 0.15), C72@20.2Å(now 16.8,conf 0.24), S8@17.8Å(now 13.8,conf 0.18), L76@17.1Å(now 11.5,conf 0.16), G38@17.8Å(now 13.9,conf 0.17), C5@17.3Å(now 12.4,conf 0.17)
  - Q61↔E78: targets 23.8/5.6Å but partners are 10.4Å apart → too_close_together by 7.8Å
  - Q61↔Y81: targets 23.8/5.6Å but partners are 10.6Å apart → too_close_together by 7.6Å
  - N64↔Y81: targets 20.6/5.6Å but partners are 7.6Å apart → too_close_together by 7.4Å

## Secondary Structure (DSSP-like)

- helix(H)=54 · strand(E)=26 · 3-10(G)=12 · coil(C)=2

```
CHHGHHHHHEEHEHHHHEHHEEHHHEGHHHEHHHHHHGHEGEGHHHHHEHEHHHGGECHHHEHEGHHHEHHHGEHHGGHHEHHHEHEEEGEEEE
```

## Backbone H-bond Network

- total=68 · helix(i→i+4)=22 · sheet=46
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - S8 ↔ L12  (helix)
  - L12 ↔ E16  (helix)
  - L15 ↔ C19  (helix)
  - C19 ↔ H23  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - L35 ↔ E39  (helix)
  - P46 ↔ E50  (helix)
  - E50 ↔ T54  (helix)
  - L59 ↔ E63  (helix)
  - E63 ↔ V67  (helix)
  - C66 ↔ H70  (helix)
  - V67 ↔ L71  (helix)
  - C72 ↔ L76  (helix)
  - L76 ↔ L80  (helix)
  - … +48 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=46 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=489 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=259 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6061 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=20 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
