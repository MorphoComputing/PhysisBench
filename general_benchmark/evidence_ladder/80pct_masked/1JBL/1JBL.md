# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1JBL/sequence/1JBL.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1JBL/seeds/seed_1/1JBL.pdb`
- residues: 12
- mode: oracle
- ca_rmsd: 2.454 A
- tm_score_ca_ordered: 0.11588348061566663
- heavy_atom_rmsd: 4.152 A
- sidechain_heavy_atom_rmsd: 5.063 A
- **all-atom quality (honest):** heavy 4.152 A, sidechain 5.063 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 9
- bin_accuracy: 0.889

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=rejected_lj_regression tested=12
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.454345159350996
- ga_delta_rmsd: -0.17360826648395067  ga_fitness_mode: energy
- pre_local_rmsd: 2.454288117539282  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=5 · strand(E)=4 · 3-10(G)=0 · coil(C)=3

```
EEHHHHHCCECE
```

## Backbone H-bond Network

- total=5 · helix(i→i+4)=1 · sheet=4
  - T3 ↔ P7  (helix)
  - R1 ↔ C10  (sheet)
  - R1 ↔ P12  (sheet)
  - C2 ↔ C10  (sheet)
  - C2 ↔ P12  (sheet)

## Solvent Accessibility (burial)

- buried=7 · exposed=1 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=31 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=10 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7107 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C2–C10

## Side-chain Rotamers (χ1/χ2)

- 12 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1JBL.ensemble.pdb`)
- RMSF mean=0.788Å max=1.562Å (per-residue in .per_residue.csv)
- most flexible residues: 11, 2, 4, 10, 6

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1JBL.pae.csv`
- mean=0.313Å · max=1.639Å · AlphaFold-PAE analog (low block = rigid unit/domain)
