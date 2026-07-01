# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\5WOW\seeds\seed_2\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 0.964 A
- tm_score_ca_ordered: 0.7924768528123891
- heavy_atom_rmsd: 2.940 A
- sidechain_heavy_atom_rmsd: 3.590 A
- **all-atom quality (honest):** heavy 2.940 A, sidechain 3.590 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 249
- bin_accuracy: 0.835

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=4.095167905509072 -> 3.2677652427254333 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9641032419028358
- ga_delta_rmsd: 1.7189140020211555  ga_fitness_mode: energy
- pre_local_rmsd: 0.9640092503560738  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=19 · 3-10(G)=4 · coil(C)=10

```
CEGGECCEEGHEGHCECEHCEEECEEECECEEHEECE
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=0 · sheet=53
  - V2 ↔ Q8  (sheet)
  - V2 ↔ C16  (sheet)
  - V2 ↔ G18  (sheet)
  - V2 ↔ I21  (sheet)
  - V2 ↔ C22  (sheet)
  - K5 ↔ C16  (sheet)
  - K5 ↔ G18  (sheet)
  - K5 ↔ I21  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ G18  (sheet)
  - Q8 ↔ I21  (sheet)
  - Q8 ↔ C22  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ N25  (sheet)
  - Q8 ↔ G26  (sheet)
  - Q8 ↔ Y27  (sheet)
  - R9 ↔ C16  (sheet)
  - R9 ↔ I21  (sheet)
  - R9 ↔ C22  (sheet)
  - R9 ↔ R23  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=124 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=68 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5103 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`5WOW.ensemble.pdb`)
- RMSF mean=3.231Å max=5.694Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 8, 7, 6, 14

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=36.3 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 13, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 29, 33, 34, 35, 36, 37

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `5WOW.pae.csv`
- mean=1.251Å · max=3.595Å · AlphaFold-PAE analog (low block = rigid unit/domain)
