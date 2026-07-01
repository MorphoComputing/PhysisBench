# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\50pct_masked\1GCN\seeds\seed_6\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.618 A
- tm_score_ca_ordered: 0.3192532966278852
- heavy_atom_rmsd: 5.029 A
- sidechain_heavy_atom_rmsd: 6.283 A
- **all-atom quality (honest):** heavy 5.029 A, sidechain 6.283 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 167
- bin_accuracy: 0.892

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=6 · 3-10(G)=4 · coil(C)=1

```
CEEHHGEHHEHHEHHGHHHHHGHHGHE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=6 · sheet=2
  - T4 ↔ D8  (helix)
  - D8 ↔ Y12  (helix)
  - D14 ↔ A18  (helix)
  - R17 ↔ F21  (helix)
  - Q19 ↔ Q23  (helix)
  - D20 ↔ W24  (helix)
  - Q2 ↔ S7  (sheet)
  - S7 ↔ L13  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=65 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5399 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
