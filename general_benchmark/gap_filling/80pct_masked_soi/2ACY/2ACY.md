# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2ACY\seeds\seed_3\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 0.441 A
- tm_score_ca_ordered: 0.9853595253445947
- heavy_atom_rmsd: 2.983 A
- sidechain_heavy_atom_rmsd: 3.875 A
- **all-atom quality (honest):** heavy 2.983 A, sidechain 3.875 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1236
- bin_accuracy: 0.932

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.44121528656649617
- ga_delta_rmsd: 3.0078552898361757  ga_fitness_mode: energy
- pre_local_rmsd: 0.4459690671737754  localized_anchor_rmsd: 0.4412070235256751

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=36 · 3-10(G)=19 · coil(C)=12

```
CCEECEEEEEEEGEGCEHEHHHHHHHHHHHHHHEGEEEECGHEHECCEEEGECHHGHHHHHHHHGEEECHGEGGGEGGCECGEHEGEEGEGEGEGC
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=17 · sheet=29
  - G18 ↔ R22  (helix)
  - F20 ↔ Y24  (helix)
  - F21 ↔ T25  (helix)
  - R22 ↔ Q26  (helix)
  - K23 ↔ A27  (helix)
  - Y24 ↔ E28  (helix)
  - T25 ↔ G29  (helix)
  - Q26 ↔ K30  (helix)
  - A27 ↔ K31  (helix)
  - E28 ↔ L32  (helix)
  - G29 ↔ G33  (helix)
  - A54 ↔ R58  (helix)
  - S55 ↔ H59  (helix)
  - V57 ↔ Q61  (helix)
  - R58 ↔ E62  (helix)
  - H59 ↔ W63  (helix)
  - M60 ↔ L64  (helix)
  - I12 ↔ Q17  (sheet)
  - G14 ↔ V19  (sheet)
  - L34 ↔ G48  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=44 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=384 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=211 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4156 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`2ACY.ensemble.pdb`)
- RMSF mean=5.884Å max=11.93Å (per-residue in .per_residue.csv)
- most flexible residues: 2, 42, 43, 41, 70

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=16.9 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2ACY.pae.csv`
- mean=1.892Å · max=8.866Å · AlphaFold-PAE analog (low block = rigid unit/domain)
