# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\experimental_restraints\disulfides\1JBL\seeds\seed_0\1JBL.pdb`
- residues: 12
- mode: refinement
- ca_rmsd: 4.265 A
- tm_score_ca_ordered: 0.03382659458528866
- heavy_atom_rmsd: 5.468 A
- sidechain_heavy_atom_rmsd: 6.064 A
- **all-atom quality (honest):** heavy 5.468 A, sidechain 6.064 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 1
- bin_accuracy: 0.000

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=5 · 3-10(G)=0 · coil(C)=0

```
EEHHHHHHEHEE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=3 · sheet=6
  - T3 ↔ P7  (helix)
  - K4 ↔ P8  (helix)
  - I6 ↔ C10  (helix)
  - R1 ↔ I9  (sheet)
  - R1 ↔ F11  (sheet)
  - R1 ↔ P12  (sheet)
  - C2 ↔ I9  (sheet)
  - C2 ↔ F11  (sheet)
  - C2 ↔ P12  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=1 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=48 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=16 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0142 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C2–C10

## Side-chain Rotamers (χ1/χ2)

- 12 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
