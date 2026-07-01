# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe\1JRJ\seeds\seed_0\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.575 A
- tm_score_ca_ordered: 0.09578245151076714
- heavy_atom_rmsd: 8.181 A
- sidechain_heavy_atom_rmsd: 8.613 A
- **all-atom quality (honest):** heavy 8.181 A, sidechain 8.613 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 47
- bin_accuracy: 0.596

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=7 · 3-10(G)=1 · coil(C)=2

```
CEHHHHHHHHHHHHHEHEHHHHHHHHEHHHEHGHCEE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=17 · sheet=8
  - G3 ↔ S7  (helix)
  - F5 ↔ L9  (helix)
  - S7 ↔ K11  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - K11 ↔ E15  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - R19 ↔ E23  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - L25 ↔ G29  (helix)
  - K26 ↔ P30  (helix)
  - G28 ↔ S32  (helix)
  - P30 ↔ A34  (helix)
  - E2 ↔ E16  (sheet)
  - E2 ↔ V18  (sheet)
  - V18 ↔ P36  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=194 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=78 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3192 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
