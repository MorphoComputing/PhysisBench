# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1ENH\seeds\seed_0\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 0.053 A
- tm_score_ca_ordered: 0.9994776864213331
- heavy_atom_rmsd: 2.991 A
- sidechain_heavy_atom_rmsd: 3.848 A
- **all-atom quality (honest):** heavy 2.991 A, sidechain 3.848 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 612
- bin_accuracy: 0.975

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.13130542900557488 -> 0.12985298759584044 A
- topology_reconvergence: applied=True accepted=13/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.05331601720196334
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.055432832930552886  localized_anchor_rmsd: 0.05333130700709187

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=11 · 3-10(G)=3 · coil(C)=1

```
EEECEEHHHHHHHHHHHHHEGEEGHHHHHHHHHGEHEHHHHHHHHHHHHHHE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=25 · sheet=0
  - S7 ↔ A11  (helix)
  - E8 ↔ R12  (helix)
  - Q9 ↔ L13  (helix)
  - L10 ↔ K14  (helix)
  - A11 ↔ R15  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - K14 ↔ N18  (helix)
  - R15 ↔ E19  (helix)
  - E25 ↔ Q29  (helix)
  - R26 ↔ Q30  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - Q29 ↔ S33  (helix)
  - S32 ↔ G36  (helix)
  - G36 ↔ A40  (helix)
  - E39 ↔ K43  (helix)
  - A40 ↔ I44  (helix)
  - Q41 ↔ W45  (helix)
  - I42 ↔ F46  (helix)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=148 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=20 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6853 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1ENH.ensemble.pdb`)
- RMSF mean=0.022Å max=0.056Å (per-residue in .per_residue.csv)
- most flexible residues: 21, 42, 30, 9, 31

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1ENH.pae.csv`
- mean=0.016Å · max=0.089Å · AlphaFold-PAE analog (low block = rigid unit/domain)
