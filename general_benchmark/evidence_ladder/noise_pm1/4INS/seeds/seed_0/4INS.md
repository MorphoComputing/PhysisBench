# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\4INS\seeds\seed_0\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 4.352 A
- tm_score_ca_ordered: 0.5793979144372868
- heavy_atom_rmsd: 5.438 A
- sidechain_heavy_atom_rmsd: 6.173 A
- **all-atom quality (honest):** heavy 5.438 A, sidechain 6.173 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 4186
- bin_accuracy: 0.459

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.352360651353211
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 4.352390280593941  localized_anchor_rmsd: 4.352390280593941

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L71-L80 → 1484 conflicts (48%); F43-K47 → 419 conflicts (14%)
- explained: 1903/3064 conflicts by 2 root cause(s)
- metrics: hubs=93 (frac 0.989), conflicts/hub=32.9, max_incompat=8.63Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L71-L80 + F43-K47 — explain ~1903/3064 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L71** — severity 109.98, 85 conflict(s); suspect input ~`V77` (group: pull_in)
  - pull-in (wants closer): C53@4.6Å(now 8.1,conf 0.53), H28@15.9Å(now 19.0,conf 0.34), S55@8.4Å(now 12.0,conf 0.35), L35@15.5Å(now 18.6,conf 0.34), T54@8.2Å(now 11.2,conf 0.35)
  - push-out (wants farther): K47@25.9Å(now 18.8,conf 0.66), P46@21.5Å(now 16.5,conf 0.45), T45@20.4Å(now 14.1,conf 0.42), E86@21.1Å(now 16.0,conf 0.44), R87@20.6Å(now 13.9,conf 0.42), F43@18.9Å(now 12.8,conf 0.38), G88@17.8Å(now 13.2,conf 0.36), Y44@18.3Å(now 13.0,conf 0.37), G85@17.1Å(now 13.8,conf 0.35), N64@16.5Å(now 4.9,conf 0.35), Y91@13.8Å(now 10.3,conf 0.34), Y60@14.3Å(now 10.5,conf 0.34), T92@15.0Å(now 11.5,conf 0.34), F90@15.1Å(now 11.2,conf 0.34), I48@9.4Å(now 3.8,conf 0.34), C66@16.2Å(now 8.4,conf 0.35), F89@15.1Å(now 11.3,conf 0.34), L62@9.8Å(now 4.7,conf 0.34), E63@14.8Å(now 7.2,conf 0.34), Q61@12.2Å(now 6.9,conf 0.34), Y65@13.1Å(now 4.7,conf 0.34)
  - K47↔V77: targets 25.9/6.5Å but partners are 11.9Å apart → too_close_together by 7.5Å
  - K47↔H75: targets 25.9/5.8Å but partners are 13.3Å apart → too_close_together by 6.8Å
  - T45↔V77: targets 20.4/6.5Å but partners are 6.5Å apart → too_close_together by 7.3Å
- **K47** — severity 100.44, 88 conflict(s); suspect input ~`Y44` (group: pull_in)
  - pull-in (wants closer): E3@8.0Å(now 10.9,conf 0.35), T7@12.1Å(now 16.3,conf 0.34), V2@7.2Å(now 9.7,conf 0.37)
  - push-out (wants farther): N68@27.4Å(now 23.6,conf 0.94), V67@27.4Å(now 22.8,conf 0.94), H70@27.1Å(now 23.3,conf 0.87), Q69@26.4Å(now 23.2,conf 0.73), C53@27.1Å(now 24.4,conf 0.87), C52@26.9Å(now 23.4,conf 0.82), C72@24.9Å(now 19.8,conf 0.57), S58@25.8Å(now 23.0,conf 0.65), L71@25.9Å(now 18.8,conf 0.66), P93@23.4Å(now 20.3,conf 0.51), K94@25.9Å(now 22.6,conf 0.66), H75@23.0Å(now 13.3,conf 0.49), Y60@24.2Å(now 20.9,conf 0.54), G73@22.8Å(now 15.9,conf 0.49), S74@22.7Å(now 12.2,conf 0.48), L76@21.1Å(now 15.9,conf 0.44), V36@21.9Å(now 19.2,conf 0.46), L62@20.6Å(now 17.7,conf 0.42), A79@19.8Å(now 13.8,conf 0.40), E78@19.6Å(now 10.6,conf 0.39), V77@17.4Å(now 11.9,conf 0.36), Y91@18.4Å(now 13.7,conf 0.37), Y65@18.0Å(now 15.0,conf 0.36), L80@14.9Å(now 11.2,conf 0.34), C84@13.7Å(now 10.0,conf 0.34), F90@15.6Å(now 11.6,conf 0.34), G85@9.8Å(now 6.8,conf 0.34), N17@17.8Å(now 14.3,conf 0.36), L82@16.5Å(now 10.8,conf 0.35), Y81@14.8Å(now 9.5,conf 0.34)
  - S74↔G88: targets 22.7/7.7Å but partners are 6.5Å apart → too_close_together by 8.5Å
  - S74↔F89: targets 22.7/10.5Å but partners are 4.0Å apart → too_close_together by 8.2Å
  - H75↔G88: targets 23.0/7.7Å but partners are 7.8Å apart → too_close_together by 7.5Å
- **R87** — severity 97.01, 86 conflict(s); suspect input ~`C66` (group: pull_in)
  - pull-in (wants closer): S8@18.6Å(now 22.5,conf 0.37), R40@19.1Å(now 22.2,conf 0.38), C37@18.0Å(now 21.1,conf 0.36), T7@18.6Å(now 21.5,conf 0.37), A32@17.6Å(now 20.4,conf 0.36), G41@15.4Å(now 19.3,conf 0.34), C6@16.3Å(now 19.5,conf 0.35), H28@17.1Å(now 19.7,conf 0.35), G26@11.7Å(now 16.6,conf 0.34), V2@10.6Å(now 15.1,conf 0.34), Y18@14.9Å(now 17.5,conf 0.34), S27@13.8Å(now 16.6,conf 0.34), E3@13.5Å(now 16.7,conf 0.34)
  - push-out (wants farther): H70@23.9Å(now 18.6,conf 0.52), Q69@22.0Å(now 18.4,conf 0.46), V67@22.5Å(now 17.6,conf 0.48), C72@21.3Å(now 16.5,conf 0.45), G73@21.0Å(now 12.5,conf 0.43), L71@20.6Å(now 13.9,conf 0.42), S74@19.3Å(now 8.6,conf 0.39), H75@19.2Å(now 9.4,conf 0.38), L76@16.8Å(now 12.3,conf 0.35), Y91@14.9Å(now 12.0,conf 0.34), L82@10.9Å(now 6.4,conf 0.34), L80@11.0Å(now 7.5,conf 0.34), A79@14.1Å(now 9.9,conf 0.34), E78@15.4Å(now 8.4,conf 0.34), V77@13.8Å(now 9.3,conf 0.34)
  - S74↔C66: targets 19.3/6.6Å but partners are 4.9Å apart → too_close_together by 7.8Å
  - H75↔C66: targets 19.2/6.6Å but partners are 4.9Å apart → too_close_together by 7.7Å
  - G73↔F90: targets 21.0/9.0Å but partners are 5.1Å apart → too_close_together by 6.9Å
- **S74** — severity 92.00, 84 conflict(s); suspect input ~`L82` (group: pull_in)
  - pull-in (wants closer): T7@20.9Å(now 23.4,conf 0.43), V20@21.7Å(now 25.5,conf 0.46), N21@21.6Å(now 24.5,conf 0.45), Y13@18.8Å(now 21.8,conf 0.38), S11@18.5Å(now 22.7,conf 0.37), H23@17.5Å(now 21.8,conf 0.36), Q22@17.7Å(now 22.0,conf 0.36), E31@6.3Å(now 14.3,conf 0.40), Y34@8.5Å(now 13.6,conf 0.35), L12@17.6Å(now 20.6,conf 0.36), C53@8.0Å(now 13.4,conf 0.35), H28@8.9Å(now 16.9,conf 0.34), V30@8.2Å(now 11.8,conf 0.35), G38@8.5Å(now 15.4,conf 0.35), L29@11.7Å(now 14.8,conf 0.34), A32@9.4Å(now 16.1,conf 0.34), C37@12.1Å(now 15.0,conf 0.34), L35@8.2Å(now 16.2,conf 0.35), V36@11.2Å(now 16.1,conf 0.34), S27@10.7Å(now 14.1,conf 0.34), L24@15.4Å(now 18.4,conf 0.34), L33@8.9Å(now 13.1,conf 0.34)
  - push-out (wants farther): K47@22.7Å(now 12.2,conf 0.48), I1@21.7Å(now 17.3,conf 0.46), R87@19.3Å(now 8.6,conf 0.39), P46@18.1Å(now 10.5,conf 0.36), E86@20.1Å(now 10.6,conf 0.41), Y60@17.8Å(now 14.7,conf 0.36), N64@17.2Å(now 8.5,conf 0.35), T45@17.6Å(now 6.9,conf 0.36), Q61@19.2Å(now 12.3,conf 0.39), N68@18.0Å(now 15.4,conf 0.36), E63@18.0Å(now 9.8,conf 0.36), C66@15.6Å(now 4.9,conf 0.34), T92@14.0Å(now 8.3,conf 0.34), Y91@10.5Å(now 4.7,conf 0.34), C84@17.9Å(now 7.8,conf 0.36), Y18@17.2Å(now 14.5,conf 0.35), Y81@10.9Å(now 7.0,conf 0.34), Y65@15.1Å(now 5.0,conf 0.34), F42@13.4Å(now 9.7,conf 0.34), F43@14.8Å(now 7.6,conf 0.34), V83@13.0Å(now 9.0,conf 0.34), G88@16.2Å(now 6.5,conf 0.35), G85@14.9Å(now 9.1,conf 0.34), F90@14.4Å(now 4.2,conf 0.34), K94@17.6Å(now 12.9,conf 0.36), L62@12.5Å(now 9.1,conf 0.34), F89@13.8Å(now 4.0,conf 0.34), Y44@11.9Å(now 7.0,conf 0.34), L80@9.7Å(now 4.6,conf 0.34)
  - K47↔E78: targets 22.7/5.6Å but partners are 10.6Å apart → too_close_together by 6.5Å
  - E78↔C84: targets 5.6/17.9Å but partners are 4.9Å apart → too_close_together by 7.4Å
  - K47↔V77: targets 22.7/5.3Å but partners are 11.9Å apart → too_close_together by 5.5Å
- **C53** — severity 91.51, 73 conflict(s); suspect input ~`S74` (group: pull_in)
  - pull-in (wants closer): S8@27.5Å(now 31.3,conf 0.98), I9@27.5Å(now 30.5,conf 0.98), L71@4.6Å(now 8.1,conf 0.53), S74@8.0Å(now 13.4,conf 0.35), G73@8.3Å(now 11.7,conf 0.35)
  - push-out (wants farther): K47@27.1Å(now 24.4,conf 0.87), P46@25.3Å(now 21.1,conf 0.61), G26@23.5Å(now 19.4,conf 0.51), Y44@19.8Å(now 16.0,conf 0.40), F43@20.2Å(now 14.7,conf 0.41), L33@20.6Å(now 16.8,conf 0.42), E50@5.9Å(now 2.6,conf 0.42), G41@16.6Å(now 13.0,conf 0.35), E63@16.8Å(now 13.7,conf 0.35), I48@8.3Å(now 5.7,conf 0.35), Q61@12.7Å(now 10.0,conf 0.34)
  - K47↔S74: targets 27.1/8.0Å but partners are 12.2Å apart → too_close_together by 7.0Å
  - P46↔S74: targets 25.3/8.0Å but partners are 10.5Å apart → too_close_together by 6.9Å
  - C72↔F43: targets 5.3/20.2Å but partners are 9.5Å apart → too_close_together by 5.4Å
- **C72** — severity 80.29, 55 conflict(s); suspect input ~`V77` (group: push_out)
  - push-out (wants farther): K47@24.9Å(now 19.8,conf 0.57), P46@23.1Å(now 17.1,conf 0.50), R87@21.3Å(now 16.5,conf 0.45), T45@21.5Å(now 13.5,conf 0.45), G85@19.3Å(now 16.6,conf 0.39), C19@18.3Å(now 15.6,conf 0.37), Y44@18.4Å(now 11.5,conf 0.37), F43@17.9Å(now 9.5,conf 0.36), C66@15.4Å(now 11.8,conf 0.34), V49@10.0Å(now 3.5,conf 0.34), N64@16.8Å(now 10.6,conf 0.35), Y65@16.2Å(now 8.9,conf 0.35), P93@10.3Å(now 6.2,conf 0.34), T92@11.9Å(now 7.0,conf 0.34), F90@15.1Å(now 10.2,conf 0.34), L62@12.8Å(now 9.9,conf 0.34), R40@15.2Å(now 11.9,conf 0.34), G41@13.4Å(now 9.1,conf 0.34), F42@15.8Å(now 9.7,conf 0.34), K94@15.3Å(now 9.2,conf 0.34), F89@15.8Å(now 11.9,conf 0.34), E50@9.1Å(now 6.2,conf 0.34), I48@9.6Å(now 3.0,conf 0.34), Y91@11.5Å(now 7.7,conf 0.34)
  - T45↔H75: targets 21.5/4.9Å but partners are 8.3Å apart → too_close_together by 8.3Å
  - P46↔H75: targets 23.1/4.9Å but partners are 11.3Å apart → too_close_together by 7.0Å
  - K47↔H75: targets 24.9/4.9Å but partners are 13.3Å apart → too_close_together by 6.7Å

## Secondary Structure (DSSP-like)

- helix(H)=48 · strand(E)=28 · 3-10(G)=11 · coil(C)=7

```
CGGCHEHECEEGHHHHHEHHEEHHHEHHHHGHHHHHCEHEGEEGHHHEEHEHEHCCEEHHGHHHGHHEEHHHEHHHGHHHHHHCEHEEEGEEGE
```

## Backbone H-bond Network

- total=59 · helix(i→i+4)=19 · sheet=40
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - P46 ↔ E50  (helix)
  - E50 ↔ T54  (helix)
  - L59 ↔ E63  (helix)
  - E63 ↔ V67  (helix)
  - V67 ↔ L71  (helix)
  - C72 ↔ L76  (helix)
  - S74 ↔ E78  (helix)
  - L76 ↔ L80  (helix)
  - A79 ↔ V83  (helix)
  - C6 ↔ S11  (sheet)
  - … +39 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=39 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=481 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=253 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2687 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
