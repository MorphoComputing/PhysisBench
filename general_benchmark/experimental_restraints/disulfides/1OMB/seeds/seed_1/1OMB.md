# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1OMB\seeds\seed_1\1OMB.pdb`
- residues: 33
- mode: refinement
- ca_rmsd: 5.961 A
- tm_score_ca_ordered: 0.09907665709132261
- heavy_atom_rmsd: 7.847 A
- sidechain_heavy_atom_rmsd: 9.552 A
- **all-atom quality (honest):** heavy 7.847 A, sidechain 9.552 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 3
- bin_accuracy: 0.667

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=7 · 3-10(G)=1 · coil(C)=1

```
CEGHHHHHEHHHHHEHEHEHHEHHHHHHHHHHE
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=15 · sheet=15
  - D4 ↔ C8  (helix)
  - G6 ↔ W10  (helix)
  - K7 ↔ G11  (helix)
  - C8 ↔ G12  (helix)
  - W10 ↔ K14  (helix)
  - G12 ↔ C16  (helix)
  - C16 ↔ P20  (helix)
  - P20 ↔ S24  (helix)
  - C21 ↔ M25  (helix)
  - C23 ↔ G27  (helix)
  - S24 ↔ T28  (helix)
  - M25 ↔ N29  (helix)
  - I26 ↔ C30  (helix)
  - G27 ↔ E31  (helix)
  - T28 ↔ C32  (helix)
  - A2 ↔ T9  (sheet)
  - A2 ↔ C15  (sheet)
  - A2 ↔ R17  (sheet)
  - A2 ↔ R19  (sheet)
  - A2 ↔ R22  (sheet)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=249 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=144 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1253 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
