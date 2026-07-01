# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1UBQ\seeds\seed_1\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 0.475 A
- tm_score_ca_ordered: 0.9764037418830117
- heavy_atom_rmsd: 2.865 A
- sidechain_heavy_atom_rmsd: 3.734 A
- **all-atom quality (honest):** heavy 2.865 A, sidechain 3.734 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 2556
- bin_accuracy: 0.672

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=0.6680675175094495 -> 0.5548933065878073 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.474547717437864
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.4818719923112424  localized_anchor_rmsd: 0.4745400496484204

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K10-T13 → 25 conflicts (56%); Q1 → 4 conflicts (9%); K62 → 3 conflicts (7%)
- explained: 32/45 conflicts by 3 root cause(s)
- metrics: hubs=20 (frac 0.27), conflicts/hub=2.2, max_incompat=3.82Å, chain_span=0.986
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K10-T13 + Q1 + K62 — explain ~32/45 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T13** — severity 4.82, 7 conflict(s); suspect input ~`K10` (group: pull_in)
  - pull-in (wants closer): I29@7.4Å(now 9.9,conf 0.36), V16@7.6Å(now 10.1,conf 0.36)
  - V16↔K10: targets 7.6/8.9Å but partners are 19.1Å apart → too_far_apart by 2.6Å
  - P37↔I29: targets 17.4/7.4Å but partners are 7.5Å apart → too_close_together by 2.5Å
  - D20↔V16: targets 16.5/7.6Å but partners are 6.7Å apart → too_close_together by 2.2Å
- **I12** — severity 4.06, 5 conflict(s); suspect input ~`Q1` (group: pull_in)
  - pull-in (wants closer): Q1@7.5Å(now 10.2,conf 0.36)
  - push-out (wants farther): P18@20.6Å(now 17.6,conf 0.42)
  - T8↔Q1: targets 9.7/7.5Å but partners are 20.4Å apart → too_far_apart by 3.2Å
  - P18↔Q1: targets 20.6/7.5Å but partners are 10.5Å apart → too_close_together by 2.6Å
  - E33↔Q1: targets 7.0/7.5Å but partners are 16.7Å apart → too_far_apart by 2.2Å
- **R41** — severity 2.60, 3 conflict(s); suspect input ~`G74` (group: pull_in)
  - pull-in (wants closer): Q1@16.2Å(now 19.7,conf 0.35), K10@13.0Å(now 16.2,conf 0.34)
  - Q1↔G74: targets 16.2/13.7Å but partners are 33.1Å apart → too_far_apart by 3.2Å
  - Q1↔R71: targets 16.2/6.3Å but partners are 25.0Å apart → too_far_apart by 2.5Å
  - E50↔K10: targets 8.0/13.0Å but partners are 23.0Å apart → too_far_apart by 1.9Å
- **Q1** — severity 2.56, 3 conflict(s); suspect input ~`K62` (group: pull_in)
  - pull-in (wants closer): G74@27.4Å(now 33.1,conf 0.97), R73@27.4Å(now 30.4,conf 0.97), R41@16.2Å(now 19.7,conf 0.35), I12@7.5Å(now 10.2,conf 0.36)
  - G74↔K62: targets 27.4/5.2Å but partners are 34.8Å apart → too_far_apart by 2.2Å
  - K10↔I12: targets 16.5/7.5Å but partners are 6.5Å apart → too_close_together by 2.5Å
  - K62↔I12: targets 5.2/7.5Å but partners are 14.4Å apart → too_far_apart by 1.8Å
- **V16** — severity 2.50, 3 conflict(s); suspect input ~`T11` (group: pull_in)
  - pull-in (wants closer): G74@27.2Å(now 31.1,conf 0.88), T13@7.6Å(now 10.1,conf 0.36)
  - T11↔T13: targets 17.2/7.6Å but partners are 6.4Å apart → too_close_together by 3.2Å
  - G9↔T13: targets 22.8/7.6Å but partners are 12.9Å apart → too_close_together by 2.4Å
  - I12↔T13: targets 12.9/7.6Å but partners are 3.8Å apart → too_close_together by 1.5Å
- **P18** — severity 2.24, 3 conflict(s); suspect input ~`I2` (group: push_out)
  - pull-in (wants closer): G74@27.4Å(now 33.1,conf 0.97), R73@26.8Å(now 29.9,conf 0.80)
  - push-out (wants farther): I12@20.6Å(now 17.6,conf 0.42)
  - I12↔I2: targets 20.6/9.4Å but partners are 8.4Å apart → too_close_together by 2.8Å
  - I12↔T13: targets 20.6/14.7Å but partners are 3.8Å apart → too_close_together by 2.2Å
  - I12↔F3: targets 20.6/13.2Å but partners are 5.9Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=23 · 3-10(G)=21 · coil(C)=7

```
CEEGGEHEHEEGGGEEEHHEEHHHHHHHHHGEHHEGHHCEGGCEHGEGGECHEEHHHGGGECHEEGEGGGGGCC
```

## Backbone H-bond Network

- total=32 · helix(i→i+4)=10 · sheet=22
  - P18 ↔ I22  (helix)
  - S19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - V25 ↔ I29  (helix)
  - K26 ↔ Q30  (helix)
  - Q30 ↔ G34  (helix)
  - G34 ↔ D38  (helix)
  - G52 ↔ S56  (helix)
  - I2 ↔ T11  (sheet)
  - I2 ↔ E15  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ E17  (sheet)
  - F3 ↔ K10  (sheet)
  - F3 ↔ T11  (sheet)
  - F3 ↔ E15  (sheet)
  - F3 ↔ V16  (sheet)
  - T6 ↔ T11  (sheet)
  - E15 ↔ D20  (sheet)
  - … +12 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=43 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=245 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=112 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1092 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
