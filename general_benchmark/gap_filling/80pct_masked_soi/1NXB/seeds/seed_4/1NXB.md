# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1NXB\seeds\seed_4\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 1.409 A
- tm_score_ca_ordered: 0.841173264039828
- heavy_atom_rmsd: 3.130 A
- sidechain_heavy_atom_rmsd: 4.032 A
- **all-atom quality (honest):** heavy 3.130 A, sidechain 4.032 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 548
- bin_accuracy: 0.874

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.4086411627330786
- ga_delta_rmsd: 1.1997568128167142  ga_fitness_mode: energy
- pre_local_rmsd: 1.4150759492654115  localized_anchor_rmsd: 1.4086398162280294

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=37 · 3-10(G)=8 · coil(C)=7

```
EECCEEGCEGCEEEGEEEHHEEEEEEEEEEHEGGEGEEECEEEHHEEHEGCEGEEECHHE
```

## Backbone H-bond Network

- total=115 · helix(i→i+4)=1 · sheet=114
  - T44 ↔ G48  (helix)
  - I1 ↔ T12  (sheet)
  - I1 ↔ T13  (sheet)
  - I1 ↔ K14  (sheet)
  - I1 ↔ C16  (sheet)
  - I1 ↔ S17  (sheet)
  - I1 ↔ P18  (sheet)
  - I1 ↔ S21  (sheet)
  - C2 ↔ T12  (sheet)
  - C2 ↔ T13  (sheet)
  - C2 ↔ K14  (sheet)
  - C2 ↔ C16  (sheet)
  - C2 ↔ S17  (sheet)
  - C2 ↔ S21  (sheet)
  - C2 ↔ S22  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ T13  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ Y24  (sheet)
  - Q5 ↔ H25  (sheet)
  - … +95 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=217 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=134 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4901 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
