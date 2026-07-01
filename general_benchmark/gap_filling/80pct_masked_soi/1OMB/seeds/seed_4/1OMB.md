# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1OMB\seeds\seed_4\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 0.999 A
- tm_score_ca_ordered: 0.7712389447850613
- heavy_atom_rmsd: 3.191 A
- sidechain_heavy_atom_rmsd: 4.107 A
- **all-atom quality (honest):** heavy 3.191 A, sidechain 4.107 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 205
- bin_accuracy: 0.790

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain_block reason=accepted tested=24
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=4.473558362801004 -> 3.1829759080964672 A
- topology_reconvergence: applied=True accepted=10/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.9992440195605677
- ga_delta_rmsd: -0.44051884546192355  ga_fitness_mode: energy
- pre_local_rmsd: 0.9991892049690361  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=17 · 3-10(G)=5 · coil(C)=7

```
CCECHHEGEGCEEGECHEEEEEEEEEGECEGHC
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=0 · sheet=42
  - E3 ↔ T13  (sheet)
  - E3 ↔ C15  (sheet)
  - E3 ↔ R19  (sheet)
  - K7 ↔ G12  (sheet)
  - K7 ↔ T13  (sheet)
  - K7 ↔ C15  (sheet)
  - K7 ↔ G18  (sheet)
  - K7 ↔ R19  (sheet)
  - K7 ↔ P20  (sheet)
  - K7 ↔ C21  (sheet)
  - K7 ↔ R22  (sheet)
  - K7 ↔ C23  (sheet)
  - K7 ↔ S24  (sheet)
  - T9 ↔ C15  (sheet)
  - T9 ↔ R19  (sheet)
  - T9 ↔ P20  (sheet)
  - T9 ↔ C21  (sheet)
  - T9 ↔ R22  (sheet)
  - T9 ↔ C23  (sheet)
  - T9 ↔ T28  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=112 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=55 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7707 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
