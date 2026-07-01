# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1NXB\seeds\seed_1\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 1.530 A
- tm_score_ca_ordered: 0.8401106444226696
- heavy_atom_rmsd: 3.663 A
- sidechain_heavy_atom_rmsd: 4.779 A
- **all-atom quality (honest):** heavy 3.663 A, sidechain 4.779 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.017
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 826
- bin_accuracy: 0.898

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.530224429368442
- ga_delta_rmsd: 0.2902569385440783  ga_fitness_mode: energy
- pre_local_rmsd: 1.533321198581497  localized_anchor_rmsd: 1.530212027511668

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=27 · 3-10(G)=11 · coil(C)=11

```
CEGHEEHEECCEEECEECHHHEGEGGGEGEHEEEEGGEECECGHGEHHEGCECECEEHHC
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=1 · sheet=46
  - T44 ↔ G48  (helix)
  - C2 ↔ T12  (sheet)
  - C2 ↔ T13  (sheet)
  - C2 ↔ K14  (sheet)
  - C2 ↔ C16  (sheet)
  - C2 ↔ S17  (sheet)
  - C2 ↔ S22  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ T13  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ Y24  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ T13  (sheet)
  - H6 ↔ Y24  (sheet)
  - S8 ↔ T13  (sheet)
  - T13 ↔ Y24  (sheet)
  - K14 ↔ S22  (sheet)
  - K14 ↔ Y24  (sheet)
  - C16 ↔ S22  (sheet)
  - C16 ↔ Y24  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=212 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=131 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6228 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0167

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
