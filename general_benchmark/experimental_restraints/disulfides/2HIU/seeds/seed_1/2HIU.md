# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.481 A
- tm_score_ca_ordered: 0.14879830643805372
- heavy_atom_rmsd: 8.875 A
- sidechain_heavy_atom_rmsd: 10.054 A
- **all-atom quality (honest):** heavy 8.875 A, sidechain 10.054 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 24
- distogram_pairs: 3
- bin_accuracy: 0.667

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=8 · 3-10(G)=6 · coil(C)=2

```
CHEEHHEHHGHHHGHGHEHHHHHHHEHHHHHEEHEHGHGHHHHGHHC
```

## Backbone H-bond Network

- total=32 · helix(i→i+4)=21 · sheet=11
  - V2 ↔ C6  (helix)
  - C5 ↔ I9  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - S11 ↔ L15  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - N17 ↔ N21  (helix)
  - C19 ↔ H23  (helix)
  - V20 ↔ L24  (helix)
  - N21 ↔ C25  (helix)
  - H23 ↔ S27  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - V30 ↔ Y34  (helix)
  - Y34 ↔ G38  (helix)
  - V36 ↔ R40  (helix)
  - G38 ↔ F42  (helix)
  - G41 ↔ T45  (helix)
  - … +12 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=407 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=254 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1253 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=24 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
