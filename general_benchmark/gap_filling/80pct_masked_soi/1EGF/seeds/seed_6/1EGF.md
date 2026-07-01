# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1EGF\seeds\seed_6\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 1.868 A
- tm_score_ca_ordered: 0.7597364136700248
- heavy_atom_rmsd: 3.710 A
- sidechain_heavy_atom_rmsd: 4.786 A
- **all-atom quality (honest):** heavy 3.710 A, sidechain 4.786 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 413
- bin_accuracy: 0.770

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=2.5944819654161284 -> 2.350559614159224 A
- topology_reconvergence: applied=True accepted=19/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.8680351886767617
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.8720762405220062  localized_anchor_rmsd: 1.8680499450730443

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=24 · 3-10(G)=7 · coil(C)=6

```
EEGECEHHGEHGEEHEHHEEEGHHCHECEGEEEGHHEEHCEHEGEEECHEC
```

## Backbone H-bond Network

- total=82 · helix(i→i+4)=3 · sheet=79
  - S7 ↔ G11  (helix)
  - G11 ↔ N15  (helix)
  - G35 ↔ D39  (helix)
  - S1 ↔ C19  (sheet)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ C19  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - G4 ↔ D10  (sheet)
  - G4 ↔ C13  (sheet)
  - G4 ↔ C19  (sheet)
  - G4 ↔ M20  (sheet)
  - G4 ↔ H21  (sheet)
  - P6 ↔ C13  (sheet)
  - P6 ↔ C19  (sheet)
  - P6 ↔ M20  (sheet)
  - P6 ↔ H21  (sheet)
  - D10 ↔ C19  (sheet)
  - D10 ↔ T29  (sheet)
  - … +62 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=202 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=118 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9241 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
