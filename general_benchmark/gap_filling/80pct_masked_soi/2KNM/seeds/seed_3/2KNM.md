# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2KNM\seeds\seed_3\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 1.741 A
- tm_score_ca_ordered: 0.4843483157738709
- heavy_atom_rmsd: 3.165 A
- sidechain_heavy_atom_rmsd: 3.920 A
- **all-atom quality (honest):** heavy 3.165 A, sidechain 3.920 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 159
- bin_accuracy: 0.723

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=3.380666276432584 -> 2.7100551221561124 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.7413363626939564
- ga_delta_rmsd: 0.7056452726681424  ga_fitness_mode: energy
- pre_local_rmsd: 1.74130653446157  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=19 · 3-10(G)=3 · coil(C)=2

```
EEEEECHCEEEEEEEGGEEEHEHHEGEE
```

## Backbone H-bond Network

- total=86 · helix(i→i+4)=0 · sheet=86
  - I1 ↔ I13  (sheet)
  - I1 ↔ S14  (sheet)
  - I1 ↔ S15  (sheet)
  - I1 ↔ G18  (sheet)
  - I1 ↔ C19  (sheet)
  - I1 ↔ S20  (sheet)
  - P2 ↔ C12  (sheet)
  - P2 ↔ I13  (sheet)
  - P2 ↔ S14  (sheet)
  - P2 ↔ S15  (sheet)
  - P2 ↔ G18  (sheet)
  - P2 ↔ C19  (sheet)
  - P2 ↔ S20  (sheet)
  - P2 ↔ K22  (sheet)
  - C3 ↔ P11  (sheet)
  - C3 ↔ C12  (sheet)
  - C3 ↔ I13  (sheet)
  - C3 ↔ S14  (sheet)
  - C3 ↔ S15  (sheet)
  - C3 ↔ G18  (sheet)
  - … +66 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=57 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9508 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
