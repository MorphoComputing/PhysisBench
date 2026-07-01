# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\50pct_masked\3IOL\seeds\seed_2\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.541 A
- tm_score_ca_ordered: 0.24660481102307152
- heavy_atom_rmsd: 4.113 A
- sidechain_heavy_atom_rmsd: 4.983 A
- **all-atom quality (honest):** heavy 4.113 A, sidechain 4.983 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 116
- bin_accuracy: 0.767

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=7 · 3-10(G)=1 · coil(C)=0

```
EEHEEHHHEHHHHHHHHHHHGHEE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=11 · sheet=3
  - T3 ↔ S7  (helix)
  - V6 ↔ L10  (helix)
  - S7 ↔ E11  (helix)
  - S8 ↔ G12  (helix)
  - L10 ↔ A14  (helix)
  - E11 ↔ A15  (helix)
  - G12 ↔ K16  (helix)
  - Q13 ↔ E17  (helix)
  - A14 ↔ F18  (helix)
  - K16 ↔ A20  (helix)
  - F18 ↔ L22  (helix)
  - T1 ↔ Y9  (sheet)
  - F2 ↔ Y9  (sheet)
  - S4 ↔ Y9  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=62 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7024 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
