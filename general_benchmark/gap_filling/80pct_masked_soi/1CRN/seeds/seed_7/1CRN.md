# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CRN\seeds\seed_7\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 0.731 A
- tm_score_ca_ordered: 0.8928902019128803
- heavy_atom_rmsd: 2.430 A
- sidechain_heavy_atom_rmsd: 3.152 A
- **all-atom quality (honest):** heavy 2.430 A, sidechain 3.152 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 327
- bin_accuracy: 0.832

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7310734501526432
- ga_delta_rmsd: 0.8948291944105162  ga_fitness_mode: energy
- pre_local_rmsd: 0.7437055800143479  localized_anchor_rmsd: 0.7310587655576462

## Failure Classification

- primary_reason: `SIDECHAIN_RMSD_HIGH`
- reasons: `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=13 · 3-10(G)=9 · coil(C)=7

```
CEGGEHHGGHCHHGHCCHEEEHHHGHHEGGEECECEEEGCHHHE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=4 · sheet=10
  - I6 ↔ S10  (helix)
  - P18 ↔ E22  (helix)
  - E22 ↔ A26  (helix)
  - A23 ↔ T27  (helix)
  - T20 ↔ Y28  (sheet)
  - P21 ↔ Y28  (sheet)
  - P21 ↔ C31  (sheet)
  - P21 ↔ I32  (sheet)
  - C31 ↔ A44  (sheet)
  - I32 ↔ A37  (sheet)
  - I32 ↔ T38  (sheet)
  - I32 ↔ A44  (sheet)
  - A37 ↔ A44  (sheet)
  - T38 ↔ A44  (sheet)

## Solvent Accessibility (burial)

- buried=17 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=143 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=44 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5648 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
