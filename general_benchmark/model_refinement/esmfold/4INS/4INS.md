# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\4INS\seeds\seed_1\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 15.086 A
- tm_score_ca_ordered: 0.10178986493178478
- heavy_atom_rmsd: 15.983 A
- sidechain_heavy_atom_rmsd: 16.812 A
- **all-atom quality (honest):** heavy 15.983 A, sidechain 16.812 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 4186
- bin_accuracy: 0.440

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 15.08641083393521
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 15.086392173751776  localized_anchor_rmsd: 15.086392173751776

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C72 → 1320 conflicts (27%); C25 → 868 conflicts (18%)
- explained: 2188/4954 conflicts by 2 root cause(s)
- metrics: hubs=94 (frac 1.0), conflicts/hub=52.7, max_incompat=15.54Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C72 + C25 — explain ~2188/4954 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C6** — severity 263.18, 109 conflict(s); suspect input ~`C72` (group: pull_in)
  - pull-in (wants closer): T54@27.4Å(now 30.1,conf 0.94), C72@5.3Å(now 19.4,conf 0.46), C57@21.4Å(now 26.3,conf 0.45), I9@7.2Å(now 13.0,conf 0.37), C10@7.3Å(now 11.9,conf 0.36), H70@8.4Å(now 10.9,conf 0.35), N17@16.3Å(now 19.6,conf 0.35), I1@8.7Å(now 11.9,conf 0.35), Y60@15.6Å(now 18.2,conf 0.34), E16@14.7Å(now 17.6,conf 0.34), S11@10.0Å(now 14.8,conf 0.34), L12@10.7Å(now 14.1,conf 0.34), Y13@13.5Å(now 17.6,conf 0.34), L15@11.2Å(now 14.5,conf 0.34), Q14@12.0Å(now 16.5,conf 0.34)
  - push-out (wants farther): C25@26.7Å(now 9.2,conf 0.78), S27@26.4Å(now 22.0,conf 0.73), Y44@25.1Å(now 20.9,conf 0.59), H28@24.1Å(now 21.0,conf 0.53), F43@23.3Å(now 16.3,conf 0.50), V30@22.8Å(now 18.2,conf 0.49), E31@21.0Å(now 16.7,conf 0.43), F42@20.3Å(now 12.7,conf 0.41), G73@6.0Å(now 3.3,conf 0.41), G41@18.9Å(now 7.8,conf 0.38), A32@18.9Å(now 15.7,conf 0.38), L33@18.6Å(now 15.4,conf 0.37), Y34@18.2Å(now 13.5,conf 0.37), K94@17.5Å(now 7.7,conf 0.36), R40@16.3Å(now 8.3,conf 0.35), E39@16.0Å(now 6.5,conf 0.34), L35@15.5Å(now 10.9,conf 0.34), S74@9.3Å(now 4.7,conf 0.34), P93@14.8Å(now 7.1,conf 0.34), G38@14.6Å(now 9.9,conf 0.34), H75@10.3Å(now 6.5,conf 0.34), T92@13.9Å(now 9.2,conf 0.34)
  - L29↔C72: targets 23.0/5.3Å but partners are 3.1Å apart → too_close_together by 14.6Å
  - L24↔C72: targets 24.1/5.3Å but partners are 4.6Å apart → too_close_together by 14.3Å
  - C53↔C72: targets 27.0/5.3Å but partners are 7.7Å apart → too_close_together by 14.0Å
- **E3** — severity 213.71, 112 conflict(s); suspect input ~`C72` (group: pull_in)
  - pull-in (wants closer): K47@27.5Å(now 32.5,conf 0.99), P46@27.5Å(now 30.7,conf 0.99), E50@27.5Å(now 30.8,conf 0.98), T54@27.4Å(now 30.7,conf 0.97), C57@22.8Å(now 26.3,conf 0.49), C72@8.3Å(now 21.7,conf 0.35)
  - push-out (wants farther): C25@27.2Å(now 15.2,conf 0.88), F43@26.6Å(now 20.6,conf 0.77), V30@25.0Å(now 22.2,conf 0.58), F42@23.7Å(now 16.9,conf 0.52), G41@22.2Å(now 13.2,conf 0.47), R40@20.1Å(now 13.3,conf 0.41), E39@19.4Å(now 12.9,conf 0.39), C37@18.2Å(now 14.1,conf 0.37), G38@17.7Å(now 15.1,conf 0.36), P93@9.9Å(now 4.7,conf 0.34), K94@12.6Å(now 8.0,conf 0.34)
  - C25↔C6: targets 27.2/5.6Å but partners are 9.2Å apart → too_close_together by 12.4Å
  - L29↔C72: targets 24.9/8.3Å but partners are 3.1Å apart → too_close_together by 13.5Å
  - L24↔C72: targets 25.4/8.3Å but partners are 4.6Å apart → too_close_together by 12.5Å
- **C53** — severity 200.95, 73 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): K94@27.5Å(now 30.3,conf 1.00), C25@5.2Å(now 21.1,conf 0.47)
  - push-out (wants farther): C72@24.8Å(now 7.7,conf 0.57), F90@24.8Å(now 22.2,conf 0.57), E78@19.9Å(now 17.3,conf 0.40), Y81@17.9Å(now 15.4,conf 0.36), C66@17.4Å(now 14.3,conf 0.36), C84@15.2Å(now 12.3,conf 0.34)
  - C72↔L24: targets 24.8/5.7Å but partners are 4.6Å apart → too_close_together by 14.6Å
  - C6↔C25: targets 27.0/5.2Å but partners are 9.2Å apart → too_close_together by 12.6Å
  - S74↔C25: targets 25.0/5.2Å but partners are 7.4Å apart → too_close_together by 12.4Å
- **V2** — severity 196.04, 117 conflict(s); suspect input ~`C72` (group: pull_in)
  - pull-in (wants closer): K47@27.5Å(now 30.1,conf 0.98), C57@19.8Å(now 22.9,conf 0.40), C72@8.0Å(now 18.7,conf 0.35)
  - push-out (wants farther): Y44@26.0Å(now 22.6,conf 0.67), C25@25.4Å(now 14.0,conf 0.62), F43@25.3Å(now 18.8,conf 0.60), V30@22.4Å(now 19.7,conf 0.48), F42@22.1Å(now 15.3,conf 0.47), G41@21.2Å(now 12.4,conf 0.44), R40@19.4Å(now 13.0,conf 0.39), E39@18.8Å(now 12.7,conf 0.38), T92@8.3Å(now 5.7,conf 0.35), C37@16.6Å(now 12.1,conf 0.35), P93@9.8Å(now 5.5,conf 0.34), K94@12.8Å(now 8.9,conf 0.34)
  - C25↔C6: targets 25.4/6.5Å but partners are 9.2Å apart → too_close_together by 9.8Å
  - L29↔C72: targets 21.9/8.0Å but partners are 3.1Å apart → too_close_together by 10.8Å
  - V49↔C72: targets 26.6/8.0Å but partners are 8.0Å apart → too_close_together by 10.6Å
- **C5** — severity 181.50, 94 conflict(s); suspect input ~`C72` (group: pull_in)
  - pull-in (wants closer): K47@27.4Å(now 30.7,conf 0.97), T54@27.1Å(now 29.7,conf 0.87), C52@23.4Å(now 26.7,conf 0.51), C57@19.9Å(now 25.2,conf 0.40), C72@7.1Å(now 20.8,conf 0.37), L15@8.1Å(now 10.6,conf 0.35), Q14@8.6Å(now 11.2,conf 0.35), Y13@10.7Å(now 13.3,conf 0.34), N17@12.9Å(now 15.4,conf 0.34), E16@11.8Å(now 14.3,conf 0.34)
  - push-out (wants farther): C25@26.3Å(now 15.1,conf 0.71), F43@24.0Å(now 19.1,conf 0.53), F42@21.1Å(now 15.3,conf 0.44), G41@20.3Å(now 12.0,conf 0.41), E39@18.2Å(now 11.8,conf 0.37), R40@18.1Å(now 11.6,conf 0.36), G73@8.2Å(now 5.3,conf 0.35), K94@16.4Å(now 10.6,conf 0.35), G38@16.3Å(now 13.7,conf 0.35), C37@15.9Å(now 11.9,conf 0.34), P93@13.2Å(now 7.4,conf 0.34), T92@12.7Å(now 9.3,conf 0.34)
  - L29↔C72: targets 22.7/7.1Å but partners are 3.1Å apart → too_close_together by 12.6Å
  - G26↔C72: targets 27.0/7.1Å but partners are 8.2Å apart → too_close_together by 11.8Å
  - C53↔C72: targets 26.4/7.1Å but partners are 7.7Å apart → too_close_together by 11.7Å
- **T7** — severity 175.48, 87 conflict(s); suspect input ~`C72` (group: pull_in)
  - pull-in (wants closer): K47@27.5Å(now 31.7,conf 0.99), P46@27.5Å(now 30.4,conf 0.99), T54@27.5Å(now 31.9,conf 0.99), E50@27.5Å(now 31.0,conf 0.98), G26@27.5Å(now 30.3,conf 0.98), C57@24.4Å(now 27.4,conf 0.55), C72@8.2Å(now 23.0,conf 0.35)
  - push-out (wants farther): C25@27.4Å(now 17.0,conf 0.96), Y44@27.0Å(now 24.2,conf 0.85), V30@26.2Å(now 23.4,conf 0.71), F43@26.1Å(now 20.3,conf 0.69), F42@22.9Å(now 16.5,conf 0.49), G41@21.4Å(now 13.2,conf 0.45), R40@18.7Å(now 11.9,conf 0.38), E39@18.6Å(now 12.5,conf 0.37), K94@18.0Å(now 13.0,conf 0.36), C37@18.0Å(now 13.0,conf 0.36), G38@17.8Å(now 14.7,conf 0.36), V36@17.4Å(now 14.8,conf 0.35), C10@8.2Å(now 5.1,conf 0.35), P93@15.5Å(now 10.3,conf 0.34), T92@15.5Å(now 12.7,conf 0.34)
  - L29↔C72: targets 26.4/8.2Å but partners are 3.1Å apart → too_close_together by 15.2Å
  - L24↔C72: targets 26.9/8.2Å but partners are 4.6Å apart → too_close_together by 14.2Å
  - H28↔C72: targets 27.0/8.2Å but partners are 5.6Å apart → too_close_together by 13.2Å

## Secondary Structure (DSSP-like)

- helix(H)=61 · strand(E)=18 · 3-10(G)=11 · coil(C)=4

```
CHHHHHEEHHGHHHHHHHEGHEGEHHHGHHHHHHHEHEHHHEEECHHHHHHEHHEHHEHHHHHHEHGHEGHHHHHHHHHHHCHCEGGHGGGEHE
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=32 · sheet=10
  - V2 ↔ C6  (helix)
  - C6 ↔ C10  (helix)
  - I9 ↔ Y13  (helix)
  - C10 ↔ Q14  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - N17 ↔ N21  (helix)
  - N21 ↔ C25  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - E31 ↔ L35  (helix)
  - L33 ↔ C37  (helix)
  - L35 ↔ E39  (helix)
  - C37 ↔ G41  (helix)
  - P46 ↔ E50  (helix)
  - K47 ↔ Q51  (helix)
  - V49 ↔ C53  (helix)
  - C53 ↔ C57  (helix)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=37 · exposed=33 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=416 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=225 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8981 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`4INS.ensemble.pdb`)
- RMSF mean=4.05Å max=9.37Å (per-residue in .per_residue.csv)
- most flexible residues: 25, 27, 13, 14, 31

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `4INS.pae.csv`
- mean=0.133Å · max=1.324Å · AlphaFold-PAE analog (low block = rigid unit/domain)
