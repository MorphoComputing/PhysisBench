# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1NXB\seeds\seed_7\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 1.204 A
- tm_score_ca_ordered: 0.8593184303341975
- heavy_atom_rmsd: 3.403 A
- sidechain_heavy_atom_rmsd: 4.549 A
- **all-atom quality (honest):** heavy 3.403 A, sidechain 4.549 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 546
- bin_accuracy: 0.864

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=5.912383208990256 -> 5.262215499461643 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.2039440832850623
- ga_delta_rmsd: 3.722300073663343  ga_fitness_mode: energy
- pre_local_rmsd: 1.2152857430208597  localized_anchor_rmsd: 1.2039975049610632

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=28 · 3-10(G)=11 · coil(C)=10

```
CECEECCGEGGGGEHEHEHHHEEECCEEEEHCGGEEGEECEEEHHEEHEGCEGGCEEHHE
```

## Backbone H-bond Network

- total=71 · helix(i→i+4)=3 · sheet=68
  - T15 ↔ G19  (helix)
  - S17 ↔ S21  (helix)
  - T44 ↔ G48  (helix)
  - C2 ↔ K14  (sheet)
  - C2 ↔ C16  (sheet)
  - C2 ↔ P18  (sheet)
  - C2 ↔ S22  (sheet)
  - N4 ↔ Q9  (sheet)
  - N4 ↔ K14  (sheet)
  - N4 ↔ C16  (sheet)
  - N4 ↔ S22  (sheet)
  - N4 ↔ C23  (sheet)
  - N4 ↔ Y24  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ C23  (sheet)
  - Q5 ↔ Y24  (sheet)
  - K14 ↔ S22  (sheet)
  - K14 ↔ C23  (sheet)
  - K14 ↔ Y24  (sheet)
  - C16 ↔ S22  (sheet)
  - … +51 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=222 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=142 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5187 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1NXB.ensemble.pdb`)
- RMSF mean=3.619Å max=7.087Å (per-residue in .per_residue.csv)
- most flexible residues: 18, 19, 17, 32, 59

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=32.4 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 39, 40, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1NXB.pae.csv`
- mean=1.437Å · max=5.009Å · AlphaFold-PAE analog (low block = rigid unit/domain)
