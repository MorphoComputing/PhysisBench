# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1HVZ\seeds\seed_6\1HVZ.pdb`
- residues: 16
- mode: refinement
- ca_rmsd: 5.272 A
- tm_score_ca_ordered: 0.026738435962627392
- heavy_atom_rmsd: 6.482 A
- sidechain_heavy_atom_rmsd: 7.406 A
- **all-atom quality (honest):** heavy 6.482 A, sidechain 7.406 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 11
- bin_accuracy: 0.909

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=5 · 3-10(G)=1 · coil(C)=1

```
CHGHHEHEHHEHHEHE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=2 · sheet=6
  - L5 ↔ G9  (helix)
  - G9 ↔ C13  (helix)
  - C6 ↔ C11  (sheet)
  - C6 ↔ I14  (sheet)
  - C6 ↔ T16  (sheet)
  - R8 ↔ I14  (sheet)
  - R8 ↔ T16  (sheet)
  - C11 ↔ T16  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=80 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=36 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0442 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
