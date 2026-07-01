# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked\1JRJ\seeds\seed_6\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.830 A
- tm_score_ca_ordered: 0.2685317377265047
- heavy_atom_rmsd: 5.517 A
- sidechain_heavy_atom_rmsd: 6.840 A
- **all-atom quality (honest):** heavy 5.517 A, sidechain 6.840 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 126
- bin_accuracy: 0.778

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=10 · 3-10(G)=8 · coil(C)=1

```
EGEGHEEGECGGHHHHHHEHHHEEGHHHHHGHHGEHE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=10 · sheet=7
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E16 ↔ L20  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - K26 ↔ P30  (helix)
  - G28 ↔ S32  (helix)
  - G29 ↔ G33  (helix)
  - S32 ↔ P36  (helix)
  - G3 ↔ L9  (sheet)
  - R19 ↔ W24  (sheet)
  - R19 ↔ P37  (sheet)
  - E23 ↔ P35  (sheet)
  - E23 ↔ P37  (sheet)
  - W24 ↔ P35  (sheet)
  - W24 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=121 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=27 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6078 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
