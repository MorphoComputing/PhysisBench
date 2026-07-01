# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2CRD\seeds\seed_7\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 1.838 A
- tm_score_ca_ordered: 0.6104743820409161
- heavy_atom_rmsd: 3.734 A
- sidechain_heavy_atom_rmsd: 4.681 A
- **all-atom quality (honest):** heavy 3.734 A, sidechain 4.681 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 215
- bin_accuracy: 0.716

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.838167966284113
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.838214757003241  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=16 · 3-10(G)=2 · coil(C)=4

```
CEEECECHHEGHHHHEHHEHEHEEEECHHEEEGE
```

## Backbone H-bond Network

- total=43 · helix(i→i+4)=5 · sheet=38
  - S8 ↔ W12  (helix)
  - K9 ↔ S13  (helix)
  - S13 ↔ R17  (helix)
  - V14 ↔ L18  (helix)
  - L18 ↔ S22  (helix)
  - N2 ↔ E10  (sheet)
  - V3 ↔ E10  (sheet)
  - S4 ↔ E10  (sheet)
  - S4 ↔ G24  (sheet)
  - T6 ↔ K25  (sheet)
  - T6 ↔ C26  (sheet)
  - E10 ↔ Q16  (sheet)
  - E10 ↔ R23  (sheet)
  - E10 ↔ G24  (sheet)
  - E10 ↔ K25  (sheet)
  - E10 ↔ C26  (sheet)
  - E10 ↔ K30  (sheet)
  - Q16 ↔ T21  (sheet)
  - Q16 ↔ R23  (sheet)
  - Q16 ↔ G24  (sheet)
  - … +23 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=135 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=68 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7758 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
