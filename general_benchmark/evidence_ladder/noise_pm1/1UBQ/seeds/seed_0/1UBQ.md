# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1UBQ\seeds\seed_0\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 0.480 A
- tm_score_ca_ordered: 0.9760296735548708
- heavy_atom_rmsd: 2.653 A
- sidechain_heavy_atom_rmsd: 3.463 A
- **all-atom quality (honest):** heavy 2.653 A, sidechain 3.463 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 2556
- bin_accuracy: 0.665

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=0.6709802467646683 -> 0.5604441788213561 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4801960238795552
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.48776754063294975  localized_anchor_rmsd: 0.48023367492674357

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K10-I12 → 15 conflicts (44%); Q1 → 4 conflicts (12%)
- explained: 19/34 conflicts by 2 root cause(s)
- metrics: hubs=17 (frac 0.23), conflicts/hub=2.0, max_incompat=3.81Å, chain_span=0.878
- **fix-first:** [LOW_CONFLICT] Root cause(s): K10-I12 + Q1 — explain ~19/34 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I12** — severity 3.98, 5 conflict(s); suspect input ~`Q1` (group: pull_in)
  - pull-in (wants closer): Q1@7.5Å(now 10.2,conf 0.36)
  - push-out (wants farther): P18@20.6Å(now 17.6,conf 0.42)
  - T8↔Q1: targets 9.7/7.5Å but partners are 20.4Å apart → too_far_apart by 3.2Å
  - P18↔Q1: targets 20.6/7.5Å but partners are 10.5Å apart → too_close_together by 2.6Å
  - E33↔Q1: targets 7.0/7.5Å but partners are 16.8Å apart → too_far_apart by 2.2Å
- **N59** — severity 3.05, 3 conflict(s); suspect input ~`K5` (group: pull_in)
  - pull-in (wants closer): G74@27.5Å(now 33.0,conf 0.99), T11@18.2Å(now 20.8,conf 0.37), K5@15.5Å(now 18.0,conf 0.34)
  - G9↔K5: targets 26.1/15.5Å but partners are 6.8Å apart → too_close_together by 3.8Å
  - K10↔K5: targets 24.2/15.5Å but partners are 6.2Å apart → too_close_together by 2.6Å
  - K10↔T11: targets 24.2/18.2Å but partners are 3.6Å apart → too_close_together by 2.4Å
- **Q1** — severity 2.60, 3 conflict(s); suspect input ~`K62` (group: pull_in)
  - pull-in (wants closer): G74@27.4Å(now 33.1,conf 0.97), R73@27.4Å(now 30.4,conf 0.97), R41@16.2Å(now 19.6,conf 0.35), I12@7.5Å(now 10.2,conf 0.36)
  - G74↔K62: targets 27.4/5.2Å but partners are 34.8Å apart → too_far_apart by 2.2Å
  - K10↔I12: targets 16.5/7.5Å but partners are 6.5Å apart → too_close_together by 2.5Å
  - K62↔I12: targets 5.2/7.5Å but partners are 14.5Å apart → too_far_apart by 1.9Å
- **R41** — severity 2.57, 3 conflict(s); suspect input ~`G74` (group: pull_in)
  - pull-in (wants closer): Q1@16.2Å(now 19.6,conf 0.35), K10@13.0Å(now 16.1,conf 0.34)
  - Q1↔G74: targets 16.2/13.7Å but partners are 33.1Å apart → too_far_apart by 3.2Å
  - Q1↔R71: targets 16.2/6.3Å but partners are 25.0Å apart → too_far_apart by 2.5Å
  - E50↔K10: targets 8.0/13.0Å but partners are 22.9Å apart → too_far_apart by 1.9Å
- **P18** — severity 2.20, 3 conflict(s); suspect input ~`I2` (group: push_out)
  - pull-in (wants closer): G74@27.4Å(now 33.1,conf 0.97), R73@26.8Å(now 29.8,conf 0.80)
  - push-out (wants farther): I12@20.6Å(now 17.6,conf 0.42)
  - I12↔I2: targets 20.6/9.4Å but partners are 8.5Å apart → too_close_together by 2.8Å
  - I12↔T13: targets 20.6/14.7Å but partners are 3.8Å apart → too_close_together by 2.2Å
  - I12↔F3: targets 20.6/13.2Å but partners are 5.9Å apart → too_close_together by 1.5Å
- **P36** — severity 1.64, 2 conflict(s); suspect input ~`L66` (group: pull_in)
  - pull-in (wants closer): L66@14.1Å(now 17.3,conf 0.34)
  - S64↔L66: targets 23.8/14.1Å but partners are 6.6Å apart → too_close_together by 3.1Å
  - T65↔L66: targets 19.2/14.1Å but partners are 3.4Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=25 · 3-10(G)=24 · coil(C)=4

```
EEEGGEHEHEEGEGEEEHHEEGHHHHHHHHGEHHEGHHGEGGCEHGEGGECHEEGHHGGGGGHEEGEGGEGGCC
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=8 · sheet=29
  - S19 ↔ E23  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - V25 ↔ I29  (helix)
  - K26 ↔ Q30  (helix)
  - Q30 ↔ G34  (helix)
  - G34 ↔ D38  (helix)
  - G52 ↔ S56  (helix)
  - Q1 ↔ T11  (sheet)
  - Q1 ↔ T13  (sheet)
  - Q1 ↔ E15  (sheet)
  - Q1 ↔ V16  (sheet)
  - Q1 ↔ E17  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ T13  (sheet)
  - I2 ↔ E15  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ E17  (sheet)
  - F3 ↔ K10  (sheet)
  - F3 ↔ T11  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=43 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=243 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=110 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1123 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
