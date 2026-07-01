# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\50pct_masked\1GCN\seeds\seed_1\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 1.839 A
- tm_score_ca_ordered: 0.4097389239696792
- heavy_atom_rmsd: 3.961 A
- sidechain_heavy_atom_rmsd: 5.023 A
- **all-atom quality (honest):** heavy 3.961 A, sidechain 5.023 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 167
- bin_accuracy: 0.928

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=8 · 3-10(G)=4 · coil(C)=0

```
EHGHEHEHGHEHHHHHHGHHEEGHHEE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=10 · sheet=4
  - Q2 ↔ T6  (helix)
  - T4 ↔ D8  (helix)
  - T6 ↔ S10  (helix)
  - D8 ↔ Y12  (helix)
  - S10 ↔ D14  (helix)
  - Y12 ↔ R16  (helix)
  - L13 ↔ R17  (helix)
  - S15 ↔ Q19  (helix)
  - R16 ↔ D20  (helix)
  - D20 ↔ W24  (helix)
  - F5 ↔ K11  (sheet)
  - F21 ↔ M26  (sheet)
  - F21 ↔ N27  (sheet)
  - V22 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=66 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5342 (restraint satisfaction; lower=better)
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
- RMSF mean=2.063Å max=3.281Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 15, 2, 24, 10

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=51.0 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 6, 7, 9, 10, 12, 15, 18, 21, 23, 24, 25

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1GCN.pae.csv`
- mean=0.339Å · max=1.857Å · AlphaFold-PAE analog (low block = rigid unit/domain)
