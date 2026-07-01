# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked\1GCN\seeds\seed_7\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.867 A
- tm_score_ca_ordered: 0.19929647672971462
- heavy_atom_rmsd: 4.857 A
- sidechain_heavy_atom_rmsd: 5.959 A
- **all-atom quality (honest):** heavy 4.857 A, sidechain 5.959 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 60
- bin_accuracy: 0.900

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=8 · 3-10(G)=3 · coil(C)=1

```
EECGHHHHHHGGHHHHEHEHHHEHEEE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=6 · sheet=5
  - F5 ↔ Y9  (helix)
  - Y9 ↔ L13  (helix)
  - D14 ↔ A18  (helix)
  - R16 ↔ D20  (helix)
  - A18 ↔ V22  (helix)
  - D20 ↔ W24  (helix)
  - R17 ↔ Q23  (sheet)
  - R17 ↔ L25  (sheet)
  - Q19 ↔ L25  (sheet)
  - Q19 ↔ M26  (sheet)
  - Q19 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=64 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4833 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
