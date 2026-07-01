# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked\1JRJ\seeds\seed_2\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.871 A
- tm_score_ca_ordered: 0.34277676422613296
- heavy_atom_rmsd: 5.110 A
- sidechain_heavy_atom_rmsd: 5.841 A
- **all-atom quality (honest):** heavy 5.110 A, sidechain 5.841 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 119
- bin_accuracy: 0.815

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=11 · 3-10(G)=4 · coil(C)=3

```
CCGGHEHHEEHHHHHHHEHEHEGHHEHHEHHHGCEEE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=8 · sheet=17
  - S7 ↔ K11  (helix)
  - K11 ↔ E15  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - W24 ↔ G28  (helix)
  - N27 ↔ S31  (helix)
  - G28 ↔ S32  (helix)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)
  - L20 ↔ K26  (sheet)
  - L20 ↔ G29  (sheet)
  - L20 ↔ P35  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - I22 ↔ G29  (sheet)
  - I22 ↔ P35  (sheet)
  - I22 ↔ P36  (sheet)
  - I22 ↔ P37  (sheet)
  - K26 ↔ P35  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=101 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=11 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5476 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
