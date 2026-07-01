# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\2CRD\seeds\seed_0\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 1.079 A
- tm_score_ca_ordered: 0.7564897202920573
- heavy_atom_rmsd: 3.092 A
- sidechain_heavy_atom_rmsd: 3.907 A
- **all-atom quality (honest):** heavy 3.092 A, sidechain 3.907 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.944

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=1.1006150533546648 -> 0.9641469298354932 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.0792867745328207
- ga_delta_rmsd: -0.13801767822935695  ga_fitness_mode: energy
- pre_local_rmsd: 1.0792761923348724  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=15 · 3-10(G)=7 · coil(C)=1

```
EEEEEGEGHHHEHHGHGHHHEGEEECEHHEGGEE
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=3 · sheet=28
  - K9 ↔ S13  (helix)
  - E10 ↔ V14  (helix)
  - Q16 ↔ N20  (helix)
  - T1 ↔ W12  (sheet)
  - V3 ↔ W12  (sheet)
  - S4 ↔ W12  (sheet)
  - S4 ↔ G24  (sheet)
  - C5 ↔ W12  (sheet)
  - C5 ↔ G24  (sheet)
  - C5 ↔ K25  (sheet)
  - T7 ↔ W12  (sheet)
  - T7 ↔ G24  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ M27  (sheet)
  - W12 ↔ T21  (sheet)
  - W12 ↔ R23  (sheet)
  - W12 ↔ G24  (sheet)
  - W12 ↔ K25  (sheet)
  - W12 ↔ K30  (sheet)
  - T21 ↔ C33  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=131 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=65 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1542 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
