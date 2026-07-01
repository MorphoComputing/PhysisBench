# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CRN\seeds\seed_6\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 1.351 A
- tm_score_ca_ordered: 0.794575794618817
- heavy_atom_rmsd: 3.293 A
- sidechain_heavy_atom_rmsd: 4.448 A
- **all-atom quality (honest):** heavy 3.293 A, sidechain 4.448 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 329
- bin_accuracy: 0.821

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=5.928287120261463 -> 4.771939876978681 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.3514308246523699
- ga_delta_rmsd: 2.9964450119950596  ga_fitness_mode: energy
- pre_local_rmsd: 1.3513695790801126  localized_anchor_rmsd: 1.3513695790801126

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=17 · 3-10(G)=6 · coil(C)=6

```
EEECECHEHHGHHHHHGHEEECGHHGHGCHEEEEHECEGEHEEC
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=3 · sheet=20
  - R9 ↔ N13  (helix)
  - S10 ↔ V14  (helix)
  - V14 ↔ P18  (helix)
  - T1 ↔ A8  (sheet)
  - C2 ↔ A8  (sheet)
  - C3 ↔ A8  (sheet)
  - P21 ↔ C31  (sheet)
  - P21 ↔ I32  (sheet)
  - P21 ↔ I33  (sheet)
  - P21 ↔ I34  (sheet)
  - C31 ↔ P40  (sheet)
  - C31 ↔ D42  (sheet)
  - C31 ↔ Y43  (sheet)
  - I32 ↔ T38  (sheet)
  - I32 ↔ P40  (sheet)
  - I32 ↔ D42  (sheet)
  - I32 ↔ Y43  (sheet)
  - I33 ↔ T38  (sheet)
  - I33 ↔ P40  (sheet)
  - I33 ↔ Y43  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=146 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=50 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.559 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
