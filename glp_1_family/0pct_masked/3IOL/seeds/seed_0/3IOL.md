# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\0pct_masked\3IOL\seeds\seed_0\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 1.665 A
- tm_score_ca_ordered: 0.4929390480275743
- heavy_atom_rmsd: 4.033 A
- sidechain_heavy_atom_rmsd: 5.367 A
- **all-atom quality (honest):** heavy 4.033 A, sidechain 5.367 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 231
- bin_accuracy: 0.900

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=7 · 3-10(G)=2 · coil(C)=1

```
EEEHGHHHHEHGHHHHEHHHEHCE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=8 · sheet=3
  - S4 ↔ S8  (helix)
  - S7 ↔ E11  (helix)
  - Y9 ↔ Q13  (helix)
  - E11 ↔ A15  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - K16 ↔ A20  (helix)
  - F18 ↔ L22  (helix)
  - T3 ↔ L10  (sheet)
  - L10 ↔ E17  (sheet)
  - E17 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=64 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6335 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
