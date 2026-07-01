# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\4PTI\seeds\seed_1\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.293 A
- tm_score_ca_ordered: 0.986480770469481
- heavy_atom_rmsd: 2.816 A
- sidechain_heavy_atom_rmsd: 3.718 A
- **all-atom quality (honest):** heavy 2.816 A, sidechain 3.718 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1431
- bin_accuracy: 0.922

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.29314271904376576
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.3076331856367119  localized_anchor_rmsd: 0.29310175452152

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=20 · 3-10(G)=13 · coil(C)=4

```
EHHHHEECEGEGEGEGECEEGCGHHGHEGEEECGGGEGEEHHHEHEHHHHHHGHHE
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=5 · sheet=32
  - R41 ↔ K45  (helix)
  - K45 ↔ D49  (helix)
  - A47 ↔ M51  (helix)
  - E48 ↔ R52  (helix)
  - M51 ↔ G55  (helix)
  - P1 ↔ E6  (sheet)
  - E6 ↔ Y20  (sheet)
  - P7 ↔ Y20  (sheet)
  - Y9 ↔ I17  (sheet)
  - Y9 ↔ R19  (sheet)
  - Y9 ↔ Y20  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ R19  (sheet)
  - A15 ↔ F32  (sheet)
  - I17 ↔ T31  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - R19 ↔ Q30  (sheet)
  - R19 ↔ T31  (sheet)
  - R19 ↔ F32  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=203 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=111 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0695 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
