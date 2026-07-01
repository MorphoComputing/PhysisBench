# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_6\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 1.966 A
- tm_score_ca_ordered: 0.37034271903582644
- heavy_atom_rmsd: 3.464 A
- sidechain_heavy_atom_rmsd: 4.127 A
- **all-atom quality (honest):** heavy 3.464 A, sidechain 4.127 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 340
- bin_accuracy: 0.729

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=6 · 3-10(G)=1 · coil(C)=2

```
CEGHHHHEHHHHHHHHEHEHHHEHHCE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=11 · sheet=2
  - F5 ↔ Y9  (helix)
  - T6 ↔ S10  (helix)
  - Y9 ↔ L13  (helix)
  - S10 ↔ D14  (helix)
  - K11 ↔ S15  (helix)
  - Y12 ↔ R16  (helix)
  - D14 ↔ A18  (helix)
  - R16 ↔ D20  (helix)
  - A18 ↔ V22  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - R17 ↔ Q23  (sheet)
  - Q19 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=69 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9216 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
