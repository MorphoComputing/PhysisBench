# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2YXF\seeds\seed_9\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 2.473 A
- tm_score_ca_ordered: 0.7846258192745242
- heavy_atom_rmsd: 4.380 A
- sidechain_heavy_atom_rmsd: 5.484 A
- **all-atom quality (honest):** heavy 4.380 A, sidechain 5.484 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.010
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 1253
- bin_accuracy: 0.745

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=13 rmsd=3.1025304272974923 -> 2.5712865439490624 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.4725686415054016
- ga_delta_rmsd: -0.425767540799197  ga_fitness_mode: energy
- pre_local_rmsd: 2.490358828281368  localized_anchor_rmsd: 2.4725739115771823

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K6-I7 → 8 conflicts (38%); N17-G18 → 8 conflicts (38%)
- explained: 16/21 conflicts by 2 root cause(s)
- metrics: hubs=9 (frac 0.093), conflicts/hub=2.3, max_incompat=4.19Å, chain_span=0.68
- **fix-first:** [LOW_CONFLICT] Root cause(s): K6-I7 + N17-G18 — explain ~16/21 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P14** — severity 10.38, 7 conflict(s); suspect input ~`N17` (group: push_out)
  - pull-in (wants closer): S88@27.5Å(now 33.6,conf 1.00), Q89@27.5Å(now 32.0,conf 1.00), T86@27.5Å(now 31.0,conf 1.00), P32@27.5Å(now 30.1,conf 1.00)
  - push-out (wants farther): K19@8.1Å(now 3.2,conf 0.79), N21@8.6Å(now 5.7,conf 0.79), S20@9.6Å(now 6.3,conf 0.69)
  - S88↔N17: targets 27.5/6.4Å but partners are 38.1Å apart → too_far_apart by 4.2Å
  - S88↔G18: targets 27.5/5.5Å but partners are 36.4Å apart → too_far_apart by 3.4Å
  - Q89↔N17: targets 27.5/6.4Å but partners are 36.2Å apart → too_far_apart by 2.3Å
- **I7** — severity 4.39, 3 conflict(s); suspect input ~`I1` (group: push_out)
  - push-out (wants farther): I1@18.9Å(now 15.9,conf 0.56)
  - R3↔I1: targets 10.0/18.9Å but partners are 5.9Å apart → too_close_together by 3.0Å
  - Q2↔I1: targets 13.0/18.9Å but partners are 3.2Å apart → too_close_together by 2.7Å
  - T4↔I1: targets 8.6/18.9Å but partners are 8.1Å apart → too_close_together by 2.2Å
- **F62** — severity 3.48, 2 conflict(s); suspect input ~`K58` (group: pull_in)
  - pull-in (wants closer): K75@27.5Å(now 31.2,conf 1.00)
  - K75↔K58: targets 27.5/7.1Å but partners are 36.8Å apart → too_far_apart by 2.2Å
  - K75↔F56: targets 27.5/4.6Å but partners are 34.0Å apart → too_far_apart by 1.9Å
- **R45** — severity 3.45, 3 conflict(s); suspect input ~`D38` (group: push_out)
  - pull-in (wants closer): I1@27.5Å(now 30.0,conf 1.00)
  - push-out (wants farther): K6@19.9Å(now 17.3,conf 0.58)
  - K6↔D38: targets 19.9/6.2Å but partners are 11.1Å apart → too_close_together by 2.6Å
  - K6↔V82: targets 19.9/11.5Å but partners are 6.5Å apart → too_close_together by 1.9Å
  - L39↔K6: targets 5.0/19.9Å but partners are 13.2Å apart → too_close_together by 1.7Å
- **I1** — severity 3.00, 2 conflict(s); suspect input ~`I7` (group: push_out)
  - pull-in (wants closer): H13@27.5Å(now 31.0,conf 1.00), R45@27.5Å(now 30.0,conf 1.00), D34@13.0Å(now 16.2,conf 0.55)
  - push-out (wants farther): I7@18.9Å(now 15.9,conf 0.56)
  - P5↔I7: targets 9.4/18.9Å but partners are 5.7Å apart → too_close_together by 3.7Å
  - K6↔I7: targets 12.6/18.9Å but partners are 4.7Å apart → too_close_together by 1.6Å
- **G18** — severity 2.77, 1 conflict(s); suspect input ~`A15` (group: pull_in)
  - pull-in (wants closer): Q89@27.5Å(now 34.6,conf 1.00)
  - Q89↔A15: targets 27.5/5.0Å but partners are 35.3Å apart → too_far_apart by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=40 · 3-10(G)=22 · coil(C)=15

```
CEHGEHCHEEEGHCHHCHCGGEHEGGCEHEECCHEEEEGGEHHEEGGHHGHHEEECEECECEEECEEGEEEGGGHEEGGECGEEHHCHEGCGGEGEE
```

## Backbone H-bond Network

- total=54 · helix(i→i+4)=1 · sheet=53
  - K48 ↔ S52  (helix)
  - V9 ↔ F22  (sheet)
  - V9 ↔ N24  (sheet)
  - Y10 ↔ F22  (sheet)
  - Y10 ↔ N24  (sheet)
  - S11 ↔ F22  (sheet)
  - S11 ↔ N24  (sheet)
  - N24 ↔ V37  (sheet)
  - N24 ↔ D38  (sheet)
  - S28 ↔ I35  (sheet)
  - S28 ↔ E36  (sheet)
  - S28 ↔ V37  (sheet)
  - F30 ↔ I35  (sheet)
  - F30 ↔ E36  (sheet)
  - I35 ↔ L54  (sheet)
  - V37 ↔ R45  (sheet)
  - V37 ↔ D53  (sheet)
  - D38 ↔ E44  (sheet)
  - D38 ↔ R45  (sheet)
  - D53 ↔ F62  (sheet)
  - … +34 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=49 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=368 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=233 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.766 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0103

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
