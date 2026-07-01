# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked\1GCN\seeds\seed_3\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.182 A
- tm_score_ca_ordered: 0.1635254204239091
- heavy_atom_rmsd: 5.201 A
- sidechain_heavy_atom_rmsd: 6.476 A
- **all-atom quality (honest):** heavy 5.201 A, sidechain 6.476 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 60
- bin_accuracy: 0.933

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=11 · 3-10(G)=3 · coil(C)=0

```
EEGGHHEHHHEEGHHHEEHEHHHEHEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=6 · sheet=10
  - F5 ↔ Y9  (helix)
  - T6 ↔ S10  (helix)
  - S10 ↔ D14  (helix)
  - S15 ↔ Q19  (helix)
  - Q19 ↔ Q23  (helix)
  - F21 ↔ L25  (helix)
  - Q2 ↔ S7  (sheet)
  - S7 ↔ Y12  (sheet)
  - K11 ↔ R17  (sheet)
  - K11 ↔ A18  (sheet)
  - Y12 ↔ R17  (sheet)
  - Y12 ↔ A18  (sheet)
  - R17 ↔ W24  (sheet)
  - A18 ↔ W24  (sheet)
  - D20 ↔ M26  (sheet)
  - D20 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=55 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4801 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
