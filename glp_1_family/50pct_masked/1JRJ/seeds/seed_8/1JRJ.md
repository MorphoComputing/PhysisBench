# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\50pct_masked\1JRJ\seeds\seed_8\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.525 A
- tm_score_ca_ordered: 0.4802284575537975
- heavy_atom_rmsd: 3.982 A
- sidechain_heavy_atom_rmsd: 4.885 A
- **all-atom quality (honest):** heavy 3.982 A, sidechain 4.885 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 298
- bin_accuracy: 0.862

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=12 · 3-10(G)=5 · coil(C)=0

```
EEEGGHEHEHHHHEHHHEHHHHGHEHEHHHHGHEGEE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=13 · sheet=13
  - T6 ↔ S10  (helix)
  - D8 ↔ Q12  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - E16 ↔ L20  (helix)
  - A17 ↔ F21  (helix)
  - L20 ↔ W24  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - K26 ↔ P30  (helix)
  - G29 ↔ G33  (helix)
  - E2 ↔ S7  (sheet)
  - G3 ↔ L9  (sheet)
  - S7 ↔ E14  (sheet)
  - L9 ↔ E14  (sheet)
  - V18 ↔ L25  (sheet)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=109 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5222 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
