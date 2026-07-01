# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\2CRD\seeds\seed_1\2CRD.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 6.664 A
- tm_score_ca_ordered: 0.09909540599628855
- heavy_atom_rmsd: 7.847 A
- sidechain_heavy_atom_rmsd: 8.922 A
- **all-atom quality (honest):** heavy 7.847 A, sidechain 8.922 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 26
- distogram_pairs: 3
- bin_accuracy: 0.000

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=6 · 3-10(G)=1 · coil(C)=0

```
EEHHHGHHHHHHHHHHHHHHHHHHEHHHHEEHHE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=22 · sheet=3
  - V3 ↔ T7  (helix)
  - S4 ↔ S8  (helix)
  - C5 ↔ K9  (helix)
  - T7 ↔ C11  (helix)
  - S8 ↔ W12  (helix)
  - K9 ↔ S13  (helix)
  - E10 ↔ V14  (helix)
  - C11 ↔ C15  (helix)
  - W12 ↔ Q16  (helix)
  - S13 ↔ R17  (helix)
  - V14 ↔ L18  (helix)
  - C15 ↔ H19  (helix)
  - Q16 ↔ N20  (helix)
  - R17 ↔ T21  (helix)
  - L18 ↔ S22  (helix)
  - H19 ↔ R23  (helix)
  - N20 ↔ G24  (helix)
  - S22 ↔ C26  (helix)
  - R23 ↔ M27  (helix)
  - G24 ↔ N28  (helix)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=321 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=212 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.1994 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=26 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2CRD.ensemble.pdb`)
- RMSF mean=2.434Å max=4.694Å (per-residue in .per_residue.csv)
- most flexible residues: 15, 34, 8, 32, 6

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2CRD.pae.csv`
- mean=1.133Å · max=4.445Å · AlphaFold-PAE analog (low block = rigid unit/domain)
