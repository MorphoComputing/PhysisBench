# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1JRJ\seeds\seed_2\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.595 A
- tm_score_ca_ordered: 0.5102052326129504
- heavy_atom_rmsd: 4.519 A
- sidechain_heavy_atom_rmsd: 5.620 A
- **all-atom quality (honest):** heavy 4.519 A, sidechain 5.620 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 246
- bin_accuracy: 0.801

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=17 · 3-10(G)=4 · coil(C)=3

```
EEEGEEEHCEHGHHHHEHHEHGHHCEECEEHGHEEEE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=3 · sheet=20
  - K11 ↔ E15  (helix)
  - E15 ↔ R19  (helix)
  - R19 ↔ E23  (helix)
  - F5 ↔ S10  (sheet)
  - S10 ↔ A17  (sheet)
  - A17 ↔ P36  (sheet)
  - A17 ↔ P37  (sheet)
  - L20 ↔ K26  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ G29  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - K26 ↔ A34  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P35  (sheet)
  - N27 ↔ P36  (sheet)
  - G29 ↔ A34  (sheet)
  - G29 ↔ P35  (sheet)
  - G29 ↔ P36  (sheet)
  - G29 ↔ P37  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=99 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8252 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
