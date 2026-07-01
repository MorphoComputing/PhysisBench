# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1HVZ\seeds\seed_8\1HVZ.pdb`
- residues: 16
- mode: refinement
- ca_rmsd: 4.706 A
- tm_score_ca_ordered: 0.022249521690030447
- heavy_atom_rmsd: 6.613 A
- sidechain_heavy_atom_rmsd: 7.816 A
- **all-atom quality (honest):** heavy 6.613 A, sidechain 7.816 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 11
- bin_accuracy: 0.636

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=6 · strand(E)=4 · 3-10(G)=5 · coil(C)=1

```
EEGGCHGHHHHGGEHE
```

## Backbone H-bond Network

- total=6 · helix(i→i+4)=2 · sheet=4
  - C6 ↔ V10  (helix)
  - C11 ↔ C15  (helix)
  - F1 ↔ I14  (sheet)
  - F1 ↔ T16  (sheet)
  - C2 ↔ I14  (sheet)
  - C2 ↔ T16  (sheet)

## Solvent Accessibility (burial)

- buried=4 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=68 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=30 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0058 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
