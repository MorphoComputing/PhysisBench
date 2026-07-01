# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 3.143 A
- tm_score_ca_ordered: 0.4741571324020728
- heavy_atom_rmsd: 4.471 A
- sidechain_heavy_atom_rmsd: 5.238 A
- **all-atom quality (honest):** heavy 4.471 A, sidechain 5.238 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 990
- bin_accuracy: 0.281

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=3.05781615354291 -> 2.6104217960018072 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.1432795620040346
- ga_delta_rmsd: -0.6811798518908727  ga_fitness_mode: energy
- pre_local_rmsd: 3.1621947251644413  localized_anchor_rmsd: 3.1432492328676434

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T7-L33 → 609 conflicts (91%); V36-P46 → 54 conflicts (8%)
- explained: 663/669 conflicts by 2 root cause(s)
- metrics: hubs=47 (frac 1.0), conflicts/hub=14.2, max_incompat=10.56Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T7-L33 + V36-P46 — explain ~663/669 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F43** — severity 26.92, 31 conflict(s); suspect input ~`L15` (group: push_out)
  - pull-in (wants closer): S8@18.8Å(now 21.5,conf 0.20), I9@17.9Å(now 21.2,conf 0.18), C19@6.0Å(now 13.7,conf 0.35), L15@10.2Å(now 16.1,conf 0.15), R40@6.9Å(now 9.6,conf 0.28), N17@7.4Å(now 13.7,conf 0.25), V2@10.1Å(now 13.1,conf 0.16)
  - push-out (wants farther): N21@22.5Å(now 19.6,conf 0.33), H23@21.4Å(now 16.6,conf 0.28), S11@21.8Å(now 19.3,conf 0.30), H28@18.0Å(now 13.8,conf 0.18), S27@19.9Å(now 12.2,conf 0.23), L24@18.2Å(now 14.6,conf 0.18)
  - N21↔C19: targets 22.5/6.0Å but partners are 10.5Å apart → too_close_together by 6.1Å
  - C19↔S11: targets 6.0/21.8Å but partners are 9.4Å apart → too_close_together by 6.4Å
  - N21↔N17: targets 22.5/7.4Å but partners are 8.7Å apart → too_close_together by 6.4Å
- **I1** — severity 20.61, 29 conflict(s); suspect input ~`I9` (group: pull_in)
  - pull-in (wants closer): T7@7.0Å(now 10.2,conf 0.28), L33@6.8Å(now 11.2,conf 0.28), C37@8.5Å(now 14.7,conf 0.20), Q14@6.5Å(now 9.5,conf 0.31)
  - push-out (wants farther): Q4@7.7Å(now 3.7,conf 0.24), C5@9.6Å(now 6.6,conf 0.17), Y34@20.1Å(now 13.8,conf 0.23), L24@9.1Å(now 6.2,conf 0.18), E31@17.2Å(now 12.8,conf 0.17), I9@17.6Å(now 11.1,conf 0.17)
  - Y34↔L33: targets 20.1/6.8Å but partners are 4.5Å apart → too_close_together by 8.8Å
  - Y34↔C37: targets 20.1/8.5Å but partners are 5.6Å apart → too_close_together by 6.0Å
  - T7↔C37: targets 7.0/8.5Å but partners are 21.3Å apart → too_far_apart by 5.8Å
- **L33** — severity 19.90, 33 conflict(s); suspect input ~`V2` (group: pull_in)
  - pull-in (wants closer): I1@6.8Å(now 11.2,conf 0.28), C10@8.8Å(now 12.0,conf 0.19), S27@6.2Å(now 11.6,conf 0.33)
  - push-out (wants farther): V36@7.8Å(now 3.0,conf 0.23), K47@20.2Å(now 16.2,conf 0.23), C19@9.4Å(now 5.0,conf 0.17), C6@17.8Å(now 14.2,conf 0.17), N21@16.8Å(now 12.1,conf 0.16), V2@18.3Å(now 12.3,conf 0.19), T45@16.4Å(now 12.3,conf 0.15), R40@16.5Å(now 8.4,conf 0.15)
  - V2↔I1: targets 18.3/6.8Å but partners are 3.8Å apart → too_close_together by 7.7Å
  - K47↔I1: targets 20.2/6.8Å but partners are 8.7Å apart → too_close_together by 4.6Å
  - G38↔R40: targets 6.4/16.5Å but partners are 3.0Å apart → too_close_together by 7.1Å
- **C37** — severity 18.84, 28 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): E16@5.6Å(now 8.9,conf 0.38), L12@6.4Å(now 9.5,conf 0.32), I1@8.5Å(now 14.7,conf 0.20), S11@9.6Å(now 13.7,conf 0.17)
  - push-out (wants farther): E3@22.8Å(now 18.2,conf 0.34), P46@20.6Å(now 16.5,conf 0.25), C25@21.4Å(now 17.3,conf 0.28), T45@19.1Å(now 14.9,conf 0.20), S27@18.6Å(now 15.2,conf 0.19)
  - E3↔I1: targets 22.8/8.5Å but partners are 3.7Å apart → too_close_together by 10.6Å
  - G41↔E16: targets 5.9/5.6Å but partners are 15.7Å apart → too_far_apart by 4.1Å
  - E3↔E16: targets 22.8/5.6Å but partners are 13.9Å apart → too_close_together by 3.3Å
- **S27** — severity 16.65, 18 conflict(s); suspect input ~`E39` (group: pull_in)
  - pull-in (wants closer): L33@6.2Å(now 11.6,conf 0.33)
  - push-out (wants farther): E39@22.3Å(now 18.0,conf 0.32), N17@20.2Å(now 16.2,conf 0.24), E16@19.7Å(now 15.8,conf 0.22), C37@18.6Å(now 15.2,conf 0.19), F43@19.9Å(now 12.2,conf 0.23), I9@17.2Å(now 14.3,conf 0.17)
  - E39↔L33: targets 22.3/6.2Å but partners are 8.7Å apart → too_close_together by 7.4Å
  - C37↔L33: targets 18.6/6.2Å but partners are 4.2Å apart → too_close_together by 8.2Å
  - V30↔F43: targets 6.0/19.9Å but partners are 7.3Å apart → too_close_together by 6.7Å
- **Q22** — severity 16.12, 18 conflict(s); suspect input ~`Y34` (group: pull_in)
  - pull-in (wants closer): A32@6.9Å(now 12.5,conf 0.28), H28@6.5Å(now 13.0,conf 0.30)
  - push-out (wants farther): E39@24.4Å(now 21.5,conf 0.47), P46@19.2Å(now 15.2,conf 0.21), C19@17.9Å(now 12.8,conf 0.18), Y44@20.1Å(now 14.7,conf 0.23), Y18@16.9Å(now 10.5,conf 0.16), C5@9.0Å(now 5.2,conf 0.18), N17@16.6Å(now 8.6,conf 0.15), E16@20.2Å(now 9.1,conf 0.23), Y34@21.4Å(now 16.8,conf 0.28), E3@10.2Å(now 7.3,conf 0.15)
  - A32↔Y34: targets 6.9/21.4Å but partners are 5.2Å apart → too_close_together by 9.3Å
  - E39↔A32: targets 24.4/6.9Å but partners are 11.4Å apart → too_close_together by 6.2Å
  - Y34↔H28: targets 21.4/6.5Å but partners are 10.2Å apart → too_close_together by 4.7Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=11 · 3-10(G)=8 · coil(C)=1

```
CEHGEHGEEGGHEHHEHHHHEHHHHHHHGHHEHHGHHHHEHGGHHEE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=9 · sheet=16
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - Y18 ↔ Q22  (helix)
  - Q22 ↔ G26  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - V30 ↔ Y34  (helix)
  - Y34 ↔ G38  (helix)
  - G41 ↔ T45  (helix)
  - V2 ↔ S8  (sheet)
  - V2 ↔ I9  (sheet)
  - V2 ↔ N21  (sheet)
  - C5 ↔ Y13  (sheet)
  - C5 ↔ E16  (sheet)
  - C5 ↔ N21  (sheet)
  - S8 ↔ Y13  (sheet)
  - S8 ↔ N21  (sheet)
  - I9 ↔ E16  (sheet)
  - I9 ↔ N21  (sheet)
  - Y13 ↔ N21  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=202 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=98 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8883 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
