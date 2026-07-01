# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4PTI\seeds\seed_5\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.412 A
- tm_score_ca_ordered: 0.9737569283051836
- heavy_atom_rmsd: 2.897 A
- sidechain_heavy_atom_rmsd: 3.767 A
- **all-atom quality (honest):** heavy 2.897 A, sidechain 3.767 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 483
- bin_accuracy: 0.896

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=12 rmsd=1.911173580915912 -> 1.4584021383336 A
- topology_reconvergence: applied=True accepted=33/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.41189617685785346
- ga_delta_rmsd: -0.16405610183741792  ga_fitness_mode: energy
- pre_local_rmsd: 0.42435892189038554  localized_anchor_rmsd: 0.4118652677638391

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=25 · 3-10(G)=14 · coil(C)=7

```
EEHHGEEEEGEGEHEEECEEGCGGHECEEGEECGGCECEEGHEGGEHGHGHHHCEE
```

## Backbone H-bond Network

- total=41 · helix(i→i+4)=2 · sheet=39
  - A47 ↔ M51  (helix)
  - D49 ↔ T53  (helix)
  - P1 ↔ E6  (sheet)
  - D2 ↔ P7  (sheet)
  - E6 ↔ Y20  (sheet)
  - P7 ↔ Y20  (sheet)
  - P7 ↔ A26  (sheet)
  - P8 ↔ R19  (sheet)
  - P8 ↔ Y20  (sheet)
  - Y9 ↔ I17  (sheet)
  - Y9 ↔ R19  (sheet)
  - Y9 ↔ Y20  (sheet)
  - G11 ↔ R16  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ R19  (sheet)
  - A15 ↔ F32  (sheet)
  - R16 ↔ T31  (sheet)
  - R16 ↔ F32  (sheet)
  - I17 ↔ T31  (sheet)
  - I17 ↔ F32  (sheet)
  - … +21 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=201 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=113 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4894 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
