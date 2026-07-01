# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2KNM\seeds\seed_5\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 5.301 A
- tm_score_ca_ordered: 0.13234612708933638
- heavy_atom_rmsd: 5.667 A
- sidechain_heavy_atom_rmsd: 6.038 A
- **all-atom quality (honest):** heavy 5.667 A, sidechain 6.038 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 133
- bin_accuracy: 0.586

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=10 · 3-10(G)=5 · coil(C)=4

```
CECEHEHHEEEHHHHHGHEGEGGGCCEE
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=3 · sheet=19
  - V8 ↔ C12  (helix)
  - C12 ↔ A16  (helix)
  - S14 ↔ G18  (helix)
  - P2 ↔ C19  (sheet)
  - P2 ↔ C21  (sheet)
  - G4 ↔ W9  (sheet)
  - G4 ↔ I10  (sheet)
  - G4 ↔ P11  (sheet)
  - G4 ↔ C19  (sheet)
  - G4 ↔ C21  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ C21  (sheet)
  - W9 ↔ C21  (sheet)
  - I10 ↔ C21  (sheet)
  - P11 ↔ C19  (sheet)
  - P11 ↔ C21  (sheet)
  - P11 ↔ Y27  (sheet)
  - C19 ↔ Y27  (sheet)
  - C19 ↔ R28  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=140 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=83 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4258 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
