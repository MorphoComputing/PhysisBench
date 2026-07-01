# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\50pct_masked\3IOL\seeds\seed_3\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.515 A
- tm_score_ca_ordered: 0.11252644106291394
- heavy_atom_rmsd: 5.403 A
- sidechain_heavy_atom_rmsd: 6.602 A
- **all-atom quality (honest):** heavy 5.403 A, sidechain 6.602 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 137
- bin_accuracy: 0.803

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=5 · 3-10(G)=5 · coil(C)=2

```
CGHHHEHEGGGCGEHHHEHHHHHE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=5 · sheet=3
  - T3 ↔ S7  (helix)
  - A15 ↔ I19  (helix)
  - K16 ↔ A20  (helix)
  - E17 ↔ W21  (helix)
  - I19 ↔ V23  (helix)
  - V6 ↔ A14  (sheet)
  - S8 ↔ A14  (sheet)
  - F18 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=66 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7079 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
