# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked\3IOL\seeds\seed_3\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.805 A
- tm_score_ca_ordered: 0.17207746123433973
- heavy_atom_rmsd: 5.156 A
- sidechain_heavy_atom_rmsd: 6.625 A
- **all-atom quality (honest):** heavy 5.156 A, sidechain 6.625 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 63
- bin_accuracy: 0.873

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=2 · 3-10(G)=4 · coil(C)=2

```
CCHEHHGGGHHHHHHHHHHHGHHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=9 · sheet=0
  - V6 ↔ L10  (helix)
  - L10 ↔ A14  (helix)
  - E11 ↔ A15  (helix)
  - G12 ↔ K16  (helix)
  - Q13 ↔ E17  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)

## Solvent Accessibility (burial)

- buried=10 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=66 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6347 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
