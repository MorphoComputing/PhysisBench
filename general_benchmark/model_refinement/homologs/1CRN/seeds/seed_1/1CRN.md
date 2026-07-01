# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1CRN\seeds\seed_1\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 0.346 A
- tm_score_ca_ordered: 0.9780072163777369
- heavy_atom_rmsd: 2.191 A
- sidechain_heavy_atom_rmsd: 2.978 A
- **all-atom quality (honest):** heavy 2.191 A, sidechain 2.978 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 822
- bin_accuracy: 0.921

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=0.696089676873607 -> 0.632656195854356 A
- topology_reconvergence: applied=True accepted=29/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.34550007097722407
- ga_delta_rmsd: -0.03805963184336636  ga_fitness_mode: energy
- pre_local_rmsd: 0.3738833098131295  localized_anchor_rmsd: 0.345533792189057

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=10 · 3-10(G)=8 · coil(C)=3

```
CEGGEGHHHHHHHHHGHHGHEEHHHHHHHHEECEGEGEGEHHHC
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=11 · sheet=9
  - V7 ↔ N11  (helix)
  - A8 ↔ F12  (helix)
  - R9 ↔ N13  (helix)
  - S10 ↔ V14  (helix)
  - N11 ↔ C15  (helix)
  - N13 ↔ L17  (helix)
  - V14 ↔ P18  (helix)
  - T20 ↔ I24  (helix)
  - A23 ↔ T27  (helix)
  - I24 ↔ Y28  (helix)
  - A26 ↔ G30  (helix)
  - C2 ↔ E22  (sheet)
  - P21 ↔ I32  (sheet)
  - E22 ↔ C31  (sheet)
  - E22 ↔ I32  (sheet)
  - E22 ↔ I34  (sheet)
  - C31 ↔ P40  (sheet)
  - I32 ↔ T38  (sheet)
  - I32 ↔ P40  (sheet)
  - I34 ↔ P40  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=146 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=47 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1135 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)
