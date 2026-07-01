# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2YXF/sequence/2YXF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/2YXF/seeds/seed_1/2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 0.399 A
- tm_score_ca_ordered: 0.988084887614492
- heavy_atom_rmsd: 3.366 A
- sidechain_heavy_atom_rmsd: 4.396 A
- **all-atom quality (honest):** heavy 3.366 A, sidechain 4.396 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 4436
- bin_accuracy: 0.942

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.3988454808483967
- ga_delta_rmsd: -0.00939132950854693  ga_fitness_mode: energy
- pre_local_rmsd: 0.4022369270497516  localized_anchor_rmsd: 0.39888537974769955

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N17-K19 → 231 conflicts (38%); T73-K75 → 219 conflicts (36%); I1-Q2 → 72 conflicts (12%)
- explained: 522/611 conflicts by 3 root cause(s)
- metrics: hubs=52 (frac 0.536), conflicts/hub=11.8, max_incompat=7.72Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N17-K19 + T73-K75 + I1-Q2 — explain ~522/611 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H31** — severity 103.52, 49 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): K19@27.5Å(now 35.4,conf 1.00), E74@27.5Å(now 35.1,conf 1.00), K75@27.5Å(now 35.1,conf 1.00), T73@27.5Å(now 34.6,conf 1.00), G18@27.5Å(now 34.2,conf 1.00), N17@27.5Å(now 34.2,conf 1.00), E16@27.5Å(now 33.7,conf 1.00), A15@27.5Å(now 32.1,conf 1.00), S20@27.5Å(now 32.4,conf 1.00), T71@27.5Å(now 32.0,conf 1.00), D76@27.5Å(now 32.0,conf 1.00), P72@27.5Å(now 31.6,conf 1.00)
  - K19↔I1: targets 27.5/6.9Å but partners are 41.8Å apart → too_far_apart by 7.4Å
  - K19↔Q2: targets 27.5/4.9Å but partners are 39.1Å apart → too_far_apart by 6.7Å
  - K75↔I1: targets 27.5/6.9Å but partners are 40.8Å apart → too_far_apart by 6.5Å
- **H13** — severity 76.19, 38 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 35.7,conf 1.00), S88@27.5Å(now 34.0,conf 1.00), Q2@27.5Å(now 33.1,conf 1.00), V85@27.5Å(now 32.8,conf 1.00), T86@27.5Å(now 32.0,conf 1.00), D59@27.5Å(now 31.4,conf 1.00), Q89@27.5Å(now 31.9,conf 1.00), W60@27.5Å(now 31.0,conf 1.00), P32@27.5Å(now 31.2,conf 1.00), L87@27.5Å(now 31.1,conf 1.00)
  - I1↔G18: targets 27.5/5.2Å but partners are 40.4Å apart → too_far_apart by 7.7Å
  - I1↔K19: targets 27.5/6.9Å but partners are 41.8Å apart → too_far_apart by 7.4Å
  - S88↔G18: targets 27.5/5.2Å but partners are 38.8Å apart → too_far_apart by 6.1Å
- **P32** — severity 70.24, 34 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): K19@27.5Å(now 36.8,conf 1.00), E74@27.5Å(now 36.4,conf 1.00), K75@27.5Å(now 36.2,conf 1.00), G18@27.5Å(now 35.8,conf 1.00), N17@27.5Å(now 35.5,conf 1.00), E16@27.5Å(now 35.2,conf 1.00), T73@27.5Å(now 35.7,conf 1.00), A15@27.5Å(now 33.8,conf 1.00), S20@27.5Å(now 33.6,conf 1.00), T71@27.5Å(now 33.0,conf 1.00), D76@27.5Å(now 32.9,conf 1.00), P72@27.5Å(now 32.7,conf 1.00), H13@27.5Å(now 31.2,conf 1.00), P14@27.5Å(now 31.1,conf 1.00), N21@27.5Å(now 30.9,conf 1.00), R97@27.5Å(now 30.6,conf 1.00)
  - K19↔I1: targets 27.5/7.6Å but partners are 41.8Å apart → too_far_apart by 6.7Å
  - K75↔I1: targets 27.5/7.6Å but partners are 40.8Å apart → too_far_apart by 5.8Å
  - E74↔I1: targets 27.5/7.6Å but partners are 40.8Å apart → too_far_apart by 5.8Å
- **P14** — severity 63.48, 31 conflict(s); suspect input ~`N17` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 35.7,conf 1.00), S88@27.5Å(now 35.4,conf 1.00), Q2@27.5Å(now 33.4,conf 1.00), V85@27.5Å(now 33.5,conf 1.00), Q89@27.5Å(now 33.6,conf 1.00), T86@27.5Å(now 33.0,conf 1.00), L87@27.5Å(now 32.3,conf 1.00), P32@27.5Å(now 31.1,conf 1.00), R3@27.5Å(now 30.4,conf 1.00), W60@27.5Å(now 30.3,conf 1.00), D59@27.5Å(now 30.2,conf 1.00), P90@27.5Å(now 30.1,conf 1.00)
  - I1↔N17: targets 27.5/5.4Å but partners are 40.5Å apart → too_far_apart by 7.6Å
  - I1↔G18: targets 27.5/5.5Å but partners are 40.4Å apart → too_far_apart by 7.3Å
  - S88↔N17: targets 27.5/5.4Å but partners are 39.7Å apart → too_far_apart by 6.8Å
- **F30** — severity 50.86, 32 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): K19@27.5Å(now 32.2,conf 1.00), K75@27.5Å(now 32.0,conf 1.00), E74@27.5Å(now 31.8,conf 1.00), N17@27.5Å(now 31.2,conf 1.00), T73@27.5Å(now 31.4,conf 1.00), E16@27.5Å(now 30.9,conf 1.00), G18@27.5Å(now 31.1,conf 1.00)
  - K19↔I1: targets 27.5/9.7Å but partners are 41.8Å apart → too_far_apart by 4.6Å
  - K19↔Q2: targets 27.5/7.2Å but partners are 39.1Å apart → too_far_apart by 4.4Å
  - K75↔W60: targets 27.5/7.7Å but partners are 39.4Å apart → too_far_apart by 4.2Å
- **S61** — severity 49.68, 27 conflict(s); suspect input ~`K58` (group: pull_in)
  - pull-in (wants closer): K75@27.5Å(now 36.1,conf 1.00), E74@27.5Å(now 35.5,conf 1.00), T73@27.5Å(now 34.8,conf 1.00), K19@27.5Å(now 33.5,conf 1.00), D76@27.5Å(now 33.1,conf 1.00), G18@27.5Å(now 31.8,conf 1.00), N17@27.5Å(now 31.6,conf 1.00), T71@27.5Å(now 31.8,conf 1.00), P72@27.5Å(now 31.6,conf 1.00), E16@27.5Å(now 30.6,conf 1.00), S20@27.5Å(now 30.7,conf 1.00), N42@27.5Å(now 30.9,conf 1.00), E77@27.5Å(now 30.0,conf 1.00)
  - K75↔K58: targets 27.5/5.3Å but partners are 40.6Å apart → too_far_apart by 7.7Å
  - E74↔K58: targets 27.5/5.3Å but partners are 39.6Å apart → too_far_apart by 6.8Å
  - T73↔K58: targets 27.5/5.3Å but partners are 38.9Å apart → too_far_apart by 6.0Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=37 · 3-10(G)=31 · coil(C)=16

```
CEEGCCCEGEEEGCHHHHHEEGGEGGGGHEEGGCEGCECGGHHECGGCEGECEGEEGCHGEGEGGGEECEGEEHGEEEEEEGGEHHEHECCGGECGE
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=1 · sheet=51
  - A15 ↔ K19  (helix)
  - Q8 ↔ N24  (sheet)
  - Y10 ↔ N21  (sheet)
  - Y10 ↔ N24  (sheet)
  - S11 ↔ S20  (sheet)
  - S11 ↔ N21  (sheet)
  - S11 ↔ N24  (sheet)
  - R12 ↔ S20  (sheet)
  - R12 ↔ N21  (sheet)
  - R12 ↔ N24  (sheet)
  - N24 ↔ D38  (sheet)
  - F30 ↔ I35  (sheet)
  - D38 ↔ E44  (sheet)
  - D38 ↔ V49  (sheet)
  - D38 ↔ H51  (sheet)
  - V49 ↔ Y67  (sheet)
  - V49 ↔ T68  (sheet)
  - H51 ↔ Y67  (sheet)
  - H51 ↔ T68  (sheet)
  - H51 ↔ F70  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=31 · exposed=38 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=341 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=212 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4979 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2YXF.ensemble.pdb`)
- RMSF mean=0.026Å max=0.154Å (per-residue in .per_residue.csv)
- most flexible residues: 3, 51, 35, 25, 26

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2YXF.pae.csv`
- mean=0.019Å · max=0.17Å · AlphaFold-PAE analog (low block = rigid unit/domain)
