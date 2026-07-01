# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\5WOW\seeds\seed_0\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 2.407 A
- tm_score_ca_ordered: 0.4879376563915051
- heavy_atom_rmsd: 3.596 A
- sidechain_heavy_atom_rmsd: 4.420 A
- **all-atom quality (honest):** heavy 3.596 A, sidechain 4.420 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 278
- bin_accuracy: 0.853

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.406473118282234
- ga_delta_rmsd: 1.7480090691660308  ga_fitness_mode: energy
- pre_local_rmsd: 2.406526014257863  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=12 · 3-10(G)=6 · coil(C)=5

```
CHEECEGHHCHEGHHEECGEGGEHHHECEGEHHHHHE
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=2 · sheet=31
  - R11 ↔ D15  (helix)
  - Y32 ↔ D36  (helix)
  - C3 ↔ C16  (sheet)
  - C3 ↔ P17  (sheet)
  - C3 ↔ C20  (sheet)
  - C3 ↔ R23  (sheet)
  - P4 ↔ C16  (sheet)
  - P4 ↔ P17  (sheet)
  - P4 ↔ C20  (sheet)
  - I6 ↔ C16  (sheet)
  - I6 ↔ P17  (sheet)
  - I6 ↔ C20  (sheet)
  - R12 ↔ P17  (sheet)
  - R12 ↔ C20  (sheet)
  - R12 ↔ R23  (sheet)
  - R12 ↔ Y27  (sheet)
  - R12 ↔ G29  (sheet)
  - C16 ↔ R23  (sheet)
  - C16 ↔ Y27  (sheet)
  - C16 ↔ G29  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=164 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=98 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1846 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`5WOW.ensemble.pdb`)
- RMSF mean=1.339Å max=4.121Å (per-residue in .per_residue.csv)
- most flexible residues: 34, 35, 32, 33, 14

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `5WOW.pae.csv`
- mean=0.942Å · max=6.277Å · AlphaFold-PAE analog (low block = rigid unit/domain)
