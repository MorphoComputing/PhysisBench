# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1MSI\seeds\seed_1\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 0.407 A
- tm_score_ca_ordered: 0.9818700802628799
- heavy_atom_rmsd: 2.298 A
- sidechain_heavy_atom_rmsd: 3.031 A
- **all-atom quality (honest):** heavy 2.298 A, sidechain 3.031 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1770
- bin_accuracy: 0.933

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4065433589683489
- ga_delta_rmsd: 0.016543277045547145  ga_fitness_mode: energy
- pre_local_rmsd: 0.4109607826445449  localized_anchor_rmsd: 0.4065235282627742

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=18 · 3-10(G)=15 · coil(C)=9

```
CEEGCGGHECGEGHEGGEHHHCECEGEEGCECCHHHHHHHHHEEGHECGEGHEGGGHHHEHHHE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=7 · sheet=12
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - D36 ↔ L40  (helix)
  - P38 ↔ S42  (helix)
  - S42 ↔ N46  (helix)
  - D58 ↔ G62  (helix)
  - M59 ↔ Y63  (helix)
  - A3 ↔ R23  (sheet)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ T18  (sheet)
  - Q9 ↔ R23  (sheet)
  - P12 ↔ T18  (sheet)
  - T18 ↔ R23  (sheet)
  - R23 ↔ G31  (sheet)
  - E25 ↔ G31  (sheet)
  - M43 ↔ V60  (sheet)
  - Q44 ↔ V60  (sheet)
  - R47 ↔ T53  (sheet)
  - R47 ↔ V60  (sheet)

## Solvent Accessibility (burial)

- buried=23 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=240 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=141 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1289 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1MSI.ensemble.pdb`)
- RMSF mean=0.072Å max=1.267Å (per-residue in .per_residue.csv)
- most flexible residues: 64, 1, 62, 35, 63

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1MSI.pae.csv`
- mean=0.038Å · max=1.209Å · AlphaFold-PAE analog (low block = rigid unit/domain)
