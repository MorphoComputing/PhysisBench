# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1JBL\seeds\seed_0\1JBL.pdb`
- residues: 12
- mode: oracle
- ca_rmsd: 1.595 A
- tm_score_ca_ordered: 0.32185396209287803
- heavy_atom_rmsd: 3.165 A
- sidechain_heavy_atom_rmsd: 3.849 A
- **all-atom quality (honest):** heavy 3.165 A, sidechain 3.849 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 38
- bin_accuracy: 0.895

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=9
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.5947719377400722
- ga_delta_rmsd: -0.42733473568226055  ga_fitness_mode: energy
- pre_local_rmsd: 1.594766289306242  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=0 · strand(E)=7 · 3-10(G)=3 · coil(C)=2

```
EEGGECCGEEEE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=0 · sheet=9
  - R1 ↔ I9  (sheet)
  - R1 ↔ C10  (sheet)
  - R1 ↔ F11  (sheet)
  - R1 ↔ P12  (sheet)
  - C2 ↔ I9  (sheet)
  - C2 ↔ C10  (sheet)
  - C2 ↔ F11  (sheet)
  - C2 ↔ P12  (sheet)
  - S5 ↔ C10  (sheet)

## Solvent Accessibility (burial)

- buried=5 · exposed=2 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=24 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1458 (restraint satisfaction; lower=better)
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
