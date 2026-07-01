# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1POH\seeds\seed_0\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.082 A
- tm_score_ca_ordered: 0.9993679857458853
- heavy_atom_rmsd: 2.430 A
- sidechain_heavy_atom_rmsd: 3.271 A
- **all-atom quality (honest):** heavy 2.430 A, sidechain 3.271 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 1620
- bin_accuracy: 0.972

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.08205910365840216
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.0840668901169098  localized_anchor_rmsd: 0.08208525125706298

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=21 · 3-10(G)=14 · coil(C)=10

```
CEEEGECHEGGCHEHHHHHHHHHHHHHEGECGEGCEHHEEECHHEHGHHHHEGHECHEGGCCEEGEGGEHHHHHGHHHHHHHC
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=19 · sheet=18
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
  - … +17 more (see .hbonds.csv)

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
