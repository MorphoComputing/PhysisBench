# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1JBL\seeds\seed_5\1JBL.pdb`
- residues: 12
- mode: oracle
- ca_rmsd: 0.994 A
- tm_score_ca_ordered: 0.3816343215918511
- heavy_atom_rmsd: 2.701 A
- sidechain_heavy_atom_rmsd: 3.185 A
- **all-atom quality (honest):** heavy 2.701 A, sidechain 3.185 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 38
- bin_accuracy: 0.895

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=12
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9940219318697147
- ga_delta_rmsd: -0.057343174638973426  ga_fitness_mode: energy
- pre_local_rmsd: 0.9940669044002248  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=3 · strand(E)=5 · 3-10(G)=1 · coil(C)=3

```
EEGHHHECCEEC
```

## Backbone H-bond Network

- total=5 · helix(i→i+4)=0 · sheet=5
  - R1 ↔ C10  (sheet)
  - R1 ↔ F11  (sheet)
  - C2 ↔ P7  (sheet)
  - C2 ↔ C10  (sheet)
  - C2 ↔ F11  (sheet)

## Solvent Accessibility (burial)

- buried=6 · exposed=2 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=25 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9085 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C2–C10

## Side-chain Rotamers (χ1/χ2)

- 12 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
