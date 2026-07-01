# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1EGF\seeds\seed_9\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 6.442 A
- tm_score_ca_ordered: 0.25239048783054796
- heavy_atom_rmsd: 7.672 A
- sidechain_heavy_atom_rmsd: 8.442 A
- **all-atom quality (honest):** heavy 7.672 A, sidechain 8.442 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 413
- bin_accuracy: 0.688

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.441880775223815
- ga_delta_rmsd: -0.3854547371969499  ga_fitness_mode: energy
- pre_local_rmsd: 6.4418734314207455  localized_anchor_rmsd: 6.4418734314207455

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=24 · 3-10(G)=11 · coil(C)=6

```
EEEEGEHGGEHECEGEEEEEECHHHEGEECEGEGGEECHEHGGHEHHEGCC
```

## Backbone H-bond Network

- total=81 · helix(i→i+4)=1 · sheet=80
  - S7 ↔ G11  (helix)
  - S1 ↔ C19  (sheet)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ C19  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - P3 ↔ Y12  (sheet)
  - P3 ↔ V18  (sheet)
  - P3 ↔ C19  (sheet)
  - P3 ↔ M20  (sheet)
  - P3 ↔ H21  (sheet)
  - G4 ↔ D10  (sheet)
  - G4 ↔ Y12  (sheet)
  - G4 ↔ V18  (sheet)
  - G4 ↔ C19  (sheet)
  - G4 ↔ M20  (sheet)
  - G4 ↔ H21  (sheet)
  - P6 ↔ Y12  (sheet)
  - P6 ↔ C19  (sheet)
  - … +61 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=208 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=122 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.925 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
