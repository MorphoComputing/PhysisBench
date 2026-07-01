# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 1.480 A
- tm_score_ca_ordered: 0.5928193827306577
- heavy_atom_rmsd: 2.975 A
- sidechain_heavy_atom_rmsd: 3.622 A
- **all-atom quality (honest):** heavy 2.975 A, sidechain 3.622 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 159
- bin_accuracy: 0.717

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=24
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=2.6020645944212863 -> 2.3464342401767144 A
- topology_reconvergence: applied=True accepted=19/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.480313317126168
- ga_delta_rmsd: 0.27325403419511285  ga_fitness_mode: energy
- pre_local_rmsd: 1.4801564673135925  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=13 · 3-10(G)=5 · coil(C)=6

```
CEGGEGGCEEEEGEHHCECECEHHECEE
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=0 · sheet=35
  - P2 ↔ C12  (sheet)
  - P2 ↔ S14  (sheet)
  - P2 ↔ G18  (sheet)
  - P2 ↔ S20  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ P11  (sheet)
  - E5 ↔ C12  (sheet)
  - E5 ↔ S14  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - W9 ↔ V25  (sheet)
  - I10 ↔ V25  (sheet)
  - P11 ↔ S20  (sheet)
  - P11 ↔ V25  (sheet)
  - P11 ↔ Y27  (sheet)
  - C12 ↔ G18  (sheet)
  - C12 ↔ S20  (sheet)
  - C12 ↔ K22  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=112 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=62 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9058 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
