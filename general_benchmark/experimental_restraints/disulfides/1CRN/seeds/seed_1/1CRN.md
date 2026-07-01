# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1CRN\seeds\seed_1\1CRN.pdb`
- residues: 44
- mode: refinement
- ca_rmsd: 6.985 A
- tm_score_ca_ordered: 0.14043150835797624
- heavy_atom_rmsd: 8.175 A
- sidechain_heavy_atom_rmsd: 9.456 A
- **all-atom quality (honest):** heavy 8.175 A, sidechain 9.456 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 38
- distogram_pairs: 3
- bin_accuracy: 0.000

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=7 · 3-10(G)=2 · coil(C)=2

```
CHHHEGHHHHHEHHHHHHHHEEHEHHHHHHHHHHEGHHHEHHHC
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=19 · sheet=14
  - C3 ↔ V7  (helix)
  - P4 ↔ A8  (helix)
  - V7 ↔ N11  (helix)
  - R9 ↔ N13  (helix)
  - N11 ↔ C15  (helix)
  - N13 ↔ L17  (helix)
  - V14 ↔ P18  (helix)
  - C15 ↔ G19  (helix)
  - R16 ↔ T20  (helix)
  - G19 ↔ A23  (helix)
  - A23 ↔ T27  (helix)
  - C25 ↔ T29  (helix)
  - A26 ↔ G30  (helix)
  - T27 ↔ C31  (helix)
  - G30 ↔ I34  (helix)
  - I34 ↔ T38  (helix)
  - A37 ↔ G41  (helix)
  - T38 ↔ D42  (helix)
  - C39 ↔ Y43  (helix)
  - S5 ↔ F12  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=404 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=266 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4216 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=38 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
