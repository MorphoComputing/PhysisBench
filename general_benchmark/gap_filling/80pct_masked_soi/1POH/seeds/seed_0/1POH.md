# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1POH\seeds\seed_0\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.371 A
- tm_score_ca_ordered: 0.9876458229749172
- heavy_atom_rmsd: 2.327 A
- sidechain_heavy_atom_rmsd: 3.006 A
- **all-atom quality (honest):** heavy 2.327 A, sidechain 3.006 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 957
- bin_accuracy: 0.920

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=42
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.37112239421459725
- ga_delta_rmsd: 4.916567942390289  ga_fitness_mode: energy
- pre_local_rmsd: 0.37550765135315317  localized_anchor_rmsd: 0.37119049659358083

## Failure Classification

- primary_reason: `SIDECHAIN_RMSD_HIGH`
- reasons: `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=26 · 3-10(G)=13 · coil(C)=12

```
CEEEEECCECGEHEHGHHHHHHHHHHHEGECGEGEEHGEEECHHEHHHHHGEGHECCEEECCEEGEHCEHGHHGGGHHHHHHC
```

## Backbone H-bond Network

- total=43 · helix(i→i+4)=15 · sheet=28
  - L13 ↔ P17  (helix)
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
  - Q50 ↔ L54  (helix)
  - V73 ↔ V77  (helix)
  - V77 ↔ A81  (helix)
  - K78 ↔ E82  (helix)
  - T6 ↔ G12  (sheet)
  - A9 ↔ H14  (sheet)
  - T33 ↔ K39  (sheet)
  - T33 ↔ S40  (sheet)
  - T33 ↔ A41  (sheet)
  - … +23 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=316 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=155 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4721 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
