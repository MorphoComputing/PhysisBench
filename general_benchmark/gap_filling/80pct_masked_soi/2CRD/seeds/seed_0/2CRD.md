# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2CRD\seeds\seed_0\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 1.785 A
- tm_score_ca_ordered: 0.5858794177198331
- heavy_atom_rmsd: 4.335 A
- sidechain_heavy_atom_rmsd: 5.730 A
- **all-atom quality (honest):** heavy 4.335 A, sidechain 5.730 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 216
- bin_accuracy: 0.708

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=3.218619172312094 -> 2.107724263153898 A
- topology_reconvergence: applied=True accepted=7/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.7848657793992995
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.784794230502392  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=17 · 3-10(G)=1 · coil(C)=4

```
EEHGCCEEHHHEHHHEHHEHEEEEECEHHECEEE
```

## Backbone H-bond Network

- total=54 · helix(i→i+4)=4 · sheet=50
  - K9 ↔ S13  (helix)
  - E10 ↔ V14  (helix)
  - S13 ↔ R17  (helix)
  - V14 ↔ L18  (helix)
  - T1 ↔ W12  (sheet)
  - T1 ↔ Q16  (sheet)
  - T7 ↔ W12  (sheet)
  - T7 ↔ G24  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ M27  (sheet)
  - S8 ↔ R23  (sheet)
  - S8 ↔ G24  (sheet)
  - S8 ↔ K25  (sheet)
  - S8 ↔ M27  (sheet)
  - W12 ↔ H19  (sheet)
  - W12 ↔ T21  (sheet)
  - W12 ↔ S22  (sheet)
  - W12 ↔ R23  (sheet)
  - W12 ↔ G24  (sheet)
  - W12 ↔ K25  (sheet)
  - … +34 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=138 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=72 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9813 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
