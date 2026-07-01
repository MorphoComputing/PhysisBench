# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\0pct_masked\1GCN\seeds\seed_4\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.058 A
- tm_score_ca_ordered: 0.285183247598265
- heavy_atom_rmsd: 5.369 A
- sidechain_heavy_atom_rmsd: 6.769 A
- **all-atom quality (honest):** heavy 5.369 A, sidechain 6.769 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 341
- bin_accuracy: 0.959

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=5 · 3-10(G)=6 · coil(C)=0

```
EEHEHGHGGHGHHHGHHHHHHHGHHEE
```

## Backbone H-bond Network

- total=10 · helix(i→i+4)=10 · sheet=0
  - G3 ↔ S7  (helix)
  - S10 ↔ D14  (helix)
  - Y12 ↔ R16  (helix)
  - L13 ↔ R17  (helix)
  - D14 ↔ A18  (helix)
  - R16 ↔ D20  (helix)
  - R17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)

## Solvent Accessibility (burial)

- buried=14 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=67 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4988 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
