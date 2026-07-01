# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\2CRD\seeds\seed_0\2CRD.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 7.008 A
- tm_score_ca_ordered: 0.09821990314271016
- heavy_atom_rmsd: 8.508 A
- sidechain_heavy_atom_rmsd: 9.597 A
- **all-atom quality (honest):** heavy 8.508 A, sidechain 9.597 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 3
- bin_accuracy: 0.667

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=8 · 3-10(G)=5 · coil(C)=0

```
EEHEEHHGGEHHGGHEHHHHHHEGHHHHHHHHHE
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=12 · sheet=15
  - V3 ↔ T7  (helix)
  - T7 ↔ C11  (helix)
  - C11 ↔ C15  (helix)
  - R17 ↔ T21  (helix)
  - L18 ↔ S22  (helix)
  - T21 ↔ K25  (helix)
  - S22 ↔ C26  (helix)
  - K25 ↔ K29  (helix)
  - C26 ↔ K30  (helix)
  - M27 ↔ C31  (helix)
  - N28 ↔ R32  (helix)
  - K29 ↔ C33  (helix)
  - T1 ↔ E10  (sheet)
  - T1 ↔ Q16  (sheet)
  - N2 ↔ E10  (sheet)
  - N2 ↔ Q16  (sheet)
  - S4 ↔ E10  (sheet)
  - S4 ↔ Q16  (sheet)
  - S4 ↔ R23  (sheet)
  - C5 ↔ E10  (sheet)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=306 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=193 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.829 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
