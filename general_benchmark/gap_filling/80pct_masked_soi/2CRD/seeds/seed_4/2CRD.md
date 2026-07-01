# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2CRD\seeds\seed_4\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 0.884 A
- tm_score_ca_ordered: 0.7857075496426998
- heavy_atom_rmsd: 3.196 A
- sidechain_heavy_atom_rmsd: 4.059 A
- **all-atom quality (honest):** heavy 3.196 A, sidechain 4.059 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 215
- bin_accuracy: 0.837

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=5.471800133922191 -> 4.756028678950055 A
- topology_reconvergence: applied=True accepted=5/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.8840227714927807
- ga_delta_rmsd: 2.593251142194431  ga_fitness_mode: energy
- pre_local_rmsd: 0.8840153314863983  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=15 · 3-10(G)=4 · coil(C)=4

```
EEEECCEHEHHHGGGHHHEHEHHCEEECHEEEGE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=3 · sheet=21
  - S8 ↔ W12  (helix)
  - W12 ↔ Q16  (helix)
  - Q16 ↔ N20  (helix)
  - T1 ↔ H19  (sheet)
  - V3 ↔ K9  (sheet)
  - S4 ↔ K9  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ C26  (sheet)
  - T7 ↔ M27  (sheet)
  - K9 ↔ K25  (sheet)
  - K9 ↔ C26  (sheet)
  - K9 ↔ M27  (sheet)
  - H19 ↔ R32  (sheet)
  - H19 ↔ Y34  (sheet)
  - T21 ↔ R32  (sheet)
  - T21 ↔ Y34  (sheet)
  - K25 ↔ K30  (sheet)
  - K25 ↔ C31  (sheet)
  - K25 ↔ R32  (sheet)
  - K25 ↔ Y34  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=128 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=62 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5455 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
