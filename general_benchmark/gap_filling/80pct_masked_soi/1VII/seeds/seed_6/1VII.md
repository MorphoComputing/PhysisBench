# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1VII\seeds\seed_6\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.377 A
- tm_score_ca_ordered: 0.426569235900924
- heavy_atom_rmsd: 4.037 A
- sidechain_heavy_atom_rmsd: 5.137 A
- **all-atom quality (honest):** heavy 4.037 A, sidechain 5.137 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 218
- bin_accuracy: 0.711

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=6.596468561621121 -> 5.315445527613718 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.376813574157565
- ga_delta_rmsd: 2.563412335491507  ga_fitness_mode: energy
- pre_local_rmsd: 2.3768675081430337  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=12 · 3-10(G)=4 · coil(C)=4

```
CCHHEHEHHHEHEHHHHCEEEEHHGEGGEHEGEC
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=5 · sheet=11
  - E4 ↔ A8  (helix)
  - F6 ↔ F10  (helix)
  - A8 ↔ M12  (helix)
  - F10 ↔ R14  (helix)
  - M12 ↔ A16  (helix)
  - D5 ↔ G11  (sheet)
  - D5 ↔ T13  (sheet)
  - K7 ↔ T13  (sheet)
  - G11 ↔ K29  (sheet)
  - T13 ↔ N19  (sheet)
  - T13 ↔ G33  (sheet)
  - N19 ↔ Q26  (sheet)
  - L20 ↔ Q26  (sheet)
  - P21 ↔ Q26  (sheet)
  - L22 ↔ K29  (sheet)
  - Q26 ↔ E31  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=98 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=18 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4478 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
