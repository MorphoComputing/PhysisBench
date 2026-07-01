# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1OMB\seeds\seed_8\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 2.343 A
- tm_score_ca_ordered: 0.5016569953001621
- heavy_atom_rmsd: 3.917 A
- sidechain_heavy_atom_rmsd: 4.910 A
- **all-atom quality (honest):** heavy 3.917 A, sidechain 4.910 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 205
- bin_accuracy: 0.639

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=12 rmsd=3.1420609174723078 -> 2.4344301531987713 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.343081396857871
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.343045305418455  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=11 · 3-10(G)=10 · coil(C)=4

```
CEEEHCEGEEHGGGHHHGCEGEGEHEHHGGEGC
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=1 · sheet=14
  - G11 ↔ C15  (helix)
  - A2 ↔ K7  (sheet)
  - A2 ↔ P20  (sheet)
  - E3 ↔ P20  (sheet)
  - D4 ↔ P20  (sheet)
  - K7 ↔ P20  (sheet)
  - K7 ↔ R22  (sheet)
  - K7 ↔ S24  (sheet)
  - T9 ↔ P20  (sheet)
  - T9 ↔ R22  (sheet)
  - W10 ↔ P20  (sheet)
  - P20 ↔ E31  (sheet)
  - R22 ↔ E31  (sheet)
  - S24 ↔ E31  (sheet)
  - I26 ↔ E31  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=113 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=55 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.056 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
