# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.859 A
- tm_score_ca_ordered: 0.06361652091075023
- heavy_atom_rmsd: 8.650 A
- sidechain_heavy_atom_rmsd: 9.565 A
- **all-atom quality (honest):** heavy 8.650 A, sidechain 9.565 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 22
- distogram_pairs: 3
- bin_accuracy: 0.333

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=4 · 3-10(G)=4 · coil(C)=1

```
CEHHHHGHHHGHHGHHHEHHHGHEHHHE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=13 · sheet=3
  - G4 ↔ V8  (helix)
  - E5 ↔ W9  (helix)
  - S6 ↔ I10  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - C12 ↔ A16  (helix)
  - I13 ↔ I17  (helix)
  - S15 ↔ C19  (helix)
  - A16 ↔ S20  (helix)
  - I17 ↔ C21  (helix)
  - C19 ↔ S23  (helix)
  - C21 ↔ V25  (helix)
  - S23 ↔ Y27  (helix)
  - P2 ↔ G18  (sheet)
  - G18 ↔ K24  (sheet)
  - G18 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=5 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=230 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=144 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9771 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=22 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
