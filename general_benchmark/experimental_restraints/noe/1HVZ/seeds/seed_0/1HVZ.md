# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\experimental_restraints\noe\1HVZ\seeds\seed_0\1HVZ.pdb`
- residues: 16
- mode: refinement
- ca_rmsd: 6.163 A
- tm_score_ca_ordered: 0.021420285958437875
- heavy_atom_rmsd: 7.338 A
- sidechain_heavy_atom_rmsd: 8.209 A
- **all-atom quality (honest):** heavy 7.338 A, sidechain 8.209 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 11
- bin_accuracy: 0.364

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=5 · 3-10(G)=0 · coil(C)=1

```
CHHHEHHHHEHHEEHE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=6 · sheet=5
  - C2 ↔ C6  (helix)
  - R3 ↔ R7  (helix)
  - C4 ↔ R8  (helix)
  - R7 ↔ C11  (helix)
  - R8 ↔ R12  (helix)
  - C11 ↔ C15  (helix)
  - L5 ↔ V10  (sheet)
  - L5 ↔ C13  (sheet)
  - L5 ↔ I14  (sheet)
  - L5 ↔ T16  (sheet)
  - V10 ↔ T16  (sheet)

## Solvent Accessibility (burial)

- buried=5 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=83 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=44 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0022 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
