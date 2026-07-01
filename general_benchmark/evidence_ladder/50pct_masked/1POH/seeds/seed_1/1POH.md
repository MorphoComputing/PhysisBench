# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1POH\seeds\seed_1\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.082 A
- tm_score_ca_ordered: 0.9993672788237077
- heavy_atom_rmsd: 2.432 A
- sidechain_heavy_atom_rmsd: 3.269 A
- **all-atom quality (honest):** heavy 2.432 A, sidechain 3.269 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 1620
- bin_accuracy: 0.972

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.08216501641261018
- ga_delta_rmsd: 0.03643096370769991  ga_fitness_mode: energy
- pre_local_rmsd: 0.08411099414377576  localized_anchor_rmsd: 0.08213183146547577

## Failure Classification

- primary_reason: `SIDECHAIN_RMSD_HIGH`
- reasons: `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=20 · 3-10(G)=17 · coil(C)=8

```
CEEEGECHEGGCHEHHHHHHHHHHHHHEGEGGGGEEHHEEECHHEHGHHHHEGHECHEGGCCEGGEGGEHHHHHGHHHHHHHC
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=19 · sheet=14
  - L13 ↔ P17  (helix)
  - R16 ↔ Q20  (helix)
  - P17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - A19 ↔ K23  (helix)
  - Q20 ↔ E24  (helix)
  - F21 ↔ A25  (helix)
  - V22 ↔ K26  (helix)
  - K23 ↔ G27  (helix)
  - K44 ↔ K48  (helix)
  - L46 ↔ Q50  (helix)
  - Q50 ↔ L54  (helix)
  - Q70 ↔ E74  (helix)
  - A72 ↔ L76  (helix)
  - V73 ↔ V77  (helix)
  - E74 ↔ K78  (helix)
  - L76 ↔ M80  (helix)
  - V77 ↔ A81  (helix)
  - K78 ↔ E82  (helix)
  - A9 ↔ H14  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=318 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=156 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6489 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
