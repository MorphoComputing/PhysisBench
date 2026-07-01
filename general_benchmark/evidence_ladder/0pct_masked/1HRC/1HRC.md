# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1HRC/sequence/1HRC.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1HRC/seeds/seed_0/1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 0.068 A
- tm_score_ca_ordered: 0.9996639389083786
- heavy_atom_rmsd: 2.878 A
- sidechain_heavy_atom_rmsd: 3.856 A
- **all-atom quality (honest):** heavy 2.878 A, sidechain 3.856 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3256
- bin_accuracy: 0.979

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.06778117441234467
- ga_delta_rmsd: 0.023024828818190485  ga_fitness_mode: energy
- pre_local_rmsd: 0.06880985312060013  localized_anchor_rmsd: 0.06776716188024048

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=46 · strand(E)=26 · 3-10(G)=20 · coil(C)=10

```
EGHHHHHHHHGEHHHCEEGECHEECEHEECGEGHCHEEEHCECGEGECHHHHGEGECGEHGHHHHGHHHGHHHHGHEHEGEGECGEGHHHHHHHHHHHGGHE
```

## Backbone H-bond Network

- total=68 · helix(i→i+4)=20 · sheet=48
  - E3 ↔ K7  (helix)
  - K4 ↔ I8  (helix)
  - G5 ↔ F9  (helix)
  - K6 ↔ V10  (helix)
  - V10 ↔ A14  (helix)
  - G36 ↔ G40  (helix)
  - E60 ↔ M64  (helix)
  - L63 ↔ L67  (helix)
  - M64 ↔ E68  (helix)
  - L67 ↔ K71  (helix)
  - E68 ↔ K72  (helix)
  - K72 ↔ G76  (helix)
  - T88 ↔ D92  (helix)
  - E89 ↔ L93  (helix)
  - R90 ↔ I94  (helix)
  - E91 ↔ A95  (helix)
  - D92 ↔ Y96  (helix)
  - L93 ↔ L97  (helix)
  - I94 ↔ K98  (helix)
  - L97 ↔ T101  (helix)
  - … +48 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=37 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=370 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=151 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6255 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1HRC.ensemble.pdb`)
- RMSF mean=0.025Å max=0.17Å (per-residue in .per_residue.csv)
- most flexible residues: 2, 59, 66, 58, 29

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HRC.pae.csv`
- mean=0.018Å · max=0.166Å · AlphaFold-PAE analog (low block = rigid unit/domain)
