# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1GCN\seeds\seed_4\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.845 A
- tm_score_ca_ordered: 0.14772186483199642
- heavy_atom_rmsd: 5.826 A
- sidechain_heavy_atom_rmsd: 7.097 A
- **all-atom quality (honest):** heavy 5.826 A, sidechain 7.097 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 155
- bin_accuracy: 0.781

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=18 · 3-10(G)=2 · coil(C)=3

```
EEGECHHEEHEEEEEHEEECEEGECEE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=1 · sheet=25
  - T6 ↔ S10  (helix)
  - T4 ↔ Y9  (sheet)
  - D8 ↔ L13  (sheet)
  - D8 ↔ D14  (sheet)
  - Y9 ↔ D14  (sheet)
  - Y9 ↔ S15  (sheet)
  - K11 ↔ R17  (sheet)
  - K11 ↔ A18  (sheet)
  - Y12 ↔ R17  (sheet)
  - Y12 ↔ A18  (sheet)
  - Y12 ↔ Q19  (sheet)
  - L13 ↔ A18  (sheet)
  - L13 ↔ Q19  (sheet)
  - L13 ↔ F21  (sheet)
  - D14 ↔ Q19  (sheet)
  - D14 ↔ F21  (sheet)
  - S15 ↔ F21  (sheet)
  - S15 ↔ V22  (sheet)
  - R17 ↔ V22  (sheet)
  - R17 ↔ W24  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=51 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6229 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
