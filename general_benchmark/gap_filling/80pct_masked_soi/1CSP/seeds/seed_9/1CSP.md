# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CSP\seeds\seed_9\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 0.568 A
- tm_score_ca_ordered: 0.9636224939454825
- heavy_atom_rmsd: 2.688 A
- sidechain_heavy_atom_rmsd: 3.582 A
- **all-atom quality (honest):** heavy 2.688 A, sidechain 3.582 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 634
- bin_accuracy: 0.913

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=11 rmsd=5.500045356539953 -> 4.946137091768011 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5679894122633395
- ga_delta_rmsd: 3.9357045316210457  ga_fitness_mode: energy
- pre_local_rmsd: 0.5746520297872185  localized_anchor_rmsd: 0.5679406265363743

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=30 · 3-10(G)=14 · coil(C)=13

```
CEEEGHEGHHECCCEEGGECHEECEECEHHHEEECCCEEGECGEEEGEEGGEEGHEEEEGGGGCC
```

## Backbone H-bond Network

- total=62 · helix(i→i+4)=1 · sheet=61
  - K6 ↔ S10  (helix)
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
  - W7 ↔ V25  (sheet)
  - W7 ↔ F26  (sheet)
  - E11 ↔ H28  (sheet)
  - G15 ↔ V25  (sheet)
  - G15 ↔ F26  (sheet)
  - G15 ↔ H28  (sheet)
  - … +42 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=229 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=140 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.439 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
