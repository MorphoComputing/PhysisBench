# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\4PTI\seeds\seed_1\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 12.466 A
- tm_score_ca_ordered: 0.0800626341041119
- heavy_atom_rmsd: 12.744 A
- sidechain_heavy_atom_rmsd: 13.325 A
- **all-atom quality (honest):** heavy 12.744 A, sidechain 13.325 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 499
- bin_accuracy: 0.170

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 12.466266015406756
- ga_delta_rmsd: -0.6526297352038952  ga_fitness_mode: energy
- pre_local_rmsd: 12.466260659391661  localized_anchor_rmsd: 12.466260659391661

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R19-G36 → 457 conflicts (89%); E48-D49 → 28 conflicts (5%)
- explained: 485/515 conflicts by 2 root cause(s)
- metrics: hubs=36 (frac 0.643), conflicts/hub=14.3, max_incompat=15.64Å, chain_span=0.929
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R19-G36 + E48-D49 — explain ~485/515 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G35** — severity 60.58, 40 conflict(s); suspect input ~`A39` (group: push_out)
  - push-out (wants farther): Y20@27.5Å(now 15.2,conf 1.00), N23@27.5Å(now 11.4,conf 0.99), A24@27.5Å(now 14.4,conf 0.99), G11@27.5Å(now 16.0,conf 0.99), R16@27.5Å(now 17.4,conf 0.99), E6@27.5Å(now 24.7,conf 0.98), I18@27.5Å(now 20.5,conf 0.98), G27@27.5Å(now 14.4,conf 0.98), I17@27.4Å(now 20.7,conf 0.97), R19@27.4Å(now 17.2,conf 0.97), T53@27.4Å(now 24.7,conf 0.94), Y9@27.1Å(now 18.7,conf 0.87), R41@27.1Å(now 23.2,conf 0.85), T10@26.6Å(now 17.8,conf 0.76), F32@25.8Å(now 15.3,conf 0.66), Y22@25.8Å(now 15.8,conf 0.65), P1@24.4Å(now 19.7,conf 0.55), T31@24.0Å(now 10.3,conf 0.53), F21@18.5Å(now 14.3,conf 0.37), L28@9.2Å(now 6.1,conf 0.34), K25@10.2Å(now 6.9,conf 0.34)
  - N23↔A39: targets 27.5/8.4Å but partners are 9.1Å apart → too_close_together by 10.0Å
  - Y20↔Q30: targets 27.5/15.8Å but partners are 3.8Å apart → too_close_together by 7.9Å
  - N23↔K25: targets 27.5/10.2Å but partners are 9.8Å apart → too_close_together by 7.5Å
- **D49** — severity 59.36, 34 conflict(s); suspect input ~`T31` (group: pull_in)
  - pull-in (wants closer): T31@9.1Å(now 14.2,conf 0.34), F32@9.3Å(now 12.0,conf 0.34)
  - push-out (wants farther): Y22@27.5Å(now 15.9,conf 1.00), Y20@27.5Å(now 23.0,conf 1.00), A26@27.5Å(now 24.8,conf 1.00), F21@27.5Å(now 22.5,conf 0.98), R19@27.5Å(now 24.4,conf 0.98), G11@27.5Å(now 24.1,conf 0.98), D2@27.4Å(now 24.8,conf 0.95), Y9@27.3Å(now 23.9,conf 0.93), T10@27.0Å(now 24.4,conf 0.85), S46@24.9Å(now 15.2,conf 0.58), L28@24.1Å(now 21.4,conf 0.53), K45@22.9Å(now 13.2,conf 0.49), P1@20.8Å(now 17.2,conf 0.43), R41@18.9Å(now 10.1,conf 0.38), T53@15.2Å(now 8.9,conf 0.34), K40@10.0Å(now 7.3,conf 0.34), A39@14.5Å(now 12.0,conf 0.34)
  - Y22↔F32: targets 27.5/9.3Å but partners are 4.0Å apart → too_close_together by 14.2Å
  - Y22↔T31: targets 27.5/9.1Å but partners are 6.6Å apart → too_close_together by 11.8Å
  - F21↔T31: targets 27.5/9.1Å but partners are 9.7Å apart → too_close_together by 8.7Å
- **K40** — severity 57.81, 35 conflict(s); suspect input ~`Y34` (group: push_out)
  - push-out (wants farther): N23@27.5Å(now 11.2,conf 1.00), L5@27.5Å(now 24.8,conf 1.00), A24@27.5Å(now 14.4,conf 1.00), G27@27.5Å(now 13.7,conf 1.00), Y20@27.5Å(now 18.7,conf 1.00), F3@27.5Å(now 22.4,conf 1.00), I18@27.5Å(now 22.1,conf 1.00), Y22@27.5Å(now 15.9,conf 0.99), R16@27.5Å(now 20.1,conf 0.99), I17@27.5Å(now 22.0,conf 0.99), E6@27.5Å(now 22.7,conf 0.99), D2@27.5Å(now 21.1,conf 0.98), S46@27.4Å(now 16.3,conf 0.97), R19@27.4Å(now 19.4,conf 0.97), K45@27.4Å(now 15.9,conf 0.95), G11@27.2Å(now 17.0,conf 0.90), A26@27.1Å(now 21.7,conf 0.85), Y9@26.5Å(now 17.6,conf 0.74), Q30@25.7Å(now 21.0,conf 0.64), T53@24.5Å(now 13.8,conf 0.55), T10@24.4Å(now 17.6,conf 0.54), F21@23.6Å(now 20.5,conf 0.51), K25@19.4Å(now 16.4,conf 0.39), P1@18.9Å(now 12.5,conf 0.38), F32@15.6Å(now 12.6,conf 0.34), D49@10.0Å(now 7.3,conf 0.34), E48@14.6Å(now 7.9,conf 0.34), R52@14.4Å(now 10.1,conf 0.34), V33@13.5Å(now 7.3,conf 0.34)
  - N23↔Y34: targets 27.5/6.0Å but partners are 11.3Å apart → too_close_together by 10.2Å
  - N23↔T31: targets 27.5/13.1Å but partners are 3.5Å apart → too_close_together by 11.0Å
  - G27↔Y34: targets 27.5/6.0Å but partners are 13.9Å apart → too_close_together by 7.6Å
- **E6** — severity 47.70, 30 conflict(s); suspect input ~`Y20` (group: pull_in)
  - pull-in (wants closer): R16@6.6Å(now 9.7,conf 0.38), Y20@10.1Å(now 13.4,conf 0.34)
  - push-out (wants farther): A26@27.5Å(now 18.1,conf 1.00), T31@27.5Å(now 19.5,conf 1.00), F32@27.5Å(now 22.2,conf 1.00), A39@27.5Å(now 22.2,conf 0.99), K40@27.5Å(now 22.7,conf 0.99), L28@27.5Å(now 23.4,conf 0.99), V33@27.5Å(now 24.2,conf 0.98), G35@27.5Å(now 24.7,conf 0.98), R41@27.2Å(now 21.7,conf 0.90), Y34@27.1Å(now 23.0,conf 0.87), K25@25.6Å(now 21.7,conf 0.63), K45@25.3Å(now 21.4,conf 0.60), S46@22.2Å(now 18.8,conf 0.47), P1@19.6Å(now 13.1,conf 0.40), F3@6.4Å(now 3.6,conf 0.39), Y9@13.5Å(now 10.2,conf 0.34)
  - A26↔Y20: targets 27.5/10.1Å but partners are 5.7Å apart → too_close_together by 11.6Å
  - A26↔I17: targets 27.5/5.9Å but partners are 13.0Å apart → too_close_together by 8.6Å
  - A26↔I18: targets 27.5/9.7Å but partners are 7.8Å apart → too_close_together by 9.9Å
- **L28** — severity 43.69, 30 conflict(s); suspect input ~`G35` (group: push_out)
  - push-out (wants farther): L5@27.5Å(now 24.4,conf 1.00), Y20@27.5Å(now 11.6,conf 1.00), F3@27.5Å(now 24.1,conf 1.00), E6@27.5Å(now 23.4,conf 0.99), I18@27.4Å(now 17.1,conf 0.97), R16@27.4Å(now 15.1,conf 0.97), F32@27.4Å(now 15.4,conf 0.97), G11@27.4Å(now 17.8,conf 0.96), R19@27.4Å(now 14.5,conf 0.95), I17@27.4Å(now 18.2,conf 0.95), N23@27.4Å(now 11.0,conf 0.95), T31@27.2Å(now 9.8,conf 0.90), V33@27.1Å(now 12.2,conf 0.87), R52@27.1Å(now 24.3,conf 0.86), A24@27.1Å(now 13.0,conf 0.86), E48@26.3Å(now 23.0,conf 0.71), Y9@25.9Å(now 19.1,conf 0.67), T10@24.3Å(now 19.1,conf 0.54), D49@24.1Å(now 21.4,conf 0.53), G36@19.2Å(now 8.8,conf 0.39), Y22@18.9Å(now 14.5,conf 0.38), Y34@18.9Å(now 14.2,conf 0.38), G35@9.2Å(now 6.1,conf 0.34), F21@13.4Å(now 10.1,conf 0.34), K25@11.2Å(now 1.8,conf 0.34)
  - V33↔A39: targets 27.1/11.9Å but partners are 5.8Å apart → too_close_together by 9.4Å
  - V33↔G35: targets 27.1/9.2Å but partners are 9.2Å apart → too_close_together by 8.8Å
  - T31↔G35: targets 27.2/9.2Å but partners are 10.3Å apart → too_close_together by 7.8Å
- **R52** — severity 42.67, 29 conflict(s); suspect input ~`T31` (group: pull_in)
  - pull-in (wants closer): F32@8.3Å(now 13.3,conf 0.35), T31@9.7Å(now 16.4,conf 0.34)
  - push-out (wants farther): Y20@27.5Å(now 24.7,conf 1.00), F21@27.5Å(now 24.6,conf 1.00), L28@27.1Å(now 24.3,conf 0.86), P1@22.8Å(now 17.9,conf 0.49), S46@22.7Å(now 13.4,conf 0.48), K45@20.5Å(now 11.2,conf 0.42), E48@6.6Å(now 3.7,conf 0.39), A39@18.8Å(now 15.1,conf 0.38), R41@16.5Å(now 8.2,conf 0.35), K40@14.4Å(now 10.1,conf 0.34)
  - F21↔T31: targets 27.5/9.7Å but partners are 9.7Å apart → too_close_together by 8.1Å
  - Y20↔T31: targets 27.5/9.7Å but partners are 9.8Å apart → too_close_together by 8.0Å
  - L28↔T31: targets 27.1/9.7Å but partners are 9.8Å apart → too_close_together by 7.6Å

## Secondary Structure (DSSP-like)

- helix(H)=35 · strand(E)=12 · 3-10(G)=9 · coil(C)=0

```
EEHHHGEGGEGGHGHEHHHEHHEHHHHHHHEHHHHHHHHEHHGEHHHGHHEHHHGE
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=20 · sheet=19
  - A15 ↔ R19  (helix)
  - I18 ↔ Y22  (helix)
  - F21 ↔ K25  (helix)
  - Y22 ↔ A26  (helix)
  - A24 ↔ L28  (helix)
  - K25 ↔ C29  (helix)
  - A26 ↔ Q30  (helix)
  - L28 ↔ F32  (helix)
  - Q30 ↔ Y34  (helix)
  - F32 ↔ G36  (helix)
  - Y34 ↔ R38  (helix)
  - G35 ↔ A39  (helix)
  - C37 ↔ R41  (helix)
  - R38 ↔ N42  (helix)
  - R41 ↔ K45  (helix)
  - N42 ↔ S46  (helix)
  - K45 ↔ D49  (helix)
  - S46 ↔ C50  (helix)
  - D49 ↔ T53  (helix)
  - C50 ↔ C54  (helix)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=193 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=137 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=8.7303 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
