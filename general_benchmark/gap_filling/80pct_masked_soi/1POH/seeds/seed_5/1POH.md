# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1POH\seeds\seed_5\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.469 A
- tm_score_ca_ordered: 0.9806896074518341
- heavy_atom_rmsd: 2.550 A
- sidechain_heavy_atom_rmsd: 3.321 A
- **all-atom quality (honest):** heavy 2.550 A, sidechain 3.321 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 957
- bin_accuracy: 0.926

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=51
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4692228024999099
- ga_delta_rmsd: 4.93303101005136  ga_fitness_mode: energy
- pre_local_rmsd: 0.4745928984326084  localized_anchor_rmsd: 0.46919279454174173

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=26 · 3-10(G)=16 · coil(C)=7

```
CEEEGECCEGGEGEGGHHHHHHGHHHHEGECGEEEEHHEEEGHHEHGHHHGEHHEECEEECGEEGEHHHHHHHHGHGHHHHHC
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=15 · sheet=32
  - P17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - Q20 ↔ E24  (helix)
  - F21 ↔ A25  (helix)
  - V22 ↔ K26  (helix)
  - K44 ↔ K48  (helix)
  - L46 ↔ Q50  (helix)
  - Q50 ↔ L54  (helix)
  - E67 ↔ K71  (helix)
  - E69 ↔ V73  (helix)
  - Q70 ↔ E74  (helix)
  - A72 ↔ L76  (helix)
  - E74 ↔ K78  (helix)
  - L76 ↔ M80  (helix)
  - K78 ↔ E82  (helix)
  - T6 ↔ G12  (sheet)
  - A9 ↔ H14  (sheet)
  - F28 ↔ T33  (sheet)
  - T33 ↔ K39  (sheet)
  - T33 ↔ S40  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=31 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=320 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=160 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4427 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
