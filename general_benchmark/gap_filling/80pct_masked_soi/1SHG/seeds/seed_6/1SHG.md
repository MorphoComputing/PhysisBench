# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1SHG\seeds\seed_6\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 0.547 A
- tm_score_ca_ordered: 0.9548921656107734
- heavy_atom_rmsd: 2.412 A
- sidechain_heavy_atom_rmsd: 3.066 A
- **all-atom quality (honest):** heavy 2.412 A, sidechain 3.066 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 476
- bin_accuracy: 0.884

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=3.306664494958618 -> 2.9915837274725483 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5469174012208132
- ga_delta_rmsd: 2.4297675822657454  ga_fitness_mode: energy
- pre_local_rmsd: 0.5608353453830247  localized_anchor_rmsd: 0.5469837549549929

## Failure Classification

- primary_reason: `SIDECHAIN_RMSD_HIGH`
- reasons: `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=33 · 3-10(G)=9 · coil(C)=9

```
EEGGCGEEEEEEEHCEECEECGEEEECEEHHECEEEEEEGGGEEECEECGHEEGC
```

## Backbone H-bond Network

- total=113 · helix(i→i+4)=0 · sheet=113
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y7 ↔ I24  (sheet)
  - D8 ↔ V17  (sheet)
  - D8 ↔ M19  (sheet)
  - D8 ↔ K20  (sheet)
  - D8 ↔ D23  (sheet)
  - D8 ↔ I24  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ V17  (sheet)
  - Y9 ↔ M19  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ D23  (sheet)
  - Q10 ↔ E16  (sheet)
  - Q10 ↔ V17  (sheet)
  - Q10 ↔ M19  (sheet)
  - Q10 ↔ K20  (sheet)
  - E11 ↔ E16  (sheet)
  - E11 ↔ V17  (sheet)
  - … +93 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=204 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=124 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4881 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
