# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1POH\seeds\seed_3\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.362 A
- tm_score_ca_ordered: 0.9885581545391918
- heavy_atom_rmsd: 2.174 A
- sidechain_heavy_atom_rmsd: 2.813 A
- **all-atom quality (honest):** heavy 2.174 A, sidechain 2.813 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 957
- bin_accuracy: 0.944

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=1.0134657635123316 -> 0.9117607446874284 A
- topology_reconvergence: applied=True accepted=17/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.3623797493296511
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.36418458367669165  localized_anchor_rmsd: 0.36235536171723104

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=22 · 3-10(G)=15 · coil(C)=10

```
EEEEGGCCECGEHEHGHHHHHHHHHHHEGECGEGCEHHEEECHHEHGHHHHEGHECCEEGGCEGGEHHEHHHHGGHHHHHHHC
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=17 · sheet=19
  - L13 ↔ P17  (helix)
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
  - E67 ↔ K71  (helix)
  - A72 ↔ L76  (helix)
  - V73 ↔ V77  (helix)
  - L76 ↔ M80  (helix)
  - V77 ↔ A81  (helix)
  - K78 ↔ E82  (helix)
  - A9 ↔ H14  (sheet)
  - F28 ↔ T33  (sheet)
  - T33 ↔ K39  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=316 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=154 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4479 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)
