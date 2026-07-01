# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\4PTI\seeds\seed_0\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.086 A
- tm_score_ca_ordered: 0.9988050542997363
- heavy_atom_rmsd: 3.119 A
- sidechain_heavy_atom_rmsd: 4.177 A
- **all-atom quality (honest):** heavy 3.119 A, sidechain 4.177 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 716
- bin_accuracy: 0.973

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.08579362612908178
- ga_delta_rmsd: 0.14513474290237968  ga_fitness_mode: energy
- pre_local_rmsd: 0.08858491401517486  localized_anchor_rmsd: 0.08576542271961721

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=20 · 3-10(G)=16 · coil(C)=6

```
EEHHHECCEGGGEGEGECEEGCGGHHGEEEEEGGGCEGEEGHEEGEHHHHHHGHHC
```

## Backbone H-bond Network

- total=41 · helix(i→i+4)=3 · sheet=38
  - A47 ↔ M51  (helix)
  - E48 ↔ R52  (helix)
  - M51 ↔ G55  (helix)
  - P1 ↔ E6  (sheet)
  - Y9 ↔ I17  (sheet)
  - Y9 ↔ R19  (sheet)
  - Y9 ↔ Y20  (sheet)
  - A15 ↔ F32  (sheet)
  - I17 ↔ T31  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - R19 ↔ C29  (sheet)
  - R19 ↔ Q30  (sheet)
  - R19 ↔ T31  (sheet)
  - R19 ↔ F32  (sheet)
  - R19 ↔ C37  (sheet)
  - R19 ↔ A39  (sheet)
  - Y20 ↔ L28  (sheet)
  - Y20 ↔ C29  (sheet)
  - Y20 ↔ Q30  (sheet)
  - … +21 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=204 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=112 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6569 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`4PTI.ensemble.pdb`)
- RMSF mean=0.028Å max=0.097Å (per-residue in .per_residue.csv)
- most flexible residues: 5, 20, 29, 8, 46

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `4PTI.pae.csv`
- mean=0.02Å · max=0.12Å · AlphaFold-PAE analog (low block = rigid unit/domain)
