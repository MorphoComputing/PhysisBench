# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked\1JRJ\seeds\seed_0\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.395 A
- tm_score_ca_ordered: 0.5039620520757562
- heavy_atom_rmsd: 3.857 A
- sidechain_heavy_atom_rmsd: 4.671 A
- **all-atom quality (honest):** heavy 3.857 A, sidechain 4.671 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 119
- bin_accuracy: 0.916

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=12 · 3-10(G)=5 · coil(C)=1

```
EECEHHGEHHHHHGHEHHHEHGHHGHEHHEHHEEGEE
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=10 · sheet=10
  - F5 ↔ L9  (helix)
  - T6 ↔ S10  (helix)
  - L9 ↔ M13  (helix)
  - K11 ↔ E15  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - R19 ↔ E23  (helix)
  - W24 ↔ G28  (helix)
  - G28 ↔ S32  (helix)
  - D8 ↔ E16  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ P30  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - N27 ↔ G33  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P36  (sheet)
  - P30 ↔ P36  (sheet)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=18 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=102 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=10 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4754 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
