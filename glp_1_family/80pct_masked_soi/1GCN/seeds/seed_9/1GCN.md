# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1GCN\seeds\seed_9\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.845 A
- tm_score_ca_ordered: 0.11345180909892985
- heavy_atom_rmsd: 6.087 A
- sidechain_heavy_atom_rmsd: 7.214 A
- **all-atom quality (honest):** heavy 6.087 A, sidechain 7.214 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 156
- bin_accuracy: 0.769

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=5 · strand(E)=15 · 3-10(G)=2 · coil(C)=5

```
EEEEHCECECGEHHHEGECECEEEHEE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=0 · sheet=12
  - Q2 ↔ S7  (sheet)
  - T4 ↔ Y9  (sheet)
  - S7 ↔ Y12  (sheet)
  - Y9 ↔ R16  (sheet)
  - Y12 ↔ A18  (sheet)
  - R16 ↔ V22  (sheet)
  - R16 ↔ Q23  (sheet)
  - A18 ↔ Q23  (sheet)
  - A18 ↔ W24  (sheet)
  - D20 ↔ M26  (sheet)
  - D20 ↔ N27  (sheet)
  - V22 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=49 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8854 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
