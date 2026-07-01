# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\experimental_restraints\ambiguous\1TIT\seeds\seed_1\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 12.167 A
- tm_score_ca_ordered: 0.1501891842299758
- heavy_atom_rmsd: 13.049 A
- sidechain_heavy_atom_rmsd: 14.022 A
- **all-atom quality (honest):** heavy 13.049 A, sidechain 14.022 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 100
- distogram_pairs: 8
- bin_accuracy: 0.125

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=63 · strand(E)=15 · 3-10(G)=8 · coil(C)=1

```
CEHHHHHEHEHEGHHHEHHHEHHHHHHHHHHHHHHHHHHHEEHHHHHHEHHHGGHEHHHHHHEHHHHGHHGGHHHEHHHGHGHEHEE
```

## Backbone H-bond Network

- total=67 · helix(i→i+4)=46 · sheet=21
  - V3 ↔ L7  (helix)
  - K5 ↔ G9  (helix)
  - L7 ↔ E11  (helix)
  - E11 ↔ G15  (helix)
  - V14 ↔ A18  (helix)
  - G15 ↔ H19  (helix)
  - E16 ↔ F20  (helix)
  - A18 ↔ I22  (helix)
  - H19 ↔ E23  (helix)
  - F20 ↔ L24  (helix)
  - I22 ↔ E26  (helix)
  - E23 ↔ P27  (helix)
  - L24 ↔ D28  (helix)
  - S25 ↔ V29  (helix)
  - E26 ↔ H30  (helix)
  - P27 ↔ G31  (helix)
  - D28 ↔ Q32  (helix)
  - V29 ↔ W33  (helix)
  - H30 ↔ K34  (helix)
  - G31 ↔ L35  (helix)
  - … +47 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=33 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1150 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=868 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4067 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=100 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
