# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1HVZ\seeds\seed_1\1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 2.473 A
- tm_score_ca_ordered: 0.16370876504172532
- heavy_atom_rmsd: 4.735 A
- sidechain_heavy_atom_rmsd: 5.988 A
- **all-atom quality (honest):** heavy 4.735 A, sidechain 5.988 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 91
- bin_accuracy: 0.824

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=12
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.472394967451113
- ga_delta_rmsd: -0.4325922823050017  ga_fitness_mode: energy
- pre_local_rmsd: 2.472509559291574  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=0 · strand(E)=4 · 3-10(G)=7 · coil(C)=5

```
CEGCECEGGEGGCGGC
```

## Backbone H-bond Network

- total=1 · helix(i→i+4)=0 · sheet=1
  - L5 ↔ V10  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=37 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=18 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1407 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1HVZ.ensemble.pdb`)
- RMSF mean=0.659Å max=1.79Å (per-residue in .per_residue.csv)
- most flexible residues: 14, 1, 4, 7, 5

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HVZ.pae.csv`
- mean=0.103Å · max=0.519Å · AlphaFold-PAE analog (low block = rigid unit/domain)
