# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\2YXF\seeds\seed_1\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 0.716 A
- tm_score_ca_ordered: 0.9694226001112325
- heavy_atom_rmsd: 3.347 A
- sidechain_heavy_atom_rmsd: 4.354 A
- **all-atom quality (honest):** heavy 3.347 A, sidechain 4.354 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 2218
- bin_accuracy: 0.929

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7156243413392557
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.7217245054780098  localized_anchor_rmsd: 0.715636544869085

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T73-K75 → 55 conflicts (54%); N17-G18 → 22 conflicts (22%); I1-Q2 → 11 conflicts (11%)
- explained: 88/102 conflicts by 3 root cause(s)
- metrics: hubs=31 (frac 0.32), conflicts/hub=3.3, max_incompat=6.4Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T73-K75 + N17-G18 + I1-Q2 — explain ~88/102 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H31** — severity 20.59, 9 conflict(s); suspect input ~`Q2` (group: pull_in)
  - pull-in (wants closer): K19@27.5Å(now 34.2,conf 1.00), T73@27.5Å(now 34.4,conf 1.00), G18@27.5Å(now 33.3,conf 1.00), N17@27.5Å(now 33.4,conf 1.00), E16@27.5Å(now 32.7,conf 1.00), S20@27.5Å(now 31.8,conf 1.00), D76@27.5Å(now 31.9,conf 1.00), P72@27.5Å(now 31.4,conf 1.00)
  - K19↔Q2: targets 27.5/4.9Å but partners are 38.2Å apart → too_far_apart by 5.8Å
  - N17↔Q2: targets 27.5/4.9Å but partners are 37.8Å apart → too_far_apart by 5.4Å
  - G18↔Q2: targets 27.5/4.9Å but partners are 37.4Å apart → too_far_apart by 5.0Å
- **F62** — severity 18.79, 8 conflict(s); suspect input ~`D59` (group: pull_in)
  - pull-in (wants closer): K75@27.5Å(now 33.4,conf 1.00), E74@27.5Å(now 33.1,conf 1.00)
  - K75↔D59: targets 27.5/7.9Å but partners are 40.7Å apart → too_far_apart by 5.4Å
  - K75↔K58: targets 27.5/8.0Å but partners are 40.5Å apart → too_far_apart by 5.0Å
  - E74↔D59: targets 27.5/7.9Å but partners are 40.3Å apart → too_far_apart by 4.9Å
- **F56** — severity 14.11, 7 conflict(s); suspect input ~`D59` (group: pull_in)
  - pull-in (wants closer): E74@27.5Å(now 35.2,conf 1.00), T73@27.5Å(now 34.1,conf 1.00), D76@27.5Å(now 32.9,conf 1.00), N42@27.5Å(now 30.8,conf 1.00), E77@27.5Å(now 30.2,conf 1.00)
  - E74↔D59: targets 27.5/6.4Å but partners are 40.3Å apart → too_far_apart by 6.4Å
  - T73↔D59: targets 27.5/6.4Å but partners are 39.3Å apart → too_far_apart by 5.4Å
  - D76↔D59: targets 27.5/6.4Å but partners are 37.7Å apart → too_far_apart by 3.8Å
- **E77** — severity 13.72, 8 conflict(s); suspect input ~`E74` (group: pull_in)
  - pull-in (wants closer): D59@27.5Å(now 34.8,conf 1.00), K58@27.5Å(now 34.7,conf 1.00), I1@27.5Å(now 32.8,conf 1.00), W60@27.5Å(now 32.4,conf 1.00), S57@27.5Å(now 32.4,conf 1.00), Q2@27.5Å(now 30.7,conf 1.00), F56@27.5Å(now 30.2,conf 1.00)
  - D59↔E74: targets 27.5/8.2Å but partners are 40.3Å apart → too_far_apart by 4.6Å
  - K58↔E74: targets 27.5/8.2Å but partners are 39.8Å apart → too_far_apart by 4.1Å
  - I1↔E74: targets 27.5/8.2Å but partners are 39.1Å apart → too_far_apart by 3.4Å
- **P14** — severity 11.81, 7 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): S88@27.5Å(now 34.9,conf 1.00), V85@27.5Å(now 33.1,conf 1.00), Q89@27.5Å(now 33.0,conf 1.00), T86@27.5Å(now 32.6,conf 1.00), L87@27.5Å(now 31.9,conf 1.00), P32@27.5Å(now 30.7,conf 1.00)
  - S88↔G18: targets 27.5/5.5Å but partners are 38.1Å apart → too_far_apart by 5.0Å
  - V85↔G18: targets 27.5/5.5Å but partners are 36.9Å apart → too_far_apart by 3.9Å
  - T86↔G18: targets 27.5/5.5Å but partners are 36.3Å apart → too_far_apart by 3.3Å
- **R97** — severity 8.88, 5 conflict(s); suspect input ~`E74` (group: pull_in)
  - pull-in (wants closer): D59@27.5Å(now 33.8,conf 1.00), K58@27.5Å(now 32.9,conf 1.00), W60@27.5Å(now 31.2,conf 1.00)
  - D59↔E74: targets 27.5/8.0Å but partners are 40.3Å apart → too_far_apart by 4.8Å
  - K58↔E74: targets 27.5/8.0Å but partners are 39.8Å apart → too_far_apart by 4.3Å
  - W60↔E74: targets 27.5/8.0Å but partners are 38.0Å apart → too_far_apart by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=37 · 3-10(G)=38 · coil(C)=13

```
CEGGECCEGEEEGCGHGGGEEGGEGGGGHEEGGHEGCEGGGHGECGGCEGECEGEGGEHEEGEGGGEECECEEHGEGEEEEGGEHHEHEGCGGECCE
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=0 · sheet=47
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
  - D53 ↔ Y63  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=40 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=339 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=211 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5082 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
