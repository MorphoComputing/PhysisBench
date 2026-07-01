# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2ACY\seeds\seed_0\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 10.842 A
- tm_score_ca_ordered: 0.2479880976168948
- heavy_atom_rmsd: 12.133 A
- sidechain_heavy_atom_rmsd: 13.198 A
- **all-atom quality (honest):** heavy 12.133 A, sidechain 13.198 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1236
- bin_accuracy: 0.923

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.842238736339311
- ga_delta_rmsd: -1.8892186023334911  ga_fitness_mode: energy
- pre_local_rmsd: 10.842214002466193  localized_anchor_rmsd: 10.842214002466193

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=41 · 3-10(G)=14 · coil(C)=16

```
EEEGEGEGCEECEEEGEHCHHGGHHGHHGHHHECEEEEECEHCEEEEEECEECHHGHHHHHHHHGCEGEHGCEEGECEEECGEHECECEEHEHECC
```

## Backbone H-bond Network

- total=51 · helix(i→i+4)=11 · sheet=40
  - F20 ↔ Y24  (helix)
  - F21 ↔ T25  (helix)
  - Y24 ↔ E28  (helix)
  - A27 ↔ K31  (helix)
  - E28 ↔ L32  (helix)
  - A54 ↔ R58  (helix)
  - S55 ↔ H59  (helix)
  - V57 ↔ Q61  (helix)
  - R58 ↔ E62  (helix)
  - H59 ↔ W63  (helix)
  - M60 ↔ L64  (helix)
  - E1 ↔ S7  (sheet)
  - E11 ↔ Q17  (sheet)
  - G33 ↔ Q51  (sheet)
  - G33 ↔ G52  (sheet)
  - V35 ↔ G48  (sheet)
  - V35 ↔ Q49  (sheet)
  - V35 ↔ Q51  (sheet)
  - V35 ↔ G52  (sheet)
  - G36 ↔ Q47  (sheet)
  - … +31 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=43 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=385 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=212 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.424 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
