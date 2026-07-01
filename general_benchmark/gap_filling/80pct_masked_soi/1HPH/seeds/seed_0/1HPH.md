# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HPH\seeds\seed_0\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 4.128 A
- tm_score_ca_ordered: 0.3167281380115121
- heavy_atom_rmsd: 5.334 A
- sidechain_heavy_atom_rmsd: 5.995 A
- **all-atom quality (honest):** heavy 5.334 A, sidechain 5.995 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 235
- bin_accuracy: 0.634

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.128009505232674
- ga_delta_rmsd: 2.173575902615606  ga_fitness_mode: energy
- pre_local_rmsd: 4.12794930018868  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=6 · 3-10(G)=3 · coil(C)=3

```
CEGHEHHHHHHEHCEHHHHHGHHEHGHHHHHEHHC
```

## Backbone H-bond Network

- total=10 · helix(i→i+4)=9 · sheet=1
  - L6 ↔ L10  (helix)
  - M7 ↔ G11  (helix)
  - S16 ↔ V20  (helix)
  - R19 ↔ L23  (helix)
  - L23 ↔ L27  (helix)
  - K25 ↔ D29  (helix)
  - L27 ↔ H31  (helix)
  - D29 ↔ F33  (helix)
  - V30 ↔ V34  (helix)
  - Q5 ↔ K12  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=89 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=2 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3374 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
