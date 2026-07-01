# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\2CRD\seeds\seed_0\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 1.067 A
- tm_score_ca_ordered: 0.7624567318596016
- heavy_atom_rmsd: 3.188 A
- sidechain_heavy_atom_rmsd: 4.174 A
- **all-atom quality (honest):** heavy 3.188 A, sidechain 4.174 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.893

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=1.0917389681504417 -> 0.8817933077922901 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.0666411776151945
- ga_delta_rmsd: -0.22475004783600339  ga_fitness_mode: energy
- pre_local_rmsd: 1.0665338304885916  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=11 · 3-10(G)=8 · coil(C)=4

```
CEEEEGEGHHHHHHHHGCCGEGHEECEHHEGGGE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=4 · sheet=12
  - K9 ↔ S13  (helix)
  - E10 ↔ V14  (helix)
  - C11 ↔ C15  (helix)
  - W12 ↔ Q16  (helix)
  - S4 ↔ G24  (sheet)
  - C5 ↔ G24  (sheet)
  - C5 ↔ K25  (sheet)
  - T7 ↔ G24  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ M27  (sheet)
  - T21 ↔ Y34  (sheet)
  - G24 ↔ K30  (sheet)
  - G24 ↔ Y34  (sheet)
  - K25 ↔ K30  (sheet)
  - K25 ↔ Y34  (sheet)
  - M27 ↔ Y34  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=131 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=65 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1558 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2CRD.ensemble.pdb`)
- RMSF mean=0.029Å max=0.069Å (per-residue in .per_residue.csv)
- most flexible residues: 17, 16, 32, 24, 5

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2CRD.pae.csv`
- mean=0.02Å · max=0.096Å · AlphaFold-PAE analog (low block = rigid unit/domain)
