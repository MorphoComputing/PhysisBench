# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1HVZ\seeds\seed_9\1HVZ.pdb`
- residues: 16
- mode: refinement
- ca_rmsd: 2.025 A
- tm_score_ca_ordered: 0.11462996541653067
- heavy_atom_rmsd: 4.255 A
- sidechain_heavy_atom_rmsd: 5.180 A
- **all-atom quality (honest):** heavy 4.255 A, sidechain 5.180 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 11
- bin_accuracy: 0.727

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=5 · 3-10(G)=3 · coil(C)=0

```
EHEGEHHHHHHEHGGE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=3 · sheet=5
  - C2 ↔ C6  (helix)
  - C6 ↔ V10  (helix)
  - G9 ↔ C13  (helix)
  - F1 ↔ T16  (sheet)
  - R3 ↔ R12  (sheet)
  - R3 ↔ T16  (sheet)
  - L5 ↔ R12  (sheet)
  - L5 ↔ T16  (sheet)

## Solvent Accessibility (burial)

- buried=7 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=46 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=21 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0957 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1HVZ.ensemble.pdb`)
- RMSF mean=2.548Å max=3.813Å (per-residue in .per_residue.csv)
- most flexible residues: 9, 1, 12, 16, 8

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=43.5 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 16

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HVZ.pae.csv`
- mean=1.356Å · max=4.449Å · AlphaFold-PAE analog (low block = rigid unit/domain)
