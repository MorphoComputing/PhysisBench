# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 0.944 A
- tm_score_ca_ordered: 0.6905383682983249
- heavy_atom_rmsd: 3.236 A
- sidechain_heavy_atom_rmsd: 4.328 A
- **all-atom quality (honest):** heavy 3.236 A, sidechain 4.328 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 325
- bin_accuracy: 0.948

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9440829363410101
- ga_delta_rmsd: 0.05899088155753052  ga_fitness_mode: energy
- pre_local_rmsd: 0.9440538220670817  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=11 · 3-10(G)=4 · coil(C)=5

```
CEHHEEGGEECCHHHHGCEECEHHEGEE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=0 · sheet=23
  - P2 ↔ C19  (sheet)
  - P2 ↔ S20  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ S20  (sheet)
  - S6 ↔ K22  (sheet)
  - S6 ↔ V25  (sheet)
  - W9 ↔ V25  (sheet)
  - I10 ↔ S20  (sheet)
  - I10 ↔ V25  (sheet)
  - C19 ↔ V25  (sheet)
  - C19 ↔ Y27  (sheet)
  - C19 ↔ R28  (sheet)
  - S20 ↔ V25  (sheet)
  - S20 ↔ Y27  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=95 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=44 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1532 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
