# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\0pct_masked\1GCN\seeds\seed_6\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 1.281 A
- tm_score_ca_ordered: 0.5940301526327237
- heavy_atom_rmsd: 3.726 A
- sidechain_heavy_atom_rmsd: 4.498 A
- **all-atom quality (honest):** heavy 3.726 A, sidechain 4.498 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 341
- bin_accuracy: 0.912

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=10 · 3-10(G)=2 · coil(C)=1

```
EEECHHHEHHEGHHEEEHHHHHGHHEE
```

## Backbone H-bond Network

- total=10 · helix(i→i+4)=7 · sheet=3
  - F5 ↔ Y9  (helix)
  - Y9 ↔ L13  (helix)
  - S10 ↔ D14  (helix)
  - D14 ↔ A18  (helix)
  - A18 ↔ V22  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - G3 ↔ D8  (sheet)
  - K11 ↔ R16  (sheet)
  - K11 ↔ R17  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=68 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5269 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1GCN.ensemble.pdb`)
- RMSF mean=1.942Å max=2.99Å (per-residue in .per_residue.csv)
- most flexible residues: 24, 25, 8, 1, 12

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=53.0 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 8, 11, 12, 15, 19, 24, 25, 27

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1GCN.pae.csv`
- mean=0.345Å · max=1.804Å · AlphaFold-PAE analog (low block = rigid unit/domain)
