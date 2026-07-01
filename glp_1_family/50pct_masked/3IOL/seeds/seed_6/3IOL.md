# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\50pct_masked\3IOL\seeds\seed_6\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.418 A
- tm_score_ca_ordered: 0.2583232252804209
- heavy_atom_rmsd: 4.364 A
- sidechain_heavy_atom_rmsd: 5.388 A
- **all-atom quality (honest):** heavy 4.364 A, sidechain 5.388 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 137
- bin_accuracy: 0.854

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=7 · 3-10(G)=2 · coil(C)=1

```
CHEHHEHGHHEHHHHEEHHHEHGE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=5 · sheet=6
  - D5 ↔ Y9  (helix)
  - Y9 ↔ Q13  (helix)
  - L10 ↔ A14  (helix)
  - A14 ↔ F18  (helix)
  - F18 ↔ L22  (helix)
  - V6 ↔ E11  (sheet)
  - E11 ↔ K16  (sheet)
  - E11 ↔ E17  (sheet)
  - K16 ↔ W21  (sheet)
  - K16 ↔ K24  (sheet)
  - E17 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=63 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6604 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
