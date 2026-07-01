# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1SHG\seeds\seed_0\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 0.302 A
- tm_score_ca_ordered: 0.9859759438988149
- heavy_atom_rmsd: 3.000 A
- sidechain_heavy_atom_rmsd: 3.922 A
- **all-atom quality (honest):** heavy 3.000 A, sidechain 3.922 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1378
- bin_accuracy: 0.950

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=1 rmsd=0.31101547037769306 -> 0.29425690455712644 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.3022856379768603
- ga_delta_rmsd: -0.01707673903883028  ga_fitness_mode: energy
- pre_local_rmsd: 0.31053538060074876  localized_anchor_rmsd: 0.3022960341514637

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=23 · 3-10(G)=14 · coil(C)=8

```
EEGGGGECEECGEHHEGEEEGHEGGGCHEHHEGEEEGECGGHEEECECHHHEECC
```

## Backbone H-bond Network

- total=48 · helix(i→i+4)=0 · sheet=48
  - Y7 ↔ T18  (sheet)
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ T18  (sheet)
  - Y9 ↔ M19  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ D23  (sheet)
  - Q10 ↔ E16  (sheet)
  - Q10 ↔ T18  (sheet)
  - Q10 ↔ M19  (sheet)
  - Q10 ↔ K20  (sheet)
  - S13 ↔ T18  (sheet)
  - E16 ↔ W35  (sheet)
  - E16 ↔ W36  (sheet)
  - T18 ↔ D23  (sheet)
  - T18 ↔ V38  (sheet)
  - M19 ↔ V38  (sheet)
  - D23 ↔ V38  (sheet)
  - … +28 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=200 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=120 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1403 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
