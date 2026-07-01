# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1MSI\seeds\seed_0\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 0.571 A
- tm_score_ca_ordered: 0.9772541684060572
- heavy_atom_rmsd: 2.554 A
- sidechain_heavy_atom_rmsd: 3.328 A
- **all-atom quality (honest):** heavy 2.554 A, sidechain 3.328 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1770
- bin_accuracy: 0.940

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=0.672197692812864 -> 0.6116932704996021 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5707893824318789
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5731722557527559  localized_anchor_rmsd: 0.5708297874260476

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=17 · 3-10(G)=14 · coil(C)=11

```
CEGECGCHECGEGHEGGGHHHCECEGEEGCECCHHHHHHHHHEEGHECGEGHEGGEHHHEHHHC
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=7 · sheet=12
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - D36 ↔ L40  (helix)
  - P38 ↔ S42  (helix)
  - S42 ↔ N46  (helix)
  - D58 ↔ G62  (helix)
  - M59 ↔ Y63  (helix)
  - S4 ↔ R23  (sheet)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ R23  (sheet)
  - R23 ↔ G31  (sheet)
  - E25 ↔ G31  (sheet)
  - M43 ↔ V60  (sheet)
  - Q44 ↔ M56  (sheet)
  - Q44 ↔ V60  (sheet)
  - R47 ↔ T53  (sheet)
  - R47 ↔ M56  (sheet)
  - R47 ↔ V60  (sheet)
  - P50 ↔ M56  (sheet)

## Solvent Accessibility (burial)

- buried=22 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=244 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=143 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1288 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
