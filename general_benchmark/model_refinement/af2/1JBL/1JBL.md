# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1JBL\seeds\seed_1\1JBL.pdb`
- residues: 12
- mode: oracle
- ca_rmsd: 0.706 A
- tm_score_ca_ordered: 0.39652163362184867
- heavy_atom_rmsd: 2.877 A
- sidechain_heavy_atom_rmsd: 3.594 A
- **all-atom quality (honest):** heavy 2.877 A, sidechain 3.594 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 45
- bin_accuracy: 0.933

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=12
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=1.2844494816719303 -> 0.9044300540511746 A
- topology_reconvergence: applied=True accepted=29/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7064086675902232
- ga_delta_rmsd: 0.08857362657618639  ga_fitness_mode: energy
- pre_local_rmsd: 0.7062836958678471  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=1 · strand(E)=4 · 3-10(G)=7 · coil(C)=0

```
EEGGEGHGGGGE
```

## Backbone H-bond Network

- total=2 · helix(i→i+4)=0 · sheet=2
  - R1 ↔ P12  (sheet)
  - C2 ↔ P12  (sheet)

## Solvent Accessibility (burial)

- buried=6 · exposed=3 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=23 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1564 (restraint satisfaction; lower=better)
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
- RMSF mean=0.174Å max=0.632Å (per-residue in .per_residue.csv)
- most flexible residues: 6, 7, 1, 4, 2

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1JBL.pae.csv`
- mean=0.047Å · max=0.238Å · AlphaFold-PAE analog (low block = rigid unit/domain)
