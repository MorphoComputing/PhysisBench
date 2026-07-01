# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\50pct_masked\1GCN\seeds\seed_5\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.646 A
- tm_score_ca_ordered: 0.3210278806148348
- heavy_atom_rmsd: 4.845 A
- sidechain_heavy_atom_rmsd: 6.052 A
- **all-atom quality (honest):** heavy 4.845 A, sidechain 6.052 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 167
- bin_accuracy: 0.886

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=6 · 3-10(G)=3 · coil(C)=0

```
EEEGHHHEHHHHHHHEGHHHHHHGHHE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=11 · sheet=2
  - F5 ↔ Y9  (helix)
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - Y9 ↔ L13  (helix)
  - S10 ↔ D14  (helix)
  - K11 ↔ S15  (helix)
  - D14 ↔ A18  (helix)
  - S15 ↔ Q19  (helix)
  - A18 ↔ V22  (helix)
  - F21 ↔ L25  (helix)
  - V22 ↔ M26  (helix)
  - Q2 ↔ D8  (sheet)
  - G3 ↔ D8  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=67 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5449 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
