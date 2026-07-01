# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\50pct_masked\1JRJ\seeds\seed_1\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 0.918 A
- tm_score_ca_ordered: 0.8498409876314212
- heavy_atom_rmsd: 2.883 A
- sidechain_heavy_atom_rmsd: 3.631 A
- **all-atom quality (honest):** heavy 2.883 A, sidechain 3.631 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 323
- bin_accuracy: 0.926

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=6 · 3-10(G)=5 · coil(C)=2

```
ECGHHHHHHGHHHHHHHEHHHHHHHHHGGHHEGECEE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=16 · sheet=2
  - T4 ↔ D8  (helix)
  - S7 ↔ K11  (helix)
  - D8 ↔ Q12  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - E16 ↔ L20  (helix)
  - A17 ↔ F21  (helix)
  - R19 ↔ E23  (helix)
  - L20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ N27  (helix)
  - K26 ↔ P30  (helix)
  - N27 ↔ S31  (helix)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=103 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4823 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1JRJ.ensemble.pdb`)
- RMSF mean=1.784Å max=3.399Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 11, 7, 15, 30

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=56.6 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 3, 7, 11, 14, 15, 20, 22, 27, 30, 31, 33, 34

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1JRJ.pae.csv`
- mean=0.315Å · max=1.688Å · AlphaFold-PAE analog (low block = rigid unit/domain)
