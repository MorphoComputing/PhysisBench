# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\0pct_masked\1JRJ\seeds\seed_1\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 0.483 A
- tm_score_ca_ordered: 0.9428233760847191
- heavy_atom_rmsd: 2.041 A
- sidechain_heavy_atom_rmsd: 2.423 A
- **all-atom quality (honest):** heavy 2.041 A, sidechain 2.423 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 637
- bin_accuracy: 0.947

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=7 · 3-10(G)=3 · coil(C)=1

```
EEGHCHHGHHHHHHHHHHHHHHHHHHHHHHHEGEEEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=19 · sheet=0
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - E16 ↔ L20  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - L20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ N27  (helix)
  - K26 ↔ P30  (helix)
  - N27 ↔ S31  (helix)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=100 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4772 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)
