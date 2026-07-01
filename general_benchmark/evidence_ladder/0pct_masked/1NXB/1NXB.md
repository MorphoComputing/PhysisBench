# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1NXB/sequence/1NXB.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1NXB/seeds/seed_0/1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 0.566 A
- tm_score_ca_ordered: 0.9669349948206795
- heavy_atom_rmsd: 2.836 A
- sidechain_heavy_atom_rmsd: 3.829 A
- **all-atom quality (honest):** heavy 2.836 A, sidechain 3.829 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.017
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 1653
- bin_accuracy: 0.947

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=0.9244186737937564 -> 0.7035148526356195 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5664007207161362
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5685092464720897  localized_anchor_rmsd: 0.566382723889685

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=30 · 3-10(G)=9 · coil(C)=11

```
CECHEEHCECCEEEGEECHCHEGEGEEECEHEEEGGEGECEEEHGEHHEGCECEGEEHHE
```

## Backbone H-bond Network

- total=70 · helix(i→i+4)=1 · sheet=69
  - T44 ↔ G48  (helix)
  - C2 ↔ T12  (sheet)
  - C2 ↔ T13  (sheet)
  - C2 ↔ K14  (sheet)
  - C2 ↔ C16  (sheet)
  - C2 ↔ S17  (sheet)
  - C2 ↔ S22  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ T13  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ Y24  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ T13  (sheet)
  - H6 ↔ Y24  (sheet)
  - H6 ↔ K26  (sheet)
  - T13 ↔ Y24  (sheet)
  - K14 ↔ S22  (sheet)
  - K14 ↔ Y24  (sheet)
  - C16 ↔ S22  (sheet)
  - C16 ↔ Y24  (sheet)
  - … +50 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=209 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=132 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.607 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0167

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1NXB.ensemble.pdb`)
- RMSF mean=0.035Å max=0.125Å (per-residue in .per_residue.csv)
- most flexible residues: 31, 29, 4, 2, 45

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1NXB.pae.csv`
- mean=0.024Å · max=0.116Å · AlphaFold-PAE analog (low block = rigid unit/domain)
