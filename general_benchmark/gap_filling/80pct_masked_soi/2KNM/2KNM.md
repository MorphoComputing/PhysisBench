# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 1.469 A
- tm_score_ca_ordered: 0.5809592752588549
- heavy_atom_rmsd: 2.824 A
- sidechain_heavy_atom_rmsd: 3.510 A
- **all-atom quality (honest):** heavy 2.824 A, sidechain 3.510 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 160
- bin_accuracy: 0.738

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=24
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=2.305033004279251 -> 1.9012149391585573 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.468850418620137
- ga_delta_rmsd: -0.027412950763193944  ga_fitness_mode: energy
- pre_local_rmsd: 1.468818922135167  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=14 · 3-10(G)=4 · coil(C)=6

```
CEEEEEGEGEEEGHHHCCCECEHGECEE
```

## Backbone H-bond Network

- total=41 · helix(i→i+4)=0 · sheet=41
  - P2 ↔ C12  (sheet)
  - P2 ↔ S20  (sheet)
  - P2 ↔ K22  (sheet)
  - C3 ↔ P11  (sheet)
  - C3 ↔ C12  (sheet)
  - C3 ↔ S20  (sheet)
  - C3 ↔ K22  (sheet)
  - G4 ↔ I10  (sheet)
  - G4 ↔ P11  (sheet)
  - G4 ↔ C12  (sheet)
  - G4 ↔ S20  (sheet)
  - G4 ↔ K22  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ P11  (sheet)
  - E5 ↔ C12  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ K22  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ C12  (sheet)
  - … +21 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=115 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=65 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1253 (restraint satisfaction; lower=better)
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

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=2.218Å max=4.567Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 4, 2, 3, 15

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=50.0 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 13, 15, 16, 17, 18, 20, 21, 22

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=0.702Å · max=3.166Å · AlphaFold-PAE analog (low block = rigid unit/domain)
