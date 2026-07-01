# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\4PTI\seeds\seed_1\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.354 A
- tm_score_ca_ordered: 0.9806653262557321
- heavy_atom_rmsd: 3.096 A
- sidechain_heavy_atom_rmsd: 4.116 A
- **all-atom quality (honest):** heavy 3.096 A, sidechain 4.116 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1431
- bin_accuracy: 0.920

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.35365762439071485
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.36966962234074924  localized_anchor_rmsd: 0.35376588330374437

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=18 · 3-10(G)=15 · coil(C)=5

```
EEHHHEECEGGGEGEGECEEGCGHHGHECEEECGGGEGGGHHHEHEHHHHHHGHHE
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=5 · sheet=26
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
  - A15 ↔ F32  (sheet)
  - I17 ↔ T31  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - R19 ↔ Q30  (sheet)
  - R19 ↔ T31  (sheet)
  - R19 ↔ F32  (sheet)
  - R19 ↔ C37  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=207 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=115 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0716 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
