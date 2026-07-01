# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\50pct_masked\1GCN\seeds\seed_3\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.586 A
- tm_score_ca_ordered: 0.22878410246760053
- heavy_atom_rmsd: 4.478 A
- sidechain_heavy_atom_rmsd: 5.441 A
- **all-atom quality (honest):** heavy 4.478 A, sidechain 5.441 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 167
- bin_accuracy: 0.880

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=7 · 3-10(G)=1 · coil(C)=1

```
EECEHHEHGHHHHHHEHHHHHHHHHEE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=11 · sheet=1
  - T6 ↔ S10  (helix)
  - D8 ↔ Y12  (helix)
  - S10 ↔ D14  (helix)
  - K11 ↔ S15  (helix)
  - D14 ↔ A18  (helix)
  - S15 ↔ Q19  (helix)
  - R17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - Q19 ↔ Q23  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - Q2 ↔ S7  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=68 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5567 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
