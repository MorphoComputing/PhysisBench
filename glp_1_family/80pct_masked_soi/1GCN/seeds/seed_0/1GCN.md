# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1GCN\seeds\seed_0\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 4.223 A
- tm_score_ca_ordered: 0.10553821283544196
- heavy_atom_rmsd: 6.242 A
- sidechain_heavy_atom_rmsd: 7.346 A
- **all-atom quality (honest):** heavy 6.242 A, sidechain 7.346 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 155
- bin_accuracy: 0.697

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=15 · 3-10(G)=2 · coil(C)=2

```
EHHEGHEGEHCEEEHEEHHEECEHEEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=3 · sheet=16
  - Q2 ↔ T6  (helix)
  - T6 ↔ S10  (helix)
  - S15 ↔ Q19  (helix)
  - T4 ↔ Y9  (sheet)
  - S7 ↔ Y12  (sheet)
  - Y9 ↔ D14  (sheet)
  - Y9 ↔ R16  (sheet)
  - Y12 ↔ R17  (sheet)
  - L13 ↔ D20  (sheet)
  - L13 ↔ F21  (sheet)
  - D14 ↔ D20  (sheet)
  - D14 ↔ F21  (sheet)
  - R16 ↔ F21  (sheet)
  - R17 ↔ Q23  (sheet)
  - D20 ↔ L25  (sheet)
  - D20 ↔ M26  (sheet)
  - D20 ↔ N27  (sheet)
  - F21 ↔ M26  (sheet)
  - F21 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=16 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=44 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3337 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
