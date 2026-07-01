# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_6\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 1.966 A
- tm_score_ca_ordered: 0.37034271903582644
- heavy_atom_rmsd: 3.464 A
- sidechain_heavy_atom_rmsd: 4.127 A
- **all-atom quality (honest):** heavy 3.464 A, sidechain 4.127 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 340
- bin_accuracy: 0.729

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=6 · 3-10(G)=1 · coil(C)=2

```
CEGHHHHEHHHHHHHHEHEHHHEHHCE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=11 · sheet=2
  - F5 ↔ Y9  (helix)
  - T6 ↔ S10  (helix)
  - Y9 ↔ L13  (helix)
  - S10 ↔ D14  (helix)
  - K11 ↔ S15  (helix)
  - Y12 ↔ R16  (helix)
  - D14 ↔ A18  (helix)
  - R16 ↔ D20  (helix)
  - A18 ↔ V22  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - R17 ↔ Q23  (sheet)
  - Q19 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=69 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9216 (restraint satisfaction; lower=better)
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
- RMSF mean=2.027Å max=3.03Å (per-residue in .per_residue.csv)
- most flexible residues: 10, 19, 25, 6, 18

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=51.4 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 6, 10, 12, 17, 18, 19, 24, 25

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1GCN.pae.csv`
- mean=0.368Å · max=1.61Å · AlphaFold-PAE analog (low block = rigid unit/domain)
