# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1VII\seeds\seed_5\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 4.827 A
- tm_score_ca_ordered: 0.318925787638367
- heavy_atom_rmsd: 5.718 A
- sidechain_heavy_atom_rmsd: 6.381 A
- **all-atom quality (honest):** heavy 5.718 A, sidechain 6.381 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 221
- bin_accuracy: 0.638

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.82657773884949
- ga_delta_rmsd: -0.47517986147682745  ga_fitness_mode: energy
- pre_local_rmsd: 4.826569885852577  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=8 · 3-10(G)=3 · coil(C)=2

```
CEHHHHEHEHGEHHHHHHHEHHHEHEHGGHHEHC
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=9 · sheet=8
  - E4 ↔ A8  (helix)
  - F6 ↔ F10  (helix)
  - T13 ↔ F17  (helix)
  - S15 ↔ N19  (helix)
  - F17 ↔ P21  (helix)
  - N19 ↔ W23  (helix)
  - P21 ↔ Q25  (helix)
  - W23 ↔ N27  (helix)
  - N27 ↔ E31  (helix)
  - S2 ↔ K7  (sheet)
  - S2 ↔ V9  (sheet)
  - S2 ↔ M12  (sheet)
  - K7 ↔ M12  (sheet)
  - M12 ↔ K32  (sheet)
  - L20 ↔ Q26  (sheet)
  - K24 ↔ K32  (sheet)
  - Q26 ↔ K32  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=106 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=18 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6878 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
