# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked\1JRJ\seeds\seed_9\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.071 A
- tm_score_ca_ordered: 0.3509874352560992
- heavy_atom_rmsd: 4.545 A
- sidechain_heavy_atom_rmsd: 5.610 A
- **all-atom quality (honest):** heavy 4.545 A, sidechain 5.610 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 126
- bin_accuracy: 0.905

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=17 · 3-10(G)=4 · coil(C)=0

```
EEEEGGHEHHHHHEEEGEHEHEHHEGHHHEHHHEEEE
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=8 · sheet=28
  - S7 ↔ K11  (helix)
  - L9 ↔ M13  (helix)
  - R19 ↔ E23  (helix)
  - E23 ↔ N27  (helix)
  - W24 ↔ G28  (helix)
  - N27 ↔ S31  (helix)
  - G28 ↔ S32  (helix)
  - G29 ↔ G33  (helix)
  - G3 ↔ D8  (sheet)
  - D8 ↔ E14  (sheet)
  - D8 ↔ E15  (sheet)
  - D8 ↔ E16  (sheet)
  - E14 ↔ L20  (sheet)
  - E14 ↔ I22  (sheet)
  - E15 ↔ L20  (sheet)
  - E15 ↔ I22  (sheet)
  - E16 ↔ I22  (sheet)
  - V18 ↔ L25  (sheet)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=107 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5151 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
