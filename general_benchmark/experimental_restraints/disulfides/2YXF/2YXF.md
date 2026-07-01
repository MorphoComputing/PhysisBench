# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\2YXF\seeds\seed_1\2YXF.pdb`
- residues: 97
- mode: refinement
- ca_rmsd: 11.194 A
- tm_score_ca_ordered: 0.18687188817518224
- heavy_atom_rmsd: 11.916 A
- sidechain_heavy_atom_rmsd: 12.937 A
- **all-atom quality (honest):** heavy 11.916 A, sidechain 12.937 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 154
- distogram_pairs: 1
- bin_accuracy: 1.000

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=73 · strand(E)=14 · 3-10(G)=9 · coil(C)=1

```
CHEHEHHEHGHHEHEHHHHHEEHHHGHHEHGHHHEHHHHHHHHHHHGEHHHHGHHHHHHHHHHHHHHHEGHHHHGHHEEHHHGHHHHHHHHHGHHHE
```

## Backbone H-bond Network

- total=72 · helix(i→i+4)=49 · sheet=23
  - Q2 ↔ K6  (helix)
  - I7 ↔ S11  (helix)
  - R12 ↔ E16  (helix)
  - P14 ↔ G18  (helix)
  - E16 ↔ S20  (helix)
  - K19 ↔ L23  (helix)
  - S20 ↔ N24  (helix)
  - L23 ↔ V27  (helix)
  - N24 ↔ S28  (helix)
  - S28 ↔ P32  (helix)
  - F30 ↔ D34  (helix)
  - P32 ↔ E36  (helix)
  - D34 ↔ D38  (helix)
  - E36 ↔ L40  (helix)
  - V37 ↔ K41  (helix)
  - D38 ↔ N42  (helix)
  - K41 ↔ R45  (helix)
  - N42 ↔ I46  (helix)
  - R45 ↔ V49  (helix)
  - I46 ↔ E50  (helix)
  - … +52 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1381 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1162 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6808 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=154 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2YXF.ensemble.pdb`)
- RMSF mean=3.769Å max=8.373Å (per-residue in .per_residue.csv)
- most flexible residues: 76, 67, 50, 3, 40

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2YXF.pae.csv`
- mean=1.953Å · max=9.099Å · AlphaFold-PAE analog (low block = rigid unit/domain)
