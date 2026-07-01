# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1UBQ\seeds\seed_1\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 1.679 A
- tm_score_ca_ordered: 0.883392907987486
- heavy_atom_rmsd: 3.360 A
- sidechain_heavy_atom_rmsd: 4.101 A
- **all-atom quality (honest):** heavy 3.360 A, sidechain 4.101 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 2556
- bin_accuracy: 0.904

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=1.7037225770233844 -> 1.3550267846147364 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.6785467828326333
- ga_delta_rmsd: -0.34846516607474265  ga_fitness_mode: energy
- pre_local_rmsd: 1.6835725726423203  localized_anchor_rmsd: 1.6785761187759787

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=25 · 3-10(G)=17 · coil(C)=9

```
EEGGGEHGHECGCEGEEHHEEHHHHHHHHHHHGHEEGHHEGCEGHHEGGEGGEEHHHECEECGEEGCCEGCECE
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=10 · sheet=24
  - P18 ↔ I22  (helix)
  - S19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - V25 ↔ I29  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - Q30 ↔ G34  (helix)
  - G34 ↔ D38  (helix)
  - Q1 ↔ L14  (sheet)
  - Q1 ↔ V16  (sheet)
  - Q1 ↔ E17  (sheet)
  - Q1 ↔ D20  (sheet)
  - I2 ↔ L14  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ E17  (sheet)
  - I2 ↔ D20  (sheet)
  - L14 ↔ D20  (sheet)
  - V16 ↔ T21  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=37 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=247 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=113 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0993 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
