# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1SHG\seeds\seed_2\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 9.252 A
- tm_score_ca_ordered: 0.2356977436921976
- heavy_atom_rmsd: 10.817 A
- sidechain_heavy_atom_rmsd: 12.012 A
- **all-atom quality (honest):** heavy 10.817 A, sidechain 12.012 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 474
- bin_accuracy: 0.793

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.251876325957882
- ga_delta_rmsd: 0.07317125963513327  ga_fitness_mode: energy
- pre_local_rmsd: 9.251851597147196  localized_anchor_rmsd: 9.251851597147196

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=26 · 3-10(G)=5 · coil(C)=14

```
EECCCHEEGCECEEGCEEEECGECCCCHEEHCEHEEHHHEHCEEEEGEHGHCEEE
```

## Backbone H-bond Network

- total=49 · helix(i→i+4)=1 · sheet=48
  - K37 ↔ N41  (helix)
  - Y7 ↔ T18  (sheet)
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - D8 ↔ V17  (sheet)
  - D8 ↔ T18  (sheet)
  - D8 ↔ M19  (sheet)
  - D8 ↔ K20  (sheet)
  - D8 ↔ D23  (sheet)
  - E11 ↔ V17  (sheet)
  - E11 ↔ T18  (sheet)
  - E11 ↔ M19  (sheet)
  - E11 ↔ K20  (sheet)
  - S13 ↔ T18  (sheet)
  - V17 ↔ W35  (sheet)
  - V17 ↔ W36  (sheet)
  - T18 ↔ D23  (sheet)
  - T18 ↔ W36  (sheet)
  - M19 ↔ W36  (sheet)
  - … +29 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=222 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=141 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6006 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
