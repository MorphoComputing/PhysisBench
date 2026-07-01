# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4PTI\seeds\seed_4\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 1.313 A
- tm_score_ca_ordered: 0.8068029465631701
- heavy_atom_rmsd: 3.267 A
- sidechain_heavy_atom_rmsd: 4.211 A
- **all-atom quality (honest):** heavy 3.267 A, sidechain 4.211 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 483
- bin_accuracy: 0.781

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=3.838823819635288 -> 3.4266503176281375 A
- topology_reconvergence: applied=True accepted=5/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.3128140911333508
- ga_delta_rmsd: 1.0916001646762192  ga_fitness_mode: energy
- pre_local_rmsd: 1.3287349507899764  localized_anchor_rmsd: 1.3127450201635036

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=30 · 3-10(G)=8 · coil(C)=7

```
EEHHHEEEGHECEEEEECEEEEEGGEGEEEEECGHGECEEECCEGEHHEHGHHEHC
```

## Backbone H-bond Network

- total=77 · helix(i→i+4)=1 · sheet=76
  - E48 ↔ R52  (helix)
  - P1 ↔ E6  (sheet)
  - P1 ↔ P7  (sheet)
  - D2 ↔ P7  (sheet)
  - D2 ↔ Y22  (sheet)
  - E6 ↔ F21  (sheet)
  - E6 ↔ Y22  (sheet)
  - E6 ↔ N23  (sheet)
  - P7 ↔ Y20  (sheet)
  - P7 ↔ F21  (sheet)
  - P7 ↔ Y22  (sheet)
  - P7 ↔ N23  (sheet)
  - P8 ↔ R19  (sheet)
  - P8 ↔ Y20  (sheet)
  - P8 ↔ F21  (sheet)
  - P8 ↔ Y22  (sheet)
  - P8 ↔ N23  (sheet)
  - G11 ↔ R16  (sheet)
  - G11 ↔ I17  (sheet)
  - R16 ↔ F32  (sheet)
  - … +57 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=228 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=131 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8677 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
