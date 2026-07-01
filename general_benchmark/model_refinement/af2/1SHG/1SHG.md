# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1SHG\seeds\seed_1\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 0.567 A
- tm_score_ca_ordered: 0.9600366798948506
- heavy_atom_rmsd: 2.597 A
- sidechain_heavy_atom_rmsd: 3.323 A
- **all-atom quality (honest):** heavy 2.597 A, sidechain 3.323 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1378
- bin_accuracy: 0.953

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=3 rmsd=0.5756529546746226 -> 0.5247226450544082 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5670886987944573
- ga_delta_rmsd: -0.05031879674393247  ga_fitness_mode: energy
- pre_local_rmsd: 0.5743436016386906  localized_anchor_rmsd: 0.5671459559602199

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=22 · 3-10(G)=13 · coil(C)=9

```
EEGGGHECEGCGEHHEEGEECHEGGCCHCHHEGGEEGEEEGHEGEEECHHHEECC
```

## Backbone H-bond Network

- total=49 · helix(i→i+4)=0 · sheet=49
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ V17  (sheet)
  - Y9 ↔ M19  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ D23  (sheet)
  - E16 ↔ W35  (sheet)
  - E16 ↔ W36  (sheet)
  - V17 ↔ D23  (sheet)
  - V17 ↔ W35  (sheet)
  - V17 ↔ W36  (sheet)
  - M19 ↔ W36  (sheet)
  - M19 ↔ V38  (sheet)
  - M19 ↔ E39  (sheet)
  - K20 ↔ V40  (sheet)
  - D23 ↔ V38  (sheet)
  - D23 ↔ E39  (sheet)
  - D23 ↔ V40  (sheet)
  - … +29 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=207 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=125 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1415 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1SHG.ensemble.pdb`)
- RMSF mean=0.024Å max=0.061Å (per-residue in .per_residue.csv)
- most flexible residues: 13, 51, 36, 46, 8

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1SHG.pae.csv`
- mean=0.017Å · max=0.088Å · AlphaFold-PAE analog (low block = rigid unit/domain)
