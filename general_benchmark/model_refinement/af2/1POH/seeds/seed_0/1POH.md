# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1POH\seeds\seed_0\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.430 A
- tm_score_ca_ordered: 0.9841545234849207
- heavy_atom_rmsd: 2.782 A
- sidechain_heavy_atom_rmsd: 3.753 A
- **all-atom quality (honest):** heavy 2.782 A, sidechain 3.753 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3240
- bin_accuracy: 0.931

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.42964351823783964
- ga_delta_rmsd: 0.0005425870722666204  ga_fitness_mode: energy
- pre_local_rmsd: 0.43302521779398984  localized_anchor_rmsd: 0.429628587258508

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=20 · 3-10(G)=15 · coil(C)=8

```
CEGEEGCHEHGEHEGGHHHHHHHHHHHEGECGEGEEHHEEECHHEHHHHHHHGGECHEGGCCEGEEHGHHHHHHHHHHHHHGC
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=23 · sheet=13
  - L13 ↔ P17  (helix)
  - P17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - A19 ↔ K23  (helix)
  - Q20 ↔ E24  (helix)
  - F21 ↔ A25  (helix)
  - V22 ↔ K26  (helix)
  - K23 ↔ G27  (helix)
  - A43 ↔ F47  (helix)
  - K44 ↔ K48  (helix)
  - L46 ↔ Q50  (helix)
  - F47 ↔ T51  (helix)
  - K48 ↔ L52  (helix)
  - E67 ↔ K71  (helix)
  - E69 ↔ V73  (helix)
  - Q70 ↔ E74  (helix)
  - K71 ↔ H75  (helix)
  - A72 ↔ L76  (helix)
  - V73 ↔ V77  (helix)
  - E74 ↔ K78  (helix)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=327 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=162 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0641 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
