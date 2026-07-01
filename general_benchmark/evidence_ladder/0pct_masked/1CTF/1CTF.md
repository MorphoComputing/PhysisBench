# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set/general_benchmark/1CTF/sequence/1CTF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1CTF/seeds/seed_1/1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 0.055 A
- tm_score_ca_ordered: 0.9996193378077642
- heavy_atom_rmsd: 2.281 A
- sidechain_heavy_atom_rmsd: 2.988 A
- **all-atom quality (honest):** heavy 2.281 A, sidechain 2.988 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 2016
- bin_accuracy: 0.973

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.18629497073245846 -> 0.18402951709949456 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.05458192604313364
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.05836604220697044  localized_anchor_rmsd: 0.05461570122799352

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=14 · 3-10(G)=9 · coil(C)=3

```
CEGGGHEGHHHHHHHHHHHHHHEHEEGHGHHHHHHGEHEGHEEHEEHHHHHHHHHHHHHHCEGEEC
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=27 · sheet=3
  - K6 ↔ A10  (helix)
  - A10 ↔ A14  (helix)
  - N11 ↔ V15  (helix)
  - K12 ↔ I16  (helix)
  - V13 ↔ K17  (helix)
  - A14 ↔ A18  (helix)
  - V15 ↔ V19  (helix)
  - I16 ↔ R20  (helix)
  - K17 ↔ G21  (helix)
  - A18 ↔ A22  (helix)
  - R20 ↔ G24  (helix)
  - G24 ↔ K28  (helix)
  - K28 ↔ D32  (helix)
  - A30 ↔ V34  (helix)
  - K31 ↔ E35  (helix)
  - V34 ↔ P38  (helix)
  - G44 ↔ D48  (helix)
  - K47 ↔ E51  (helix)
  - D48 ↔ A52  (helix)
  - D49 ↔ L53  (helix)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=245 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=100 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6695 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1CTF.ensemble.pdb`)
- RMSF mean=0.02Å max=0.05Å (per-residue in .per_residue.csv)
- most flexible residues: 28, 20, 17, 43, 38

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1CTF.pae.csv`
- mean=0.014Å · max=0.076Å · AlphaFold-PAE analog (low block = rigid unit/domain)
