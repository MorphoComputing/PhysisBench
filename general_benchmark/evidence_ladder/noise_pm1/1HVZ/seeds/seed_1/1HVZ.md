# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1HVZ\seeds\seed_1\1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 1.069 A
- tm_score_ca_ordered: 0.3558604844534716
- heavy_atom_rmsd: 3.233 A
- sidechain_heavy_atom_rmsd: 3.930 A
- **all-atom quality (honest):** heavy 3.233 A, sidechain 3.930 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 91
- bin_accuracy: 0.670

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=12
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.068595942457851
- ga_delta_rmsd: 0.007184542070557187  ga_fitness_mode: energy
- pre_local_rmsd: 1.0685576072839547  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=6 · strand(E)=6 · 3-10(G)=2 · coil(C)=2

```
CCEHGHEHHEEHHEGE
```

## Backbone H-bond Network

- total=7 · helix(i→i+4)=3 · sheet=4
  - C4 ↔ R8  (helix)
  - R8 ↔ R12  (helix)
  - G9 ↔ C13  (helix)
  - R3 ↔ C11  (sheet)
  - R3 ↔ I14  (sheet)
  - R3 ↔ T16  (sheet)
  - R7 ↔ I14  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=41 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=20 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1892 (restraint satisfaction; lower=better)
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
