# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\4INS\seeds\seed_1\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 8.744 A
- tm_score_ca_ordered: 0.2836422211330979
- heavy_atom_rmsd: 10.029 A
- sidechain_heavy_atom_rmsd: 11.035 A
- **all-atom quality (honest):** heavy 10.029 A, sidechain 11.035 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 27
- distogram_pairs: 4186
- bin_accuracy: 0.302

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.743829856664448
- ga_delta_rmsd: -0.2505081519618173  ga_fitness_mode: energy
- pre_local_rmsd: 8.755816773630526  localized_anchor_rmsd: 8.743789615343877

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L62-Y91 → 3714 conflicts (73%); E39-V49 → 671 conflicts (13%); E31-L35 → 283 conflicts (6%)
- explained: 4668/5096 conflicts by 3 root cause(s)
- metrics: hubs=94 (frac 1.0), conflicts/hub=54.2, max_incompat=12.74Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L62-Y91 + E39-V49 + E31-L35 — explain ~4668/5096 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S74** — severity 104.38, 118 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): T7@16.9Å(now 19.9,conf 0.16), E31@7.0Å(now 14.2,conf 0.27), C53@5.6Å(now 13.3,conf 0.38), H28@7.2Å(now 16.5,conf 0.26), V30@8.2Å(now 11.8,conf 0.21), G38@7.8Å(now 16.4,conf 0.23), L82@7.3Å(now 10.3,conf 0.26), A32@9.6Å(now 15.8,conf 0.17), L35@8.6Å(now 15.6,conf 0.20), L59@10.1Å(now 13.8,conf 0.16), L33@8.1Å(now 12.2,conf 0.22)
  - push-out (wants farther): S8@22.5Å(now 19.7,conf 0.33), K47@22.7Å(now 7.1,conf 0.34), Q4@23.3Å(now 19.6,conf 0.38), E3@19.3Å(now 16.8,conf 0.21), C10@23.8Å(now 19.6,conf 0.42), I1@24.5Å(now 15.6,conf 0.47), N17@20.1Å(now 15.1,conf 0.23), R87@19.2Å(now 7.8,conf 0.21), P46@16.7Å(now 7.9,conf 0.16), E86@21.9Å(now 9.5,conf 0.30), T45@17.5Å(now 4.2,conf 0.17), Q61@21.8Å(now 12.3,conf 0.29), N68@18.7Å(now 14.7,conf 0.20), E63@19.5Å(now 11.9,conf 0.21), Y91@10.1Å(now 4.9,conf 0.16), C84@21.6Å(now 7.1,conf 0.29), Y18@18.1Å(now 13.0,conf 0.18), E39@18.9Å(now 15.5,conf 0.20), S55@21.6Å(now 17.7,conf 0.28), K94@20.1Å(now 12.9,conf 0.23), L80@9.7Å(now 3.3,conf 0.17)
  - E78↔C84: targets 5.9/21.6Å but partners are 5.4Å apart → too_close_together by 10.3Å
  - C53↔S55: targets 5.6/21.6Å but partners are 5.8Å apart → too_close_together by 10.2Å
  - Q61↔C53: targets 21.8/5.6Å but partners are 7.5Å apart → too_close_together by 8.6Å
- **C53** — severity 97.82, 100 conflict(s); suspect input ~`S74` (group: pull_in)
  - pull-in (wants closer): S8@26.2Å(now 29.3,conf 0.67), C10@24.6Å(now 28.0,conf 0.49), Y60@9.0Å(now 13.3,conf 0.18), S74@5.6Å(now 13.3,conf 0.38), V77@9.9Å(now 12.5,conf 0.16)
  - push-out (wants farther): K47@25.5Å(now 20.3,conf 0.58), E16@24.0Å(now 21.3,conf 0.43), T45@17.3Å(now 13.5,conf 0.17), P46@24.2Å(now 18.6,conf 0.45), G26@24.0Å(now 19.7,conf 0.43), Y44@19.5Å(now 14.3,conf 0.21), V49@5.6Å(now 3.1,conf 0.38), F43@21.6Å(now 11.8,conf 0.29), L33@23.2Å(now 15.9,conf 0.37), E50@6.9Å(now 3.2,conf 0.28), C37@19.7Å(now 15.7,conf 0.22), C84@20.9Å(now 17.8,conf 0.26), F89@18.5Å(now 15.8,conf 0.19), R40@17.9Å(now 12.6,conf 0.18), G41@18.6Å(now 10.2,conf 0.19), E63@19.0Å(now 14.4,conf 0.20), I48@9.9Å(now 4.6,conf 0.16), A79@18.6Å(now 15.0,conf 0.19)
  - K47↔S74: targets 25.5/5.6Å but partners are 7.1Å apart → too_close_together by 12.7Å
  - P46↔S74: targets 24.2/5.6Å but partners are 7.9Å apart → too_close_together by 10.7Å
  - R87↔S74: targets 22.8/5.6Å but partners are 7.8Å apart → too_close_together by 9.4Å
- **K47** — severity 81.81, 93 conflict(s); suspect input ~`Y44` (group: pull_in)
  - pull-in (wants closer): E3@9.5Å(now 14.0,conf 0.17), V2@7.5Å(now 14.1,conf 0.25)
  - push-out (wants farther): T54@26.9Å(now 22.8,conf 0.80), I56@26.5Å(now 23.0,conf 0.72), N68@26.2Å(now 20.3,conf 0.68), V67@26.4Å(now 20.3,conf 0.70), H70@24.6Å(now 19.7,conf 0.48), E50@26.6Å(now 20.8,conf 0.75), C53@25.5Å(now 20.3,conf 0.58), Q51@25.1Å(now 21.6,conf 0.54), C52@25.9Å(now 20.9,conf 0.63), C72@21.4Å(now 15.3,conf 0.28), L71@24.0Å(now 15.5,conf 0.43), P93@22.4Å(now 14.8,conf 0.32), K94@24.4Å(now 17.2,conf 0.46), Q61@21.6Å(now 18.9,conf 0.29), E39@25.4Å(now 20.5,conf 0.56), H75@22.5Å(now 11.9,conf 0.33), Y60@24.8Å(now 21.1,conf 0.50), G73@19.4Å(now 10.1,conf 0.21), S74@22.7Å(now 7.1,conf 0.34), L76@19.7Å(now 13.8,conf 0.22), V36@23.0Å(now 17.3,conf 0.36), T92@19.1Å(now 13.2,conf 0.20), C37@23.0Å(now 18.0,conf 0.36), L62@20.4Å(now 16.8,conf 0.24), G41@19.8Å(now 17.0,conf 0.22), A79@20.0Å(now 13.4,conf 0.23), S11@20.3Å(now 17.6,conf 0.24), E78@20.9Å(now 9.6,conf 0.26), E16@17.4Å(now 14.2,conf 0.17), Y91@19.1Å(now 8.6,conf 0.20), C19@17.6Å(now 14.6,conf 0.17), Y65@18.7Å(now 12.1,conf 0.19), G88@7.0Å(now 3.1,conf 0.27), F90@16.7Å(now 6.2,conf 0.16), N17@19.8Å(now 12.4,conf 0.22), F89@7.9Å(now 5.3,conf 0.23), L82@16.9Å(now 12.0,conf 0.16), L15@17.9Å(now 13.3,conf 0.18), L29@17.9Å(now 15.2,conf 0.18)
  - S74↔G88: targets 22.7/7.0Å but partners are 5.2Å apart → too_close_together by 10.5Å
  - S74↔Y44: targets 22.7/6.8Å but partners are 6.5Å apart → too_close_together by 9.3Å
  - S74↔F89: targets 22.7/7.9Å but partners are 3.1Å apart → too_close_together by 11.6Å
- **H28** — severity 80.50, 96 conflict(s); suspect input ~`L76` (group: pull_in)
  - pull-in (wants closer): V67@17.8Å(now 20.8,conf 0.17), R87@17.2Å(now 20.3,conf 0.16), E78@7.4Å(now 12.4,conf 0.25), V77@9.4Å(now 13.3,conf 0.17), S74@7.2Å(now 16.5,conf 0.26), C10@9.6Å(now 13.4,conf 0.17), L76@7.4Å(now 14.3,conf 0.25), L82@9.4Å(now 15.4,conf 0.17)
  - push-out (wants farther): S55@24.6Å(now 19.0,conf 0.49), C57@23.1Å(now 20.0,conf 0.37), Q61@23.8Å(now 16.9,conf 0.42), C52@21.9Å(now 19.1,conf 0.30), L59@20.7Å(now 17.4,conf 0.25), E63@20.0Å(now 17.0,conf 0.23), E31@7.7Å(now 4.9,conf 0.24), Y65@22.0Å(now 18.6,conf 0.30), L24@7.0Å(now 3.4,conf 0.27), A79@16.8Å(now 14.2,conf 0.16), T45@18.2Å(now 14.1,conf 0.18)
  - Q61↔L76: targets 23.8/7.4Å but partners are 5.5Å apart → too_close_together by 11.0Å
  - S74↔F90: targets 7.2/20.6Å but partners are 4.1Å apart → too_close_together by 9.3Å
  - Y65↔S74: targets 22.0/7.2Å but partners are 6.1Å apart → too_close_together by 8.7Å
- **A32** — severity 79.95, 106 conflict(s); suspect input ~`H75` (group: pull_in)
  - pull-in (wants closer): N64@17.2Å(now 20.1,conf 0.16), E78@8.2Å(now 14.3,conf 0.21), V2@7.1Å(now 10.6,conf 0.26), H75@8.1Å(now 15.7,conf 0.22), V20@6.5Å(now 9.9,conf 0.30), L76@9.7Å(now 14.6,conf 0.16), S74@9.6Å(now 15.8,conf 0.17), T92@10.1Å(now 15.3,conf 0.16)
  - push-out (wants farther): Q61@21.0Å(now 18.0,conf 0.26), I56@22.3Å(now 18.7,conf 0.32), Y60@23.9Å(now 19.3,conf 0.42), T54@22.2Å(now 17.9,conf 0.32), S55@26.2Å(now 18.1,conf 0.68), E50@22.4Å(now 18.2,conf 0.33), E63@24.7Å(now 19.9,conf 0.49), L35@7.6Å(now 3.6,conf 0.24), E39@16.9Å(now 11.7,conf 0.16), S11@17.7Å(now 9.8,conf 0.17), T45@16.7Å(now 12.1,conf 0.16)
  - E63↔H75: targets 24.7/8.1Å but partners are 5.5Å apart → too_close_together by 11.2Å
  - H75↔V20: targets 8.1/6.5Å but partners are 23.6Å apart → too_far_apart by 9.0Å
  - E63↔E78: targets 24.7/8.2Å but partners are 8.0Å apart → too_close_together by 8.5Å
- **C72** — severity 72.22, 89 conflict(s); suspect input ~`Y81` (group: pull_in)
  - pull-in (wants closer): V20@21.7Å(now 24.9,conf 0.29), N17@17.4Å(now 20.4,conf 0.17), H23@21.7Å(now 24.6,conf 0.29), C25@19.7Å(now 22.9,conf 0.22), L15@17.3Å(now 20.1,conf 0.17), H75@5.6Å(now 10.3,conf 0.38), S58@10.3Å(now 13.9,conf 0.15), C37@8.8Å(now 14.9,conf 0.19), V77@6.5Å(now 9.1,conf 0.31), A79@9.6Å(now 13.4,conf 0.17), Y81@8.9Å(now 13.8,conf 0.19), Y34@8.2Å(now 12.2,conf 0.21), E78@9.2Å(now 12.2,conf 0.18)
  - push-out (wants farther): K47@21.4Å(now 15.3,conf 0.28), P46@23.0Å(now 15.2,conf 0.36), R87@21.1Å(now 15.7,conf 0.27), T45@21.8Å(now 9.4,conf 0.30), L76@10.4Å(now 6.7,conf 0.15), G85@20.0Å(now 16.1,conf 0.23), Y44@19.1Å(now 11.2,conf 0.20), F43@18.1Å(now 8.7,conf 0.18), N64@16.7Å(now 11.4,conf 0.16), Y65@17.9Å(now 7.9,conf 0.18), P93@9.6Å(now 6.3,conf 0.17), T92@10.0Å(now 6.8,conf 0.16), Y60@18.2Å(now 15.0,conf 0.18), K94@16.7Å(now 9.1,conf 0.16), S27@20.2Å(now 17.1,conf 0.24), E50@8.7Å(now 5.9,conf 0.20), I48@9.7Å(now 3.5,conf 0.17)
  - T45↔V77: targets 21.8/6.5Å but partners are 4.9Å apart → too_close_together by 10.5Å
  - P46↔V77: targets 23.0/6.5Å but partners are 6.6Å apart → too_close_together by 10.0Å
  - P46↔H75: targets 23.0/5.6Å but partners are 8.9Å apart → too_close_together by 8.5Å

## Secondary Structure (DSSP-like)

- helix(H)=53 · strand(E)=22 · 3-10(G)=6 · coil(C)=13

```
CHHEHHEHEHEHHHHHHEHCECEHHGHHHHHHHHHHHEHHCCCEHHHHGHEHEHCCCEHHHEHEHGHEGHHGGEHHHHHHHHHEEHCCCCEEEE
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=23 · sheet=30
  - V2 ↔ C6  (helix)
  - S8 ↔ L12  (helix)
  - L12 ↔ E16  (helix)
  - L15 ↔ C19  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - L35 ↔ E39  (helix)
  - V36 ↔ R40  (helix)
  - P46 ↔ E50  (helix)
  - E50 ↔ T54  (helix)
  - L59 ↔ E63  (helix)
  - Q61 ↔ Y65  (helix)
  - E63 ↔ V67  (helix)
  - V67 ↔ L71  (helix)
  - L71 ↔ H75  (helix)
  - H75 ↔ A79  (helix)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=50 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=493 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=265 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6074 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=27 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
