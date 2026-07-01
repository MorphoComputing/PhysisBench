# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1EGF\seeds\seed_0\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 1.610 A
- tm_score_ca_ordered: 0.7716014328265081
- heavy_atom_rmsd: 3.749 A
- sidechain_heavy_atom_rmsd: 4.928 A
- **all-atom quality (honest):** heavy 3.749 A, sidechain 4.928 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 413
- bin_accuracy: 0.816

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=2.9039786127582436 -> 2.6228248921133357 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.6103605756633386
- ga_delta_rmsd: 0.8378372811594397  ga_fitness_mode: energy
- pre_local_rmsd: 1.6215969334166767  localized_anchor_rmsd: 1.6103395276323234

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=24 · 3-10(G)=6 · coil(C)=9

```
CECCEEHHEECGCEHEEECEEGHHCHEEEGGEEGHEEEHEHHHHECEEGEC
```

## Backbone H-bond Network

- total=75 · helix(i→i+4)=2 · sheet=73
  - G35 ↔ D39  (helix)
  - D39 ↔ T43  (helix)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - C5 ↔ D10  (sheet)
  - C5 ↔ G17  (sheet)
  - C5 ↔ V18  (sheet)
  - C5 ↔ M20  (sheet)
  - C5 ↔ H21  (sheet)
  - P6 ↔ M20  (sheet)
  - P6 ↔ H21  (sheet)
  - Y9 ↔ L14  (sheet)
  - Y9 ↔ H21  (sheet)
  - Y9 ↔ S27  (sheet)
  - Y9 ↔ Y28  (sheet)
  - Y9 ↔ T29  (sheet)
  - D10 ↔ Y28  (sheet)
  - D10 ↔ T29  (sheet)
  - L14 ↔ T29  (sheet)
  - L14 ↔ C32  (sheet)
  - … +55 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=195 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=111 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5956 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
