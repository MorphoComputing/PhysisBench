# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1VII\seeds\seed_0\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.212 A
- tm_score_ca_ordered: 0.5088386108562795
- heavy_atom_rmsd: 3.745 A
- sidechain_heavy_atom_rmsd: 4.597 A
- **all-atom quality (honest):** heavy 3.745 A, sidechain 4.597 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 305
- bin_accuracy: 0.813

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=2.57574169318405 -> 2.1765552209568817 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.2121644498034496
- ga_delta_rmsd: -0.8558985564429316  ga_fitness_mode: energy
- pre_local_rmsd: 2.212086237957955  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=8 · 3-10(G)=2 · coil(C)=4

```
CEGHHHHHHHHEEHHHHHHECEGHHEHHHHEECC
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=7 · sheet=7
  - E4 ↔ A8  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - K24 ↔ L28  (helix)
  - Q25 ↔ K29  (helix)
  - S2 ↔ M12  (sheet)
  - S2 ↔ T13  (sheet)
  - M12 ↔ L20  (sheet)
  - T13 ↔ L20  (sheet)
  - L20 ↔ Q26  (sheet)
  - Q26 ↔ E31  (sheet)
  - Q26 ↔ K32  (sheet)

## Solvent Accessibility (burial)

- buried=7 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=101 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.185 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
