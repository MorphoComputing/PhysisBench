# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 8.752 A
- tm_score_ca_ordered: 0.15059945658722784
- heavy_atom_rmsd: 9.587 A
- sidechain_heavy_atom_rmsd: 10.213 A
- **all-atom quality (honest):** heavy 9.587 A, sidechain 10.213 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 990
- bin_accuracy: 0.440

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.752127149667235
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 8.752124597791507  localized_anchor_rmsd: 8.752124597791507

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C25 → 179 conflicts (42%); C6 → 79 conflicts (18%)
- explained: 258/429 conflicts by 2 root cause(s)
- metrics: hubs=43 (frac 0.915), conflicts/hub=10.0, max_incompat=9.61Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C25 + C6 — explain ~258/429 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N21** — severity 56.89, 35 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): C25@6.5Å(now 12.8,conf 0.39)
  - push-out (wants farther): F43@22.6Å(now 19.7,conf 0.48), C37@22.4Å(now 16.8,conf 0.48), C6@22.4Å(now 17.1,conf 0.47), F42@21.7Å(now 18.9,conf 0.46), V36@21.1Å(now 18.2,conf 0.44), Y44@20.8Å(now 17.9,conf 0.43), C10@19.5Å(now 16.9,conf 0.39), S11@18.3Å(now 14.9,conf 0.37), Q14@15.8Å(now 12.8,conf 0.34), L12@15.0Å(now 10.6,conf 0.34), Y13@14.8Å(now 11.8,conf 0.34), E16@10.3Å(now 7.3,conf 0.34), L15@13.3Å(now 10.5,conf 0.34), N17@11.9Å(now 9.3,conf 0.34)
  - C6↔C25: targets 22.4/6.5Å but partners are 6.2Å apart → too_close_together by 9.6Å
  - F43↔C25: targets 22.6/6.5Å but partners are 7.5Å apart → too_close_together by 8.5Å
  - F42↔C25: targets 21.7/6.5Å but partners are 6.7Å apart → too_close_together by 8.4Å
- **Q22** — severity 46.77, 34 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): C25@5.5Å(now 9.9,conf 0.45), C19@6.0Å(now 10.4,conf 0.41)
  - push-out (wants farther): C37@20.6Å(now 16.5,conf 0.42), C6@20.1Å(now 14.5,conf 0.41), V36@19.8Å(now 17.0,conf 0.40), F43@19.6Å(now 16.4,conf 0.40), F42@19.0Å(now 16.1,conf 0.38), T45@18.3Å(now 15.4,conf 0.37), Y44@17.8Å(now 14.4,conf 0.36), P46@17.0Å(now 14.1,conf 0.35), S11@14.7Å(now 11.5,conf 0.34), Y13@10.9Å(now 8.4,conf 0.34), L12@11.3Å(now 7.7,conf 0.34)
  - C25↔C6: targets 5.5/20.1Å but partners are 6.2Å apart → too_close_together by 8.4Å
  - C37↔C19: targets 20.6/6.0Å but partners are 7.9Å apart → too_close_together by 6.7Å
  - C25↔F43: targets 5.5/19.6Å but partners are 7.5Å apart → too_close_together by 6.6Å
- **V20** — severity 41.57, 30 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): C25@9.4Å(now 15.6,conf 0.34)
  - push-out (wants farther): S8@26.0Å(now 23.5,conf 0.68), G41@25.4Å(now 22.8,conf 0.61), F43@25.3Å(now 22.1,conf 0.60), C37@24.9Å(now 17.8,conf 0.58), C6@24.3Å(now 18.9,conf 0.54), F42@24.3Å(now 21.2,conf 0.54), Y44@23.4Å(now 20.4,conf 0.50), V36@23.3Å(now 20.1,conf 0.50), P46@22.4Å(now 19.5,conf 0.47), C10@21.1Å(now 18.3,conf 0.44), K47@20.7Å(now 17.9,conf 0.43), S11@20.0Å(now 16.5,conf 0.40), L12@17.1Å(now 12.9,conf 0.35), Q14@16.8Å(now 13.1,conf 0.35), Y13@16.2Å(now 12.9,conf 0.35), L15@14.9Å(now 11.7,conf 0.34), E16@11.7Å(now 8.3,conf 0.34), N17@12.2Å(now 8.6,conf 0.34)
  - C6↔C25: targets 24.3/9.4Å but partners are 6.2Å apart → too_close_together by 8.7Å
  - F43↔C25: targets 25.3/9.4Å but partners are 7.5Å apart → too_close_together by 8.4Å
  - F42↔C25: targets 24.3/9.4Å but partners are 6.7Å apart → too_close_together by 8.2Å
- **K47** — severity 29.50, 27 conflict(s); suspect input ~`L12` (group: pull_in)
  - pull-in (wants closer): L12@7.8Å(now 10.7,conf 0.36)
  - push-out (wants farther): E3@21.6Å(now 15.2,conf 0.45), V20@20.7Å(now 17.9,conf 0.43), V2@20.7Å(now 13.0,conf 0.42), C6@19.5Å(now 13.5,conf 0.39), I1@19.2Å(now 13.0,conf 0.39), Q4@18.7Å(now 15.5,conf 0.38), Y18@17.0Å(now 9.2,conf 0.35), Y13@8.3Å(now 5.6,conf 0.35), C25@16.4Å(now 12.3,conf 0.35), N17@14.6Å(now 11.8,conf 0.34), Q14@11.6Å(now 8.8,conf 0.34)
  - L12↔Y18: targets 7.8/17.0Å but partners are 3.6Å apart → too_close_together by 5.6Å
  - L12↔C25: targets 7.8/16.4Å but partners are 3.4Å apart → too_close_together by 5.2Å
  - C6↔L12: targets 19.5/7.8Å but partners are 6.9Å apart → too_close_together by 4.8Å
- **T45** — severity 27.75, 24 conflict(s); suspect input ~`L12` (group: pull_in)
  - pull-in (wants closer): C37@17.9Å(now 21.0,conf 0.36)
  - push-out (wants farther): E3@19.2Å(now 14.2,conf 0.39), V2@18.6Å(now 11.5,conf 0.37), Q22@18.3Å(now 15.4,conf 0.37), I1@17.9Å(now 12.7,conf 0.36), Y18@17.8Å(now 11.0,conf 0.36), C25@17.8Å(now 9.8,conf 0.36), H23@17.0Å(now 14.2,conf 0.35), C6@16.1Å(now 10.7,conf 0.34)
  - C25↔L12: targets 17.8/8.0Å but partners are 3.4Å apart → too_close_together by 6.3Å
  - Y18↔L12: targets 17.8/8.0Å but partners are 3.6Å apart → too_close_together by 6.2Å
  - S11↔Y18: targets 7.3/17.8Å but partners are 5.2Å apart → too_close_together by 5.4Å
- **P46** — severity 25.73, 24 conflict(s); suspect input ~`L12` (group: push_out)
  - push-out (wants farther): V20@22.4Å(now 19.5,conf 0.47), E3@21.5Å(now 14.7,conf 0.45), V2@20.4Å(now 12.2,conf 0.42), I1@19.5Å(now 12.8,conf 0.39), Q4@18.9Å(now 15.5,conf 0.38), C6@18.6Å(now 12.1,conf 0.37), Y18@18.3Å(now 9.8,conf 0.37), Q22@17.0Å(now 14.1,conf 0.35), C25@16.9Å(now 10.7,conf 0.35), N17@16.6Å(now 13.6,conf 0.35), S11@9.2Å(now 5.9,conf 0.34), Y13@10.3Å(now 7.0,conf 0.34), I9@13.5Å(now 10.9,conf 0.34), Q14@13.1Å(now 10.1,conf 0.34), C10@12.3Å(now 9.2,conf 0.34)
  - Y18↔L12: targets 18.3/8.4Å but partners are 3.6Å apart → too_close_together by 6.3Å
  - C25↔L12: targets 16.9/8.4Å but partners are 3.4Å apart → too_close_together by 5.1Å
  - V2↔C10: targets 20.4/12.3Å but partners are 3.3Å apart → too_close_together by 4.8Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=10 · 3-10(G)=5 · coil(C)=3

```
CHEHHHHECGGHHHHGHHHHHEHHHHHHHHHHHHHEHEHGECEGEEE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=16 · sheet=2
  - V2 ↔ C6  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - C19 ↔ H23  (helix)
  - V20 ↔ L24  (helix)
  - H23 ↔ S27  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - L33 ↔ C37  (helix)
  - L35 ↔ E39  (helix)
  - E3 ↔ S8  (sheet)
  - V36 ↔ G41  (sheet)

## Solvent Accessibility (burial)

- buried=21 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=196 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=87 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6338 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
