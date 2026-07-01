# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1GCN\seeds\seed_5\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.575 A
- tm_score_ca_ordered: 0.1520627392707809
- heavy_atom_rmsd: 5.603 A
- sidechain_heavy_atom_rmsd: 6.797 A
- **all-atom quality (honest):** heavy 5.603 A, sidechain 6.797 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 159
- bin_accuracy: 0.786

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=12 · 3-10(G)=2 · coil(C)=3

```
CCHHHGHHEHEEHECHEEHEEEEHEGE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=2 · sheet=15
  - G3 ↔ S7  (helix)
  - T4 ↔ D8  (helix)
  - Y9 ↔ D14  (sheet)
  - K11 ↔ R17  (sheet)
  - K11 ↔ A18  (sheet)
  - Y12 ↔ R17  (sheet)
  - Y12 ↔ A18  (sheet)
  - D14 ↔ D20  (sheet)
  - D14 ↔ F21  (sheet)
  - R17 ↔ V22  (sheet)
  - R17 ↔ Q23  (sheet)
  - A18 ↔ Q23  (sheet)
  - A18 ↔ L25  (sheet)
  - D20 ↔ L25  (sheet)
  - D20 ↔ N27  (sheet)
  - F21 ↔ N27  (sheet)
  - V22 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=49 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5616 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
