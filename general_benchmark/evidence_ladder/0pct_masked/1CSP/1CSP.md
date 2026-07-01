# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1CSP/sequence/1CSP.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1CSP/seeds/seed_1/1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 0.041 A
- tm_score_ca_ordered: 0.9997854205638775
- heavy_atom_rmsd: 2.854 A
- sidechain_heavy_atom_rmsd: 3.732 A
- **all-atom quality (honest):** heavy 2.854 A, sidechain 3.732 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1953
- bin_accuracy: 0.976

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.08579729728113451 -> 0.08424752972363389 A
- topology_reconvergence: applied=True accepted=5/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.040596135634205235
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.04156821863965972  localized_anchor_rmsd: 0.04056809587496011

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=29 · 3-10(G)=20 · coil(C)=9

```
EEEEGGEGGGGGGCEEGCECHEECGGGGHHHEEEEECCEGECHECEGEEGGEEHHEEEEEGGEGC
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=0 · sheet=52
  - L1 ↔ V19  (sheet)
  - E2 ↔ V19  (sheet)
  - E2 ↔ Q22  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ V19  (sheet)
  - G3 ↔ Q22  (sheet)
  - G3 ↔ D23  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ V19  (sheet)
  - K4 ↔ Q22  (sheet)
  - K4 ↔ D23  (sheet)
  - W7 ↔ G15  (sheet)
  - W7 ↔ F16  (sheet)
  - G15 ↔ I32  (sheet)
  - F16 ↔ Q22  (sheet)
  - F16 ↔ D23  (sheet)
  - I32 ↔ T39  (sheet)
  - I32 ↔ E41  (sheet)
  - I32 ↔ V46  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=234 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=143 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6553 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1CSP.ensemble.pdb`)
- RMSF mean=0.025Å max=0.06Å (per-residue in .per_residue.csv)
- most flexible residues: 44, 2, 6, 54, 57

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1CSP.pae.csv`
- mean=0.019Å · max=0.1Å · AlphaFold-PAE analog (low block = rigid unit/domain)
