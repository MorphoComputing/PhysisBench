# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\4PTI\seeds\seed_0\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.296 A
- tm_score_ca_ordered: 0.9861546489981665
- heavy_atom_rmsd: 2.960 A
- sidechain_heavy_atom_rmsd: 3.869 A
- **all-atom quality (honest):** heavy 2.960 A, sidechain 3.869 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1431
- bin_accuracy: 0.921

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=0.31259903813933276 -> 0.2785381987050884 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.296395161456617
- ga_delta_rmsd: -0.03015173826712514  ga_fitness_mode: energy
- pre_local_rmsd: 0.3092653311628066  localized_anchor_rmsd: 0.2963986632008132

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=20 · 3-10(G)=14 · coil(C)=5

```
EEHHHEECEGEGEGEGECEEGCGHHGHEGEEECGGGEGGEHHEEHEHHHHHHGHHC
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=5 · sheet=33
  - R41 ↔ K45  (helix)
  - K45 ↔ D49  (helix)
  - A47 ↔ M51  (helix)
  - E48 ↔ R52  (helix)
  - M51 ↔ G55  (helix)
  - P1 ↔ E6  (sheet)
  - D2 ↔ P7  (sheet)
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
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=206 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=112 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.07 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
