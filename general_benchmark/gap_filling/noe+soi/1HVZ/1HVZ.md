# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1HVZ\seeds\seed_9\1HVZ.pdb`
- residues: 16
- mode: refinement
- ca_rmsd: 1.857 A
- tm_score_ca_ordered: 0.18191247611109107
- heavy_atom_rmsd: 3.699 A
- sidechain_heavy_atom_rmsd: 4.640 A
- **all-atom quality (honest):** heavy 3.699 A, sidechain 4.640 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 62
- bin_accuracy: 0.500

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=2 · strand(E)=13 · 3-10(G)=0 · coil(C)=1

```
EEECEEEHEEEEHEEE
```

## Backbone H-bond Network

- total=21 · helix(i→i+4)=0 · sheet=21
  - F1 ↔ I14  (sheet)
  - F1 ↔ C15  (sheet)
  - F1 ↔ T16  (sheet)
  - C2 ↔ R12  (sheet)
  - C2 ↔ I14  (sheet)
  - C2 ↔ C15  (sheet)
  - C2 ↔ T16  (sheet)
  - R3 ↔ C11  (sheet)
  - R3 ↔ R12  (sheet)
  - R3 ↔ I14  (sheet)
  - R3 ↔ C15  (sheet)
  - R3 ↔ T16  (sheet)
  - L5 ↔ V10  (sheet)
  - L5 ↔ C11  (sheet)
  - L5 ↔ R12  (sheet)
  - L5 ↔ I14  (sheet)
  - L5 ↔ C15  (sheet)
  - C6 ↔ C11  (sheet)
  - C6 ↔ R12  (sheet)
  - C6 ↔ I14  (sheet)
  - … +1 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=7 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=37 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=17 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6002 (restraint satisfaction; lower=better)
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
- RMSF mean=2.824Å max=4.039Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 16, 5, 3, 12

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=39.8 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HVZ.pae.csv`
- mean=0.942Å · max=3.121Å · AlphaFold-PAE analog (low block = rigid unit/domain)
