# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1VII\seeds\seed_2\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.386 A
- tm_score_ca_ordered: 0.43327770991651715
- heavy_atom_rmsd: 4.295 A
- sidechain_heavy_atom_rmsd: 5.385 A
- **all-atom quality (honest):** heavy 4.295 A, sidechain 5.385 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 220
- bin_accuracy: 0.718

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.3857096429836906
- ga_delta_rmsd: 0.43822353596482877  ga_fitness_mode: energy
- pre_local_rmsd: 2.385688292597245  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=16 · 3-10(G)=4 · coil(C)=4

```
CEHHEHEGECEEEGHCHEEGEEHEHHEGHHECEE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=1 · sheet=23
  - Q26 ↔ K30  (helix)
  - S2 ↔ K7  (sheet)
  - S2 ↔ V9  (sheet)
  - S2 ↔ G11  (sheet)
  - S2 ↔ M12  (sheet)
  - S2 ↔ T13  (sheet)
  - D5 ↔ G11  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ T13  (sheet)
  - K7 ↔ M12  (sheet)
  - K7 ↔ T13  (sheet)
  - V9 ↔ N27  (sheet)
  - G11 ↔ A18  (sheet)
  - M12 ↔ A18  (sheet)
  - T13 ↔ A18  (sheet)
  - T13 ↔ N19  (sheet)
  - T13 ↔ G33  (sheet)
  - A18 ↔ K24  (sheet)
  - A18 ↔ N27  (sheet)
  - N19 ↔ K24  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=103 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5392 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
