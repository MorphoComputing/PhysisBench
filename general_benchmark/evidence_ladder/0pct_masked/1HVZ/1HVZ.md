# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set/general_benchmark/1HVZ/sequence/1HVZ.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1HVZ/seeds/seed_1/1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 0.093 A
- tm_score_ca_ordered: 0.9671613706237971
- heavy_atom_rmsd: 2.450 A
- sidechain_heavy_atom_rmsd: 2.826 A
- **all-atom quality (honest):** heavy 2.450 A, sidechain 2.826 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 91
- bin_accuracy: 0.967

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=15
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.09320283516285716
- ga_delta_rmsd: 0.18679716164009602  ga_fitness_mode: energy
- pre_local_rmsd: 0.09320022514702594  localized_anchor_rmsd: None

## Secondary Structure (DSSP-like)

- helix(H)=0 · strand(E)=4 · 3-10(G)=8 · coil(C)=4

```
CCEGGGEGCEGGGEGC
```

## Backbone H-bond Network

- total=1 · helix(i→i+4)=0 · sheet=1
  - R3 ↔ I14  (sheet)

## Solvent Accessibility (burial)

- buried=6 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=40 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7023 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1HVZ.ensemble.pdb`)
- RMSF mean=0.018Å max=0.035Å (per-residue in .per_residue.csv)
- most flexible residues: 13, 4, 3, 7, 14

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HVZ.pae.csv`
- mean=0.012Å · max=0.042Å · AlphaFold-PAE analog (low block = rigid unit/domain)
