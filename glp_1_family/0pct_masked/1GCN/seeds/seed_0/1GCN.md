# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\0pct_masked\1GCN\seeds\seed_0\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.734 A
- tm_score_ca_ordered: 0.2155527653711612
- heavy_atom_rmsd: 4.673 A
- sidechain_heavy_atom_rmsd: 5.739 A
- **all-atom quality (honest):** heavy 4.673 A, sidechain 5.739 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 300
- bin_accuracy: 0.870

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=11 · 3-10(G)=2 · coil(C)=2

```
CEEEHGHEEHEHEHHHEHHHGHEHCEE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=4 · sheet=5
  - S10 ↔ D14  (helix)
  - D14 ↔ A18  (helix)
  - S15 ↔ Q19  (helix)
  - A18 ↔ V22  (helix)
  - G3 ↔ D8  (sheet)
  - T4 ↔ Y9  (sheet)
  - D8 ↔ L13  (sheet)
  - K11 ↔ R17  (sheet)
  - R17 ↔ Q23  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=69 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5359 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
