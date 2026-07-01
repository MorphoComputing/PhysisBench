# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1GCN\seeds\seed_2\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.404 A
- tm_score_ca_ordered: 0.15976826872901206
- heavy_atom_rmsd: 5.473 A
- sidechain_heavy_atom_rmsd: 6.755 A
- **all-atom quality (honest):** heavy 5.473 A, sidechain 6.755 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 155
- bin_accuracy: 0.677

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=9 · 3-10(G)=1 · coil(C)=0

```
EEEHHEHHEHHEHGHHEHHEHHHHHHE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=8 · sheet=3
  - T4 ↔ D8  (helix)
  - S7 ↔ K11  (helix)
  - K11 ↔ S15  (helix)
  - S15 ↔ Q19  (helix)
  - A18 ↔ V22  (helix)
  - Q19 ↔ Q23  (helix)
  - F21 ↔ L25  (helix)
  - V22 ↔ M26  (helix)
  - T6 ↔ Y12  (sheet)
  - Y12 ↔ R17  (sheet)
  - D20 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=57 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0616 (restraint satisfaction; lower=better)
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
- RMSF mean=2.802Å max=4.38Å (per-residue in .per_residue.csv)
- most flexible residues: 20, 19, 24, 1, 15

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=40.8 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 16, 19, 20, 21, 23, 24, 25, 27

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1GCN.pae.csv`
- mean=0.555Å · max=1.86Å · AlphaFold-PAE analog (low block = rigid unit/domain)
