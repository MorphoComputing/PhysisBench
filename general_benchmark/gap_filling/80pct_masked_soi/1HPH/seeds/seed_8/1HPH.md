# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HPH\seeds\seed_8\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 2.577 A
- tm_score_ca_ordered: 0.4526625473056518
- heavy_atom_rmsd: 4.143 A
- sidechain_heavy_atom_rmsd: 4.921 A
- **all-atom quality (honest):** heavy 4.143 A, sidechain 4.921 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 235
- bin_accuracy: 0.685

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=4.101103695484531 -> 2.6263592128783135 A
- topology_reconvergence: applied=True accepted=12/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.577541634086973
- ga_delta_rmsd: -1.6156993206957941  ga_fitness_mode: energy
- pre_local_rmsd: 2.5774618286567508  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=7 · 3-10(G)=4 · coil(C)=5

```
CEHHHHHGHGHEHHEGHHEHHHHHHHCCECECGHE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=6 · sheet=2
  - E3 ↔ M7  (helix)
  - M7 ↔ G11  (helix)
  - L14 ↔ E18  (helix)
  - E18 ↔ W22  (helix)
  - V20 ↔ R24  (helix)
  - W22 ↔ K26  (helix)
  - K12 ↔ R19  (sheet)
  - D29 ↔ A35  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=93 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=4 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7948 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
