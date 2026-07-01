# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\2YXF\seeds\seed_1\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 1.222 A
- tm_score_ca_ordered: 0.9185933752079165
- heavy_atom_rmsd: 3.281 A
- sidechain_heavy_atom_rmsd: 4.184 A
- **all-atom quality (honest):** heavy 3.281 A, sidechain 4.184 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 4465
- bin_accuracy: 0.669

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=1.4497425139656825 -> 1.3216453285013638 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.221884775456473
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.224192558178139  localized_anchor_rmsd: 1.2218974674142158

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** A15-S20 → 120 conflicts (29%); K75-D76 → 71 conflicts (17%); I1 → 47 conflicts (11%)
- explained: 238/411 conflicts by 3 root cause(s)
- metrics: hubs=65 (frac 0.67), conflicts/hub=6.3, max_incompat=5.95Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): A15-S20 + K75-D76 + I1 — explain ~238/411 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R81** — severity 22.21, 24 conflict(s); suspect input ~`D76` (group: pull_in)
  - pull-in (wants closer): H31@14.2Å(now 16.8,conf 0.34), D76@12.7Å(now 15.9,conf 0.34)
  - push-out (wants farther): K58@26.5Å(now 23.7,conf 0.74)
  - K75↔D76: targets 21.1/12.7Å but partners are 3.5Å apart → too_close_together by 4.9Å
  - H31↔D76: targets 14.2/12.7Å but partners are 31.3Å apart → too_far_apart by 4.4Å
  - H31↔G43: targets 14.2/8.1Å but partners are 26.6Å apart → too_far_apart by 4.3Å
- **D76** — severity 17.27, 16 conflict(s); suspect input ~`T73` (group: push_out)
  - pull-in (wants closer): D59@27.5Å(now 36.3,conf 1.00), I1@27.5Å(now 34.1,conf 1.00), K58@27.5Å(now 35.8,conf 1.00), W60@27.5Å(now 34.7,conf 1.00), S57@27.5Å(now 34.0,conf 0.99), Q2@27.5Å(now 32.6,conf 0.99), S61@27.5Å(now 31.9,conf 0.98), F56@27.4Å(now 32.2,conf 0.97), P32@27.5Å(now 31.9,conf 0.98), H31@27.5Å(now 31.3,conf 0.98), R3@27.5Å(now 30.7,conf 0.98), S33@27.3Å(now 29.9,conf 0.91), S55@27.0Å(now 29.9,conf 0.83), E16@23.0Å(now 25.6,conf 0.49), R81@12.7Å(now 15.9,conf 0.34)
  - push-out (wants farther): N24@17.7Å(now 15.0,conf 0.36)
  - D59↔T73: targets 27.5/4.7Å but partners are 36.7Å apart → too_far_apart by 4.5Å
  - K58↔T73: targets 27.5/4.7Å but partners are 35.7Å apart → too_far_apart by 3.5Å
  - I1↔T73: targets 27.5/4.7Å but partners are 35.4Å apart → too_far_apart by 3.2Å
- **A15** — severity 16.32, 12 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): Q2@27.5Å(now 33.6,conf 0.99), Q89@27.5Å(now 35.7,conf 1.00), V85@27.5Å(now 34.8,conf 1.00), T86@27.5Å(now 34.7,conf 0.99), L87@27.5Å(now 33.8,conf 0.99), P32@27.5Å(now 32.6,conf 0.98), R3@27.5Å(now 31.7,conf 0.99), W60@27.5Å(now 30.2,conf 0.98), P90@27.5Å(now 32.6,conf 0.99), H84@27.5Å(now 32.2,conf 0.98), D59@27.5Å(now 30.2,conf 0.98), H31@27.5Å(now 30.7,conf 0.98), D34@27.5Å(now 31.4,conf 0.99), T4@27.4Å(now 30.2,conf 0.96), N83@27.5Å(now 31.2,conf 0.98), I1@27.5Å(now 33.3,conf 1.00), S88@27.5Å(now 36.6,conf 1.00)
  - G18↔S88: targets 4.5/27.5Å but partners are 36.5Å apart → too_far_apart by 4.5Å
  - V85↔G18: targets 27.5/4.5Å but partners are 35.4Å apart → too_far_apart by 3.4Å
  - T86↔G18: targets 27.5/4.5Å but partners are 35.4Å apart → too_far_apart by 3.4Å
- **S20** — severity 15.89, 16 conflict(s); suspect input ~`N17` (group: push_out)
  - pull-in (wants closer): Q2@27.5Å(now 34.4,conf 1.00), S88@27.5Å(now 34.5,conf 1.00), D59@27.5Å(now 32.2,conf 0.99), T86@27.5Å(now 34.1,conf 0.99), V85@27.5Å(now 33.6,conf 0.99), W60@27.5Å(now 32.2,conf 0.99), R3@27.5Å(now 32.7,conf 0.99), K58@27.5Å(now 31.4,conf 0.99), P32@27.5Å(now 32.5,conf 0.99), Q89@27.5Å(now 33.0,conf 0.98), L87@27.5Å(now 32.4,conf 0.99), H31@27.4Å(now 31.4,conf 0.95), T4@27.4Å(now 30.6,conf 0.94), D34@27.3Å(now 30.1,conf 0.93), H84@27.4Å(now 30.5,conf 0.97), P72@8.1Å(now 11.0,conf 0.35), I1@27.5Å(now 34.9,conf 1.00)
  - push-out (wants farther): E16@12.1Å(now 9.1,conf 0.34)
  - S88↔N17: targets 27.5/5.7Å but partners are 37.8Å apart → too_far_apart by 4.6Å
  - Q89↔N17: targets 27.5/5.7Å but partners are 36.7Å apart → too_far_apart by 3.5Å
  - T86↔N17: targets 27.5/5.7Å but partners are 36.5Å apart → too_far_apart by 3.2Å
- **F70** — severity 15.02, 17 conflict(s); suspect input ~`L39` (group: push_out)
  - pull-in (wants closer): I1@27.5Å(now 32.3,conf 1.00), D59@27.5Å(now 30.9,conf 0.98), Q2@27.5Å(now 31.2,conf 0.99), K58@27.5Å(now 30.6,conf 0.98), W60@27.4Å(now 30.4,conf 0.95), T86@26.8Å(now 29.5,conf 0.80), L39@7.2Å(now 10.4,conf 0.37)
  - push-out (wants farther): Y66@15.5Å(now 12.2,conf 0.34), V49@12.4Å(now 9.3,conf 0.34)
  - Y67↔Y66: targets 8.0/15.5Å but partners are 3.6Å apart → too_close_together by 4.0Å
  - V82↔L39: targets 20.2/7.2Å but partners are 9.7Å apart → too_close_together by 3.3Å
  - G18↔L39: targets 10.3/7.2Å but partners are 20.9Å apart → too_far_apart by 3.4Å
- **H31** — severity 14.52, 14 conflict(s); suspect input ~`W60` (group: push_out)
  - pull-in (wants closer): K19@27.5Å(now 33.8,conf 0.99), E74@27.5Å(now 33.2,conf 1.00), K75@27.5Å(now 33.7,conf 0.99), T73@27.5Å(now 32.8,conf 0.99), G18@27.5Å(now 32.3,conf 0.99), N17@27.5Å(now 32.4,conf 0.98), E16@27.5Å(now 31.5,conf 0.99), A15@27.5Å(now 30.7,conf 0.98), S20@27.4Å(now 31.4,conf 0.95), T71@27.4Å(now 31.2,conf 0.95), D76@27.5Å(now 31.3,conf 0.98), P72@27.5Å(now 30.9,conf 0.98), R81@14.2Å(now 16.8,conf 0.34)
  - push-out (wants farther): S55@13.9Å(now 11.3,conf 0.34)
  - K75↔W60: targets 27.5/4.9Å but partners are 36.9Å apart → too_far_apart by 4.5Å
  - E74↔W60: targets 27.5/4.9Å but partners are 35.9Å apart → too_far_apart by 3.5Å
  - T73↔W60: targets 27.5/4.9Å but partners are 35.4Å apart → too_far_apart by 3.0Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=40 · 3-10(G)=30 · coil(C)=17

```
CEEECGCEGEEEECHHHHHEEGCEGGGEGEGGHCEEGEGCEHGEGGGCEGEEECECHCHEGGEGGEEGCEEEGGCECEEEGEEEGHEGECCGGGCGE
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=1 · sheet=57
  - A15 ↔ K19  (helix)
  - Q8 ↔ N24  (sheet)
  - Q8 ↔ S28  (sheet)
  - Y10 ↔ N21  (sheet)
  - Y10 ↔ N24  (sheet)
  - S11 ↔ S20  (sheet)
  - S11 ↔ N21  (sheet)
  - S11 ↔ N24  (sheet)
  - R12 ↔ S20  (sheet)
  - R12 ↔ N21  (sheet)
  - R12 ↔ N24  (sheet)
  - H13 ↔ S20  (sheet)
  - H13 ↔ N21  (sheet)
  - H13 ↔ N24  (sheet)
  - N24 ↔ D38  (sheet)
  - N24 ↔ K41  (sheet)
  - S28 ↔ I35  (sheet)
  - F30 ↔ I35  (sheet)
  - F30 ↔ E36  (sheet)
  - E36 ↔ S52  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=43 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=365 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=224 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8436 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
