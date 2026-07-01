# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: oracle
- ca_rmsd: 1.673 A
- tm_score_ca_ordered: 0.49066462003114736
- heavy_atom_rmsd: 3.663 A
- sidechain_heavy_atom_rmsd: 4.808 A
- **all-atom quality (honest):** heavy 3.663 A, sidechain 4.808 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 196
- bin_accuracy: 0.908

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.673167528251616
- ga_delta_rmsd: 1.9192010288919432  ga_fitness_mode: energy
- pre_local_rmsd: 1.6732399625863617  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=12 · 3-10(G)=6 · coil(C)=2

```
CEHHEEGHCEEGHEGHEGEEGHHHEGEE
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=1 · sheet=33
  - G4 ↔ V8  (helix)
  - P2 ↔ S14  (sheet)
  - P2 ↔ I17  (sheet)
  - P2 ↔ C19  (sheet)
  - P2 ↔ S20  (sheet)
  - E5 ↔ I10  (sheet)
  - E5 ↔ P11  (sheet)
  - E5 ↔ S14  (sheet)
  - E5 ↔ I17  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ S14  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ S20  (sheet)
  - S6 ↔ V25  (sheet)
  - I10 ↔ V25  (sheet)
  - P11 ↔ C19  (sheet)
  - P11 ↔ S20  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=97 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=46 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1694 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
