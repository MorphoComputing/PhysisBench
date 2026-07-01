# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.806 A
- tm_score_ca_ordered: 0.47273857314695666
- heavy_atom_rmsd: 4.826 A
- sidechain_heavy_atom_rmsd: 6.026 A
- **all-atom quality (honest):** heavy 4.826 A, sidechain 6.026 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 218
- bin_accuracy: 0.720

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.8060198879790326
- ga_delta_rmsd: 2.3102796417934877  ga_fitness_mode: energy
- pre_local_rmsd: 2.806055997303955  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=14 · 3-10(G)=2 · coil(C)=1

```
EEEHHHEHEHEHEHHHGEHEHEHEHHHEEHGEHC
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=7 · sheet=31
  - E4 ↔ A8  (helix)
  - F6 ↔ F10  (helix)
  - F10 ↔ R14  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - W23 ↔ N27  (helix)
  - Q26 ↔ K30  (helix)
  - L1 ↔ K7  (sheet)
  - L1 ↔ V9  (sheet)
  - L1 ↔ G11  (sheet)
  - L1 ↔ T13  (sheet)
  - S2 ↔ K7  (sheet)
  - S2 ↔ V9  (sheet)
  - S2 ↔ G11  (sheet)
  - S2 ↔ T13  (sheet)
  - D3 ↔ V9  (sheet)
  - D3 ↔ G11  (sheet)
  - D3 ↔ T13  (sheet)
  - K7 ↔ T13  (sheet)
  - V9 ↔ L28  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=114 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=29 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.005 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
