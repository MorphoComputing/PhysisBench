# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HVZ\sequence\1HVZ.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1HVZ\seeds\seed_1\1HVZ.pdb`
- residues: 16
- mode: oracle
- ca_rmsd: 3.179 A
- tm_score_ca_ordered: 0.16623865912408345
- heavy_atom_rmsd: 5.465 A
- sidechain_heavy_atom_rmsd: 6.835 A
- **all-atom quality (honest):** heavy 5.465 A, sidechain 6.835 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/15 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 46
- bin_accuracy: 0.739

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=12
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.1788797724959825
- ga_delta_rmsd: 0.33000396826601497  ga_fitness_mode: energy
- pre_local_rmsd: 3.1789234765374093  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=6 · 3-10(G)=2 · coil(C)=1

```
CEEHHEEHHGGHHHEE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=4 · sheet=4
  - C4 ↔ R8  (helix)
  - L5 ↔ G9  (helix)
  - R8 ↔ R12  (helix)
  - G9 ↔ C13  (helix)
  - C2 ↔ C15  (sheet)
  - C2 ↔ T16  (sheet)
  - R3 ↔ C15  (sheet)
  - R3 ↔ T16  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=44 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=22 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7556 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C15, C4–C13, C6–C11

## Side-chain Rotamers (χ1/χ2)

- 15 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
