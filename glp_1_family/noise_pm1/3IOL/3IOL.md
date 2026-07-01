# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm1\3IOL\seeds\seed_5\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 1.030 A
- tm_score_ca_ordered: 0.5065141996381032
- heavy_atom_rmsd: 3.078 A
- sidechain_heavy_atom_rmsd: 3.885 A
- **all-atom quality (honest):** heavy 3.078 A, sidechain 3.885 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 274
- bin_accuracy: 0.715

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=4 · 3-10(G)=3 · coil(C)=1

```
CEHHEHEHGHHHHHGGHHHHHHHE
```

## Backbone H-bond Network

- total=10 · helix(i→i+4)=9 · sheet=1
  - S4 ↔ S8  (helix)
  - V6 ↔ L10  (helix)
  - S8 ↔ G12  (helix)
  - L10 ↔ A14  (helix)
  - Q13 ↔ E17  (helix)
  - A14 ↔ F18  (helix)
  - E17 ↔ W21  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)
  - F2 ↔ S7  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=65 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0309 (restraint satisfaction; lower=better)
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
- RMSF mean=1.664Å max=2.703Å (per-residue in .per_residue.csv)
- most flexible residues: 24, 6, 8, 4, 2

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=58.5 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 2, 4, 6, 8, 9, 17, 19, 24

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `3IOL.pae.csv`
- mean=0.364Å · max=1.452Å · AlphaFold-PAE analog (low block = rigid unit/domain)
