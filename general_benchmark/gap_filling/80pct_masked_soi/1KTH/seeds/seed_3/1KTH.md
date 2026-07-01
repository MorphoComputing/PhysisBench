# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1KTH\seeds\seed_3\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 1.020 A
- tm_score_ca_ordered: 0.9052264868026496
- heavy_atom_rmsd: 2.967 A
- sidechain_heavy_atom_rmsd: 3.829 A
- **all-atom quality (honest):** heavy 2.967 A, sidechain 3.829 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 489
- bin_accuracy: 0.812

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=3.102287044787322 -> 2.8050095781906186 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.019833282063738
- ga_delta_rmsd: 1.4096458268751912  ga_fitness_mode: energy
- pre_local_rmsd: 1.047578402653428  localized_anchor_rmsd: 1.0197573574685188

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=27 · 3-10(G)=11 · coil(C)=8

```
EEHHEGECEGGCEEEEEEEEEGEHGGGEGGEEECHCECEECHEEGEHHGHHHCCEE
```

## Backbone H-bond Network

- total=62 · helix(i→i+4)=2 · sheet=60
  - Q47 ↔ E51  (helix)
  - K48 ↔ K52  (helix)
  - D2 ↔ P7  (sheet)
  - K5 ↔ Y21  (sheet)
  - K5 ↔ D23  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - P7 ↔ D23  (sheet)
  - D9 ↔ F16  (sheet)
  - D9 ↔ I17  (sheet)
  - D9 ↔ L18  (sheet)
  - D9 ↔ K19  (sheet)
  - D9 ↔ W20  (sheet)
  - D9 ↔ Y21  (sheet)
  - D9 ↔ D23  (sheet)
  - C13 ↔ W33  (sheet)
  - R14 ↔ W33  (sheet)
  - D15 ↔ W33  (sheet)
  - F16 ↔ F32  (sheet)
  - F16 ↔ W33  (sheet)
  - … +42 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=198 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=112 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5583 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
