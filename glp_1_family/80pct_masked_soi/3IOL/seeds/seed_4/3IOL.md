# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\3IOL\seeds\seed_4\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.836 A
- tm_score_ca_ordered: 0.07580349394609126
- heavy_atom_rmsd: 5.789 A
- sidechain_heavy_atom_rmsd: 6.898 A
- **all-atom quality (honest):** heavy 5.789 A, sidechain 6.898 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 133
- bin_accuracy: 0.692

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=13 · 3-10(G)=0 · coil(C)=1

```
EEEEECEHEHHEHHHEHEEEHHHE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=3 · sheet=14
  - L10 ↔ A14  (helix)
  - Q13 ↔ E17  (helix)
  - E17 ↔ W21  (helix)
  - T1 ↔ S7  (sheet)
  - T1 ↔ Y9  (sheet)
  - F2 ↔ S7  (sheet)
  - F2 ↔ Y9  (sheet)
  - T3 ↔ Y9  (sheet)
  - S4 ↔ Y9  (sheet)
  - D5 ↔ G12  (sheet)
  - S7 ↔ G12  (sheet)
  - Y9 ↔ K16  (sheet)
  - G12 ↔ F18  (sheet)
  - G12 ↔ I19  (sheet)
  - K16 ↔ K24  (sheet)
  - F18 ↔ K24  (sheet)
  - I19 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=56 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9151 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
