# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\0pct_masked\1JRJ\seeds\seed_3\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.239 A
- tm_score_ca_ordered: 0.37376031445353836
- heavy_atom_rmsd: 5.052 A
- sidechain_heavy_atom_rmsd: 6.434 A
- **all-atom quality (honest):** heavy 5.052 A, sidechain 6.434 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 637
- bin_accuracy: 0.799

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=7 · 3-10(G)=8 · coil(C)=2

```
EECHEHHHHGHHHHHGHGGGGHCHHEGHEHHHGHHEE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=9 · sheet=3
  - T4 ↔ D8  (helix)
  - D8 ↔ Q12  (helix)
  - L9 ↔ M13  (helix)
  - K11 ↔ E15  (helix)
  - M13 ↔ A17  (helix)
  - W24 ↔ G28  (helix)
  - G28 ↔ S32  (helix)
  - P30 ↔ A34  (helix)
  - S31 ↔ P35  (helix)
  - K26 ↔ P36  (sheet)
  - G29 ↔ P36  (sheet)
  - G29 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=108 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=13 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.571 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
