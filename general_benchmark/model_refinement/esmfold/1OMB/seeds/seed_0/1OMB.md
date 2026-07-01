# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1OMB\seeds\seed_0\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 1.429 A
- tm_score_ca_ordered: 0.6365477804600143
- heavy_atom_rmsd: 3.091 A
- sidechain_heavy_atom_rmsd: 4.005 A
- **all-atom quality (honest):** heavy 3.091 A, sidechain 4.005 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 465
- bin_accuracy: 0.804

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.429300552344207
- ga_delta_rmsd: -0.03421432569518834  ga_fitness_mode: energy
- pre_local_rmsd: 1.429294732219665  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=15 · 3-10(G)=7 · coil(C)=7

```
CEECHECEEGGEEEEEGHEGGEGCGHCEHCECE
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=0 · sheet=52
  - A2 ↔ C8  (sheet)
  - A2 ↔ T9  (sheet)
  - A2 ↔ G12  (sheet)
  - A2 ↔ T13  (sheet)
  - A2 ↔ K14  (sheet)
  - A2 ↔ C15  (sheet)
  - A2 ↔ C16  (sheet)
  - A2 ↔ R19  (sheet)
  - E3 ↔ C8  (sheet)
  - E3 ↔ T9  (sheet)
  - E3 ↔ T13  (sheet)
  - E3 ↔ K14  (sheet)
  - E3 ↔ C15  (sheet)
  - E3 ↔ C16  (sheet)
  - E3 ↔ R19  (sheet)
  - G6 ↔ T13  (sheet)
  - G6 ↔ K14  (sheet)
  - G6 ↔ C15  (sheet)
  - G6 ↔ C16  (sheet)
  - G6 ↔ R19  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=113 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=60 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1604 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
