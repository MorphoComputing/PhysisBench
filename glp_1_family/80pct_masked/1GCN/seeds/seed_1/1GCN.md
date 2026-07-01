# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked\1GCN\seeds\seed_1\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.663 A
- tm_score_ca_ordered: 0.25379423488731256
- heavy_atom_rmsd: 5.022 A
- sidechain_heavy_atom_rmsd: 6.223 A
- **all-atom quality (honest):** heavy 5.022 A, sidechain 6.223 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 60
- bin_accuracy: 0.967

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=6 · 3-10(G)=2 · coil(C)=2

```
CHGHEHHHEEHHHEHGHHHHHEHHHCE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=9 · sheet=3
  - Q2 ↔ T6  (helix)
  - S7 ↔ K11  (helix)
  - K11 ↔ S15  (helix)
  - L13 ↔ R17  (helix)
  - S15 ↔ Q19  (helix)
  - R17 ↔ F21  (helix)
  - Q19 ↔ Q23  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - F5 ↔ S10  (sheet)
  - Y9 ↔ D14  (sheet)
  - V22 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=64 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4763 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
