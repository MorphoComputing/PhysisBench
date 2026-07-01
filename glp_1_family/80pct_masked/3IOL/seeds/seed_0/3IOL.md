# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked\3IOL\seeds\seed_0\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.630 A
- tm_score_ca_ordered: 0.14836185800072496
- heavy_atom_rmsd: 5.486 A
- sidechain_heavy_atom_rmsd: 6.625 A
- **all-atom quality (honest):** heavy 5.486 A, sidechain 6.625 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 46
- bin_accuracy: 0.848

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=9 · 3-10(G)=2 · coil(C)=0

```
EHEEHEEEGHEHGHHHEHHHHHHE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=7 · sheet=8
  - L10 ↔ A14  (helix)
  - G12 ↔ K16  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - K16 ↔ A20  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)
  - T1 ↔ V6  (sheet)
  - T1 ↔ S7  (sheet)
  - T1 ↔ S8  (sheet)
  - T3 ↔ S8  (sheet)
  - S4 ↔ E11  (sheet)
  - V6 ↔ E11  (sheet)
  - E11 ↔ E17  (sheet)
  - E17 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=66 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6301 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
