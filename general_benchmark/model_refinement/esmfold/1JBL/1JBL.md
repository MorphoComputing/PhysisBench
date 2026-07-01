# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1JBL\seeds\seed_0\1JBL.pdb`
- residues: 12
- mode: oracle
- ca_rmsd: 0.590 A
- tm_score_ca_ordered: 0.5556166526930109
- heavy_atom_rmsd: 2.631 A
- sidechain_heavy_atom_rmsd: 3.079 A
- **all-atom quality (honest):** heavy 2.631 A, sidechain 3.079 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 45
- bin_accuracy: 0.800

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=9
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=1.2292442675665143 -> 1.0273012564187491 A
- topology_reconvergence: applied=True accepted=36/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5897478774682815
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5897500548091729  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=1 · strand(E)=6 · 3-10(G)=5 · coil(C)=0

```
EEGHEGGEGGEE
```

## Backbone H-bond Network

- total=7 · helix(i→i+4)=0 · sheet=7
  - R1 ↔ P8  (sheet)
  - R1 ↔ F11  (sheet)
  - R1 ↔ P12  (sheet)
  - C2 ↔ P8  (sheet)
  - C2 ↔ F11  (sheet)
  - C2 ↔ P12  (sheet)
  - S5 ↔ F11  (sheet)

## Solvent Accessibility (burial)

- buried=6 · exposed=3 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=23 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1506 (restraint satisfaction; lower=better)
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
- RMSF mean=0.994Å max=1.532Å (per-residue in .per_residue.csv)
- most flexible residues: 11, 8, 5, 7, 2

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1JBL.pae.csv`
- mean=0.058Å · max=0.372Å · AlphaFold-PAE analog (low block = rigid unit/domain)
