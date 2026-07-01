# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1JRJ\seeds\seed_5\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.537 A
- tm_score_ca_ordered: 0.49286262769511624
- heavy_atom_rmsd: 4.318 A
- sidechain_heavy_atom_rmsd: 5.606 A
- **all-atom quality (honest):** heavy 4.318 A, sidechain 5.606 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 258
- bin_accuracy: 0.802

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=17 · 3-10(G)=4 · coil(C)=3

```
EECEECHEGEGHHEHEHEHHHHHEEHECHEHEGEGEE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=2 · sheet=24
  - E15 ↔ R19  (helix)
  - R19 ↔ E23  (helix)
  - T4 ↔ S10  (sheet)
  - F5 ↔ S10  (sheet)
  - D8 ↔ E14  (sheet)
  - S10 ↔ E16  (sheet)
  - V18 ↔ W24  (sheet)
  - V18 ↔ L25  (sheet)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)
  - W24 ↔ P30  (sheet)
  - W24 ↔ S32  (sheet)
  - W24 ↔ A34  (sheet)
  - W24 ↔ P36  (sheet)
  - W24 ↔ P37  (sheet)
  - L25 ↔ P30  (sheet)
  - L25 ↔ S32  (sheet)
  - L25 ↔ A34  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=93 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7715 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
