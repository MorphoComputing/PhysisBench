# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\2YXF\seeds\seed_0\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 3.153 A
- tm_score_ca_ordered: 0.7754225224408645
- heavy_atom_rmsd: 4.212 A
- sidechain_heavy_atom_rmsd: 4.851 A
- **all-atom quality (honest):** heavy 4.212 A, sidechain 4.851 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 4465
- bin_accuracy: 0.867

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=3.200928737333759 -> 2.749627093328367 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.153127568876113
- ga_delta_rmsd: -0.45984424554223713  ga_fitness_mode: energy
- pre_local_rmsd: 3.175281513920236  localized_anchor_rmsd: 3.153133919876353

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N17-K19 → 166 conflicts (62%); T71-K75 → 61 conflicts (23%); I1-Q2 → 20 conflicts (8%)
- explained: 247/267 conflicts by 3 root cause(s)
- metrics: hubs=39 (frac 0.402), conflicts/hub=6.8, max_incompat=5.57Å, chain_span=0.887
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N17-K19 + T71-K75 + I1-Q2 — explain ~247/267 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T71** — severity 34.80, 27 conflict(s); suspect input ~`K19` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 36.1,conf 1.00), D59@27.5Å(now 34.6,conf 1.00), Q2@27.5Å(now 34.9,conf 1.00), K58@27.5Å(now 33.9,conf 0.99), W60@27.5Å(now 34.1,conf 0.99), P32@27.5Å(now 32.8,conf 0.98), R3@27.5Å(now 32.1,conf 0.98), H31@27.5Å(now 31.8,conf 0.98), T86@27.4Å(now 31.8,conf 0.97), S61@27.4Å(now 31.2,conf 0.97), V85@27.4Å(now 31.8,conf 0.97), S88@27.4Å(now 31.5,conf 0.97), S57@27.4Å(now 30.7,conf 0.97), S33@27.3Å(now 30.2,conf 0.93)
  - I1↔K19: targets 27.5/5.8Å but partners are 38.9Å apart → too_far_apart by 5.6Å
  - I1↔G18: targets 27.5/5.9Å but partners are 38.9Å apart → too_far_apart by 5.5Å
  - Q2↔K19: targets 27.5/5.8Å but partners are 38.3Å apart → too_far_apart by 5.0Å
- **P72** — severity 30.49, 30 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 34.8,conf 1.00), D59@27.5Å(now 33.9,conf 1.00), K58@27.5Å(now 33.6,conf 0.99), Q2@27.5Å(now 33.6,conf 0.99), W60@27.5Å(now 33.7,conf 0.99), P32@27.5Å(now 32.3,conf 0.98), R3@27.4Å(now 30.9,conf 0.97), H31@27.4Å(now 31.1,conf 0.97), S57@27.4Å(now 30.4,conf 0.97), S61@27.4Å(now 30.6,conf 0.97), V85@27.4Å(now 30.8,conf 0.95), T86@27.4Å(now 30.4,conf 0.95), S33@27.4Å(now 30.0,conf 0.93)
  - I1↔G18: targets 27.5/6.3Å but partners are 38.9Å apart → too_far_apart by 5.2Å
  - Q2↔G18: targets 27.5/6.3Å but partners are 38.1Å apart → too_far_apart by 4.4Å
  - I1↔K19: targets 27.5/7.0Å but partners are 38.9Å apart → too_far_apart by 4.4Å
- **H31** — severity 24.67, 21 conflict(s); suspect input ~`Q2` (group: pull_in)
  - pull-in (wants closer): G18@27.5Å(now 35.5,conf 1.00), N17@27.5Å(now 34.1,conf 1.00), K19@27.5Å(now 35.3,conf 1.00), E74@27.5Å(now 34.3,conf 1.00), K75@27.5Å(now 34.3,conf 0.99), E16@27.5Å(now 33.0,conf 0.99), T73@27.5Å(now 33.7,conf 0.99), S20@27.5Å(now 32.6,conf 0.98), T71@27.5Å(now 31.8,conf 0.98), P72@27.4Å(now 31.1,conf 0.97), D76@27.4Å(now 31.4,conf 0.97), A15@27.4Å(now 29.9,conf 0.96)
  - K19↔Q2: targets 27.5/5.5Å but partners are 38.3Å apart → too_far_apart by 5.3Å
  - G18↔Q2: targets 27.5/5.5Å but partners are 38.1Å apart → too_far_apart by 5.1Å
  - G18↔I1: targets 27.5/7.1Å but partners are 38.9Å apart → too_far_apart by 4.3Å
- **T73** — severity 24.50, 22 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 37.1,conf 1.00), D59@27.5Å(now 36.8,conf 1.00), K58@27.5Å(now 36.7,conf 1.00), W60@27.5Å(now 36.6,conf 1.00), Q2@27.5Å(now 35.9,conf 1.00), P32@27.5Å(now 35.0,conf 1.00), S57@27.5Å(now 33.5,conf 0.99), S61@27.5Å(now 33.5,conf 0.99), H31@27.5Å(now 33.7,conf 0.99), R3@27.5Å(now 33.1,conf 0.99), F56@27.5Å(now 33.1,conf 0.99), S33@27.5Å(now 32.9,conf 0.99), V85@27.5Å(now 32.9,conf 0.98), T86@27.5Å(now 32.3,conf 0.98), D34@27.5Å(now 32.2,conf 0.98), S55@27.4Å(now 31.6,conf 0.97), F62@27.4Å(now 31.3,conf 0.97), S88@27.4Å(now 31.1,conf 0.97), F30@27.4Å(now 30.5,conf 0.96), T4@27.4Å(now 30.2,conf 0.96), L54@27.4Å(now 30.4,conf 0.94), L87@27.4Å(now 29.9,conf 0.94)
  - I1↔G18: targets 27.5/6.3Å but partners are 38.9Å apart → too_far_apart by 5.1Å
  - Q2↔G18: targets 27.5/6.3Å but partners are 38.1Å apart → too_far_apart by 4.3Å
  - I1↔N17: targets 27.5/5.6Å but partners are 36.9Å apart → too_far_apart by 3.8Å
- **N17** — severity 13.48, 11 conflict(s); suspect input ~`T73` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 36.9,conf 1.00), Q2@27.5Å(now 36.3,conf 1.00), D59@27.5Å(now 35.5,conf 1.00), W60@27.5Å(now 35.9,conf 1.00), K58@27.5Å(now 35.0,conf 1.00), P32@27.5Å(now 35.8,conf 1.00), H31@27.5Å(now 34.1,conf 1.00), R3@27.5Å(now 33.4,conf 1.00), V85@27.5Å(now 34.7,conf 1.00), T86@27.5Å(now 33.8,conf 1.00), S61@27.5Å(now 33.0,conf 1.00), S57@27.5Å(now 32.2,conf 0.99), S33@27.5Å(now 33.7,conf 0.99), S88@27.5Å(now 33.4,conf 0.99), F56@27.5Å(now 32.3,conf 0.99), D34@27.5Å(now 33.7,conf 0.99), L87@27.5Å(now 31.8,conf 0.98), T4@27.5Å(now 30.8,conf 0.98), F62@27.5Å(now 31.1,conf 0.98), F30@27.5Å(now 30.7,conf 0.98), S55@27.5Å(now 31.0,conf 0.98), H84@27.5Å(now 31.3,conf 0.97), Q89@27.4Å(now 30.9,conf 0.97), L54@27.4Å(now 30.4,conf 0.96), I35@27.4Å(now 30.3,conf 0.95)
  - I1↔T73: targets 27.5/5.6Å but partners are 37.1Å apart → too_far_apart by 4.0Å
  - D59↔T73: targets 27.5/5.6Å but partners are 36.8Å apart → too_far_apart by 3.7Å
  - K58↔T73: targets 27.5/5.6Å but partners are 36.7Å apart → too_far_apart by 3.6Å
- **E16** — severity 13.42, 10 conflict(s); suspect input ~`K19` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 35.6,conf 1.00), Q2@27.5Å(now 35.3,conf 1.00), D59@27.5Å(now 33.6,conf 1.00), W60@27.5Å(now 34.2,conf 1.00), P32@27.5Å(now 34.8,conf 1.00), K58@27.5Å(now 33.0,conf 1.00), V85@27.5Å(now 34.4,conf 1.00), H31@27.5Å(now 33.0,conf 0.99), T86@27.5Å(now 33.3,conf 0.99), S88@27.5Å(now 33.6,conf 0.99), R3@27.5Å(now 32.3,conf 0.99), S33@27.5Å(now 32.7,conf 0.99), S61@27.5Å(now 31.4,conf 0.99), D34@27.5Å(now 33.0,conf 0.99), L87@27.5Å(now 31.6,conf 0.98), S57@27.5Å(now 30.2,conf 0.98), F56@27.5Å(now 30.5,conf 0.98), Q89@27.4Å(now 31.3,conf 0.97), T4@27.4Å(now 30.0,conf 0.97), H84@27.4Å(now 31.0,conf 0.97)
  - I1↔K19: targets 27.5/5.9Å but partners are 38.9Å apart → too_far_apart by 5.5Å
  - Q2↔K19: targets 27.5/5.9Å but partners are 38.3Å apart → too_far_apart by 4.9Å
  - V85↔K19: targets 27.5/5.9Å but partners are 36.7Å apart → too_far_apart by 3.3Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=43 · 3-10(G)=31 · coil(C)=13

```
CEEGCGCEGEEHECGGGEECEEGEGGGEHEEGGCEEGEGGGHHECGGHEEGECCEEEHGGEEEGEGEECEGEGHGEGEEECGEEHHEHECEGGECGE
```

## Backbone H-bond Network

- total=69 · helix(i→i+4)=0 · sheet=69
  - Q8 ↔ N24  (sheet)
  - Q8 ↔ S28  (sheet)
  - Y10 ↔ N21  (sheet)
  - Y10 ↔ F22  (sheet)
  - Y10 ↔ N24  (sheet)
  - S11 ↔ G18  (sheet)
  - S11 ↔ K19  (sheet)
  - S11 ↔ N21  (sheet)
  - S11 ↔ F22  (sheet)
  - S11 ↔ N24  (sheet)
  - H13 ↔ G18  (sheet)
  - H13 ↔ K19  (sheet)
  - H13 ↔ N21  (sheet)
  - H13 ↔ F22  (sheet)
  - H13 ↔ N24  (sheet)
  - N24 ↔ D38  (sheet)
  - S28 ↔ I35  (sheet)
  - S28 ↔ E36  (sheet)
  - F30 ↔ I35  (sheet)
  - F30 ↔ E36  (sheet)
  - … +49 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=45 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=349 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=221 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.795 (restraint satisfaction; lower=better)
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
