# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4PTI\seeds\seed_9\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.619 A
- tm_score_ca_ordered: 0.9464218030747968
- heavy_atom_rmsd: 3.293 A
- sidechain_heavy_atom_rmsd: 4.350 A
- **all-atom quality (honest):** heavy 3.293 A, sidechain 4.350 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 483
- bin_accuracy: 0.872

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.6190962588353109
- ga_delta_rmsd: 4.928238015450529  ga_fitness_mode: energy
- pre_local_rmsd: 0.6353247453301214  localized_anchor_rmsd: 0.6190751260095674

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=22 · 3-10(G)=12 · coil(C)=10

```
EHHHCEECEHGGEHEGECEEGCGGHGCEEECEGCEGEEEECHEEGEHGHHCHGCHE
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=1 · sheet=38
  - T10 ↔ K14  (helix)
  - P1 ↔ E6  (sheet)
  - E6 ↔ Y20  (sheet)
  - P7 ↔ Y20  (sheet)
  - Y9 ↔ I17  (sheet)
  - Y9 ↔ R19  (sheet)
  - Y9 ↔ Y20  (sheet)
  - A15 ↔ F32  (sheet)
  - A15 ↔ G35  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ G35  (sheet)
  - I17 ↔ C37  (sheet)
  - R19 ↔ C29  (sheet)
  - R19 ↔ Q30  (sheet)
  - R19 ↔ F32  (sheet)
  - R19 ↔ G35  (sheet)
  - R19 ↔ C37  (sheet)
  - R19 ↔ A39  (sheet)
  - Y20 ↔ L28  (sheet)
  - Y20 ↔ C29  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=207 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=115 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.545 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
