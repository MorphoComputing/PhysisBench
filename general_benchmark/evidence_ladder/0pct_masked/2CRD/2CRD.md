# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set/general_benchmark/2CRD/sequence/2CRD.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/2CRD/seeds/seed_0/2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 0.023 A
- tm_score_ca_ordered: 0.999759283644926
- heavy_atom_rmsd: 2.306 A
- sidechain_heavy_atom_rmsd: 2.946 A
- **all-atom quality (honest):** heavy 2.306 A, sidechain 2.946 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.992

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.04506093108431688 -> 0.044177186169624995 A
- topology_reconvergence: applied=True accepted=4/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.02343208549942103
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.023417703015716322  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=18 · 3-10(G)=5 · coil(C)=2

```
EEEEEGEHHEHEHHHHGGEHEGCEEEEHGECEEE
```

## Backbone H-bond Network

- total=54 · helix(i→i+4)=3 · sheet=51
  - K9 ↔ S13  (helix)
  - C11 ↔ C15  (helix)
  - Q16 ↔ N20  (helix)
  - T1 ↔ E10  (sheet)
  - T1 ↔ W12  (sheet)
  - T1 ↔ H19  (sheet)
  - N2 ↔ E10  (sheet)
  - V3 ↔ E10  (sheet)
  - V3 ↔ W12  (sheet)
  - S4 ↔ E10  (sheet)
  - S4 ↔ W12  (sheet)
  - S4 ↔ G24  (sheet)
  - C5 ↔ E10  (sheet)
  - C5 ↔ W12  (sheet)
  - C5 ↔ G24  (sheet)
  - C5 ↔ K25  (sheet)
  - T7 ↔ W12  (sheet)
  - T7 ↔ G24  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ C26  (sheet)
  - … +34 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=125 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=60 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7053 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2CRD.ensemble.pdb`)
- RMSF mean=0.025Å max=0.051Å (per-residue in .per_residue.csv)
- most flexible residues: 10, 23, 24, 33, 13

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2CRD.pae.csv`
- mean=0.018Å · max=0.072Å · AlphaFold-PAE analog (low block = rigid unit/domain)
