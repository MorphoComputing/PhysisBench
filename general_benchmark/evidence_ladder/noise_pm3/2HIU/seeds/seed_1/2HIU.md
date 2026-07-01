# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 2.328 A
- tm_score_ca_ordered: 0.6151173848031588
- heavy_atom_rmsd: 3.716 A
- sidechain_heavy_atom_rmsd: 4.543 A
- **all-atom quality (honest):** heavy 3.716 A, sidechain 4.543 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 990
- bin_accuracy: 0.297

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.3278300462516612
- ga_delta_rmsd: 0.5861532681762895  ga_fitness_mode: energy
- pre_local_rmsd: 2.4663078678991917  localized_anchor_rmsd: 2.327875293789963

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y18-L33 → 421 conflicts (70%); C37-P46 → 124 conflicts (21%); T7-S11 → 42 conflicts (7%)
- explained: 587/599 conflicts by 3 root cause(s)
- metrics: hubs=47 (frac 1.0), conflicts/hub=12.7, max_incompat=10.08Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y18-L33 + C37-P46 + T7-S11 — explain ~587/599 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I1** — severity 23.04, 34 conflict(s); suspect input ~`I9` (group: push_out)
  - pull-in (wants closer): T7@7.0Å(now 10.4,conf 0.28), L33@6.8Å(now 12.8,conf 0.28), C37@8.5Å(now 14.9,conf 0.20), Q14@6.5Å(now 9.2,conf 0.31), H23@6.6Å(now 9.3,conf 0.30)
  - push-out (wants farther): Q4@7.7Å(now 3.7,conf 0.24), Y34@20.1Å(now 14.4,conf 0.23), L24@9.1Å(now 5.1,conf 0.18), E31@17.2Å(now 12.4,conf 0.17), I9@17.6Å(now 9.5,conf 0.17)
  - Y34↔L33: targets 20.1/6.8Å but partners are 4.0Å apart → too_close_together by 9.3Å
  - Y34↔C37: targets 20.1/8.5Å but partners are 5.3Å apart → too_close_together by 6.2Å
  - T7↔C37: targets 7.0/8.5Å but partners are 21.1Å apart → too_far_apart by 5.7Å
- **F43** — severity 19.32, 28 conflict(s); suspect input ~`L15` (group: push_out)
  - pull-in (wants closer): S8@18.8Å(now 21.5,conf 0.20), C19@6.0Å(now 8.9,conf 0.35), L15@10.2Å(now 15.3,conf 0.15), E31@8.9Å(now 13.1,conf 0.19), R40@6.9Å(now 9.8,conf 0.28), N17@7.4Å(now 11.6,conf 0.25), V2@10.1Å(now 12.7,conf 0.16)
  - push-out (wants farther): N21@22.5Å(now 19.5,conf 0.33), H23@21.4Å(now 17.5,conf 0.28), S11@21.8Å(now 18.1,conf 0.30), H28@18.0Å(now 15.2,conf 0.18), S27@19.9Å(now 14.3,conf 0.23), L24@18.2Å(now 14.1,conf 0.18)
  - S11↔N17: targets 21.8/7.4Å but partners are 7.9Å apart → too_close_together by 6.5Å
  - Y18↔S11: targets 6.6/21.8Å but partners are 10.8Å apart → too_close_together by 4.5Å
  - S11↔L15: targets 21.8/10.2Å but partners are 3.4Å apart → too_close_together by 8.2Å
- **L33** — severity 16.50, 26 conflict(s); suspect input ~`V2` (group: pull_in)
  - pull-in (wants closer): I1@6.8Å(now 12.8,conf 0.28), C10@8.8Å(now 12.3,conf 0.19), Q14@8.2Å(now 11.3,conf 0.21), S27@6.2Å(now 11.1,conf 0.33)
  - push-out (wants farther): V36@7.8Å(now 2.9,conf 0.23), C19@9.4Å(now 6.9,conf 0.17), C6@17.8Å(now 14.6,conf 0.17), N21@16.8Å(now 11.6,conf 0.16), V2@18.3Å(now 13.6,conf 0.19), R40@16.5Å(now 8.5,conf 0.15)
  - V2↔I1: targets 18.3/6.8Å but partners are 3.1Å apart → too_close_together by 8.4Å
  - K47↔I1: targets 20.2/6.8Å but partners are 8.4Å apart → too_close_together by 5.0Å
  - G38↔R40: targets 6.4/16.5Å but partners are 3.2Å apart → too_close_together by 6.9Å
- **C37** — severity 15.85, 25 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): E16@5.6Å(now 8.6,conf 0.38), I1@8.5Å(now 14.9,conf 0.20), S11@9.6Å(now 13.5,conf 0.17)
  - push-out (wants farther): E3@22.8Å(now 18.8,conf 0.34), P46@20.6Å(now 17.2,conf 0.25), C25@21.4Å(now 16.8,conf 0.28), T45@19.1Å(now 15.3,conf 0.20), S27@18.6Å(now 14.7,conf 0.19)
  - E3↔I1: targets 22.8/8.5Å but partners are 4.1Å apart → too_close_together by 10.1Å
  - G41↔E16: targets 5.9/5.6Å but partners are 14.1Å apart → too_far_apart by 2.6Å
  - C25↔I1: targets 21.4/8.5Å but partners are 8.3Å apart → too_close_together by 4.5Å
- **P46** — severity 14.76, 26 conflict(s); suspect input ~`C5` (group: pull_in)
  - pull-in (wants closer): V30@8.4Å(now 12.1,conf 0.20), Q4@8.5Å(now 11.1,conf 0.20), C5@9.8Å(now 14.7,conf 0.16), N17@9.2Å(now 13.0,conf 0.18)
  - push-out (wants farther): V20@24.1Å(now 21.3,conf 0.44), E39@23.1Å(now 20.5,conf 0.37), Q22@19.2Å(now 14.4,conf 0.21), R40@21.9Å(now 18.2,conf 0.30), Y13@21.7Å(now 19.1,conf 0.29), C37@20.6Å(now 17.2,conf 0.25)
  - Q22↔Q4: targets 19.2/8.5Å but partners are 3.4Å apart → too_close_together by 7.3Å
  - Y13↔N17: targets 21.7/9.2Å but partners are 7.0Å apart → too_close_together by 5.5Å
  - Q22↔C5: targets 19.2/9.8Å but partners are 3.9Å apart → too_close_together by 5.5Å
- **Q22** — severity 14.74, 16 conflict(s); suspect input ~`Y34` (group: pull_in)
  - pull-in (wants closer): A32@6.9Å(now 12.7,conf 0.28), H28@6.5Å(now 11.9,conf 0.30)
  - push-out (wants farther): I9@8.3Å(now 3.6,conf 0.21), P46@19.2Å(now 14.4,conf 0.21), Y44@20.1Å(now 15.0,conf 0.23), Y18@16.9Å(now 12.2,conf 0.16), C5@9.0Å(now 3.9,conf 0.18), S8@7.5Å(now 3.7,conf 0.24), N17@16.6Å(now 11.4,conf 0.15), E16@20.2Å(now 11.8,conf 0.23), Y34@21.4Å(now 17.9,conf 0.28), E3@10.2Å(now 6.2,conf 0.15), V30@17.6Å(now 14.9,conf 0.17)
  - A32↔Y34: targets 6.9/21.4Å but partners are 5.4Å apart → too_close_together by 9.1Å
  - E39↔A32: targets 24.4/6.9Å but partners are 11.7Å apart → too_close_together by 5.9Å
  - Y34↔H28: targets 21.4/6.5Å but partners are 9.9Å apart → too_close_together by 4.9Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=12 · 3-10(G)=5 · coil(C)=4

```
CHHEEHHEHHEHEHHGHHHGEHHHHHHHEHHEGHHHGHHECGCCEEE
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=17 · sheet=16
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - C6 ↔ C10  (helix)
  - C10 ↔ Q14  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - Y18 ↔ Q22  (helix)
  - C19 ↔ H23  (helix)
  - Q22 ↔ G26  (helix)
  - H23 ↔ S27  (helix)
  - L24 ↔ H28  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - Y34 ↔ G38  (helix)
  - L35 ↔ E39  (helix)
  - Q4 ↔ S11  (sheet)
  - Q4 ↔ Y13  (sheet)
  - Q4 ↔ N21  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=183 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=77 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8374 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
