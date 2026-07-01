# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\50pct_masked\1GCN\seeds\seed_4\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.981 A
- tm_score_ca_ordered: 0.1763631638361608
- heavy_atom_rmsd: 5.597 A
- sidechain_heavy_atom_rmsd: 7.004 A
- **all-atom quality (honest):** heavy 5.597 A, sidechain 7.004 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 167
- bin_accuracy: 0.910

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=7 · 3-10(G)=6 · coil(C)=0

```
EEEGHHHHEHHHHHEGGGGHHEHGHHE
```

## Backbone H-bond Network

- total=7 · helix(i→i+4)=4 · sheet=3
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - S10 ↔ D14  (helix)
  - F21 ↔ L25  (helix)
  - Y9 ↔ S15  (sheet)
  - S15 ↔ V22  (sheet)
  - V22 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=66 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5664 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
