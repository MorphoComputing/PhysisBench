# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1HVZ\seeds\seed_8\1HVZ.pdb`
- residues: 16
- mode: refinement
- ca_rmsd: 3.598 A
- tm_score_ca_ordered: 0.03560517696098139
- heavy_atom_rmsd: 5.544 A
- sidechain_heavy_atom_rmsd: 6.851 A
- **all-atom quality (honest):** heavy 5.544 A, sidechain 6.851 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 62
- bin_accuracy: 0.726

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=3 · strand(E)=10 · 3-10(G)=1 · coil(C)=2

```
EEEEECHHHCEEEEGE
```

## Backbone H-bond Network

- total=21 · helix(i→i+4)=0 · sheet=21
  - F1 ↔ C13  (sheet)
  - F1 ↔ I14  (sheet)
  - F1 ↔ T16  (sheet)
  - C2 ↔ C13  (sheet)
  - C2 ↔ I14  (sheet)
  - C2 ↔ T16  (sheet)
  - R3 ↔ C11  (sheet)
  - R3 ↔ R12  (sheet)
  - R3 ↔ C13  (sheet)
  - R3 ↔ I14  (sheet)
  - R3 ↔ T16  (sheet)
  - C4 ↔ C11  (sheet)
  - C4 ↔ R12  (sheet)
  - C4 ↔ C13  (sheet)
  - C4 ↔ I14  (sheet)
  - C4 ↔ T16  (sheet)
  - L5 ↔ C11  (sheet)
  - L5 ↔ R12  (sheet)
  - L5 ↔ C13  (sheet)
  - L5 ↔ I14  (sheet)
  - … +1 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=5 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=40 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8037 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
