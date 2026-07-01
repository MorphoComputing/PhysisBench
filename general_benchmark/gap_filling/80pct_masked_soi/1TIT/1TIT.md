# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TIT\seeds\seed_8\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 0.813 A
- tm_score_ca_ordered: 0.9585711504439558
- heavy_atom_rmsd: 2.941 A
- sidechain_heavy_atom_rmsd: 3.812 A
- **all-atom quality (honest):** heavy 2.941 A, sidechain 3.812 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.023
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 1027
- bin_accuracy: 0.896

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=7.995062759291683 -> 6.928131295166891 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8129511379305902
- ga_delta_rmsd: 5.828860403099414  ga_fitness_mode: energy
- pre_local_rmsd: 0.8282206439580738  localized_anchor_rmsd: 0.8129458913458026

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.011), conflicts/hub=1.0, max_incompat=2.25Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I1** — severity 1.23, 1 conflict(s); suspect input ~`E26` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 36.4,conf 1.00), F13@27.5Å(now 32.6,conf 1.00), Q63@27.5Å(now 30.9,conf 1.00), N61@27.5Å(now 30.2,conf 1.00), G65@27.5Å(now 30.2,conf 1.00)
  - E87↔E26: targets 27.5/6.7Å but partners are 36.4Å apart → too_far_apart by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=50 · 3-10(G)=20 · coil(C)=8

```
CEGHEEGEEEEGHGHEEEECEEGGGEEEEEEEEEEHCEGEEGECHECECEEEHEGGGGGEGGEHHHEEEGGGEEGCEEEEEEEECEE
```

## Backbone H-bond Network

- total=96 · helix(i→i+4)=0 · sheet=96
  - E2 ↔ I22  (sheet)
  - K5 ↔ E21  (sheet)
  - K5 ↔ I22  (sheet)
  - P6 ↔ H19  (sheet)
  - P6 ↔ E21  (sheet)
  - P6 ↔ I22  (sheet)
  - Y8 ↔ A18  (sheet)
  - Y8 ↔ H19  (sheet)
  - Y8 ↔ E21  (sheet)
  - Y8 ↔ I22  (sheet)
  - G9 ↔ A18  (sheet)
  - G9 ↔ H19  (sheet)
  - G9 ↔ E21  (sheet)
  - G9 ↔ I22  (sheet)
  - V10 ↔ E16  (sheet)
  - V10 ↔ T17  (sheet)
  - V10 ↔ A18  (sheet)
  - V10 ↔ H19  (sheet)
  - V10 ↔ E21  (sheet)
  - E11 ↔ E16  (sheet)
  - … +76 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=348 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=226 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4909 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.023

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1TIT.ensemble.pdb`)
- RMSF mean=3.722Å max=7.621Å (per-residue in .per_residue.csv)
- most flexible residues: 4, 5, 51, 38, 2

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=31.1 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 63, 64, 65, 66, 67, 68, 70, 71, 72, 73, 74, 75, 76, 77, 78, 80, 81, 82, 83, 84, 85, 86, 87

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1TIT.pae.csv`
- mean=1.67Å · max=7.844Å · AlphaFold-PAE analog (low block = rigid unit/domain)
