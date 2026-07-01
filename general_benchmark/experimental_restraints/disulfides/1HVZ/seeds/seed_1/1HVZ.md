# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1HVZ\seeds\seed_1\1HVZ.pdb`
- residues: 16
- mode: refinement
- ca_rmsd: 5.520 A
- tm_score_ca_ordered: 0.03355275427358741
- heavy_atom_rmsd: 7.428 A
- sidechain_heavy_atom_rmsd: 8.562 A
- **all-atom quality (honest):** heavy 7.428 A, sidechain 8.562 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 3
- bin_accuracy: 1.000

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=1 · 3-10(G)=1 · coil(C)=2

```
CHHEHHGHHHHHHHHC
```

## Backbone H-bond Network

- total=6 · helix(i→i+4)=6 · sheet=0
  - C2 ↔ C6  (helix)
  - L5 ↔ G9  (helix)
  - C6 ↔ V10  (helix)
  - R8 ↔ R12  (helix)
  - V10 ↔ I14  (helix)
  - C11 ↔ C15  (helix)

## Solvent Accessibility (burial)

- buried=9 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=81 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=39 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6808 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
