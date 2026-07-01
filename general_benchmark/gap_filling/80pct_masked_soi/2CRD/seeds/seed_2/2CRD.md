# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2CRD\seeds\seed_2\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 0.693 A
- tm_score_ca_ordered: 0.8683847338396908
- heavy_atom_rmsd: 2.630 A
- sidechain_heavy_atom_rmsd: 3.344 A
- **all-atom quality (honest):** heavy 2.630 A, sidechain 3.344 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 215
- bin_accuracy: 0.851

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=11 rmsd=1.6812803964414298 -> 0.9967628090355022 A
- topology_reconvergence: applied=True accepted=9/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.6927996875619812
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.6928076675865502  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=14 · 3-10(G)=8 · coil(C)=4

```
EEEGCHEHHEHHGHGHGGEGEHCEECEGEECEGE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=2 · sheet=23
  - S8 ↔ W12  (helix)
  - W12 ↔ Q16  (helix)
  - T1 ↔ E10  (sheet)
  - T1 ↔ H19  (sheet)
  - N2 ↔ E10  (sheet)
  - V3 ↔ E10  (sheet)
  - T7 ↔ G24  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ M27  (sheet)
  - E10 ↔ G24  (sheet)
  - E10 ↔ K25  (sheet)
  - E10 ↔ M27  (sheet)
  - E10 ↔ K30  (sheet)
  - H19 ↔ G24  (sheet)
  - H19 ↔ R32  (sheet)
  - H19 ↔ Y34  (sheet)
  - T21 ↔ R32  (sheet)
  - T21 ↔ Y34  (sheet)
  - G24 ↔ K30  (sheet)
  - G24 ↔ R32  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=125 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=59 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5723 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
