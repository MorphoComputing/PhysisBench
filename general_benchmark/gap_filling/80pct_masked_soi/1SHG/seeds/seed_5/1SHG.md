# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1SHG\seeds\seed_5\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 1.638 A
- tm_score_ca_ordered: 0.7281185709127459
- heavy_atom_rmsd: 3.893 A
- sidechain_heavy_atom_rmsd: 5.025 A
- **all-atom quality (honest):** heavy 3.893 A, sidechain 5.025 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 476
- bin_accuracy: 0.756

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=4.043420474657285 -> 3.3507131110364985 A
- topology_reconvergence: applied=True accepted=5/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.6380869595673286
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.6933653793393895  localized_anchor_rmsd: 1.6381041389192195

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=30 · 3-10(G)=10 · coil(C)=5

```
EEGGGGECEGGHEHGEGGEEEHECCEEEEHHEHHEEEEEGCHEEEEEEEHHEEEC
```

## Backbone H-bond Network

- total=109 · helix(i→i+4)=1 · sheet=108
  - S30 ↔ D34  (helix)
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ K21  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ M19  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ K21  (sheet)
  - Y9 ↔ D23  (sheet)
  - E16 ↔ W35  (sheet)
  - E16 ↔ W36  (sheet)
  - M19 ↔ T26  (sheet)
  - M19 ↔ V38  (sheet)
  - M19 ↔ E39  (sheet)
  - D23 ↔ V38  (sheet)
  - D23 ↔ E39  (sheet)
  - T26 ↔ W36  (sheet)
  - T26 ↔ K37  (sheet)
  - T26 ↔ V38  (sheet)
  - … +89 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=221 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=140 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6646 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
