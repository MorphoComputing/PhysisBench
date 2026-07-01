# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\50pct_masked\3IOL\seeds\seed_8\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.817 A
- tm_score_ca_ordered: 0.23438289577248417
- heavy_atom_rmsd: 4.600 A
- sidechain_heavy_atom_rmsd: 5.628 A
- **all-atom quality (honest):** heavy 4.600 A, sidechain 5.628 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 116
- bin_accuracy: 0.802

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=9 · 3-10(G)=1 · coil(C)=0

```
EEEGEHHHEHEHHEHHHHHHHHEE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=7 · sheet=5
  - V6 ↔ L10  (helix)
  - S8 ↔ G12  (helix)
  - G12 ↔ K16  (helix)
  - Q13 ↔ E17  (helix)
  - A15 ↔ I19  (helix)
  - K16 ↔ A20  (helix)
  - E17 ↔ W21  (helix)
  - T1 ↔ Y9  (sheet)
  - F2 ↔ Y9  (sheet)
  - T3 ↔ Y9  (sheet)
  - D5 ↔ E11  (sheet)
  - Y9 ↔ A14  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=60 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.667 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
