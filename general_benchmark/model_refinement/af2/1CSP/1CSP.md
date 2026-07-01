# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1CSP\seeds\seed_0\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 0.891 A
- tm_score_ca_ordered: 0.9375438641959447
- heavy_atom_rmsd: 3.213 A
- sidechain_heavy_atom_rmsd: 4.210 A
- **all-atom quality (honest):** heavy 3.213 A, sidechain 4.210 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1953
- bin_accuracy: 0.932

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8904559301876456
- ga_delta_rmsd: -0.0030809029014207123  ga_fitness_mode: energy
- pre_local_rmsd: 0.8922049021598261  localized_anchor_rmsd: 0.8905118085270585

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=27 · 3-10(G)=18 · coil(C)=10

```
CEEEGHEGHHHGGCEEGGGCHEECGGEEHHHEEEEECGEGECHEGEGEECECGHGECEEGGGECE
```

## Backbone H-bond Network

- total=55 · helix(i→i+4)=1 · sheet=54
  - K6 ↔ S10  (helix)
  - E2 ↔ Q22  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ Q22  (sheet)
  - G3 ↔ D23  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ Q22  (sheet)
  - K4 ↔ D23  (sheet)
  - W7 ↔ G15  (sheet)
  - W7 ↔ F16  (sheet)
  - W7 ↔ V27  (sheet)
  - G15 ↔ V27  (sheet)
  - G15 ↔ H28  (sheet)
  - G15 ↔ I32  (sheet)
  - F16 ↔ Q22  (sheet)
  - F16 ↔ D23  (sheet)
  - F16 ↔ V27  (sheet)
  - F16 ↔ H28  (sheet)
  - F16 ↔ I32  (sheet)
  - … +35 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=234 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=143 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0918 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1CSP.ensemble.pdb`)
- RMSF mean=0.026Å max=0.075Å (per-residue in .per_residue.csv)
- most flexible residues: 47, 48, 12, 17, 26

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1CSP.pae.csv`
- mean=0.02Å · max=0.108Å · AlphaFold-PAE analog (low block = rigid unit/domain)
