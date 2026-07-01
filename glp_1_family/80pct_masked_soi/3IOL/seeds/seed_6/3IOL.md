# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\3IOL\seeds\seed_6\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.449 A
- tm_score_ca_ordered: 0.10252442540241262
- heavy_atom_rmsd: 5.535 A
- sidechain_heavy_atom_rmsd: 7.087 A
- **all-atom quality (honest):** heavy 5.535 A, sidechain 7.087 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 144
- bin_accuracy: 0.764

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=8 · 3-10(G)=2 · coil(C)=2

```
EHGHHHHHEHHEHHGEHECCEHEE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=6 · sheet=6
  - F2 ↔ V6  (helix)
  - S4 ↔ S8  (helix)
  - V6 ↔ L10  (helix)
  - S7 ↔ E11  (helix)
  - L10 ↔ A14  (helix)
  - Q13 ↔ E17  (helix)
  - T1 ↔ Y9  (sheet)
  - Y9 ↔ K16  (sheet)
  - G12 ↔ F18  (sheet)
  - K16 ↔ W21  (sheet)
  - F18 ↔ V23  (sheet)
  - F18 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=62 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9905 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
