# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HVZ\seeds\seed_7\1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 1.169 A
- tm_score_ca_ordered: 0.28505077795489403
- heavy_atom_rmsd: 3.797 A
- sidechain_heavy_atom_rmsd: 4.954 A
- **all-atom quality (honest):** heavy 3.797 A, sidechain 4.954 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 64
- bin_accuracy: 0.812

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=15
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.1692518376811336
- ga_delta_rmsd: -0.09084108251749456  ga_fitness_mode: energy
- pre_local_rmsd: 1.1692255518514614  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=2 · strand(E)=7 · 3-10(G)=2 · coil(C)=5

```
CEEGGCCHHECECEEE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=0 · sheet=8
  - C2 ↔ R12  (sheet)
  - C2 ↔ I14  (sheet)
  - C2 ↔ C15  (sheet)
  - C2 ↔ T16  (sheet)
  - R3 ↔ R12  (sheet)
  - R3 ↔ I14  (sheet)
  - R3 ↔ C15  (sheet)
  - R3 ↔ T16  (sheet)

## Solvent Accessibility (burial)

- buried=6 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=40 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5658 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1HVZ.ensemble.pdb`)
- RMSF mean=1.765Å max=3.237Å (per-residue in .per_residue.csv)
- most flexible residues: 16, 1, 4, 9, 13

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=56.3 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 4, 9, 16

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HVZ.pae.csv`
- mean=0.473Å · max=1.901Å · AlphaFold-PAE analog (low block = rigid unit/domain)
