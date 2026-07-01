# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1EGF\seeds\seed_4\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 0.958 A
- tm_score_ca_ordered: 0.8699494571504448
- heavy_atom_rmsd: 3.240 A
- sidechain_heavy_atom_rmsd: 4.313 A
- **all-atom quality (honest):** heavy 3.240 A, sidechain 4.313 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 413
- bin_accuracy: 0.845

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=2.190142937491135 -> 2.0202224214496693 A
- topology_reconvergence: applied=True accepted=14/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9583653940243833
- ga_delta_rmsd: 0.2489474643911178  ga_fitness_mode: energy
- pre_local_rmsd: 0.9705233584437248  localized_anchor_rmsd: 0.9583778549090708

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=25 · 3-10(G)=11 · coil(C)=6

```
EEEEGEGHEGGGCEHCEECEEGHHGHEGGEEEEHHEEEHEHEGGECEECEC
```

## Backbone H-bond Network

- total=84 · helix(i→i+4)=1 · sheet=83
  - G35 ↔ D39  (helix)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - P3 ↔ V18  (sheet)
  - P3 ↔ M20  (sheet)
  - P3 ↔ H21  (sheet)
  - G4 ↔ Y9  (sheet)
  - G4 ↔ V18  (sheet)
  - G4 ↔ M20  (sheet)
  - G4 ↔ H21  (sheet)
  - P6 ↔ M20  (sheet)
  - P6 ↔ H21  (sheet)
  - Y9 ↔ L14  (sheet)
  - Y9 ↔ M20  (sheet)
  - Y9 ↔ H21  (sheet)
  - Y9 ↔ S27  (sheet)
  - L14 ↔ C30  (sheet)
  - L14 ↔ N31  (sheet)
  - … +64 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=185 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=102 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5549 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
