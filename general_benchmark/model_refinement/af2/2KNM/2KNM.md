# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 0.935 A
- tm_score_ca_ordered: 0.6926441896264296
- heavy_atom_rmsd: 3.117 A
- sidechain_heavy_atom_rmsd: 4.094 A
- **all-atom quality (honest):** heavy 3.117 A, sidechain 4.094 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 325
- bin_accuracy: 0.951

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9355213340869196
- ga_delta_rmsd: 0.02635520531332458  ga_fitness_mode: energy
- pre_local_rmsd: 0.9354955100680319  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=10 · 3-10(G)=5 · coil(C)=5

```
CEHHEEGGEECCHHHHGCEGCEHHEGEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=0 · sheet=16
  - P2 ↔ C19  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ K22  (sheet)
  - S6 ↔ V25  (sheet)
  - W9 ↔ V25  (sheet)
  - I10 ↔ V25  (sheet)
  - C19 ↔ V25  (sheet)
  - C19 ↔ Y27  (sheet)
  - C19 ↔ R28  (sheet)
  - K22 ↔ Y27  (sheet)
  - K22 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=95 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=44 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1534 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=0.035Å max=0.113Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 11, 23, 27, 7

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=0.018Å · max=0.098Å · AlphaFold-PAE analog (low block = rigid unit/domain)
