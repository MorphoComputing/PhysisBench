# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1OMB\seeds\seed_0\1OMB.pdb`
- residues: 33
- mode: refinement
- ca_rmsd: 8.297 A
- tm_score_ca_ordered: 0.1006395081583831
- heavy_atom_rmsd: 9.598 A
- sidechain_heavy_atom_rmsd: 10.760 A
- **all-atom quality (honest):** heavy 9.598 A, sidechain 10.760 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 27
- distogram_pairs: 3
- bin_accuracy: 0.000

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=9 · 3-10(G)=2 · coil(C)=2

```
CHEHHHHEHEHEGEEHHHGHHHHHEHEHEHHHC
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=9 · sheet=21
  - A2 ↔ G6  (helix)
  - Y5 ↔ T9  (helix)
  - C16 ↔ P20  (helix)
  - G18 ↔ R22  (helix)
  - P20 ↔ S24  (helix)
  - R22 ↔ I26  (helix)
  - S24 ↔ T28  (helix)
  - I26 ↔ C30  (helix)
  - T28 ↔ C32  (helix)
  - E3 ↔ C8  (sheet)
  - E3 ↔ W10  (sheet)
  - E3 ↔ G12  (sheet)
  - E3 ↔ K14  (sheet)
  - C8 ↔ K14  (sheet)
  - C8 ↔ C15  (sheet)
  - C8 ↔ M25  (sheet)
  - C8 ↔ G27  (sheet)
  - W10 ↔ C15  (sheet)
  - W10 ↔ M25  (sheet)
  - W10 ↔ G27  (sheet)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=256 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=164 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4216 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=27 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
