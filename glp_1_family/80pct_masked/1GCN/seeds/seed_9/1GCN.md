# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked\1GCN\seeds\seed_9\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.283 A
- tm_score_ca_ordered: 0.16133405041052498
- heavy_atom_rmsd: 6.027 A
- sidechain_heavy_atom_rmsd: 7.552 A
- **all-atom quality (honest):** heavy 6.027 A, sidechain 7.552 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 60
- bin_accuracy: 0.850

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=8 · 3-10(G)=1 · coil(C)=2

```
EEGHHEEHHHHHHHHEHHCHEEHCHHE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=8 · sheet=6
  - T4 ↔ D8  (helix)
  - F5 ↔ Y9  (helix)
  - D8 ↔ Y12  (helix)
  - Y9 ↔ L13  (helix)
  - S10 ↔ D14  (helix)
  - K11 ↔ S15  (helix)
  - L13 ↔ R17  (helix)
  - D14 ↔ A18  (helix)
  - S1 ↔ T6  (sheet)
  - Q2 ↔ S7  (sheet)
  - R16 ↔ F21  (sheet)
  - R16 ↔ V22  (sheet)
  - F21 ↔ N27  (sheet)
  - V22 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=61 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5042 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
