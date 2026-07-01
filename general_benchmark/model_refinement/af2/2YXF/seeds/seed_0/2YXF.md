# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\2YXF\seeds\seed_0\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 2.923 A
- tm_score_ca_ordered: 0.7923067703561677
- heavy_atom_rmsd: 4.098 A
- sidechain_heavy_atom_rmsd: 4.741 A
- **all-atom quality (honest):** heavy 4.098 A, sidechain 4.741 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 4465
- bin_accuracy: 0.859

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=3.237676492638042 -> 2.9463881068977082 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.923457193189212
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.9458450010659325  localized_anchor_rmsd: 2.9234989149299473

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I1-Q2 → 245 conflicts (52%); G18-K19 → 114 conflicts (24%); T73-K75 → 66 conflicts (14%)
- explained: 425/476 conflicts by 3 root cause(s)
- metrics: hubs=48 (frac 0.495), conflicts/hub=9.9, max_incompat=7.96Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I1-Q2 + G18-K19 + T73-K75 — explain ~425/476 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P72** — severity 50.21, 39 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 37.0,conf 1.00), D59@27.5Å(now 34.9,conf 0.99), Q2@27.5Å(now 34.1,conf 0.99), K58@27.5Å(now 34.0,conf 0.99), W60@27.5Å(now 33.8,conf 0.99), P32@27.5Å(now 32.4,conf 0.98), R3@27.4Å(now 31.2,conf 0.97), H31@27.4Å(now 31.1,conf 0.97), S61@27.4Å(now 30.4,conf 0.96), V85@27.4Å(now 31.1,conf 0.96), S57@27.4Å(now 30.3,conf 0.96), T86@27.4Å(now 30.7,conf 0.96), S33@27.4Å(now 30.2,conf 0.94), F56@27.4Å(now 29.9,conf 0.94), S88@27.4Å(now 30.4,conf 0.94), D34@27.3Å(now 29.9,conf 0.92)
  - I1↔G18: targets 27.5/6.2Å but partners are 41.4Å apart → too_far_apart by 7.6Å
  - I1↔N17: targets 27.5/5.5Å but partners are 39.8Å apart → too_far_apart by 6.7Å
  - I1↔K19: targets 27.5/7.0Å but partners are 41.4Å apart → too_far_apart by 7.0Å
- **T71** — severity 47.82, 34 conflict(s); suspect input ~`K19` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 38.0,conf 1.00), D59@27.5Å(now 35.5,conf 1.00), Q2@27.5Å(now 35.2,conf 1.00), K58@27.5Å(now 34.5,conf 0.99), W60@27.5Å(now 34.3,conf 0.99), P32@27.5Å(now 32.8,conf 0.98), R3@27.5Å(now 32.4,conf 0.98), H31@27.5Å(now 31.8,conf 0.97), T86@27.4Å(now 31.8,conf 0.97), V85@27.4Å(now 31.9,conf 0.97), S88@27.4Å(now 31.6,conf 0.97), S61@27.4Å(now 31.0,conf 0.97), S57@27.4Å(now 30.8,conf 0.96), F56@27.4Å(now 30.1,conf 0.94), S33@27.4Å(now 30.3,conf 0.94), D34@27.3Å(now 29.9,conf 0.91)
  - I1↔K19: targets 27.5/6.0Å but partners are 41.4Å apart → too_far_apart by 7.9Å
  - I1↔G18: targets 27.5/6.0Å but partners are 41.4Å apart → too_far_apart by 7.8Å
  - I1↔S20: targets 27.5/5.3Å but partners are 38.7Å apart → too_far_apart by 5.9Å
- **H31** — severity 41.01, 28 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): G18@27.5Å(now 35.7,conf 1.00), N17@27.5Å(now 34.4,conf 1.00), K19@27.5Å(now 35.7,conf 1.00), E74@27.5Å(now 34.3,conf 1.00), K75@27.5Å(now 34.8,conf 0.99), E16@27.5Å(now 33.5,conf 0.99), T73@27.5Å(now 33.7,conf 0.99), S20@27.5Å(now 32.7,conf 0.99), T71@27.5Å(now 31.8,conf 0.97), P72@27.4Å(now 31.1,conf 0.97), D76@27.4Å(now 31.2,conf 0.97), A15@27.4Å(now 30.1,conf 0.96)
  - K19↔Q2: targets 27.5/5.5Å but partners are 39.1Å apart → too_far_apart by 6.0Å
  - G18↔Q2: targets 27.5/5.5Å but partners are 38.7Å apart → too_far_apart by 5.7Å
  - K19↔I1: targets 27.5/7.3Å but partners are 41.4Å apart → too_far_apart by 6.7Å
- **T73** — severity 34.95, 26 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 39.4,conf 1.00), D59@27.5Å(now 37.9,conf 1.00), K58@27.5Å(now 37.1,conf 1.00), W60@27.5Å(now 36.7,conf 1.00), Q2@27.5Å(now 36.3,conf 1.00), P32@27.5Å(now 35.0,conf 1.00), S57@27.5Å(now 33.4,conf 0.99), H31@27.5Å(now 33.7,conf 0.99), S61@27.5Å(now 33.3,conf 0.99), R3@27.5Å(now 33.5,conf 0.99), F56@27.5Å(now 33.1,conf 0.99), S33@27.5Å(now 33.0,conf 0.99), V85@27.5Å(now 33.0,conf 0.98), T86@27.5Å(now 32.5,conf 0.98), D34@27.5Å(now 32.4,conf 0.98), S55@27.5Å(now 31.7,conf 0.97), F62@27.4Å(now 31.2,conf 0.97), S88@27.4Å(now 31.4,conf 0.97), F30@27.4Å(now 30.3,conf 0.96), T4@27.4Å(now 30.3,conf 0.95), L54@27.4Å(now 30.5,conf 0.94), L87@27.3Å(now 29.9,conf 0.93)
  - I1↔N17: targets 27.5/5.5Å but partners are 39.8Å apart → too_far_apart by 6.7Å
  - I1↔G18: targets 27.5/6.4Å but partners are 41.4Å apart → too_far_apart by 7.4Å
  - Q2↔G18: targets 27.5/6.4Å but partners are 38.7Å apart → too_far_apart by 4.8Å
- **N17** — severity 24.13, 18 conflict(s); suspect input ~`T73` (group: push_out)
  - pull-in (wants closer): I1@27.5Å(now 39.8,conf 1.00), Q2@27.5Å(now 37.1,conf 1.00), D59@27.5Å(now 36.8,conf 1.00), W60@27.5Å(now 36.0,conf 1.00), K58@27.5Å(now 35.5,conf 1.00), P32@27.5Å(now 36.0,conf 1.00), H31@27.5Å(now 34.4,conf 1.00), V85@27.5Å(now 35.4,conf 1.00), R3@27.5Å(now 34.1,conf 1.00), T86@27.5Å(now 34.5,conf 1.00), S61@27.5Å(now 32.9,conf 1.00), S33@27.5Å(now 33.9,conf 0.99), S88@27.5Å(now 34.7,conf 0.99), S57@27.5Å(now 32.0,conf 0.99), D34@27.5Å(now 34.2,conf 0.99), F56@27.5Å(now 32.2,conf 0.99), L87@27.5Å(now 32.5,conf 0.98), F62@27.5Å(now 31.1,conf 0.98), T4@27.5Å(now 31.4,conf 0.98), S55@27.5Å(now 30.9,conf 0.98), F30@27.5Å(now 30.8,conf 0.98), H84@27.5Å(now 31.9,conf 0.98), Q89@27.4Å(now 31.9,conf 0.97), L54@27.4Å(now 30.4,conf 0.96), I35@27.4Å(now 30.9,conf 0.96)
  - push-out (wants farther): R12@14.0Å(now 11.4,conf 0.34)
  - I1↔T73: targets 27.5/5.5Å but partners are 39.4Å apart → too_far_apart by 6.4Å
  - D59↔T73: targets 27.5/5.5Å but partners are 37.9Å apart → too_far_apart by 4.8Å
  - I1↔E74: targets 27.5/7.2Å but partners are 39.6Å apart → too_far_apart by 5.0Å
- **E16** — severity 23.98, 18 conflict(s); suspect input ~`K19` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 38.7,conf 1.00), Q2@27.5Å(now 36.2,conf 1.00), D59@27.5Å(now 35.3,conf 1.00), W60@27.5Å(now 34.7,conf 1.00), P32@27.5Å(now 35.2,conf 1.00), K58@27.5Å(now 33.7,conf 1.00), V85@27.5Å(now 35.1,conf 1.00), T86@27.5Å(now 34.1,conf 0.99), S88@27.5Å(now 34.8,conf 0.99), H31@27.5Å(now 33.5,conf 0.99), R3@27.5Å(now 33.2,conf 0.99), D34@27.5Å(now 33.7,conf 0.99), S33@27.5Å(now 33.1,conf 0.99), S61@27.5Å(now 31.6,conf 0.99), L87@27.5Å(now 32.4,conf 0.98), S57@27.5Å(now 30.4,conf 0.98), F56@27.5Å(now 30.8,conf 0.98), Q89@27.5Å(now 32.1,conf 0.98), H84@27.4Å(now 31.6,conf 0.97), T4@27.4Å(now 30.7,conf 0.97), F62@27.4Å(now 29.9,conf 0.96), I35@27.4Å(now 30.5,conf 0.95)
  - I1↔K19: targets 27.5/6.0Å but partners are 41.4Å apart → too_far_apart by 8.0Å
  - Q2↔K19: targets 27.5/6.0Å but partners are 39.1Å apart → too_far_apart by 5.6Å
  - D59↔K19: targets 27.5/6.0Å but partners are 37.6Å apart → too_far_apart by 4.1Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=46 · 3-10(G)=24 · coil(C)=15

```
CEEGCGCECEGCEEHECCEEECGEGGGEHEEGHCEEEEGGGHHEHGHGEEEECCEEGHEEEEEGEEEECEGGEHGEEEEECGGEHHEHEGCGGECGE
```

## Backbone H-bond Network

- total=83 · helix(i→i+4)=2 · sheet=81
  - G29 ↔ S33  (helix)
  - G43 ↔ E47  (helix)
  - Q8 ↔ N24  (sheet)
  - Q8 ↔ S28  (sheet)
  - Y10 ↔ E16  (sheet)
  - Y10 ↔ N21  (sheet)
  - Y10 ↔ N24  (sheet)
  - H13 ↔ K19  (sheet)
  - H13 ↔ S20  (sheet)
  - H13 ↔ N21  (sheet)
  - H13 ↔ N24  (sheet)
  - P14 ↔ K19  (sheet)
  - P14 ↔ S20  (sheet)
  - P14 ↔ N21  (sheet)
  - P14 ↔ N24  (sheet)
  - E16 ↔ N21  (sheet)
  - N24 ↔ V37  (sheet)
  - N24 ↔ D38  (sheet)
  - S28 ↔ I35  (sheet)
  - S28 ↔ V37  (sheet)
  - … +63 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=37 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=352 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=224 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7894 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
