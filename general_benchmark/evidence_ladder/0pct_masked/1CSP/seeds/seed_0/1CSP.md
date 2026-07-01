# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1CSP/sequence/1CSP.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1CSP/seeds/seed_0/1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 0.041 A
- tm_score_ca_ordered: 0.9997854439321268
- heavy_atom_rmsd: 2.533 A
- sidechain_heavy_atom_rmsd: 3.337 A
- **all-atom quality (honest):** heavy 2.533 A, sidechain 3.337 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1953
- bin_accuracy: 0.976

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.09031440472342314 -> 0.08868172198855138 A
- topology_reconvergence: applied=True accepted=5/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.04060082026444092
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.041565296597936764  localized_anchor_rmsd: 0.040565874440002446

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=29 · 3-10(G)=23 · coil(C)=6

```
CEEEGGEGGGGGGCEEGGEGHEECGGGEHHHEEEEECCEGECHEGEGEEGGEEHHEEEEEGGGGE
```

## Backbone H-bond Network

- total=54 · helix(i→i+4)=0 · sheet=54
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
  - G15 ↔ H28  (sheet)
  - G15 ↔ I32  (sheet)
  - F16 ↔ Q22  (sheet)
  - F16 ↔ D23  (sheet)
  - F16 ↔ H28  (sheet)
  - H28 ↔ Q33  (sheet)
  - H28 ↔ T39  (sheet)
  - … +34 more (see .hbonds.csv)

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
