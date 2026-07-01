# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 6.482 A
- tm_score_ca_ordered: 0.20446059311568812
- heavy_atom_rmsd: 8.063 A
- sidechain_heavy_atom_rmsd: 9.375 A
- **all-atom quality (honest):** heavy 8.063 A, sidechain 9.375 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 36
- distogram_pairs: 3
- bin_accuracy: 0.667

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=9 · 3-10(G)=2 · coil(C)=2

```
CHEEEHHHHHHHHHEHEHHHEHEHHEGHHEHHHHHGHHHHHHHHHHC
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=20 · sheet=22
  - V2 ↔ C6  (helix)
  - C6 ↔ C10  (helix)
  - T7 ↔ S11  (helix)
  - I9 ↔ Y13  (helix)
  - C10 ↔ Q14  (helix)
  - L12 ↔ E16  (helix)
  - Q14 ↔ Y18  (helix)
  - Y18 ↔ Q22  (helix)
  - L24 ↔ H28  (helix)
  - H28 ↔ A32  (helix)
  - E31 ↔ L35  (helix)
  - L33 ↔ C37  (helix)
  - Y34 ↔ G38  (helix)
  - L35 ↔ E39  (helix)
  - C37 ↔ G41  (helix)
  - G38 ↔ F42  (helix)
  - E39 ↔ F43  (helix)
  - R40 ↔ Y44  (helix)
  - G41 ↔ T45  (helix)
  - F42 ↔ P46  (helix)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=540 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=388 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.829 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=36 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
