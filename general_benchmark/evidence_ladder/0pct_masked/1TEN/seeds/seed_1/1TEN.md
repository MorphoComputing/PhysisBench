# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1TEN/sequence/1TEN.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1TEN/seeds/seed_1/1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 0.089 A
- tm_score_ca_ordered: 0.9993034244890798
- heavy_atom_rmsd: 2.800 A
- sidechain_heavy_atom_rmsd: 3.642 A
- **all-atom quality (honest):** heavy 2.800 A, sidechain 3.642 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.023
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3655
- bin_accuracy: 0.977

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.089404244131587
- ga_delta_rmsd: 0.004036760946037499  ga_fitness_mode: energy
- pre_local_rmsd: 0.09202797135049172  localized_anchor_rmsd: 0.08935010553248335

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P63-D64 → 70 conflicts (73%); R75-M78 → 21 conflicts (22%)
- explained: 91/96 conflicts by 2 root cause(s)
- metrics: hubs=22 (frac 0.25), conflicts/hub=4.4, max_incompat=5.12Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P63-D64 + R75-M78 — explain ~91/96 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D14** — severity 28.00, 15 conflict(s); suspect input ~`P63` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 37.3,conf 1.00), G76@27.5Å(now 36.4,conf 1.00), M78@27.5Å(now 35.6,conf 1.00), E27@27.5Å(now 35.3,conf 1.00), A26@27.5Å(now 35.2,conf 1.00), R75@27.5Å(now 34.5,conf 1.00), L1@27.5Å(now 34.2,conf 1.00), L25@27.5Å(now 33.5,conf 1.00), I28@27.5Å(now 33.1,conf 1.00), D29@27.5Å(now 32.5,conf 1.00), S79@27.5Å(now 32.2,conf 1.00), D2@27.5Å(now 32.2,conf 1.00), S80@27.5Å(now 31.1,conf 1.00), R74@27.5Å(now 31.0,conf 1.00)
  - D77↔P63: targets 27.5/4.7Å but partners are 37.1Å apart → too_far_apart by 4.9Å
  - E27↔P63: targets 27.5/4.7Å but partners are 36.8Å apart → too_far_apart by 4.6Å
  - G76↔P63: targets 27.5/4.7Å but partners are 36.6Å apart → too_far_apart by 4.5Å
- **P63** — severity 13.97, 7 conflict(s); suspect input ~`D14` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 37.1,conf 1.00), E27@27.5Å(now 36.8,conf 1.00), G76@27.5Å(now 36.6,conf 1.00), A26@27.5Å(now 36.6,conf 1.00), M78@27.5Å(now 35.6,conf 1.00), R75@27.5Å(now 35.1,conf 1.00), L25@27.5Å(now 35.2,conf 1.00), L1@27.5Å(now 34.8,conf 1.00), I28@27.5Å(now 34.2,conf 1.00), D29@27.5Å(now 33.5,conf 1.00), D2@27.5Å(now 33.0,conf 1.00), S79@27.5Å(now 32.2,conf 1.00), R74@27.5Å(now 31.5,conf 1.00), P24@27.5Å(now 31.5,conf 1.00), S80@27.5Å(now 31.2,conf 1.00), E51@27.5Å(now 30.7,conf 1.00), D52@27.5Å(now 30.5,conf 1.00)
  - D77↔D14: targets 27.5/4.7Å but partners are 37.3Å apart → too_far_apart by 5.1Å
  - G76↔D14: targets 27.5/4.7Å but partners are 36.4Å apart → too_far_apart by 4.3Å
  - M78↔D14: targets 27.5/4.7Å but partners are 35.6Å apart → too_far_apart by 3.5Å
- **T15** — severity 13.06, 9 conflict(s); suspect input ~`P63` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 34.8,conf 1.00), G76@27.5Å(now 33.8,conf 1.00), A26@27.5Å(now 33.5,conf 1.00), M78@27.5Å(now 33.4,conf 1.00), E27@27.5Å(now 33.2,conf 1.00), L1@27.5Å(now 32.5,conf 1.00), R75@27.5Å(now 32.1,conf 1.00), L25@27.5Å(now 32.0,conf 1.00), I28@27.5Å(now 30.8,conf 1.00), D2@27.5Å(now 30.8,conf 1.00), S79@27.5Å(now 30.2,conf 1.00)
  - D77↔P63: targets 27.5/5.8Å but partners are 37.1Å apart → too_far_apart by 3.8Å
  - E27↔P63: targets 27.5/5.8Å but partners are 36.8Å apart → too_far_apart by 3.5Å
  - G76↔P63: targets 27.5/5.8Å but partners are 36.6Å apart → too_far_apart by 3.4Å
- **R75** — severity 11.81, 9 conflict(s); suspect input ~`M78` (group: pull_in)
  - pull-in (wants closer): D64@27.5Å(now 35.7,conf 1.00), P63@27.5Å(now 35.1,conf 1.00), D14@27.5Å(now 34.5,conf 1.00), T13@27.5Å(now 33.2,conf 1.00), T65@27.5Å(now 32.8,conf 1.00), K62@27.5Å(now 32.7,conf 1.00), T15@27.5Å(now 32.1,conf 1.00), T88@27.5Å(now 30.8,conf 1.00), V12@27.5Å(now 30.4,conf 1.00), E66@27.5Å(now 30.3,conf 1.00), N60@27.5Å(now 30.1,conf 1.00)
  - D64↔M78: targets 27.5/5.2Å but partners are 35.9Å apart → too_far_apart by 3.1Å
  - D14↔M78: targets 27.5/5.2Å but partners are 35.6Å apart → too_far_apart by 2.9Å
  - P63↔M78: targets 27.5/5.2Å but partners are 35.6Å apart → too_far_apart by 2.9Å
- **T88** — severity 10.61, 7 conflict(s); suspect input ~`D64` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 33.2,conf 1.00), G76@27.5Å(now 32.9,conf 1.00), E27@27.5Å(now 31.9,conf 1.00), M78@27.5Å(now 31.0,conf 1.00), A26@27.5Å(now 31.0,conf 1.00), R75@27.5Å(now 30.8,conf 1.00)
  - D77↔D64: targets 27.5/6.4Å but partners are 37.6Å apart → too_far_apart by 3.8Å
  - G76↔D64: targets 27.5/6.4Å but partners are 37.5Å apart → too_far_apart by 3.6Å
  - E27↔D64: targets 27.5/6.4Å but partners are 37.3Å apart → too_far_apart by 3.4Å
- **R74** — severity 8.51, 7 conflict(s); suspect input ~`M78` (group: pull_in)
  - pull-in (wants closer): D64@27.5Å(now 32.0,conf 1.00), P63@27.5Å(now 31.5,conf 1.00), D14@27.5Å(now 31.0,conf 1.00)
  - D64↔M78: targets 27.5/5.8Å but partners are 35.9Å apart → too_far_apart by 2.5Å
  - D64↔D77: targets 27.5/7.6Å but partners are 37.6Å apart → too_far_apart by 2.5Å
  - D14↔M78: targets 27.5/5.8Å but partners are 35.6Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=36 · 3-10(G)=20 · coil(C)=20

```
CEGCEHCECEHCEHCCEGCEEGCCGECGHEECGCEECGGEGHHEGEGCGGHHEEEGGEEHEHEHECEEGGGGCEECHEEECEGEEEEC
```

## Backbone H-bond Network

- total=41 · helix(i→i+4)=1 · sheet=40
  - N60 ↔ D64  (helix)
  - S5 ↔ T20  (sheet)
  - S5 ↔ W21  (sheet)
  - E8 ↔ A17  (sheet)
  - E8 ↔ T20  (sheet)
  - E8 ↔ W21  (sheet)
  - K10 ↔ A17  (sheet)
  - K10 ↔ T20  (sheet)
  - K10 ↔ W21  (sheet)
  - A17 ↔ Y35  (sheet)
  - A17 ↔ G36  (sheet)
  - T20 ↔ I31  (sheet)
  - W21 ↔ I31  (sheet)
  - A26 ↔ I31  (sheet)
  - G30 ↔ T46  (sheet)
  - I31 ↔ T46  (sheet)
  - Y35 ↔ V40  (sheet)
  - Y35 ↔ R44  (sheet)
  - Y35 ↔ T46  (sheet)
  - G36 ↔ R44  (sheet)
  - … +21 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=35 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=313 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=198 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5315 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0227

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
