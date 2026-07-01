# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 1.167 A
- tm_score_ca_ordered: 0.6351077167762483
- heavy_atom_rmsd: 2.823 A
- sidechain_heavy_atom_rmsd: 3.572 A
- **all-atom quality (honest):** heavy 2.823 A, sidechain 3.572 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 325
- bin_accuracy: 0.945

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=1.2099265977543212 -> 1.083435913303587 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.1672627625413021
- ga_delta_rmsd: -0.10609260893616734  ga_fitness_mode: energy
- pre_local_rmsd: 1.1672857493164515  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=10 · 3-10(G)=5 · coil(C)=4

```
CEHHEEGHEECCHHHHHGEGCEGHEGEE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=2 · sheet=16
  - G4 ↔ V8  (helix)
  - I13 ↔ I17  (helix)
  - P2 ↔ C19  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ K22  (sheet)
  - S6 ↔ V25  (sheet)
  - W9 ↔ V25  (sheet)
  - I10 ↔ V25  (sheet)
  - C19 ↔ V25  (sheet)
  - C19 ↔ Y27  (sheet)
  - C19 ↔ R28  (sheet)
  - K22 ↔ Y27  (sheet)
  - K22 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=92 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=43 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1542 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
