# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CRN\seeds\seed_8\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 0.778 A
- tm_score_ca_ordered: 0.8822399654412725
- heavy_atom_rmsd: 2.641 A
- sidechain_heavy_atom_rmsd: 3.389 A
- **all-atom quality (honest):** heavy 2.641 A, sidechain 3.389 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 327
- bin_accuracy: 0.838

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7784240388015947
- ga_delta_rmsd: 2.91211586315648  ga_fitness_mode: energy
- pre_local_rmsd: 0.8192165496091489  localized_anchor_rmsd: 0.7784532617803127

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=14 · 3-10(G)=9 · coil(C)=5

```
EEGCEHHHHHGHHHHHCHEEECGHHHHGGGEECEGEEEGEGEHC
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=3 · sheet=9
  - I6 ↔ S10  (helix)
  - A8 ↔ F12  (helix)
  - F12 ↔ R16  (helix)
  - T1 ↔ P21  (sheet)
  - P21 ↔ I32  (sheet)
  - C31 ↔ P40  (sheet)
  - C31 ↔ D42  (sheet)
  - I32 ↔ A37  (sheet)
  - I32 ↔ T38  (sheet)
  - I32 ↔ P40  (sheet)
  - I32 ↔ D42  (sheet)
  - I34 ↔ P40  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=142 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=44 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6678 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
