# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1OMB\seeds\seed_2\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 0.779 A
- tm_score_ca_ordered: 0.8113889410448522
- heavy_atom_rmsd: 2.900 A
- sidechain_heavy_atom_rmsd: 3.788 A
- **all-atom quality (honest):** heavy 2.900 A, sidechain 3.788 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 207
- bin_accuracy: 0.749

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7792845393486215
- ga_delta_rmsd: 0.3379130639444752  ga_fitness_mode: energy
- pre_local_rmsd: 0.7792735290992854  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=3 · strand(E)=19 · 3-10(G)=1 · coil(C)=10

```
CEECHEEEECHECEECHCEEEEECECCECEEGE
```

## Backbone H-bond Network

- total=76 · helix(i→i+4)=0 · sheet=76
  - A2 ↔ K7  (sheet)
  - A2 ↔ C8  (sheet)
  - A2 ↔ K14  (sheet)
  - A2 ↔ C15  (sheet)
  - A2 ↔ R19  (sheet)
  - A2 ↔ P20  (sheet)
  - E3 ↔ C8  (sheet)
  - E3 ↔ K14  (sheet)
  - E3 ↔ C15  (sheet)
  - E3 ↔ R19  (sheet)
  - G6 ↔ K14  (sheet)
  - G6 ↔ C15  (sheet)
  - G6 ↔ R19  (sheet)
  - G6 ↔ P20  (sheet)
  - G6 ↔ C21  (sheet)
  - G6 ↔ R22  (sheet)
  - G6 ↔ C23  (sheet)
  - K7 ↔ G12  (sheet)
  - K7 ↔ K14  (sheet)
  - K7 ↔ C15  (sheet)
  - … +56 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=99 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=46 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.759 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1OMB.ensemble.pdb`)
- RMSF mean=3.038Å max=4.721Å (per-residue in .per_residue.csv)
- most flexible residues: 19, 3, 18, 4, 17

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=37.9 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 28, 29, 30, 31, 32, 33

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1OMB.pae.csv`
- mean=1.178Å · max=3.647Å · AlphaFold-PAE analog (low block = rigid unit/domain)
