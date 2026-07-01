# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1HRC\seeds\seed_1\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 0.341 A
- tm_score_ca_ordered: 0.9916195277961779
- heavy_atom_rmsd: 2.891 A
- sidechain_heavy_atom_rmsd: 3.741 A
- **all-atom quality (honest):** heavy 2.891 A, sidechain 3.741 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3299
- bin_accuracy: 0.921

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=0.41605381425441523 -> 0.38809809571503723 A
- topology_reconvergence: applied=True accepted=23/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.3407672622349805
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.3444002280204955  localized_anchor_rmsd: 0.34082145805410075

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=52 · strand(E)=25 · 3-10(G)=17 · coil(C)=8

```
ECHHHHHHHHGEHHHGEEGECHEECEHEECGEHHCHEEHHHEHHECECHHHHGEGEGGEGHHHHGHHHHGHHHHGHEHEGEGECGEHHHHHHHHHHHHGHGE
```

## Backbone H-bond Network

- total=66 · helix(i→i+4)=22 · sheet=44
  - E3 ↔ K7  (helix)
  - K4 ↔ I8  (helix)
  - G5 ↔ F9  (helix)
  - K6 ↔ V10  (helix)
  - V10 ↔ A14  (helix)
  - G36 ↔ G40  (helix)
  - G40 ↔ G44  (helix)
  - T62 ↔ Y66  (helix)
  - L63 ↔ L67  (helix)
  - M64 ↔ E68  (helix)
  - L67 ↔ K71  (helix)
  - E68 ↔ K72  (helix)
  - K72 ↔ G76  (helix)
  - K87 ↔ E91  (helix)
  - T88 ↔ D92  (helix)
  - E89 ↔ L93  (helix)
  - R90 ↔ I94  (helix)
  - E91 ↔ A95  (helix)
  - D92 ↔ Y96  (helix)
  - L93 ↔ L97  (helix)
  - … +46 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=39 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=377 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=159 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0327 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
