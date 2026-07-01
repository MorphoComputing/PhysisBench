# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1YCC\seeds\seed_1\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 0.625 A
- tm_score_ca_ordered: 0.974734881376076
- heavy_atom_rmsd: 3.024 A
- sidechain_heavy_atom_rmsd: 3.985 A
- **all-atom quality (honest):** heavy 3.024 A, sidechain 3.985 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3302
- bin_accuracy: 0.865

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=0.6966175364262513 -> 0.6288011605749754 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.6249073555252679
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.6288011605749754  localized_anchor_rmsd: 0.6248887549090353

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=46 · strand(E)=32 · 3-10(G)=15 · coil(C)=10

```
EEECECHGHHHHHHHEEHHHCEEGECHEEEEHEECGEHHCHEEHHHEHHECEECHHHGGGGHGEGGHHGHHHHEEEEHEHEGEGECGEHHHHGHHHHHHHHHC
```

## Backbone H-bond Network

- total=77 · helix(i→i+4)=17 · sheet=60
  - A7 ↔ A11  (helix)
  - K9 ↔ L13  (helix)
  - G10 ↔ F14  (helix)
  - A11 ↔ K15  (helix)
  - K15 ↔ L19  (helix)
  - G41 ↔ G45  (helix)
  - G45 ↔ G49  (helix)
  - N67 ↔ Y71  (helix)
  - M68 ↔ L72  (helix)
  - K90 ↔ D94  (helix)
  - D91 ↔ L95  (helix)
  - R92 ↔ I96  (helix)
  - D94 ↔ Y98  (helix)
  - L95 ↔ L99  (helix)
  - I96 ↔ K100  (helix)
  - T97 ↔ K101  (helix)
  - Y98 ↔ A102  (helix)
  - T16 ↔ H22  (sheet)
  - T16 ↔ T23  (sheet)
  - R17 ↔ H22  (sheet)
  - … +57 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=370 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=159 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.02 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1YCC.ensemble.pdb`)
- RMSF mean=0.111Å max=0.321Å (per-residue in .per_residue.csv)
- most flexible residues: 77, 49, 4, 75, 62

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1YCC.pae.csv`
- mean=0.082Å · max=0.466Å · AlphaFold-PAE analog (low block = rigid unit/domain)
