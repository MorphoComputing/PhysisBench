# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1JBL\seeds\seed_0\1JBL.pdb`
- residues: 12
- mode: oracle
- ca_rmsd: 0.843 A
- tm_score_ca_ordered: 0.41428749186038605
- heavy_atom_rmsd: 2.750 A
- sidechain_heavy_atom_rmsd: 3.387 A
- **all-atom quality (honest):** heavy 2.750 A, sidechain 3.387 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 45
- bin_accuracy: 0.956

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=9
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8429705023671868
- ga_delta_rmsd: -0.0349863956920361  ga_fitness_mode: energy
- pre_local_rmsd: 0.8429720371614502  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=1 · strand(E)=3 · 3-10(G)=6 · coil(C)=2

```
ECGHECGGGGGE
```

## Backbone H-bond Network

- total=1 · helix(i→i+4)=0 · sheet=1
  - R1 ↔ P12  (sheet)

## Solvent Accessibility (burial)

- buried=6 · exposed=3 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=24 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1544 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C2–C10

## Side-chain Rotamers (χ1/χ2)

- 12 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
