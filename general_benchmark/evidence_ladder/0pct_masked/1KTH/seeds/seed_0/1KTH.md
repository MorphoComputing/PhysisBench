# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1KTH/sequence/1KTH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1KTH/seeds/seed_0/1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.043 A
- tm_score_ca_ordered: 0.999704716751472
- heavy_atom_rmsd: 3.039 A
- sidechain_heavy_atom_rmsd: 4.049 A
- **all-atom quality (honest):** heavy 3.039 A, sidechain 4.049 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1431
- bin_accuracy: 0.983

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.042591453880697946
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.04415595632942041  localized_anchor_rmsd: 0.042564949729243164

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=23 · 3-10(G)=13 · coil(C)=5

```
EHHHHEEGGHEEEGECECEEECGHHGHEEGEECGGGEGEEGHEEGEHHHHHHGCEE
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=2 · sheet=40
  - Q47 ↔ E51  (helix)
  - K48 ↔ K52  (helix)
  - T1 ↔ L6  (sheet)
  - L6 ↔ W20  (sheet)
  - L6 ↔ Y21  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ K19  (sheet)
  - T12 ↔ I17  (sheet)
  - I17 ↔ R31  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - K19 ↔ C29  (sheet)
  - K19 ↔ R31  (sheet)
  - K19 ↔ F32  (sheet)
  - K19 ↔ G39  (sheet)
  - W20 ↔ S28  (sheet)
  - W20 ↔ C29  (sheet)
  - W20 ↔ R31  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=204 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=115 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6418 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
