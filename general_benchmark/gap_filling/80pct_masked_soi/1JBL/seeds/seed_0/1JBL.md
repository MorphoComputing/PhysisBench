# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1JBL\seeds\seed_0\1JBL.pdb`
- residues: 12
- mode: oracle
- ca_rmsd: 1.431 A
- tm_score_ca_ordered: 0.20669891277132535
- heavy_atom_rmsd: 3.780 A
- sidechain_heavy_atom_rmsd: 4.852 A
- **all-atom quality (honest):** heavy 3.780 A, sidechain 4.852 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 38
- bin_accuracy: 0.868

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=9
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.430914137666664
- ga_delta_rmsd: -0.1808455206483719  ga_fitness_mode: energy
- pre_local_rmsd: 1.4308541629706928  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=1 · strand(E)=7 · 3-10(G)=3 · coil(C)=1

```
ECEEHGEEEGGE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=0 · sheet=8
  - R1 ↔ P7  (sheet)
  - R1 ↔ P8  (sheet)
  - R1 ↔ I9  (sheet)
  - R1 ↔ P12  (sheet)
  - T3 ↔ P8  (sheet)
  - T3 ↔ I9  (sheet)
  - T3 ↔ P12  (sheet)
  - K4 ↔ I9  (sheet)

## Solvent Accessibility (burial)

- buried=6 · exposed=2 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=26 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=8 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.649 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C2–C10

## Side-chain Rotamers (χ1/χ2)

- 12 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
