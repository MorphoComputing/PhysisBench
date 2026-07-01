# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1HVZ/sequence/1HVZ.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1HVZ/seeds/seed_0/1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 0.103 A
- tm_score_ca_ordered: 0.9607291811130012
- heavy_atom_rmsd: 2.513 A
- sidechain_heavy_atom_rmsd: 3.166 A
- **all-atom quality (honest):** heavy 2.513 A, sidechain 3.166 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 91
- bin_accuracy: 0.967

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=12
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.10272924189928541
- ga_delta_rmsd: 1.6808686798786145  ga_fitness_mode: energy
- pre_local_rmsd: 0.10280880822253247  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=1 · strand(E)=6 · 3-10(G)=7 · coil(C)=2

```
CCEGGGEHEEGGGEGE
```

## Backbone H-bond Network

- total=2 · helix(i→i+4)=0 · sheet=2
  - R3 ↔ I14  (sheet)
  - R3 ↔ T16  (sheet)

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

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
