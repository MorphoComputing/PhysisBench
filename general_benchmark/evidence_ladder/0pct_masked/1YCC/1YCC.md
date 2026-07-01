# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1YCC/sequence/1YCC.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1YCC/seeds/seed_1/1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 0.288 A
- tm_score_ca_ordered: 0.9941836366108536
- heavy_atom_rmsd: 2.783 A
- sidechain_heavy_atom_rmsd: 3.692 A
- **all-atom quality (honest):** heavy 2.783 A, sidechain 3.692 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 3282
- bin_accuracy: 0.929

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=1 rmsd=0.3769912810824058 -> 0.34444163738958167 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.2881924193215608
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.29995891162823407  localized_anchor_rmsd: 0.28819750574471076

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=47 · strand(E)=31 · 3-10(G)=15 · coil(C)=10

```
EEECEEGHHHHHHHHGEHHHCEEGEGHEECEHEECGEHHCHEEEGCECHECEEHHHHHHGGGGEHGHHHHHHHCEEGHEHEGEGECGEHHHHHHHHHHHHHHE
```

## Backbone H-bond Network

- total=69 · helix(i→i+4)=20 · sheet=49
  - K8 ↔ T12  (helix)
  - K9 ↔ L13  (helix)
  - G10 ↔ F14  (helix)
  - A11 ↔ K15  (helix)
  - K15 ↔ L19  (helix)
  - D54 ↔ K58  (helix)
  - A55 ↔ K59  (helix)
  - E65 ↔ S69  (helix)
  - N67 ↔ Y71  (helix)
  - M68 ↔ L72  (helix)
  - S69 ↔ T73  (helix)
  - E89 ↔ N93  (helix)
  - K90 ↔ D94  (helix)
  - D91 ↔ L95  (helix)
  - R92 ↔ I96  (helix)
  - N93 ↔ T97  (helix)
  - D94 ↔ Y98  (helix)
  - L95 ↔ L99  (helix)
  - I96 ↔ K100  (helix)
  - Y98 ↔ A102  (helix)
  - … +49 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=40 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=360 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=149 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6277 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1YCC.ensemble.pdb`)
- RMSF mean=0.026Å max=0.234Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 43, 71, 68, 97

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1YCC.pae.csv`
- mean=0.02Å · max=0.273Å · AlphaFold-PAE analog (low block = rigid unit/domain)
