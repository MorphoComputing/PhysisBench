# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1JRJ\seeds\seed_4\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.200 A
- tm_score_ca_ordered: 0.27778658768170744
- heavy_atom_rmsd: 5.329 A
- sidechain_heavy_atom_rmsd: 6.247 A
- **all-atom quality (honest):** heavy 5.329 A, sidechain 6.247 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 285
- bin_accuracy: 0.782

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=15 · 3-10(G)=3 · coil(C)=5

```
EECCHHGHCEHEHGHEHEHEHGHHEHEEHEHCECEEE
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=5 · sheet=25
  - K11 ↔ E15  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - R19 ↔ E23  (helix)
  - S10 ↔ E16  (sheet)
  - Q12 ↔ V18  (sheet)
  - V18 ↔ L25  (sheet)
  - V18 ↔ P37  (sheet)
  - L20 ↔ L25  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ P35  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - L25 ↔ P30  (sheet)
  - L25 ↔ G33  (sheet)
  - L25 ↔ P35  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - N27 ↔ G33  (sheet)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.809 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
