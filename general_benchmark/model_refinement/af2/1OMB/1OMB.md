# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1OMB\seeds\seed_1\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 0.796 A
- tm_score_ca_ordered: 0.8222523793140327
- heavy_atom_rmsd: 2.518 A
- sidechain_heavy_atom_rmsd: 3.154 A
- **all-atom quality (honest):** heavy 2.518 A, sidechain 3.154 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 465
- bin_accuracy: 0.873

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=0.8502451701611928 -> 0.6785281647480899 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.7962469416434149
- ga_delta_rmsd: -0.15576596804698573  ga_fitness_mode: energy
- pre_local_rmsd: 0.7961963086994049  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=15 · 3-10(G)=5 · coil(C)=6

```
CEECHECEEHGECEEEHHEEGEGCHHHEGCEGE
```

## Backbone H-bond Network

- total=48 · helix(i→i+4)=0 · sheet=48
  - A2 ↔ C8  (sheet)
  - A2 ↔ K14  (sheet)
  - A2 ↔ C15  (sheet)
  - A2 ↔ C16  (sheet)
  - A2 ↔ R19  (sheet)
  - A2 ↔ P20  (sheet)
  - E3 ↔ C8  (sheet)
  - E3 ↔ K14  (sheet)
  - E3 ↔ C15  (sheet)
  - E3 ↔ C16  (sheet)
  - E3 ↔ R19  (sheet)
  - G6 ↔ K14  (sheet)
  - G6 ↔ C15  (sheet)
  - G6 ↔ C16  (sheet)
  - G6 ↔ R19  (sheet)
  - G6 ↔ P20  (sheet)
  - G6 ↔ R22  (sheet)
  - C8 ↔ K14  (sheet)
  - C8 ↔ C15  (sheet)
  - C8 ↔ C16  (sheet)
  - … +28 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=103 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=49 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1469 (restraint satisfaction; lower=better)
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
- RMSF mean=2.788Å max=6.66Å (per-residue in .per_residue.csv)
- most flexible residues: 18, 20, 7, 19, 6

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1OMB.pae.csv`
- mean=0.084Å · max=0.292Å · AlphaFold-PAE analog (low block = rigid unit/domain)
