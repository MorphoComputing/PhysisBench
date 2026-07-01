# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1OMB\seeds\seed_1\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 0.055 A
- tm_score_ca_ordered: 0.9985730006873824
- heavy_atom_rmsd: 2.771 A
- sidechain_heavy_atom_rmsd: 3.687 A
- **all-atom quality (honest):** heavy 2.771 A, sidechain 3.687 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 232
- bin_accuracy: 0.978

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.054936419600432065
- ga_delta_rmsd: 1.1021810567272072  ga_fitness_mode: energy
- pre_local_rmsd: 0.054972991922868274  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=5 · strand(E)=14 · 3-10(G)=7 · coil(C)=7

```
CEECHECEEGHECECGHCECGEGHHEGEEGEGE
```

## Backbone H-bond Network

- total=29 · helix(i→i+4)=0 · sheet=29
  - A2 ↔ C8  (sheet)
  - A2 ↔ K14  (sheet)
  - A2 ↔ R19  (sheet)
  - E3 ↔ C8  (sheet)
  - E3 ↔ K14  (sheet)
  - E3 ↔ R19  (sheet)
  - G6 ↔ K14  (sheet)
  - G6 ↔ R19  (sheet)
  - G6 ↔ R22  (sheet)
  - C8 ↔ K14  (sheet)
  - C8 ↔ R19  (sheet)
  - C8 ↔ R22  (sheet)
  - C8 ↔ T28  (sheet)
  - T9 ↔ K14  (sheet)
  - T9 ↔ R19  (sheet)
  - T9 ↔ R22  (sheet)
  - T9 ↔ T28  (sheet)
  - T9 ↔ N29  (sheet)
  - K14 ↔ R19  (sheet)
  - K14 ↔ R22  (sheet)
  - … +9 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=104 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=49 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7024 (restraint satisfaction; lower=better)
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

- ensemble: 2 superposed models (`1OMB.ensemble.pdb`)
- RMSF mean=0.045Å max=0.089Å (per-residue in .per_residue.csv)
- most flexible residues: 24, 21, 8, 16, 32

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1OMB.pae.csv`
- mean=0.026Å · max=0.112Å · AlphaFold-PAE analog (low block = rigid unit/domain)
