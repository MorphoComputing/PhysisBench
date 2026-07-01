# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1POH/sequence/1POH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1POH/seeds/seed_1/1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.042 A
- tm_score_ca_ordered: 0.9998347742929503
- heavy_atom_rmsd: 2.661 A
- sidechain_heavy_atom_rmsd: 3.579 A
- **all-atom quality (honest):** heavy 2.661 A, sidechain 3.579 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3240
- bin_accuracy: 0.978

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=42
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.10691551780618479 -> 0.1054505282680772 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.04189980145191646
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.043317252207943684  localized_anchor_rmsd: 0.04194192994730258

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=22 · 3-10(G)=11 · coil(C)=10

```
CEEEGECHEGGCHEHHHHHHHHHHHHHEGECGEGCEHHEEECHHEHHHHHHEGHECHEGGCCEEEEHGEHHHHHGHHHHHHHC
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=22 · sheet=18
  - L13 ↔ P17  (helix)
  - R16 ↔ Q20  (helix)
  - P17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - A19 ↔ K23  (helix)
  - Q20 ↔ E24  (helix)
  - F21 ↔ A25  (helix)
  - V22 ↔ K26  (helix)
  - K23 ↔ G27  (helix)
  - A43 ↔ F47  (helix)
  - K44 ↔ K48  (helix)
  - L46 ↔ Q50  (helix)
  - F47 ↔ T51  (helix)
  - Q50 ↔ L54  (helix)
  - E67 ↔ K71  (helix)
  - Q70 ↔ E74  (helix)
  - A72 ↔ L76  (helix)
  - V73 ↔ V77  (helix)
  - E74 ↔ K78  (helix)
  - L76 ↔ M80  (helix)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=318 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=156 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6446 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1POH.ensemble.pdb`)
- RMSF mean=0.021Å max=0.052Å (per-residue in .per_residue.csv)
- most flexible residues: 22, 42, 64, 16, 63

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1POH.pae.csv`
- mean=0.015Å · max=0.079Å · AlphaFold-PAE analog (low block = rigid unit/domain)
