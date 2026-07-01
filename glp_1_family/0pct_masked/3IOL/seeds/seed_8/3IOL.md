# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\0pct_masked\3IOL\seeds\seed_8\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.605 A
- tm_score_ca_ordered: 0.2048676728343102
- heavy_atom_rmsd: 3.872 A
- sidechain_heavy_atom_rmsd: 4.490 A
- **all-atom quality (honest):** heavy 3.872 A, sidechain 4.490 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 231
- bin_accuracy: 0.805

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=11 · 3-10(G)=0 · coil(C)=0

```
EEEHHEHEHEHEHEHHHHEHHHEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=6 · sheet=10
  - D5 ↔ Y9  (helix)
  - S7 ↔ E11  (helix)
  - Y9 ↔ Q13  (helix)
  - E11 ↔ A15  (helix)
  - K16 ↔ A20  (helix)
  - F18 ↔ L22  (helix)
  - T1 ↔ V6  (sheet)
  - T1 ↔ S8  (sheet)
  - F2 ↔ S8  (sheet)
  - T3 ↔ S8  (sheet)
  - T3 ↔ L10  (sheet)
  - V6 ↔ G12  (sheet)
  - S8 ↔ A14  (sheet)
  - G12 ↔ I19  (sheet)
  - A14 ↔ I19  (sheet)
  - I19 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=62 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6825 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
