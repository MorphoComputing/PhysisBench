# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1CTF\seeds\seed_0\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 0.578 A
- tm_score_ca_ordered: 0.9626461875137367
- heavy_atom_rmsd: 2.292 A
- sidechain_heavy_atom_rmsd: 3.012 A
- **all-atom quality (honest):** heavy 2.292 A, sidechain 3.012 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 2016
- bin_accuracy: 0.849

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=0.5900289909180991 -> 0.4712954096586086 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5779365398388363
- ga_delta_rmsd: -0.13292962801481756  ga_fitness_mode: energy
- pre_local_rmsd: 0.5952231334915196  localized_anchor_rmsd: 0.5779004526311974

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=12 · 3-10(G)=14 · coil(C)=3

```
CEGGGHEGGGHHHHHHHHHHHGEHEEHGHHHHHHHHGHEGGEEGEEHHHHHHHHHHHHHHGECGEC
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=24 · sheet=3
  - N11 ↔ V15  (helix)
  - K12 ↔ I16  (helix)
  - V13 ↔ K17  (helix)
  - A14 ↔ A18  (helix)
  - V15 ↔ V19  (helix)
  - I16 ↔ R20  (helix)
  - K17 ↔ G21  (helix)
  - R20 ↔ G24  (helix)
  - L27 ↔ K31  (helix)
  - E29 ↔ L33  (helix)
  - A30 ↔ V34  (helix)
  - K31 ↔ E35  (helix)
  - D32 ↔ S36  (helix)
  - V34 ↔ P38  (helix)
  - K47 ↔ E51  (helix)
  - D48 ↔ A52  (helix)
  - D49 ↔ L53  (helix)
  - A50 ↔ K54  (helix)
  - E51 ↔ K55  (helix)
  - A52 ↔ A56  (helix)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=257 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=110 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1221 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1CTF.ensemble.pdb`)
- RMSF mean=0.022Å max=0.058Å (per-residue in .per_residue.csv)
- most flexible residues: 50, 19, 52, 61, 25

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1CTF.pae.csv`
- mean=0.015Å · max=0.075Å · AlphaFold-PAE analog (low block = rigid unit/domain)
