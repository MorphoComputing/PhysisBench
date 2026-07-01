# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1ENH\seeds\seed_1\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 0.522 A
- tm_score_ca_ordered: 0.9569487305044301
- heavy_atom_rmsd: 3.204 A
- sidechain_heavy_atom_rmsd: 4.129 A
- **all-atom quality (honest):** heavy 3.204 A, sidechain 4.129 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 438
- bin_accuracy: 0.888

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=16 rmsd=5.014256480148628 -> 3.9112568436077617 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5220603858981175
- ga_delta_rmsd: 1.2062521400225696  ga_fitness_mode: energy
- pre_local_rmsd: 0.5279867963371289  localized_anchor_rmsd: 0.5220449763095594

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=12 · 3-10(G)=13 · coil(C)=1

```
EEECEEGGHGHHHHGHHHHEHEGEGGHHGHHHHEGHEHGHHGHHGHEHHHGE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=12 · sheet=1
  - Q9 ↔ L13  (helix)
  - R12 ↔ E16  (helix)
  - L13 ↔ F17  (helix)
  - K14 ↔ N18  (helix)
  - F17 ↔ R21  (helix)
  - R27 ↔ L31  (helix)
  - R28 ↔ S32  (helix)
  - S32 ↔ G36  (helix)
  - G36 ↔ A40  (helix)
  - A40 ↔ I44  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - Q47 ↔ K52  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=149 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4644 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
