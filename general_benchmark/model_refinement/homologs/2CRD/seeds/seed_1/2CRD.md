# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\2CRD\seeds\seed_1\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.286 A
- tm_score_ca_ordered: 0.540253886212014
- heavy_atom_rmsd: 3.858 A
- sidechain_heavy_atom_rmsd: 4.708 A
- **all-atom quality (honest):** heavy 3.858 A, sidechain 4.708 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 359
- bin_accuracy: 0.869

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.28598602391729
- ga_delta_rmsd: 1.1525738736603155  ga_fitness_mode: energy
- pre_local_rmsd: 2.2859696084654226  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=9 · 3-10(G)=5 · coil(C)=2

```
EEHGHHHHHHHHHHHHHHGHEGCEECEHHEEGGE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=9 · sheet=8
  - V3 ↔ T7  (helix)
  - T6 ↔ E10  (helix)
  - T7 ↔ C11  (helix)
  - S8 ↔ W12  (helix)
  - K9 ↔ S13  (helix)
  - E10 ↔ V14  (helix)
  - C11 ↔ C15  (helix)
  - W12 ↔ Q16  (helix)
  - Q16 ↔ N20  (helix)
  - T21 ↔ C31  (sheet)
  - T21 ↔ Y34  (sheet)
  - G24 ↔ K30  (sheet)
  - G24 ↔ C31  (sheet)
  - G24 ↔ Y34  (sheet)
  - K25 ↔ K30  (sheet)
  - K25 ↔ C31  (sheet)
  - K25 ↔ Y34  (sheet)

## Solvent Accessibility (burial)

- buried=12 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=148 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=74 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.204 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
