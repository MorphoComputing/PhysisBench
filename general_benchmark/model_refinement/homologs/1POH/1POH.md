# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1POH\seeds\seed_1\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 0.270 A
- tm_score_ca_ordered: 0.9934181348926154
- heavy_atom_rmsd: 2.626 A
- sidechain_heavy_atom_rmsd: 3.496 A
- **all-atom quality (honest):** heavy 2.626 A, sidechain 3.496 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3162
- bin_accuracy: 0.924

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=51
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.27045389089594163
- ga_delta_rmsd: -0.06843049775800975  ga_fitness_mode: energy
- pre_local_rmsd: 0.27762666769470673  localized_anchor_rmsd: 0.27046811965678386

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=19 · 3-10(G)=20 · coil(C)=6

```
CEEEEECHEGHGGEEGHHHHHHHHHHHEGEGGGGEEHHECECHHEHHHHHHEGHECHEGGGGGGGEHGHHHHHHGHHHHHHGC
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=20 · sheet=11
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
  - E69 ↔ V73  (helix)
  - Q70 ↔ E74  (helix)
  - A72 ↔ L76  (helix)
  - V73 ↔ V77  (helix)
  - E74 ↔ K78  (helix)
  - L76 ↔ M80  (helix)
  - V77 ↔ A81  (helix)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=317 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=154 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0645 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1POH.ensemble.pdb`)
- RMSF mean=0.048Å max=1.271Å (per-residue in .per_residue.csv)
- most flexible residues: 14, 48, 52, 50, 53

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1POH.pae.csv`
- mean=0.026Å · max=1.277Å · AlphaFold-PAE analog (low block = rigid unit/domain)
