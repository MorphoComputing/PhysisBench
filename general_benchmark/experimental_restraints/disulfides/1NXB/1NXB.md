# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1NXB\seeds\seed_1\1NXB.pdb`
- residues: 60
- mode: refinement
- ca_rmsd: 9.877 A
- tm_score_ca_ordered: 0.12301908469725223
- heavy_atom_rmsd: 10.442 A
- sidechain_heavy_atom_rmsd: 10.910 A
- **all-atom quality (honest):** heavy 10.442 A, sidechain 10.910 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 65
- distogram_pairs: 4
- bin_accuracy: 0.500

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=39 · strand(E)=15 · 3-10(G)=4 · coil(C)=2

```
CEEGEGEEHGHHEHHHHHHHHEHHEHHEHGHHHEHHHEHHEHHHHHHHHHHHHHEHECHE
```

## Backbone H-bond Network

- total=60 · helix(i→i+4)=23 · sheet=37
  - Q11 ↔ T15  (helix)
  - T12 ↔ C16  (helix)
  - K14 ↔ P18  (helix)
  - T15 ↔ G19  (helix)
  - G19 ↔ C23  (helix)
  - C23 ↔ Q27  (helix)
  - Q27 ↔ F31  (helix)
  - S29 ↔ G33  (helix)
  - F31 ↔ I35  (helix)
  - R32 ↔ I36  (helix)
  - G33 ↔ E37  (helix)
  - I35 ↔ G39  (helix)
  - I36 ↔ C40  (helix)
  - G39 ↔ P43  (helix)
  - C40 ↔ T44  (helix)
  - C42 ↔ K46  (helix)
  - T44 ↔ G48  (helix)
  - V45 ↔ I49  (helix)
  - K46 ↔ K50  (helix)
  - G48 ↔ S52  (helix)
  - … +40 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=719 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=530 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9031 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=65 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1NXB.ensemble.pdb`)
- RMSF mean=3.226Å max=6.745Å (per-residue in .per_residue.csv)
- most flexible residues: 10, 56, 57, 13, 39

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1NXB.pae.csv`
- mean=1.664Å · max=9.37Å · AlphaFold-PAE analog (low block = rigid unit/domain)
