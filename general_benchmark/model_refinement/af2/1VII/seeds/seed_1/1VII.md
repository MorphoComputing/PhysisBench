# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 1.418 A
- tm_score_ca_ordered: 0.6607910783808159
- heavy_atom_rmsd: 3.387 A
- sidechain_heavy_atom_rmsd: 4.244 A
- **all-atom quality (honest):** heavy 3.387 A, sidechain 4.244 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.889

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.418465849110425
- ga_delta_rmsd: -0.04837288654819649  ga_fitness_mode: energy
- pre_local_rmsd: 1.4184882700490589  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=6 · 3-10(G)=2 · coil(C)=2

```
EEHHGHHHHHHEEHHHHHHEHGHHHHHHHHHECC
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=12 · sheet=4
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - W23 ↔ N27  (helix)
  - K24 ↔ L28  (helix)
  - Q25 ↔ K29  (helix)
  - Q26 ↔ K30  (helix)
  - N27 ↔ E31  (helix)
  - L1 ↔ T13  (sheet)
  - S2 ↔ T13  (sheet)
  - M12 ↔ L20  (sheet)
  - T13 ↔ L20  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=99 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=13 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1597 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
