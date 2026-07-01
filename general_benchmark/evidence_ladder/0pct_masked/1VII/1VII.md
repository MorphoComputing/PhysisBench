# Physis Fold Oracle Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1VII/sequence/1VII.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1VII/seeds/seed_1/1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 0.028 A
- tm_score_ca_ordered: 0.9996573659568564
- global_topology_guard: enabled=True applied=True kind=global label=all axis=z reason=accepted tested=24
- global_topology_rmsd: 5.363128772775342 -> 0.07941095972988357 A
- global_topology_local_chirality_match: 0.0 -> 1.0
- global_topology_window_match: 0.0 -> 1.0
- global_topology_domain_match: 0.0 -> 1.0
- rigid_domain_reconvergence: applied=False accepted=0 candidates=64 rmsd=0.07941095972988357 -> 0.07806742588356168 A
- topology_reconvergence: applied=True accepted=7/36 rmsd=0.07806742588356168 -> 0.02794583413789846 A
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 alpha=1.0
- heavy_atom_rmsd_before_sidechain_refine: 2.836 A
- heavy_atom_rmsd: 2.788 A
- sidechain_heavy_atom_rmsd_before_sidechain_refine: 3.581 A
- sidechain_heavy_atom_rmsd: 3.541 A
- **all-atom quality (honest):** heavy 2.788 A, sidechain 3.541 A
- pre_local_rmsd: 0.028 A
- localized_anchor_rmsd: None
- phase_b_ca_rmsd_after: 0.027958178345239226
- ca_drift_after_phase_b: 0.0005046079396368291
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.990

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=9 · 3-10(G)=2 · coil(C)=2

```
EEHHHHHHECCEEHHHHHHEHHHHGHGHEHHEHE
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=9 · sheet=13
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - A18 ↔ L22  (helix)
  - N19 ↔ W23  (helix)
  - L22 ↔ Q26  (helix)
  - K24 ↔ L28  (helix)
  - Q26 ↔ K30  (helix)
  - L1 ↔ V9  (sheet)
  - L1 ↔ M12  (sheet)
  - L1 ↔ T13  (sheet)
  - S2 ↔ V9  (sheet)
  - S2 ↔ M12  (sheet)
  - S2 ↔ T13  (sheet)
  - V9 ↔ K29  (sheet)
  - M12 ↔ L20  (sheet)
  - M12 ↔ K32  (sheet)
  - T13 ↔ L20  (sheet)
  - T13 ↔ K29  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=16 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6944 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1VII.ensemble.pdb`)
- RMSF mean=0.02Å max=0.035Å (per-residue in .per_residue.csv)
- most flexible residues: 23, 27, 24, 31, 25

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1VII.pae.csv`
- mean=0.013Å · max=0.054Å · AlphaFold-PAE analog (low block = rigid unit/domain)
