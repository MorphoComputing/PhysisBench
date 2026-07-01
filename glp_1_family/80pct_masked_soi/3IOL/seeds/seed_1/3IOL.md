# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\3IOL\seeds\seed_1\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.895 A
- tm_score_ca_ordered: 0.11848131966196485
- heavy_atom_rmsd: 5.946 A
- sidechain_heavy_atom_rmsd: 7.389 A
- **all-atom quality (honest):** heavy 5.946 A, sidechain 7.389 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 140
- bin_accuracy: 0.829

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=11 · 3-10(G)=0 · coil(C)=4

```
CEHCCHEHHHEHHHEEEECEEHEE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=3 · sheet=9
  - V6 ↔ L10  (helix)
  - S8 ↔ G12  (helix)
  - L10 ↔ A14  (helix)
  - F2 ↔ S7  (sheet)
  - E11 ↔ K16  (sheet)
  - E11 ↔ E17  (sheet)
  - E11 ↔ F18  (sheet)
  - A15 ↔ A20  (sheet)
  - A15 ↔ W21  (sheet)
  - K16 ↔ W21  (sheet)
  - F18 ↔ V23  (sheet)
  - F18 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=54 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8289 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
