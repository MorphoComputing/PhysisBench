# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\3IOL\seeds\seed_7\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.749 A
- tm_score_ca_ordered: 0.09203286292568212
- heavy_atom_rmsd: 5.794 A
- sidechain_heavy_atom_rmsd: 7.068 A
- **all-atom quality (honest):** heavy 5.794 A, sidechain 7.068 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 138
- bin_accuracy: 0.797

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=5 · strand(E)=16 · 3-10(G)=1 · coil(C)=2

```
EEHEHCCHEHEHEEEEEEEEEEGE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=1 · sheet=25
  - S8 ↔ G12  (helix)
  - F2 ↔ Y9  (sheet)
  - S4 ↔ Y9  (sheet)
  - S4 ↔ E11  (sheet)
  - Y9 ↔ A14  (sheet)
  - Y9 ↔ A15  (sheet)
  - Y9 ↔ K16  (sheet)
  - Y9 ↔ E17  (sheet)
  - E11 ↔ K16  (sheet)
  - E11 ↔ E17  (sheet)
  - E11 ↔ F18  (sheet)
  - Q13 ↔ F18  (sheet)
  - Q13 ↔ I19  (sheet)
  - Q13 ↔ A20  (sheet)
  - A14 ↔ I19  (sheet)
  - A14 ↔ A20  (sheet)
  - A14 ↔ W21  (sheet)
  - A15 ↔ A20  (sheet)
  - A15 ↔ W21  (sheet)
  - A15 ↔ L22  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=50 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.642 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
