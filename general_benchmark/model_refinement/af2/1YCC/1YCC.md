# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1YCC\seeds\seed_1\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 0.578 A
- tm_score_ca_ordered: 0.9774515536175202
- heavy_atom_rmsd: 2.785 A
- sidechain_heavy_atom_rmsd: 3.636 A
- **all-atom quality (honest):** heavy 2.785 A, sidechain 3.636 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 3310
- bin_accuracy: 0.889

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=57
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=0.7264041052146001 -> 0.627961486453508 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5778405522349528
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5855765709461785  localized_anchor_rmsd: 0.5778941502638286

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=43 · strand(E)=33 · 3-10(G)=19 · coil(C)=8

```
EEECEEGHHHHHHHHGEHHHGEEGECGEECEHEECGEHHEHEEHHCEGGECEEGHHHGEHEGGEGGHHHHHHHCEEGHEHEGEGECGEHHHHHHHHHHHHGHE
```

## Backbone H-bond Network

- total=79 · helix(i→i+4)=19 · sheet=60
  - K8 ↔ T12  (helix)
  - K9 ↔ L13  (helix)
  - G10 ↔ F14  (helix)
  - A11 ↔ K15  (helix)
  - K15 ↔ L19  (helix)
  - G41 ↔ G45  (helix)
  - N56 ↔ N60  (helix)
  - N67 ↔ Y71  (helix)
  - M68 ↔ L72  (helix)
  - S69 ↔ T73  (helix)
  - E89 ↔ N93  (helix)
  - K90 ↔ D94  (helix)
  - D91 ↔ L95  (helix)
  - R92 ↔ I96  (helix)
  - N93 ↔ T97  (helix)
  - D94 ↔ Y98  (helix)
  - L95 ↔ L99  (helix)
  - I96 ↔ K100  (helix)
  - Y98 ↔ A102  (helix)
  - R17 ↔ H22  (sheet)
  - … +59 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=372 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=163 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0183 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1YCC.ensemble.pdb`)
- RMSF mean=0.028Å max=0.102Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 98, 6, 49, 3

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1YCC.pae.csv`
- mean=0.02Å · max=0.117Å · AlphaFold-PAE analog (low block = rigid unit/domain)
