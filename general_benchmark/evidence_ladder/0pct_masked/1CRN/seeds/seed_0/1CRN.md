# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1CRN/sequence/1CRN.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1CRN/seeds/seed_0/1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 0.080 A
- tm_score_ca_ordered: 0.9984379934242777
- heavy_atom_rmsd: 2.361 A
- sidechain_heavy_atom_rmsd: 3.225 A
- **all-atom quality (honest):** heavy 2.361 A, sidechain 3.225 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 861
- bin_accuracy: 0.973

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.0901639762301017 -> 0.08919991735562764 A
- topology_reconvergence: applied=True accepted=26/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.0796443744882743
- ga_delta_rmsd: -0.009125185348284964  ga_fitness_mode: energy
- pre_local_rmsd: 0.08158321751037602  localized_anchor_rmsd: 0.07966276388728943

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=12 · 3-10(G)=7 · coil(C)=1

```
EEGGEHHHHHHHHHHGHHGEHHHHHHHHEHEECEGEGEGEHHHE
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=13 · sheet=7
  - I6 ↔ S10  (helix)
  - V7 ↔ N11  (helix)
  - A8 ↔ F12  (helix)
  - R9 ↔ N13  (helix)
  - S10 ↔ V14  (helix)
  - N11 ↔ C15  (helix)
  - N13 ↔ L17  (helix)
  - V14 ↔ P18  (helix)
  - P18 ↔ E22  (helix)
  - E22 ↔ A26  (helix)
  - A23 ↔ T27  (helix)
  - I24 ↔ Y28  (helix)
  - A26 ↔ G30  (helix)
  - C31 ↔ P40  (sheet)
  - C31 ↔ A44  (sheet)
  - I32 ↔ T38  (sheet)
  - I32 ↔ P40  (sheet)
  - I32 ↔ A44  (sheet)
  - I34 ↔ P40  (sheet)
  - T38 ↔ A44  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=145 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=47 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.678 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
