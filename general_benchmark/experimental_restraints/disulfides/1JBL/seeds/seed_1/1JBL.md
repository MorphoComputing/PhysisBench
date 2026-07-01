# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1JBL\seeds\seed_1\1JBL.pdb`
- residues: 12
- mode: refinement
- ca_rmsd: 4.749 A
- tm_score_ca_ordered: 0.013467881032609175
- heavy_atom_rmsd: 5.947 A
- sidechain_heavy_atom_rmsd: 7.017 A
- **all-atom quality (honest):** heavy 5.947 A, sidechain 7.017 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 1
- bin_accuracy: 1.000

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=4 · 3-10(G)=0 · coil(C)=0

```
EHHHEHHHHHEE
```

## Backbone H-bond Network

- total=6 · helix(i→i+4)=2 · sheet=4
  - T3 ↔ P7  (helix)
  - K4 ↔ P8  (helix)
  - R1 ↔ F11  (sheet)
  - R1 ↔ P12  (sheet)
  - S5 ↔ F11  (sheet)
  - S5 ↔ P12  (sheet)

## Solvent Accessibility (burial)

- buried=7 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=41 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=14 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6808 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C2–C10

## Side-chain Rotamers (χ1/χ2)

- 12 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
