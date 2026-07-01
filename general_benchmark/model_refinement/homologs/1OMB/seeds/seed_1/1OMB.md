# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1OMB\seeds\seed_1\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 6.100 A
- tm_score_ca_ordered: 0.15450734219879245
- heavy_atom_rmsd: 7.730 A
- sidechain_heavy_atom_rmsd: 9.318 A
- **all-atom quality (honest):** heavy 7.730 A, sidechain 9.318 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 309
- bin_accuracy: 0.803

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.1002161348652555
- ga_delta_rmsd: -0.9572526593642579  ga_fitness_mode: energy
- pre_local_rmsd: 6.100166984170929  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=10 · 3-10(G)=2 · coil(C)=9

```
CEHHHHHHHHHECCCCECEHCHCEHEECGGEEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=3 · sheet=13
  - E3 ↔ K7  (helix)
  - Y5 ↔ T9  (helix)
  - K7 ↔ G11  (helix)
  - A2 ↔ R17  (sheet)
  - A2 ↔ R19  (sheet)
  - G12 ↔ G27  (sheet)
  - G12 ↔ C32  (sheet)
  - R17 ↔ E31  (sheet)
  - R17 ↔ C32  (sheet)
  - R17 ↔ T33  (sheet)
  - R19 ↔ E31  (sheet)
  - R19 ↔ C32  (sheet)
  - R19 ↔ T33  (sheet)
  - S24 ↔ E31  (sheet)
  - S24 ↔ C32  (sheet)
  - I26 ↔ E31  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=141 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=83 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.217 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
