# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1TIT/sequence/1TIT.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1TIT/seeds/seed_1/1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 0.122 A
- tm_score_ca_ordered: 0.9986968816755105
- heavy_atom_rmsd: 2.567 A
- sidechain_heavy_atom_rmsd: 3.437 A
- **all-atom quality (honest):** heavy 2.567 A, sidechain 3.437 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.011
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 3569
- bin_accuracy: 0.974

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.09645285744161708 -> 0.09615429697947345 A
- topology_reconvergence: applied=True accepted=9/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.12191780481014552
- ga_delta_rmsd: -0.00864554506648893  ga_fitness_mode: energy
- pre_local_rmsd: 0.1233417171007203  localized_anchor_rmsd: 0.12192270653384496

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E87 → 63 conflicts (68%); E26-K86 → 7 conflicts (8%)
- explained: 70/93 conflicts by 2 root cause(s)
- metrics: hubs=26 (frac 0.299), conflicts/hub=3.6, max_incompat=6.1Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E87 + E26-K86 — explain ~70/93 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F13** — severity 24.06, 14 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): E26@27.5Å(now 34.5,conf 1.00), I1@27.5Å(now 34.4,conf 1.00), D28@27.5Å(now 34.2,conf 1.00), P27@27.5Å(now 33.5,conf 1.00), S25@27.5Å(now 33.0,conf 1.00), N76@27.5Å(now 32.6,conf 1.00), A75@27.5Å(now 32.4,conf 1.00), V29@27.5Å(now 32.0,conf 1.00), E2@27.5Å(now 31.7,conf 1.00), K53@27.5Å(now 30.3,conf 1.00)
  - E26↔E87: targets 27.5/5.8Å but partners are 38.7Å apart → too_far_apart by 5.4Å
  - D28↔E87: targets 27.5/5.8Å but partners are 38.2Å apart → too_far_apart by 5.0Å
  - I1↔E87: targets 27.5/5.8Å but partners are 37.8Å apart → too_far_apart by 4.6Å
- **V14** — severity 18.07, 11 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): E26@27.5Å(now 34.3,conf 1.00), I1@27.5Å(now 34.2,conf 1.00), D28@27.5Å(now 33.3,conf 1.00), S25@27.5Å(now 33.1,conf 1.00), P27@27.5Å(now 33.0,conf 1.00), N76@27.5Å(now 31.9,conf 1.00), E2@27.5Å(now 31.8,conf 1.00), A75@27.5Å(now 31.4,conf 1.00), V29@27.5Å(now 30.9,conf 1.00)
  - E26↔E87: targets 27.5/6.0Å but partners are 38.7Å apart → too_far_apart by 5.1Å
  - D28↔E87: targets 27.5/6.0Å but partners are 38.2Å apart → too_far_apart by 4.7Å
  - I1↔E87: targets 27.5/6.0Å but partners are 37.8Å apart → too_far_apart by 4.3Å
- **K53** — severity 16.64, 9 conflict(s); suspect input ~`P27` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 34.8,conf 1.00), K86@27.5Å(now 32.2,conf 1.00), L64@27.5Å(now 31.2,conf 1.00), F13@27.5Å(now 30.3,conf 1.00), G65@27.5Å(now 30.1,conf 1.00)
  - E87↔P27: targets 27.5/4.2Å but partners are 37.8Å apart → too_far_apart by 6.1Å
  - E87↔E26: targets 27.5/6.2Å but partners are 38.7Å apart → too_far_apart by 5.0Å
  - E87↔D28: targets 27.5/6.7Å but partners are 38.2Å apart → too_far_apart by 4.1Å
- **G52** — severity 11.82, 6 conflict(s); suspect input ~`D28` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 33.7,conf 1.00), K86@27.5Å(now 31.3,conf 1.00)
  - E87↔D28: targets 27.5/5.4Å but partners are 38.2Å apart → too_far_apart by 5.3Å
  - E87↔P27: targets 27.5/5.2Å but partners are 37.8Å apart → too_far_apart by 5.1Å
  - K86↔D28: targets 27.5/5.4Å but partners are 35.8Å apart → too_far_apart by 2.9Å
- **L64** — severity 11.20, 7 conflict(s); suspect input ~`E87` (group: pull_in)
  - pull-in (wants closer): E26@27.5Å(now 34.6,conf 1.00), D28@27.5Å(now 33.7,conf 1.00), P27@27.5Å(now 33.7,conf 1.00), S25@27.5Å(now 33.2,conf 1.00), I1@27.5Å(now 33.2,conf 1.00), K53@27.5Å(now 31.2,conf 1.00), E2@27.5Å(now 30.8,conf 1.00), V29@27.5Å(now 30.8,conf 1.00)
  - E26↔E87: targets 27.5/7.1Å but partners are 38.7Å apart → too_far_apart by 4.1Å
  - D28↔E87: targets 27.5/7.1Å but partners are 38.2Å apart → too_far_apart by 3.7Å
  - I1↔E87: targets 27.5/7.1Å but partners are 37.8Å apart → too_far_apart by 3.3Å
- **N61** — severity 8.66, 5 conflict(s); suspect input ~`G15` (group: pull_in)
  - pull-in (wants closer): I1@27.5Å(now 32.0,conf 1.00), E26@27.5Å(now 31.4,conf 1.00), S25@27.5Å(now 30.6,conf 1.00)
  - I1↔G15: targets 27.5/3.6Å but partners are 34.7Å apart → too_far_apart by 3.6Å
  - E26↔G15: targets 27.5/3.6Å but partners are 34.0Å apart → too_far_apart by 2.9Å
  - S25↔G15: targets 27.5/3.6Å but partners are 33.0Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=46 · 3-10(G)=19 · coil(C)=13

```
CECHEEEECEEGGGGEEEEEEEEGCEECECEEEEGHCEGEEGEHHECCCEGCHECEEGGEGGEHHHHEECGGEEGGEEGEEEEEGEE
```

## Backbone H-bond Network

- total=89 · helix(i→i+4)=0 · sheet=89
  - E2 ↔ I22  (sheet)
  - K5 ↔ F20  (sheet)
  - K5 ↔ E21  (sheet)
  - K5 ↔ I22  (sheet)
  - K5 ↔ E23  (sheet)
  - P6 ↔ H19  (sheet)
  - P6 ↔ F20  (sheet)
  - P6 ↔ E21  (sheet)
  - P6 ↔ I22  (sheet)
  - P6 ↔ E23  (sheet)
  - L7 ↔ A18  (sheet)
  - L7 ↔ H19  (sheet)
  - L7 ↔ F20  (sheet)
  - L7 ↔ E21  (sheet)
  - L7 ↔ I22  (sheet)
  - L7 ↔ E23  (sheet)
  - Y8 ↔ A18  (sheet)
  - Y8 ↔ H19  (sheet)
  - Y8 ↔ F20  (sheet)
  - Y8 ↔ E21  (sheet)
  - … +69 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=38 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=335 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=216 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.566 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0115

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1TIT.ensemble.pdb`)
- RMSF mean=0.022Å max=0.071Å (per-residue in .per_residue.csv)
- most flexible residues: 83, 69, 57, 27, 7

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1TIT.pae.csv`
- mean=0.016Å · max=0.099Å · AlphaFold-PAE analog (low block = rigid unit/domain)
