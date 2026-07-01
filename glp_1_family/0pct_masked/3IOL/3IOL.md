# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\0pct_masked\3IOL\seeds\seed_7\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 0.291 A
- tm_score_ca_ordered: 0.8925143994277326
- heavy_atom_rmsd: 2.414 A
- sidechain_heavy_atom_rmsd: 2.968 A
- **all-atom quality (honest):** heavy 2.414 A, sidechain 2.968 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 274
- bin_accuracy: 0.960

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=3 · 3-10(G)=0 · coil(C)=0

```
EEHHHHHHHHHHHHHHHHHHHHHE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=17 · sheet=0
  - T3 ↔ S7  (helix)
  - S4 ↔ S8  (helix)
  - D5 ↔ Y9  (helix)
  - V6 ↔ L10  (helix)
  - S7 ↔ E11  (helix)
  - S8 ↔ G12  (helix)
  - Y9 ↔ Q13  (helix)
  - L10 ↔ A14  (helix)
  - E11 ↔ A15  (helix)
  - G12 ↔ K16  (helix)
  - Q13 ↔ E17  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - K16 ↔ A20  (helix)
  - E17 ↔ W21  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)

## Solvent Accessibility (burial)

- buried=9 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=63 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5814 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`3IOL.ensemble.pdb`)
- RMSF mean=1.245Å max=1.951Å (per-residue in .per_residue.csv)
- most flexible residues: 12, 7, 6, 17, 4

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=66.8 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: none

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `3IOL.pae.csv`
- mean=0.261Å · max=1.204Å · AlphaFold-PAE analog (low block = rigid unit/domain)
