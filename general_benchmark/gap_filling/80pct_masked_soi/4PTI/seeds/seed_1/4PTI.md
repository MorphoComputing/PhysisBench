# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4PTI\seeds\seed_1\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.845 A
- tm_score_ca_ordered: 0.9034618371870613
- heavy_atom_rmsd: 2.791 A
- sidechain_heavy_atom_rmsd: 3.552 A
- **all-atom quality (honest):** heavy 2.791 A, sidechain 3.552 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 483
- bin_accuracy: 0.820

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=8 rmsd=3.222266763754083 -> 2.659718630052175 A
- topology_reconvergence: applied=True accepted=32/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8454909583074707
- ga_delta_rmsd: 0.03506756779843356  ga_fitness_mode: energy
- pre_local_rmsd: 0.8651490391657782  localized_anchor_rmsd: 0.8454663834996221

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=24 · 3-10(G)=15 · coil(C)=7

```
EEHGCEEEEGEHEGEHECEGGCGGGHGEEEEECGGCEEGEGHEEGEHEHHGHECHC
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=1 · sheet=41
  - P12 ↔ R16  (helix)
  - P1 ↔ E6  (sheet)
  - D2 ↔ P7  (sheet)
  - P8 ↔ R19  (sheet)
  - P8 ↔ L28  (sheet)
  - Y9 ↔ I17  (sheet)
  - Y9 ↔ R19  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ R19  (sheet)
  - A15 ↔ F32  (sheet)
  - I17 ↔ T31  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ C37  (sheet)
  - R19 ↔ C29  (sheet)
  - R19 ↔ Q30  (sheet)
  - R19 ↔ T31  (sheet)
  - R19 ↔ F32  (sheet)
  - R19 ↔ C37  (sheet)
  - L28 ↔ S46  (sheet)
  - L28 ↔ E48  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=208 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=119 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5834 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
