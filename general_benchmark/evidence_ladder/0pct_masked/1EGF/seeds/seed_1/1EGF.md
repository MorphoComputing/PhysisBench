# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1EGF/sequence/1EGF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1EGF/seeds/seed_1/1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 0.071 A
- tm_score_ca_ordered: 0.9990502347989221
- heavy_atom_rmsd: 3.349 A
- sidechain_heavy_atom_rmsd: 4.534 A
- **all-atom quality (honest):** heavy 3.349 A, sidechain 4.534 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1176
- bin_accuracy: 0.977

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.07088120855208077
- ga_delta_rmsd: 0.009577073528222624  ga_fitness_mode: energy
- pre_local_rmsd: 0.07235513564479862  localized_anchor_rmsd: 0.07086112187138222

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=27 · 3-10(G)=5 · coil(C)=8

```
CECEEEHHEEGHCEHEEECEEEGHCHEEEEEEECHEEEHEGHHHECEGGEC
```

## Backbone H-bond Network

- total=110 · helix(i→i+4)=3 · sheet=107
  - S8 ↔ Y12  (helix)
  - G35 ↔ D39  (helix)
  - D39 ↔ T43  (helix)
  - Y2 ↔ V18  (sheet)
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
  - P6 ↔ M20  (sheet)
  - P6 ↔ H21  (sheet)
  - … +90 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=184 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=100 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6338 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
