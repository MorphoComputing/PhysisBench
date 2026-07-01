# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1EGF\seeds\seed_8\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 0.462 A
- tm_score_ca_ordered: 0.9620865146292727
- heavy_atom_rmsd: 3.352 A
- sidechain_heavy_atom_rmsd: 4.547 A
- **all-atom quality (honest):** heavy 3.352 A, sidechain 4.547 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 413
- bin_accuracy: 0.884

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=1.8297442706680564 -> 1.355291832652631 A
- topology_reconvergence: applied=True accepted=32/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4622090539821762
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.4761090907633212  localized_anchor_rmsd: 0.46217586686454

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=26 · 3-10(G)=6 · coil(C)=8

```
EECEEEHHEEGGCGHEEECEEEGHCHEEEGEGECHEEEHEHHEHECECHEC
```

## Backbone H-bond Network

- total=87 · helix(i→i+4)=1 · sheet=86
  - G35 ↔ D39  (helix)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - Y2 ↔ I22  (sheet)
  - G4 ↔ Y9  (sheet)
  - G4 ↔ V18  (sheet)
  - G4 ↔ M20  (sheet)
  - G4 ↔ H21  (sheet)
  - G4 ↔ I22  (sheet)
  - C5 ↔ D10  (sheet)
  - C5 ↔ G17  (sheet)
  - C5 ↔ V18  (sheet)
  - C5 ↔ M20  (sheet)
  - C5 ↔ H21  (sheet)
  - C5 ↔ I22  (sheet)
  - P6 ↔ V18  (sheet)
  - P6 ↔ M20  (sheet)
  - P6 ↔ H21  (sheet)
  - … +67 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=183 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=99 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4624 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
