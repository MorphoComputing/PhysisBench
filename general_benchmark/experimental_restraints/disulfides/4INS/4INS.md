# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\4INS\seeds\seed_0\4INS.pdb`
- residues: 94
- mode: refinement
- ca_rmsd: 10.272 A
- tm_score_ca_ordered: 0.1652832266451735
- heavy_atom_rmsd: 11.396 A
- sidechain_heavy_atom_rmsd: 12.508 A
- **all-atom quality (honest):** heavy 11.396 A, sidechain 12.508 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 71
- distogram_pairs: 6
- bin_accuracy: 0.500

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=64 · strand(E)=14 · 3-10(G)=14 · coil(C)=2

```
CHGEHHEHHHEHGHHGGGHHHHHHHEHHHHGHHHHGHHHHHHGEHCHHGEEGHHEHHEHHHHHHEHHHEHHHEHHEHHHHGGHHGHHGHHHHHE
```

## Backbone H-bond Network

- total=56 · helix(i→i+4)=38 · sheet=18
  - V2 ↔ C6  (helix)
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - S8 ↔ L12  (helix)
  - C10 ↔ Q14  (helix)
  - L15 ↔ C19  (helix)
  - C19 ↔ H23  (helix)
  - V20 ↔ L24  (helix)
  - N21 ↔ C25  (helix)
  - H23 ↔ S27  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - L33 ↔ C37  (helix)
  - C37 ↔ G41  (helix)
  - G41 ↔ T45  (helix)
  - C53 ↔ C57  (helix)
  - I56 ↔ Y60  (helix)
  - … +36 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=34 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=950 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=682 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1994 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=71 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`4INS.ensemble.pdb`)
- RMSF mean=3.953Å max=9.193Å (per-residue in .per_residue.csv)
- most flexible residues: 57, 3, 51, 52, 56

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `4INS.pae.csv`
- mean=2.106Å · max=8.388Å · AlphaFold-PAE analog (low block = rigid unit/domain)
