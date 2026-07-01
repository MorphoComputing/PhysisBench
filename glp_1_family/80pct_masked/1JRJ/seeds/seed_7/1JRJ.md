# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked\1JRJ\seeds\seed_7\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.601 A
- tm_score_ca_ordered: 0.4806569323980733
- heavy_atom_rmsd: 4.237 A
- sidechain_heavy_atom_rmsd: 5.382 A
- **all-atom quality (honest):** heavy 4.237 A, sidechain 5.382 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 126
- bin_accuracy: 0.889

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=7 · 3-10(G)=1 · coil(C)=1

```
EECHHEHHHHHHHHHHHHHHHHHHHHEHGHHHHEHEE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=12 · sheet=3
  - F5 ↔ L9  (helix)
  - S7 ↔ K11  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - I22 ↔ K26  (helix)
  - K26 ↔ P30  (helix)
  - S31 ↔ P35  (helix)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=108 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=13 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4999 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
