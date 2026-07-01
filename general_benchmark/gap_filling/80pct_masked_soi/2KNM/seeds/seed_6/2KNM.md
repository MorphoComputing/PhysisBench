# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2KNM\seeds\seed_6\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 5.464 A
- tm_score_ca_ordered: 0.19121192356791603
- heavy_atom_rmsd: 6.067 A
- sidechain_heavy_atom_rmsd: 6.678 A
- **all-atom quality (honest):** heavy 6.067 A, sidechain 6.678 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 159
- bin_accuracy: 0.805

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=21
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.463666864295803
- ga_delta_rmsd: 0.8358033655746144  ga_fitness_mode: energy
- pre_local_rmsd: 5.463660327231044  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=18 · 3-10(G)=0 · coil(C)=6

```
CECEEEEEEEECHEHHCECEEEEECHEE
```

## Backbone H-bond Network

- total=60 · helix(i→i+4)=0 · sheet=60
  - P2 ↔ C7  (sheet)
  - P2 ↔ S14  (sheet)
  - P2 ↔ G18  (sheet)
  - P2 ↔ S20  (sheet)
  - P2 ↔ C21  (sheet)
  - P2 ↔ K22  (sheet)
  - G4 ↔ P11  (sheet)
  - G4 ↔ S14  (sheet)
  - G4 ↔ G18  (sheet)
  - G4 ↔ S20  (sheet)
  - G4 ↔ C21  (sheet)
  - G4 ↔ K22  (sheet)
  - G4 ↔ K24  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ P11  (sheet)
  - E5 ↔ S14  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ C21  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ K24  (sheet)
  - … +40 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=59 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7699 (restraint satisfaction; lower=better)
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
