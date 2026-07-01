# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1POH\seeds\seed_0\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.477 A
- tm_score_ca_ordered: 0.981009325383659
- heavy_atom_rmsd: 2.453 A
- sidechain_heavy_atom_rmsd: 3.250 A
- **all-atom quality (honest):** heavy 2.453 A, sidechain 3.250 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3240
- bin_accuracy: 0.920

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=0.4772520491481085 -> 0.4432065471231535 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.47727315974061574
- ga_delta_rmsd: -0.03764772232280078  ga_fitness_mode: energy
- pre_local_rmsd: 0.4808542694459543  localized_anchor_rmsd: 0.4772919215930729

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=23 · 3-10(G)=12 · coil(C)=10

```
CEEEEECHEGGEHEGGHHHHHHHHHHHEGECGEGEEHHECECHHEGHHHHHHGCECHEGECCEEEEHGHHHHHHHHHHHHHGC
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=22 · sheet=12
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
  - F47 ↔ T51  (helix)
  - K48 ↔ L52  (helix)
  - E67 ↔ K71  (helix)
  - E69 ↔ V73  (helix)
  - Q70 ↔ E74  (helix)
  - K71 ↔ H75  (helix)
  - A72 ↔ L76  (helix)
  - V73 ↔ V77  (helix)
  - E74 ↔ K78  (helix)
  - H75 ↔ L79  (helix)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=329 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=163 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0685 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1POH.ensemble.pdb`)
- RMSF mean=0.022Å max=0.091Å (per-residue in .per_residue.csv)
- most flexible residues: 32, 2, 44, 35, 47

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1POH.pae.csv`
- mean=0.016Å · max=0.114Å · AlphaFold-PAE analog (low block = rigid unit/domain)
