# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CTF\seeds\seed_3\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 9.187 A
- tm_score_ca_ordered: 0.19065960892530606
- heavy_atom_rmsd: 9.716 A
- sidechain_heavy_atom_rmsd: 10.229 A
- **all-atom quality (honest):** heavy 9.716 A, sidechain 10.229 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 644
- bin_accuracy: 0.753

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.186929690069915
- ga_delta_rmsd: 0.11217324270004703  ga_fitness_mode: energy
- pre_local_rmsd: 9.186907871634334  localized_anchor_rmsd: 9.186907871634334

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=16 · 3-10(G)=15 · coil(C)=5

```
CEHCEGEEEHEGHHEHHHHHGHHHGEGHGHHHHGHCEHEHGEEHGEHGHHGHGHGHHGHHEGECEC
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=11 · sheet=4
  - A10 ↔ A14  (helix)
  - A14 ↔ A18  (helix)
  - I16 ↔ R20  (helix)
  - A18 ↔ A22  (helix)
  - R20 ↔ G24  (helix)
  - G24 ↔ K28  (helix)
  - K28 ↔ D32  (helix)
  - A40 ↔ G44  (helix)
  - A50 ↔ K54  (helix)
  - A52 ↔ A56  (helix)
  - A56 ↔ A60  (helix)
  - L5 ↔ V15  (sheet)
  - A7 ↔ V15  (sheet)
  - A8 ↔ V15  (sheet)
  - G9 ↔ V15  (sheet)

## Solvent Accessibility (burial)

- buried=23 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=261 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=111 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9374 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
