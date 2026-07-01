# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1OMB\seeds\seed_0\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 6.507 A
- tm_score_ca_ordered: 0.1731359666883304
- heavy_atom_rmsd: 7.884 A
- sidechain_heavy_atom_rmsd: 8.969 A
- **all-atom quality (honest):** heavy 7.884 A, sidechain 8.969 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 465
- bin_accuracy: 0.933

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain_block reason=rejected_domain_topology_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.507239382724983
- ga_delta_rmsd: -0.0014397918989015324  ga_fitness_mode: energy
- pre_local_rmsd: 6.507145026547299  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=15 · 3-10(G)=4 · coil(C)=7

```
CEEEHGEGEHGECECEHHGECEECHHEEHEECC
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=1 · sheet=39
  - M25 ↔ N29  (helix)
  - A2 ↔ K7  (sheet)
  - A2 ↔ K14  (sheet)
  - A2 ↔ C16  (sheet)
  - A2 ↔ P20  (sheet)
  - E3 ↔ K14  (sheet)
  - E3 ↔ C16  (sheet)
  - E3 ↔ P20  (sheet)
  - D4 ↔ K14  (sheet)
  - D4 ↔ C16  (sheet)
  - D4 ↔ P20  (sheet)
  - D4 ↔ R22  (sheet)
  - K7 ↔ G12  (sheet)
  - K7 ↔ K14  (sheet)
  - K7 ↔ C16  (sheet)
  - K7 ↔ P20  (sheet)
  - K7 ↔ R22  (sheet)
  - K7 ↔ C23  (sheet)
  - T9 ↔ K14  (sheet)
  - T9 ↔ P20  (sheet)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=103 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=50 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1415 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
