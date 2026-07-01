# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1GCN\seeds\seed_6\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.463 A
- tm_score_ca_ordered: 0.16700797873241943
- heavy_atom_rmsd: 5.379 A
- sidechain_heavy_atom_rmsd: 6.628 A
- **all-atom quality (honest):** heavy 5.379 A, sidechain 6.628 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 155
- bin_accuracy: 0.768

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=12 · 3-10(G)=4 · coil(C)=0

```
EEGGEEEGEHEGEHHHEHHEHHHHHEE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=6 · sheet=8
  - S10 ↔ D14  (helix)
  - D14 ↔ A18  (helix)
  - S15 ↔ Q19  (helix)
  - A18 ↔ V22  (helix)
  - Q19 ↔ Q23  (helix)
  - F21 ↔ L25  (helix)
  - Q2 ↔ S7  (sheet)
  - F5 ↔ K11  (sheet)
  - T6 ↔ K11  (sheet)
  - S7 ↔ L13  (sheet)
  - K11 ↔ R17  (sheet)
  - L13 ↔ D20  (sheet)
  - D20 ↔ M26  (sheet)
  - D20 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=55 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6131 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
