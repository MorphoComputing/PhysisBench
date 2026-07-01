# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1NXB\seeds\seed_1\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 0.979 A
- tm_score_ca_ordered: 0.9020384512673222
- heavy_atom_rmsd: 3.571 A
- sidechain_heavy_atom_rmsd: 4.866 A
- **all-atom quality (honest):** heavy 3.571 A, sidechain 4.866 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1543
- bin_accuracy: 0.901

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9790892792027057
- ga_delta_rmsd: 0.47195696733145986  ga_fitness_mode: energy
- pre_local_rmsd: 1.0042899523989681  localized_anchor_rmsd: 0.9791476115476645

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=30 · 3-10(G)=7 · coil(C)=15

```
CECEHEHGECCEEEGECCHCHEEEGEEEEEHEECGGEEEEECEGGECHECCECECECHHE
```

## Backbone H-bond Network

- total=83 · helix(i→i+4)=0 · sheet=83
  - C2 ↔ T12  (sheet)
  - C2 ↔ T13  (sheet)
  - C2 ↔ K14  (sheet)
  - C2 ↔ C16  (sheet)
  - C2 ↔ S22  (sheet)
  - N4 ↔ Q9  (sheet)
  - N4 ↔ T12  (sheet)
  - N4 ↔ T13  (sheet)
  - N4 ↔ K14  (sheet)
  - N4 ↔ C16  (sheet)
  - N4 ↔ C23  (sheet)
  - N4 ↔ Y24  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ T13  (sheet)
  - H6 ↔ K14  (sheet)
  - H6 ↔ Y24  (sheet)
  - H6 ↔ K26  (sheet)
  - T13 ↔ C23  (sheet)
  - T13 ↔ Y24  (sheet)
  - K14 ↔ S22  (sheet)
  - … +63 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=207 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=129 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9686 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
