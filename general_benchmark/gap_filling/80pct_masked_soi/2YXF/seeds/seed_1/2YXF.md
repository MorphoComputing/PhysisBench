# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2YXF\seeds\seed_1\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 2.341 A
- tm_score_ca_ordered: 0.804114871442377
- heavy_atom_rmsd: 4.077 A
- sidechain_heavy_atom_rmsd: 5.037 A
- **all-atom quality (honest):** heavy 4.077 A, sidechain 5.037 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 1251
- bin_accuracy: 0.793

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=51
- rigid_domain_reconvergence: applied=True accepted=15 rmsd=5.86828452751187 -> 5.212639601303156 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.3409491968158704
- ga_delta_rmsd: 2.8049048951991047  ga_fitness_mode: energy
- pre_local_rmsd: 2.3597614862495297  localized_anchor_rmsd: 2.3409161702721386

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I1-Q2 → 25 conflicts (48%); P14 → 9 conflicts (17%); K6-I7 → 4 conflicts (8%)
- explained: 38/52 conflicts by 3 root cause(s)
- metrics: hubs=16 (frac 0.165), conflicts/hub=3.2, max_incompat=5.31Å, chain_span=0.856
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I1-Q2 + P14 + K6-I7 — explain ~38/52 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P14** — severity 22.54, 9 conflict(s); suspect input ~`N17` (group: pull_in)
  - pull-in (wants closer): S88@27.5Å(now 34.7,conf 1.00), Q89@27.5Å(now 33.4,conf 1.00), T86@27.5Å(now 31.3,conf 1.00)
  - S88↔N17: targets 27.5/7.0Å but partners are 39.4Å apart → too_far_apart by 4.9Å
  - S88↔K19: targets 27.5/5.4Å but partners are 37.1Å apart → too_far_apart by 4.2Å
  - Q89↔N17: targets 27.5/7.0Å but partners are 37.6Å apart → too_far_apart by 3.1Å
- **Y10** — severity 15.99, 9 conflict(s); suspect input ~`Q2` (group: push_out)
  - push-out (wants farther): I1@27.5Å(now 22.7,conf 0.99), Q2@25.4Å(now 22.4,conf 0.70), T73@14.8Å(now 10.0,conf 0.55)
  - I1↔K6: targets 27.5/13.0Å but partners are 10.8Å apart → too_close_together by 3.7Å
  - I1↔R3: targets 27.5/20.0Å but partners are 4.4Å apart → too_close_together by 3.1Å
  - I1↔I7: targets 27.5/10.1Å but partners are 13.9Å apart → too_close_together by 3.4Å
- **I1** — severity 9.34, 5 conflict(s); suspect input ~`I7` (group: pull_in)
  - pull-in (wants closer): D34@13.0Å(now 17.4,conf 0.55)
  - push-out (wants farther): Y10@27.5Å(now 22.7,conf 0.99), I7@18.9Å(now 13.9,conf 0.56)
  - Y10↔P5: targets 27.5/9.1Å but partners are 16.0Å apart → too_close_together by 2.4Å
  - P5↔I7: targets 9.1/18.9Å but partners are 5.9Å apart → too_close_together by 3.8Å
  - Y10↔K6: targets 27.5/12.0Å but partners are 12.6Å apart → too_close_together by 2.9Å
- **Q2** — severity 8.20, 5 conflict(s); suspect input ~`Y10` (group: pull_in)
  - pull-in (wants closer): T73@27.5Å(now 31.7,conf 1.00)
  - push-out (wants farther): L23@27.4Å(now 24.7,conf 0.94), Y10@25.4Å(now 22.4,conf 0.70), K6@12.7Å(now 10.2,conf 0.55), S28@12.6Å(now 9.4,conf 0.55)
  - P5↔L23: targets 7.0/27.4Å but partners are 18.1Å apart → too_close_together by 2.3Å
  - P5↔Y10: targets 7.0/25.4Å but partners are 16.0Å apart → too_close_together by 2.4Å
  - Q8↔Y10: targets 16.0/25.4Å but partners are 7.2Å apart → too_close_together by 2.2Å
- **K6** — severity 5.56, 3 conflict(s); suspect input ~`V9` (group: pull_in)
  - pull-in (wants closer): L64@10.4Å(now 13.8,conf 0.55)
  - push-out (wants farther): K75@27.1Å(now 21.2,conf 0.86), Q2@12.7Å(now 10.2,conf 0.55)
  - K75↔V9: targets 27.1/10.0Å but partners are 13.6Å apart → too_close_together by 3.5Å
  - Y10↔K75: targets 13.0/27.1Å but partners are 12.0Å apart → too_close_together by 2.0Å
  - R3↔Q2: targets 7.0/12.7Å but partners are 3.4Å apart → too_close_together by 2.4Å
- **L23** — severity 5.45, 3 conflict(s); suspect input ~`Y26` (group: push_out)
  - push-out (wants farther): Q2@27.4Å(now 24.7,conf 0.94)
  - Q2↔Y26: targets 27.4/9.4Å but partners are 15.0Å apart → too_close_together by 2.9Å
  - V27↔Q2: targets 13.0/27.4Å but partners are 12.0Å apart → too_close_together by 2.4Å
  - Q2↔S28: targets 27.4/16.2Å but partners are 9.4Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=35 · 3-10(G)=29 · coil(C)=14

```
CHHHHGHEGEEEEECHGHECEGGEGGEEHEECGHEECEGGGHGECGHCEGEHECEGGEHHEEECHCEECGGEECCEHGEGGGGEHHEHEGGGGEGGC
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=1 · sheet=49
  - R3 ↔ I7  (helix)
  - Q8 ↔ N24  (sheet)
  - Q8 ↔ V27  (sheet)
  - Q8 ↔ S28  (sheet)
  - Y10 ↔ N21  (sheet)
  - Y10 ↔ N24  (sheet)
  - Y10 ↔ V27  (sheet)
  - S11 ↔ K19  (sheet)
  - S11 ↔ N21  (sheet)
  - S11 ↔ N24  (sheet)
  - R12 ↔ K19  (sheet)
  - R12 ↔ N21  (sheet)
  - R12 ↔ N24  (sheet)
  - H13 ↔ K19  (sheet)
  - H13 ↔ N21  (sheet)
  - H13 ↔ N24  (sheet)
  - P14 ↔ K19  (sheet)
  - P14 ↔ N21  (sheet)
  - P14 ↔ N24  (sheet)
  - N24 ↔ D38  (sheet)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=370 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=236 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6353 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
