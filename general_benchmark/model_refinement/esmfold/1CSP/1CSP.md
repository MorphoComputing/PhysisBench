# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1CSP\seeds\seed_1\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 0.994 A
- tm_score_ca_ordered: 0.9276730518575722
- heavy_atom_rmsd: 2.783 A
- sidechain_heavy_atom_rmsd: 3.616 A
- **all-atom quality (honest):** heavy 2.783 A, sidechain 3.616 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1953
- bin_accuracy: 0.916

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9943648255110158
- ga_delta_rmsd: -0.0034653696929031197  ga_fitness_mode: energy
- pre_local_rmsd: 0.9977318634770742  localized_anchor_rmsd: 0.9944216655501253

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=28 · 3-10(G)=16 · coil(C)=11

```
EEEEGHEGHHHGGCEEGEGCHECCEGGEHHHEEEEECGEGECHECEGEECECEHGECEEGGGGCE
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=1 · sheet=52
  - K6 ↔ S10  (helix)
  - L1 ↔ E18  (sheet)
  - E2 ↔ E18  (sheet)
  - E2 ↔ Q22  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ E18  (sheet)
  - G3 ↔ Q22  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ E18  (sheet)
  - K4 ↔ Q22  (sheet)
  - W7 ↔ G15  (sheet)
  - W7 ↔ F16  (sheet)
  - W7 ↔ E18  (sheet)
  - W7 ↔ V25  (sheet)
  - G15 ↔ V25  (sheet)
  - G15 ↔ H28  (sheet)
  - G15 ↔ I32  (sheet)
  - F16 ↔ Q22  (sheet)
  - F16 ↔ V25  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=233 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=141 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0969 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1CSP.ensemble.pdb`)
- RMSF mean=0.029Å max=0.075Å (per-residue in .per_residue.csv)
- most flexible residues: 38, 5, 15, 27, 2

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1CSP.pae.csv`
- mean=0.022Å · max=0.106Å · AlphaFold-PAE analog (low block = rigid unit/domain)
