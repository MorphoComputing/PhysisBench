# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1TEN\seeds\seed_0\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 0.584 A
- tm_score_ca_ordered: 0.9731589267017423
- heavy_atom_rmsd: 2.986 A
- sidechain_heavy_atom_rmsd: 3.990 A
- **all-atom quality (honest):** heavy 2.986 A, sidechain 3.990 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3570
- bin_accuracy: 0.926

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.6744540895684482 -> 0.5991591711920976 A
- topology_reconvergence: applied=True accepted=12/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5840774955643009
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.594617123430006  localized_anchor_rmsd: 0.5840765527382609

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P63-D64 → 50 conflicts (79%); R75-D77 → 8 conflicts (13%); E27 → 3 conflicts (5%)
- explained: 61/63 conflicts by 3 root cause(s)
- metrics: hubs=17 (frac 0.193), conflicts/hub=3.7, max_incompat=4.2Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P63-D64 + R75-D77 + E27 — explain ~61/63 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D14** — severity 14.38, 11 conflict(s); suspect input ~`P63` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 36.3,conf 1.00), G76@27.5Å(now 36.2,conf 1.00), E27@27.5Å(now 35.4,conf 0.99), A26@27.5Å(now 35.3,conf 0.99), M78@27.5Å(now 35.0,conf 0.99), R75@27.5Å(now 34.1,conf 0.99), L25@27.5Å(now 33.6,conf 0.99), I28@27.5Å(now 32.6,conf 0.98), D29@27.5Å(now 32.2,conf 0.98), S79@27.4Å(now 31.7,conf 0.97), D2@27.4Å(now 31.8,conf 0.97), R74@27.4Å(now 30.6,conf 0.95), S80@27.4Å(now 30.6,conf 0.94), P24@27.3Å(now 30.2,conf 0.93)
  - E27↔P63: targets 27.5/5.3Å but partners are 37.0Å apart → too_far_apart by 4.2Å
  - G76↔P63: targets 27.5/5.3Å but partners are 36.8Å apart → too_far_apart by 4.1Å
  - A26↔P63: targets 27.5/5.3Å but partners are 36.8Å apart → too_far_apart by 4.0Å
- **P63** — severity 6.64, 5 conflict(s); suspect input ~`D14` (group: pull_in)
  - pull-in (wants closer): G76@27.5Å(now 36.8,conf 1.00), E27@27.5Å(now 37.0,conf 1.00), A26@27.5Å(now 36.8,conf 1.00), D77@27.5Å(now 36.4,conf 1.00), M78@27.5Å(now 35.2,conf 1.00), L25@27.5Å(now 35.4,conf 0.99), R75@27.5Å(now 35.0,conf 0.99), I28@27.5Å(now 34.0,conf 0.99), D29@27.5Å(now 33.6,conf 0.99), D2@27.5Å(now 32.6,conf 0.98), S79@27.4Å(now 31.8,conf 0.97), P24@27.4Å(now 31.8,conf 0.97), R74@27.4Å(now 31.3,conf 0.96), S80@27.4Å(now 30.8,conf 0.95), E51@27.4Å(now 30.4,conf 0.94), D52@27.3Å(now 30.1,conf 0.92), G30@27.3Å(now 29.9,conf 0.92)
  - D77↔D14: targets 27.5/5.3Å but partners are 36.3Å apart → too_far_apart by 3.5Å
  - G76↔D14: targets 27.5/5.3Å but partners are 36.2Å apart → too_far_apart by 3.5Å
  - E27↔D14: targets 27.5/5.3Å but partners are 35.4Å apart → too_far_apart by 2.6Å
- **T88** — severity 6.07, 6 conflict(s); suspect input ~`D64` (group: pull_in)
  - pull-in (wants closer): G76@27.5Å(now 33.1,conf 0.98), D77@27.5Å(now 32.6,conf 0.98), E27@27.4Å(now 31.9,conf 0.97), A26@27.4Å(now 31.0,conf 0.95), M78@27.4Å(now 30.7,conf 0.94), R75@27.4Å(now 30.6,conf 0.94)
  - G76↔D64: targets 27.5/6.6Å but partners are 37.6Å apart → too_far_apart by 3.5Å
  - E27↔D64: targets 27.4/6.6Å but partners are 37.3Å apart → too_far_apart by 3.3Å
  - D77↔D64: targets 27.5/6.6Å but partners are 36.9Å apart → too_far_apart by 2.9Å
- **T15** — severity 5.72, 6 conflict(s); suspect input ~`P63` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 33.6,conf 0.99), G76@27.5Å(now 33.5,conf 0.99), A26@27.5Å(now 33.5,conf 0.99), E27@27.5Å(now 33.1,conf 0.98), M78@27.5Å(now 32.7,conf 0.98), L25@27.4Å(now 32.0,conf 0.97), R75@27.4Å(now 31.6,conf 0.97), I28@27.4Å(now 30.2,conf 0.94), D2@27.3Å(now 30.3,conf 0.93)
  - E27↔P63: targets 27.5/6.5Å but partners are 37.0Å apart → too_far_apart by 3.0Å
  - G76↔P63: targets 27.5/6.5Å but partners are 36.8Å apart → too_far_apart by 2.9Å
  - A26↔P63: targets 27.5/6.5Å but partners are 36.8Å apart → too_far_apart by 2.9Å
- **R75** — severity 4.72, 6 conflict(s); suspect input ~`M78` (group: pull_in)
  - pull-in (wants closer): D64@27.5Å(now 35.5,conf 1.00), P63@27.5Å(now 35.0,conf 0.99), D14@27.5Å(now 34.1,conf 0.99), T13@27.5Å(now 32.8,conf 0.98), K62@27.5Å(now 32.6,conf 0.98), T65@27.5Å(now 32.5,conf 0.98), T15@27.4Å(now 31.6,conf 0.97), T88@27.4Å(now 30.6,conf 0.94), V12@27.3Å(now 30.2,conf 0.93), E66@27.3Å(now 29.9,conf 0.92)
  - D64↔M78: targets 27.5/5.7Å but partners are 35.4Å apart → too_far_apart by 2.2Å
  - P63↔M78: targets 27.5/5.7Å but partners are 35.2Å apart → too_far_apart by 2.0Å
  - D14↔M78: targets 27.5/5.7Å but partners are 35.0Å apart → too_far_apart by 1.9Å
- **D29** — severity 4.48, 5 conflict(s); suspect input ~`G76` (group: pull_in)
  - pull-in (wants closer): D64@27.5Å(now 34.5,conf 0.99), P63@27.5Å(now 33.6,conf 0.99), D14@27.5Å(now 32.2,conf 0.98), T65@27.4Å(now 31.8,conf 0.97), K62@27.4Å(now 31.3,conf 0.96), T13@27.4Å(now 30.6,conf 0.94)
  - D64↔R75: targets 27.5/5.5Å but partners are 35.5Å apart → too_far_apart by 2.5Å
  - D64↔G76: targets 27.5/7.1Å but partners are 37.6Å apart → too_far_apart by 3.0Å
  - P63↔R75: targets 27.5/5.5Å but partners are 35.0Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=49 · 3-10(G)=16 · coil(C)=11

```
EEECEHGGGEGCEHEEEGGEEEEEHECGGEEGCCEECCHEGHHEEEGCEEHHEEEEGEEHEHEHECEEEEGGCEEGHEEECEGEEEEE
```

## Backbone H-bond Network

- total=88 · helix(i→i+4)=2 · sheet=86
  - D39 ↔ D43  (helix)
  - N60 ↔ D64  (helix)
  - D2 ↔ F22  (sheet)
  - A3 ↔ W21  (sheet)
  - A3 ↔ F22  (sheet)
  - A3 ↔ K23  (sheet)
  - S5 ↔ T20  (sheet)
  - S5 ↔ W21  (sheet)
  - S5 ↔ F22  (sheet)
  - S5 ↔ K23  (sheet)
  - S5 ↔ P24  (sheet)
  - K10 ↔ T16  (sheet)
  - K10 ↔ A17  (sheet)
  - K10 ↔ T20  (sheet)
  - K10 ↔ W21  (sheet)
  - T16 ↔ Y35  (sheet)
  - T16 ↔ G36  (sheet)
  - A17 ↔ Y35  (sheet)
  - A17 ↔ G36  (sheet)
  - T20 ↔ I31  (sheet)
  - … +68 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=34 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=316 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=201 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8776 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
