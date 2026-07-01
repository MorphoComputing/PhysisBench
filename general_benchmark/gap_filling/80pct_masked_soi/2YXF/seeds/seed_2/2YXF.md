# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2YXF\seeds\seed_2\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 2.629 A
- tm_score_ca_ordered: 0.7571766444258856
- heavy_atom_rmsd: 4.429 A
- sidechain_heavy_atom_rmsd: 5.471 A
- **all-atom quality (honest):** heavy 4.429 A, sidechain 5.471 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 1261
- bin_accuracy: 0.760

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=11 rmsd=3.926083815028964 -> 3.4980632826978093 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.6289207142872897
- ga_delta_rmsd: 0.7929361566746476  ga_fitness_mode: energy
- pre_local_rmsd: 2.6435564839621852  localized_anchor_rmsd: 2.6289274620833276

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I1-Q2 → 20 conflicts (38%); K19 → 10 conflicts (19%); E74 → 7 conflicts (14%)
- explained: 37/52 conflicts by 3 root cause(s)
- metrics: hubs=19 (frac 0.196), conflicts/hub=2.7, max_incompat=4.45Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I1-Q2 + K19 + E74 — explain ~37/52 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F62** — severity 11.87, 4 conflict(s); suspect input ~`K75` (group: pull_in)
  - pull-in (wants closer): K75@27.5Å(now 32.9,conf 1.00)
  - K58↔K75: targets 7.0/27.5Å but partners are 38.6Å apart → too_far_apart by 4.1Å
  - K75↔F56: targets 27.5/3.1Å but partners are 33.6Å apart → too_far_apart by 3.0Å
  - K75↔S57: targets 27.5/6.9Å but partners are 37.2Å apart → too_far_apart by 2.8Å
- **Y10** — severity 9.44, 6 conflict(s); suspect input ~`I7` (group: pull_in)
  - pull-in (wants closer): H51@14.5Å(now 17.4,conf 0.55)
  - push-out (wants farther): I1@27.5Å(now 22.3,conf 0.99), Q2@25.4Å(now 22.0,conf 0.70)
  - I1↔K6: targets 27.5/13.1Å but partners are 12.0Å apart → too_close_together by 2.4Å
  - I1↔I7: targets 27.5/10.1Å but partners are 14.3Å apart → too_close_together by 3.1Å
  - I1↔R3: targets 27.5/20.6Å but partners are 4.8Å apart → too_close_together by 2.1Å
- **I1** — severity 9.35, 5 conflict(s); suspect input ~`P5` (group: pull_in)
  - pull-in (wants closer): D34@13.0Å(now 17.0,conf 0.55)
  - push-out (wants farther): Y10@27.5Å(now 22.3,conf 0.99), V9@23.5Å(now 19.7,conf 0.99), Q8@19.0Å(now 16.3,conf 0.94), I7@18.9Å(now 14.3,conf 0.56)
  - Y10↔K6: targets 27.5/13.0Å but partners are 12.2Å apart → too_close_together by 2.2Å
  - P5↔I7: targets 9.4/18.9Å but partners are 5.5Å apart → too_close_together by 4.0Å
  - Y10↔P5: targets 27.5/9.4Å but partners are 15.4Å apart → too_close_together by 2.7Å
- **F56** — severity 7.99, 4 conflict(s); suspect input ~`D59` (group: push_out)
  - pull-in (wants closer): E74@27.5Å(now 33.2,conf 1.00)
  - push-out (wants farther): A15@27.2Å(now 23.7,conf 0.89)
  - E74↔D59: targets 27.5/7.6Å but partners are 38.9Å apart → too_far_apart by 3.8Å
  - S61↔E74: targets 5.0/27.5Å but partners are 35.0Å apart → too_far_apart by 2.5Å
  - E74↔F62: targets 27.5/3.1Å but partners are 32.9Å apart → too_far_apart by 2.3Å
- **Q2** — severity 7.57, 5 conflict(s); suspect input ~`Y10` (group: push_out)
  - pull-in (wants closer): T73@27.5Å(now 35.0,conf 1.00), E69@27.5Å(now 30.5,conf 1.00)
  - push-out (wants farther): Y10@25.4Å(now 22.0,conf 0.70)
  - P5↔Y10: targets 7.0/25.4Å but partners are 15.4Å apart → too_close_together by 3.1Å
  - Q8↔Y10: targets 16.0/25.4Å but partners are 7.0Å apart → too_close_together by 2.4Å
  - I7↔Y10: targets 13.0/25.4Å but partners are 10.5Å apart → too_close_together by 2.0Å
- **I7** — severity 7.51, 6 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): V27@4.8Å(now 7.3,conf 0.59), Y66@10.8Å(now 13.5,conf 0.55), T68@16.2Å(now 18.8,conf 0.55)
  - push-out (wants farther): E16@27.0Å(now 23.9,conf 0.85), K19@25.7Å(now 23.1,conf 0.70), I1@18.9Å(now 14.3,conf 0.56)
  - R3↔I1: targets 10.6/18.9Å but partners are 4.8Å apart → too_close_together by 3.5Å
  - Q2↔I1: targets 13.0/18.9Å but partners are 3.6Å apart → too_close_together by 2.3Å
  - T4↔I1: targets 8.6/18.9Å but partners are 8.1Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=38 · 3-10(G)=28 · coil(C)=14

```
CHEGGHHEGEEEEECHGGHECGCGEGEEHECCGHGECEGGGHGECGGEGGCHEEEEGGHEEEECHCEEEECEEHGHEGECEEEEHHCHEGGGGGGHE
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=1 · sheet=51
  - Q2 ↔ K6  (helix)
  - R3 ↔ Q8  (sheet)
  - Q8 ↔ C25  (sheet)
  - Q8 ↔ V27  (sheet)
  - Q8 ↔ S28  (sheet)
  - Y10 ↔ C25  (sheet)
  - S11 ↔ S20  (sheet)
  - S11 ↔ C25  (sheet)
  - R12 ↔ S20  (sheet)
  - R12 ↔ C25  (sheet)
  - H13 ↔ S20  (sheet)
  - P14 ↔ S20  (sheet)
  - C25 ↔ E36  (sheet)
  - C25 ↔ D38  (sheet)
  - V27 ↔ E36  (sheet)
  - V27 ↔ D38  (sheet)
  - S28 ↔ E36  (sheet)
  - F30 ↔ E36  (sheet)
  - E36 ↔ L54  (sheet)
  - D38 ↔ E44  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=47 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=365 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=226 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7956 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
