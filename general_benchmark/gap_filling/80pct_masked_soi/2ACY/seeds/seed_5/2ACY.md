# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2ACY\seeds\seed_5\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 10.840 A
- tm_score_ca_ordered: 0.23188051742116514
- heavy_atom_rmsd: 12.084 A
- sidechain_heavy_atom_rmsd: 13.165 A
- **all-atom quality (honest):** heavy 12.084 A, sidechain 13.165 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 1236
- bin_accuracy: 0.845

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.840390541758522
- ga_delta_rmsd: -1.5304350119468264  ga_fitness_mode: energy
- pre_local_rmsd: 10.848151482161345  localized_anchor_rmsd: 10.840393096866809

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=39 · 3-10(G)=13 · coil(C)=15

```
EEEEEGEGCEECEEGEEHGHGHGHHGHHGHHHGCEEEEECEHCECEEEECEECHHGHHHHHHHHHECGCHCECEGECEEEEEEHGHECHEHEHEHC
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=14 · sheet=33
  - G18 ↔ R22  (helix)
  - F20 ↔ Y24  (helix)
  - Y24 ↔ E28  (helix)
  - A27 ↔ K31  (helix)
  - E28 ↔ L32  (helix)
  - A54 ↔ R58  (helix)
  - S55 ↔ H59  (helix)
  - V57 ↔ Q61  (helix)
  - R58 ↔ E62  (helix)
  - H59 ↔ W63  (helix)
  - M60 ↔ L64  (helix)
  - Q61 ↔ E65  (helix)
  - D89 ↔ F93  (helix)
  - T91 ↔ I95  (helix)
  - E1 ↔ S7  (sheet)
  - E11 ↔ V16  (sheet)
  - V35 ↔ G48  (sheet)
  - V35 ↔ Q49  (sheet)
  - V35 ↔ Q51  (sheet)
  - V35 ↔ G52  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=44 · exposed=29 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=401 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=228 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4898 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
