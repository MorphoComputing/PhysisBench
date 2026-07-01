# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HVZ\seeds\seed_9\1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 3.253 A
- tm_score_ca_ordered: 0.13362059594860404
- heavy_atom_rmsd: 4.619 A
- sidechain_heavy_atom_rmsd: 5.524 A
- **all-atom quality (honest):** heavy 4.619 A, sidechain 5.524 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 64
- bin_accuracy: 0.828

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=12
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.252926892013103
- ga_delta_rmsd: 0.027887125454583828  ga_fitness_mode: energy
- pre_local_rmsd: 3.252982902999793  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=0 · strand(E)=10 · 3-10(G)=2 · coil(C)=4

```
ECEEGCECEECEEGEE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=0 · sheet=15
  - F1 ↔ C13  (sheet)
  - F1 ↔ C15  (sheet)
  - F1 ↔ T16  (sheet)
  - R3 ↔ R12  (sheet)
  - R3 ↔ C13  (sheet)
  - R3 ↔ C15  (sheet)
  - R3 ↔ T16  (sheet)
  - C4 ↔ G9  (sheet)
  - C4 ↔ V10  (sheet)
  - C4 ↔ R12  (sheet)
  - C4 ↔ C13  (sheet)
  - C4 ↔ C15  (sheet)
  - C4 ↔ T16  (sheet)
  - R7 ↔ R12  (sheet)
  - R7 ↔ C13  (sheet)

## Solvent Accessibility (burial)

- buried=7 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=39 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=20 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4795 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
