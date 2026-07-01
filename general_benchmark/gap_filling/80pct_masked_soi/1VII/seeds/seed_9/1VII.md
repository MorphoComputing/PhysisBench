# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1VII\seeds\seed_9\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 5.231 A
- tm_score_ca_ordered: 0.32393691273237113
- heavy_atom_rmsd: 6.412 A
- sidechain_heavy_atom_rmsd: 7.355 A
- **all-atom quality (honest):** heavy 6.412 A, sidechain 7.355 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 218
- bin_accuracy: 0.771

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=5.688867532258454 -> 5.19154827814068 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.231323939895477
- ga_delta_rmsd: -0.44068630328393965  ga_fitness_mode: energy
- pre_local_rmsd: 5.231322115451458  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=16 · 3-10(G)=2 · coil(C)=2

```
CEHHEHGGHEEEEHHEHEHEEEHEHHEHHHEEEC
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=3 · sheet=28
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - Q26 ↔ K30  (helix)
  - S2 ↔ F10  (sheet)
  - S2 ↔ G11  (sheet)
  - S2 ↔ M12  (sheet)
  - S2 ↔ T13  (sheet)
  - D5 ↔ F10  (sheet)
  - D5 ↔ G11  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ T13  (sheet)
  - F10 ↔ A16  (sheet)
  - F10 ↔ A18  (sheet)
  - F10 ↔ K24  (sheet)
  - F10 ↔ N27  (sheet)
  - G11 ↔ A16  (sheet)
  - G11 ↔ A18  (sheet)
  - M12 ↔ A18  (sheet)
  - T13 ↔ A18  (sheet)
  - T13 ↔ G33  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=98 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7713 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
