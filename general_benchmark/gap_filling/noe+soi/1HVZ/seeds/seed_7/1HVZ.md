# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1HVZ\seeds\seed_7\1HVZ.pdb`
- residues: 16
- mode: refinement
- ca_rmsd: 4.435 A
- tm_score_ca_ordered: 0.03691404047197301
- heavy_atom_rmsd: 6.111 A
- sidechain_heavy_atom_rmsd: 7.128 A
- **all-atom quality (honest):** heavy 6.111 A, sidechain 7.128 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 62
- bin_accuracy: 0.758

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=1 · strand(E)=10 · 3-10(G)=1 · coil(C)=4

```
CCEECEEHECEEEEGE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=0 · sheet=18
  - R3 ↔ C11  (sheet)
  - R3 ↔ R12  (sheet)
  - R3 ↔ C13  (sheet)
  - R3 ↔ I14  (sheet)
  - R3 ↔ T16  (sheet)
  - C4 ↔ G9  (sheet)
  - C4 ↔ C11  (sheet)
  - C4 ↔ R12  (sheet)
  - C4 ↔ C13  (sheet)
  - C4 ↔ I14  (sheet)
  - C4 ↔ T16  (sheet)
  - C6 ↔ C11  (sheet)
  - C6 ↔ R12  (sheet)
  - C6 ↔ C13  (sheet)
  - C6 ↔ I14  (sheet)
  - R7 ↔ R12  (sheet)
  - R7 ↔ C13  (sheet)
  - R7 ↔ I14  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=40 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=20 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.837 (restraint satisfaction; lower=better)
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
