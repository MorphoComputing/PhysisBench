# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\3IOL\seeds\seed_0\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.832 A
- tm_score_ca_ordered: 0.11760959437078623
- heavy_atom_rmsd: 5.114 A
- sidechain_heavy_atom_rmsd: 6.060 A
- **all-atom quality (honest):** heavy 5.114 A, sidechain 6.060 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 120
- bin_accuracy: 0.675

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=8 · 3-10(G)=2 · coil(C)=0

```
EEHEHGGEHHEHHHHHHHHEHEHE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=9 · sheet=3
  - D5 ↔ Y9  (helix)
  - Y9 ↔ Q13  (helix)
  - L10 ↔ A14  (helix)
  - G12 ↔ K16  (helix)
  - Q13 ↔ E17  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - E17 ↔ W21  (helix)
  - I19 ↔ V23  (helix)
  - T1 ↔ S8  (sheet)
  - F2 ↔ S8  (sheet)
  - S4 ↔ E11  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=64 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1446 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
