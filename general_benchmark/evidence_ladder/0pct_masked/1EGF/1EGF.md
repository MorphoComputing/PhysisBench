# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1EGF/sequence/1EGF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1EGF/seeds/seed_0/1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 0.064 A
- tm_score_ca_ordered: 0.999212042067487
- heavy_atom_rmsd: 2.871 A
- sidechain_heavy_atom_rmsd: 3.810 A
- **all-atom quality (honest):** heavy 2.871 A, sidechain 3.810 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1176
- bin_accuracy: 0.978

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.10451565566284331 -> 0.10399731374972856 A
- topology_reconvergence: applied=True accepted=27/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.06450918419414549
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.06584933951265264  localized_anchor_rmsd: 0.0644973939365527

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=28 · 3-10(G)=4 · coil(C)=6

```
EECEEEHHEEHHHEHEEECEEEGHCHEEEEEEECHEEEHEGHHHECEGGEC
```

## Backbone H-bond Network

- total=114 · helix(i→i+4)=5 · sheet=109
  - S7 ↔ G11  (helix)
  - S8 ↔ Y12  (helix)
  - G11 ↔ N15  (helix)
  - G35 ↔ D39  (helix)
  - D39 ↔ T43  (helix)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
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
  - … +94 more (see .hbonds.csv)

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

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1EGF.ensemble.pdb`)
- RMSF mean=0.027Å max=0.057Å (per-residue in .per_residue.csv)
- most flexible residues: 21, 50, 37, 1, 9

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1EGF.pae.csv`
- mean=0.02Å · max=0.098Å · AlphaFold-PAE analog (low block = rigid unit/domain)
