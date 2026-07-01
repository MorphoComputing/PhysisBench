# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2KNM\seeds\seed_4\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 1.598 A
- tm_score_ca_ordered: 0.5406148671987359
- heavy_atom_rmsd: 3.448 A
- sidechain_heavy_atom_rmsd: 4.482 A
- **all-atom quality (honest):** heavy 3.448 A, sidechain 4.482 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 163
- bin_accuracy: 0.730

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=21
- rigid_domain_reconvergence: applied=False accepted=1 rmsd=4.548628426611855 -> 4.355245250072634 A
- topology_reconvergence: applied=False accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.5980408578715088
- ga_delta_rmsd: 2.72642274243284  ga_fitness_mode: energy
- pre_local_rmsd: 1.5979320089103253  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=2 · strand(E)=13 · 3-10(G)=8 · coil(C)=5

```
CEGEEEGGEGEGHEHECCEGCEGCEGEE
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=0 · sheet=35
  - P2 ↔ S14  (sheet)
  - P2 ↔ C19  (sheet)
  - P2 ↔ K22  (sheet)
  - G4 ↔ P11  (sheet)
  - G4 ↔ S14  (sheet)
  - G4 ↔ A16  (sheet)
  - G4 ↔ C19  (sheet)
  - G4 ↔ K22  (sheet)
  - E5 ↔ P11  (sheet)
  - E5 ↔ S14  (sheet)
  - E5 ↔ A16  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ S14  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ K22  (sheet)
  - S6 ↔ V25  (sheet)
  - W9 ↔ V25  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=92 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=45 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9849 (restraint satisfaction; lower=better)
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
