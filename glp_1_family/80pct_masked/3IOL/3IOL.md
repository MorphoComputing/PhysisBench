# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked\3IOL\seeds\seed_7\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.241 A
- tm_score_ca_ordered: 0.19343417409761252
- heavy_atom_rmsd: 4.107 A
- sidechain_heavy_atom_rmsd: 5.226 A
- **all-atom quality (honest):** heavy 4.107 A, sidechain 5.226 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 63
- bin_accuracy: 0.889

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=7 · 3-10(G)=2 · coil(C)=1

```
CEEHHEGHHHHHEHHHEHHEHHGE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=5 · sheet=3
  - S4 ↔ S8  (helix)
  - D5 ↔ Y9  (helix)
  - E11 ↔ A15  (helix)
  - A15 ↔ I19  (helix)
  - F18 ↔ L22  (helix)
  - V6 ↔ Q13  (sheet)
  - Q13 ↔ A20  (sheet)
  - E17 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=61 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5881 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`3IOL.ensemble.pdb`)
- RMSF mean=2.379Å max=3.237Å (per-residue in .per_residue.csv)
- most flexible residues: 8, 24, 23, 6, 18

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=45.7 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 4, 5, 6, 7, 8, 10, 12, 13, 14, 15, 16, 17, 18, 19, 23, 24

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `3IOL.pae.csv`
- mean=0.63Å · max=2.067Å · AlphaFold-PAE analog (low block = rigid unit/domain)
