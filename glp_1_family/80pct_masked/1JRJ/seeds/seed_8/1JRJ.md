# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked\1JRJ\seeds\seed_8\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.210 A
- tm_score_ca_ordered: 0.2314358531057757
- heavy_atom_rmsd: 6.143 A
- sidechain_heavy_atom_rmsd: 7.644 A
- **all-atom quality (honest):** heavy 6.143 A, sidechain 7.644 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 119
- bin_accuracy: 0.832

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=8 · 3-10(G)=6 · coil(C)=1

```
EECHEGHHHGGGHHHEHHHHHHEEGHHHHEHHHGHHE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=13 · sheet=6
  - T4 ↔ D8  (helix)
  - L9 ↔ M13  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - N27 ↔ S31  (helix)
  - G28 ↔ S32  (helix)
  - G29 ↔ G33  (helix)
  - S31 ↔ P35  (helix)
  - S32 ↔ P36  (helix)
  - E16 ↔ E23  (sheet)
  - E23 ↔ P30  (sheet)
  - E23 ↔ P37  (sheet)
  - W24 ↔ P30  (sheet)
  - W24 ↔ P37  (sheet)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=18 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=126 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=29 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5945 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
