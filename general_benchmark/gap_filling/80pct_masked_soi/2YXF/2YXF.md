# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2YXF\seeds\seed_7\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 2.293 A
- tm_score_ca_ordered: 0.8332585689818904
- heavy_atom_rmsd: 4.014 A
- sidechain_heavy_atom_rmsd: 4.955 A
- **all-atom quality (honest):** heavy 4.014 A, sidechain 4.955 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 1251
- bin_accuracy: 0.802

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=4.527647732060153 -> 3.9454606630988254 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.293391021924517
- ga_delta_rmsd: 1.610874858438378  ga_fitness_mode: energy
- pre_local_rmsd: 2.3157857634821766  localized_anchor_rmsd: 2.293382389728666

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G18-K19 → 22 conflicts (56%); I1 → 7 conflicts (18%); H13-P14 → 4 conflicts (10%)
- explained: 33/39 conflicts by 3 root cause(s)
- metrics: hubs=13 (frac 0.134), conflicts/hub=3.0, max_incompat=5.23Å, chain_span=0.629
- **fix-first:** [LOW_CONFLICT] Root cause(s): G18-K19 + I1 + H13-P14 — explain ~33/39 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H13** — severity 21.35, 9 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 33.0,conf 1.00), V85@27.5Å(now 31.8,conf 1.00), P32@27.5Å(now 30.4,conf 1.00), L87@27.5Å(now 30.4,conf 1.00)
  - I1↔G18: targets 27.5/5.1Å but partners are 37.6Å apart → too_far_apart by 5.0Å
  - V85↔G18: targets 27.5/5.1Å but partners are 36.3Å apart → too_far_apart by 3.7Å
  - I1↔N17: targets 27.5/7.2Å but partners are 37.9Å apart → too_far_apart by 3.2Å
- **P14** — severity 15.04, 7 conflict(s); suspect input ~`N17` (group: pull_in)
  - pull-in (wants closer): S88@27.5Å(now 34.1,conf 1.00), Q89@27.5Å(now 32.6,conf 1.00), T86@27.5Å(now 32.0,conf 1.00)
  - S88↔N17: targets 27.5/5.6Å but partners are 38.3Å apart → too_far_apart by 5.2Å
  - Q89↔N17: targets 27.5/5.6Å but partners are 36.6Å apart → too_far_apart by 3.5Å
  - T86↔N17: targets 27.5/5.6Å but partners are 36.5Å apart → too_far_apart by 3.4Å
- **I7** — severity 11.26, 8 conflict(s); suspect input ~`I1` (group: push_out)
  - push-out (wants farther): K19@25.7Å(now 23.0,conf 0.70), I1@18.9Å(now 15.6,conf 0.56)
  - Q2↔I1: targets 13.0/18.9Å but partners are 2.6Å apart → too_close_together by 3.2Å
  - R3↔I1: targets 9.4/18.9Å but partners are 6.3Å apart → too_close_together by 3.2Å
  - K19↔R12: targets 25.7/16.1Å but partners are 6.6Å apart → too_close_together by 3.0Å
- **K19** — severity 4.15, 3 conflict(s); suspect input ~`I7` (group: pull_in)
  - pull-in (wants closer): P32@27.5Å(now 32.8,conf 1.00), T4@27.5Å(now 30.4,conf 1.00)
  - push-out (wants farther): I7@25.7Å(now 23.0,conf 0.70), Q8@22.2Å(now 19.4,conf 0.65), A15@8.9Å(now 5.6,conf 0.55), Y67@16.2Å(now 13.3,conf 0.55), Y10@16.1Å(now 13.5,conf 0.55)
  - R12↔I7: targets 7.0/25.7Å but partners are 16.4Å apart → too_close_together by 2.2Å
  - R12↔Q8: targets 7.0/22.2Å but partners are 12.9Å apart → too_close_together by 2.3Å
  - R12↔Y10: targets 7.0/16.1Å but partners are 7.1Å apart → too_close_together by 2.0Å
- **F62** — severity 4.05, 2 conflict(s); suspect input ~`F56` (group: pull_in)
  - pull-in (wants closer): K75@27.5Å(now 30.6,conf 1.00)
  - K75↔F56: targets 27.5/3.0Å but partners are 33.0Å apart → too_far_apart by 2.5Å
  - K75↔K58: targets 27.5/7.0Å but partners are 36.2Å apart → too_far_apart by 1.7Å
- **I1** — severity 3.31, 2 conflict(s); suspect input ~`I7` (group: push_out)
  - pull-in (wants closer): R97@27.5Å(now 30.6,conf 1.00), H13@27.5Å(now 33.0,conf 1.00)
  - push-out (wants farther): I7@18.9Å(now 15.6,conf 0.56), Y63@15.6Å(now 12.5,conf 0.55), T4@10.3Å(now 7.8,conf 0.55)
  - P5↔I7: targets 9.4/18.9Å but partners are 5.8Å apart → too_close_together by 3.7Å
  - K6↔I7: targets 13.0/18.9Å but partners are 3.6Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=43 · 3-10(G)=24 · coil(C)=16

```
CEEHCCCEGEEEGEHHEHGHCEHEGGCEGECCCHEGGEGGGHGEEGGCEGEHEEECEGHCEEEEGEEEEEEGGHCEEGEEEGEEHHEHECCGGECGE
```

## Backbone H-bond Network

- total=73 · helix(i→i+4)=1 · sheet=72
  - E16 ↔ S20  (helix)
  - Q8 ↔ N24  (sheet)
  - Q8 ↔ S28  (sheet)
  - Y10 ↔ F22  (sheet)
  - Y10 ↔ N24  (sheet)
  - S11 ↔ F22  (sheet)
  - S11 ↔ N24  (sheet)
  - R12 ↔ N17  (sheet)
  - R12 ↔ F22  (sheet)
  - R12 ↔ N24  (sheet)
  - P14 ↔ F22  (sheet)
  - P14 ↔ N24  (sheet)
  - N17 ↔ F22  (sheet)
  - N24 ↔ D38  (sheet)
  - S28 ↔ I35  (sheet)
  - F30 ↔ I35  (sheet)
  - I35 ↔ L54  (sheet)
  - D38 ↔ E44  (sheet)
  - D38 ↔ R45  (sheet)
  - D38 ↔ V49  (sheet)
  - … +53 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=46 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=375 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=239 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6006 (restraint satisfaction; lower=better)
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

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`2YXF.ensemble.pdb`)
- RMSF mean=4.563Å max=9.641Å (per-residue in .per_residue.csv)
- most flexible residues: 47, 48, 1, 50, 59

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=25.0 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 24, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2YXF.pae.csv`
- mean=1.712Å · max=5.626Å · AlphaFold-PAE analog (low block = rigid unit/domain)
