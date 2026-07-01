# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\3IOL\seeds\seed_3\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.336 A
- tm_score_ca_ordered: 0.1081865626335956
- heavy_atom_rmsd: 4.828 A
- sidechain_heavy_atom_rmsd: 5.922 A
- **all-atom quality (honest):** heavy 4.828 A, sidechain 5.922 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 134
- bin_accuracy: 0.769

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=12 · 3-10(G)=1 · coil(C)=3

```
CCECEHGHEHEHEEHEEHEEEHHE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=3 · sheet=13
  - V6 ↔ L10  (helix)
  - S8 ↔ G12  (helix)
  - F18 ↔ L22  (helix)
  - T3 ↔ Y9  (sheet)
  - D5 ↔ E11  (sheet)
  - Y9 ↔ A14  (sheet)
  - Y9 ↔ K16  (sheet)
  - E11 ↔ K16  (sheet)
  - E11 ↔ E17  (sheet)
  - Q13 ↔ I19  (sheet)
  - Q13 ↔ A20  (sheet)
  - A14 ↔ I19  (sheet)
  - A14 ↔ A20  (sheet)
  - A14 ↔ W21  (sheet)
  - K16 ↔ W21  (sheet)
  - I19 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=57 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7159 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
