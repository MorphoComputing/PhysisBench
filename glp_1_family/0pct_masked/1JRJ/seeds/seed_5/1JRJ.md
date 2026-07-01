# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\0pct_masked\1JRJ\seeds\seed_5\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.775 A
- tm_score_ca_ordered: 0.5497900559326648
- heavy_atom_rmsd: 4.020 A
- sidechain_heavy_atom_rmsd: 4.956 A
- **all-atom quality (honest):** heavy 4.020 A, sidechain 4.956 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 637
- bin_accuracy: 0.937

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=10 · 3-10(G)=5 · coil(C)=2

```
CECHEHEHHHHHHHHHHHEGHGHHGHHHEHGGEEEEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=12 · sheet=7
  - T4 ↔ D8  (helix)
  - T6 ↔ S10  (helix)
  - D8 ↔ Q12  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - A17 ↔ F21  (helix)
  - E23 ↔ N27  (helix)
  - W24 ↔ G28  (helix)
  - K26 ↔ P30  (helix)
  - E2 ↔ S7  (sheet)
  - R19 ↔ P36  (sheet)
  - R19 ↔ P37  (sheet)
  - G29 ↔ A34  (sheet)
  - G29 ↔ P35  (sheet)
  - G29 ↔ P36  (sheet)
  - G29 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=104 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4837 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
