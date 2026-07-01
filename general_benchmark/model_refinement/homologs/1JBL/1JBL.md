# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1JBL\seeds\seed_1\1JBL.pdb`
- residues: 12
- mode: oracle
- ca_rmsd: 0.868 A
- tm_score_ca_ordered: 0.4227882414152993
- heavy_atom_rmsd: 3.127 A
- sidechain_heavy_atom_rmsd: 4.004 A
- **all-atom quality (honest):** heavy 3.127 A, sidechain 4.004 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 38
- bin_accuracy: 0.895

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=12
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=1.5827769726403147 -> 0.8706848314011154 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8684118342109182
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.8684900310483133  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=3 · strand(E)=4 · 3-10(G)=5 · coil(C)=0

```
EEGGHGHHGEGE
```

## Backbone H-bond Network

- total=4 · helix(i→i+4)=0 · sheet=4
  - R1 ↔ C10  (sheet)
  - R1 ↔ P12  (sheet)
  - C2 ↔ C10  (sheet)
  - C2 ↔ P12  (sheet)

## Solvent Accessibility (burial)

- buried=6 · exposed=1 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=26 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1479 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C2–C10

## Side-chain Rotamers (χ1/χ2)

- 12 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1JBL.ensemble.pdb`)
- RMSF mean=0.468Å max=1.717Å (per-residue in .per_residue.csv)
- most flexible residues: 6, 9, 5, 4, 11

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1JBL.pae.csv`
- mean=0.136Å · max=0.97Å · AlphaFold-PAE analog (low block = rigid unit/domain)
