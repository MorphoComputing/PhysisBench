# Physis Fold Oracle Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1VII/sequence/1VII.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1VII/seeds/seed_0/1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 0.031 A
- tm_score_ca_ordered: 0.999587645730881
- global_topology_guard: enabled=True applied=True kind=domain_block label=D1-D4 axis=y reason=accepted tested=27
- global_topology_rmsd: 5.3726064188381395 -> 0.07644829731501662 A
- global_topology_local_chirality_match: 0.0 -> 1.0
- global_topology_window_match: 0.0 -> 1.0
- global_topology_domain_match: 0.0 -> 1.0
- rigid_domain_reconvergence: applied=False accepted=0 candidates=64 rmsd=0.07644829731501662 -> 0.07565663842689971 A
- topology_reconvergence: applied=True accepted=7/36 rmsd=0.07565663842689971 -> 0.030660444681174733 A
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 alpha=1.0
- heavy_atom_rmsd_before_sidechain_refine: 3.105 A
- heavy_atom_rmsd: 2.771 A
- sidechain_heavy_atom_rmsd_before_sidechain_refine: 3.968 A
- sidechain_heavy_atom_rmsd: 3.590 A
- **all-atom quality (honest):** heavy 2.771 A, sidechain 3.590 A
- pre_local_rmsd: 0.031 A
- localized_anchor_rmsd: None
- phase_b_ca_rmsd_after: 0.03070007398655518
- ca_drift_after_phase_b: 0.0005150166722229795
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.992

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=7 · 3-10(G)=2 · coil(C)=4

```
CEHHHHHHECCEEHHHHHHEHHHHGHGHEHHEHC
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=9 · sheet=9
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - A18 ↔ L22  (helix)
  - N19 ↔ W23  (helix)
  - L22 ↔ Q26  (helix)
  - K24 ↔ L28  (helix)
  - Q26 ↔ K30  (helix)
  - S2 ↔ V9  (sheet)
  - S2 ↔ M12  (sheet)
  - S2 ↔ T13  (sheet)
  - V9 ↔ K29  (sheet)
  - M12 ↔ L20  (sheet)
  - M12 ↔ K32  (sheet)
  - T13 ↔ L20  (sheet)
  - T13 ↔ K29  (sheet)
  - L20 ↔ K29  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=16 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6943 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
