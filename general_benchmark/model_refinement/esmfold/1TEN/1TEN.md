# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1TEN\seeds\seed_1\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 0.568 A
- tm_score_ca_ordered: 0.9745996069313473
- heavy_atom_rmsd: 2.730 A
- sidechain_heavy_atom_rmsd: 3.599 A
- **all-atom quality (honest):** heavy 2.730 A, sidechain 3.599 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.011
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3570
- bin_accuracy: 0.930

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5679775000510785
- ga_delta_rmsd: -0.1556138781191787  ga_fitness_mode: energy
- pre_local_rmsd: 0.5816655621788037  localized_anchor_rmsd: 0.5679803993739788

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P63-D64 → 48 conflicts (80%); R75-D77 → 8 conflicts (13%)
- explained: 56/60 conflicts by 2 root cause(s)
- metrics: hubs=17 (frac 0.193), conflicts/hub=3.5, max_incompat=4.09Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P63-D64 + R75-D77 — explain ~56/60 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D14** — severity 13.99, 11 conflict(s); suspect input ~`P63` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 36.3,conf 1.00), G76@27.5Å(now 36.2,conf 1.00), E27@27.5Å(now 35.3,conf 0.99), A26@27.5Å(now 35.2,conf 0.99), M78@27.5Å(now 35.0,conf 0.99), R75@27.5Å(now 34.1,conf 0.99), L25@27.5Å(now 33.5,conf 0.99), I28@27.5Å(now 32.6,conf 0.98), D29@27.5Å(now 32.2,conf 0.98), S79@27.4Å(now 31.7,conf 0.97), D2@27.4Å(now 31.7,conf 0.97), R74@27.4Å(now 30.6,conf 0.95), S80@27.4Å(now 30.5,conf 0.94), P24@27.3Å(now 30.1,conf 0.93)
  - E27↔P63: targets 27.5/5.3Å but partners are 36.8Å apart → too_far_apart by 4.1Å
  - G76↔P63: targets 27.5/5.3Å but partners are 36.8Å apart → too_far_apart by 4.0Å
  - A26↔P63: targets 27.5/5.3Å but partners are 36.7Å apart → too_far_apart by 3.9Å
- **P63** — severity 6.60, 5 conflict(s); suspect input ~`D14` (group: pull_in)
  - pull-in (wants closer): G76@27.5Å(now 36.8,conf 1.00), E27@27.5Å(now 36.8,conf 1.00), A26@27.5Å(now 36.7,conf 1.00), D77@27.5Å(now 36.3,conf 1.00), M78@27.5Å(now 35.1,conf 1.00), L25@27.5Å(now 35.3,conf 0.99), R75@27.5Å(now 34.9,conf 0.99), I28@27.5Å(now 34.0,conf 0.99), D29@27.5Å(now 33.5,conf 0.99), D2@27.5Å(now 32.5,conf 0.98), S79@27.4Å(now 31.8,conf 0.97), P24@27.4Å(now 31.7,conf 0.97), R74@27.4Å(now 31.2,conf 0.96), S80@27.4Å(now 30.7,conf 0.95), E51@27.4Å(now 30.4,conf 0.94), D52@27.3Å(now 30.0,conf 0.92), G30@27.3Å(now 29.8,conf 0.92)
  - D77↔D14: targets 27.5/5.3Å but partners are 36.3Å apart → too_far_apart by 3.5Å
  - G76↔D14: targets 27.5/5.3Å but partners are 36.2Å apart → too_far_apart by 3.5Å
  - E27↔D14: targets 27.5/5.3Å but partners are 35.3Å apart → too_far_apart by 2.5Å
- **T15** — severity 5.56, 6 conflict(s); suspect input ~`P63` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 33.7,conf 0.99), G76@27.5Å(now 33.6,conf 0.99), A26@27.5Å(now 33.4,conf 0.99), E27@27.5Å(now 33.1,conf 0.98), M78@27.5Å(now 32.8,conf 0.98), L25@27.4Å(now 32.0,conf 0.97), R75@27.4Å(now 31.6,conf 0.97), I28@27.4Å(now 30.3,conf 0.94), D2@27.3Å(now 30.3,conf 0.93)
  - E27↔P63: targets 27.5/6.5Å but partners are 36.8Å apart → too_far_apart by 2.9Å
  - G76↔P63: targets 27.5/6.5Å but partners are 36.8Å apart → too_far_apart by 2.8Å
  - A26↔P63: targets 27.5/6.5Å but partners are 36.7Å apart → too_far_apart by 2.8Å
- **T88** — severity 4.67, 4 conflict(s); suspect input ~`D64` (group: pull_in)
  - pull-in (wants closer): G76@27.5Å(now 33.0,conf 0.98), D77@27.5Å(now 32.5,conf 0.98), E27@27.4Å(now 31.8,conf 0.97), A26@27.4Å(now 30.9,conf 0.95), M78@27.4Å(now 30.6,conf 0.94), R75@27.4Å(now 30.6,conf 0.94)
  - G76↔D64: targets 27.5/6.6Å but partners are 37.5Å apart → too_far_apart by 3.4Å
  - E27↔D64: targets 27.4/6.6Å but partners are 37.2Å apart → too_far_apart by 3.2Å
  - D77↔D64: targets 27.5/6.6Å but partners are 36.9Å apart → too_far_apart by 2.8Å
- **D29** — severity 4.36, 5 conflict(s); suspect input ~`G76` (group: pull_in)
  - pull-in (wants closer): D64@27.5Å(now 34.4,conf 0.99), P63@27.5Å(now 33.5,conf 0.99), D14@27.5Å(now 32.2,conf 0.98), T65@27.4Å(now 31.7,conf 0.97), K62@27.4Å(now 31.3,conf 0.96), T13@27.4Å(now 30.6,conf 0.94)
  - D64↔R75: targets 27.5/5.5Å but partners are 35.4Å apart → too_far_apart by 2.4Å
  - D64↔G76: targets 27.5/7.1Å but partners are 37.5Å apart → too_far_apart by 2.8Å
  - P63↔R75: targets 27.5/5.5Å but partners are 34.9Å apart → too_far_apart by 1.9Å
- **R75** — severity 3.90, 5 conflict(s); suspect input ~`M78` (group: pull_in)
  - pull-in (wants closer): D64@27.5Å(now 35.4,conf 1.00), P63@27.5Å(now 34.9,conf 0.99), D14@27.5Å(now 34.1,conf 0.99), T13@27.5Å(now 32.8,conf 0.98), K62@27.5Å(now 32.6,conf 0.98), T65@27.5Å(now 32.4,conf 0.98), T15@27.4Å(now 31.6,conf 0.97), T88@27.4Å(now 30.6,conf 0.94), V12@27.3Å(now 30.2,conf 0.93), E66@27.3Å(now 29.8,conf 0.92), D11@27.3Å(now 29.8,conf 0.92)
  - D64↔M78: targets 27.5/5.7Å but partners are 35.3Å apart → too_far_apart by 2.2Å
  - P63↔M78: targets 27.5/5.7Å but partners are 35.1Å apart → too_far_apart by 2.0Å
  - D14↔M78: targets 27.5/5.7Å but partners are 35.0Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=40 · 3-10(G)=23 · coil(C)=12

```
CEECEHGGCEGCEHEEEGGEEGEEHECGGEEGGEEECCHEGHHEEGGCGEHHEHEEGCEHEHEHEGEGGGGGGCECHEEECEGEEEEE
```

## Backbone H-bond Network

- total=45 · helix(i→i+4)=2 · sheet=43
  - D39 ↔ D43  (helix)
  - N60 ↔ D64  (helix)
  - A3 ↔ W21  (sheet)
  - A3 ↔ K23  (sheet)
  - S5 ↔ T20  (sheet)
  - S5 ↔ W21  (sheet)
  - S5 ↔ K23  (sheet)
  - S5 ↔ P24  (sheet)
  - K10 ↔ T15  (sheet)
  - K10 ↔ T16  (sheet)
  - K10 ↔ A17  (sheet)
  - K10 ↔ T20  (sheet)
  - K10 ↔ W21  (sheet)
  - T16 ↔ Y35  (sheet)
  - A17 ↔ Y35  (sheet)
  - A17 ↔ G36  (sheet)
  - T20 ↔ I31  (sheet)
  - W21 ↔ I31  (sheet)
  - K23 ↔ G30  (sheet)
  - K23 ↔ I31  (sheet)
  - … +25 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=34 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=317 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=202 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8772 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0114

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1TEN.ensemble.pdb`)
- RMSF mean=0.052Å max=0.204Å (per-residue in .per_residue.csv)
- most flexible residues: 76, 77, 16, 40, 15

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1TEN.pae.csv`
- mean=0.029Å · max=0.15Å · AlphaFold-PAE analog (low block = rigid unit/domain)
