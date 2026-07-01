# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.123 A
- tm_score_ca_ordered: 0.0668565248243993
- heavy_atom_rmsd: 6.948 A
- sidechain_heavy_atom_rmsd: 7.814 A
- **all-atom quality (honest):** heavy 6.948 A, sidechain 7.814 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 3
- bin_accuracy: 0.000

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=7 · 3-10(G)=3 · coil(C)=1

```
CEHGHHEHHHEHHGHHEGHHHHEHHHEE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=10 · sheet=14
  - E5 ↔ W9  (helix)
  - S6 ↔ I10  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - C12 ↔ A16  (helix)
  - S15 ↔ C19  (helix)
  - A16 ↔ S20  (helix)
  - S20 ↔ K24  (helix)
  - C21 ↔ V25  (helix)
  - K22 ↔ C26  (helix)
  - P2 ↔ C7  (sheet)
  - P2 ↔ P11  (sheet)
  - P2 ↔ I17  (sheet)
  - C7 ↔ I17  (sheet)
  - C7 ↔ S23  (sheet)
  - C7 ↔ Y27  (sheet)
  - P11 ↔ I17  (sheet)
  - P11 ↔ S23  (sheet)
  - P11 ↔ Y27  (sheet)
  - P11 ↔ R28  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=6 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=192 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=100 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.866 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=2.114Å max=3.565Å (per-residue in .per_residue.csv)
- most flexible residues: 9, 5, 28, 27, 6

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=1.14Å · max=4.476Å · AlphaFold-PAE analog (low block = rigid unit/domain)
