# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1YCC\seeds\seed_0\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 0.676 A
- tm_score_ca_ordered: 0.9720231325434873
- heavy_atom_rmsd: 3.167 A
- sidechain_heavy_atom_rmsd: 4.164 A
- **all-atom quality (honest):** heavy 3.167 A, sidechain 4.164 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 3302
- bin_accuracy: 0.892

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.6758485358395757
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.6819593471142854  localized_anchor_rmsd: 0.6758432997069775

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=48 · strand(E)=30 · 3-10(G)=14 · coil(C)=11

```
EEECECGHHHHHHHHGEHHHEEEGECHEECEHEECGCHHCHEEHHHEHHEGEECHHHGGGEGGEHGHHHHHHHEEECHEHEGEHECGEHHHHHHHHHHHHGHC
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=21 · sheet=53
  - K8 ↔ T12  (helix)
  - K9 ↔ L13  (helix)
  - G10 ↔ F14  (helix)
  - A11 ↔ K15  (helix)
  - K15 ↔ L19  (helix)
  - G41 ↔ G45  (helix)
  - G45 ↔ G49  (helix)
  - E65 ↔ S69  (helix)
  - N67 ↔ Y71  (helix)
  - M68 ↔ L72  (helix)
  - S69 ↔ T73  (helix)
  - K80 ↔ G84  (helix)
  - E89 ↔ N93  (helix)
  - K90 ↔ D94  (helix)
  - D91 ↔ L95  (helix)
  - R92 ↔ I96  (helix)
  - N93 ↔ T97  (helix)
  - D94 ↔ Y98  (helix)
  - L95 ↔ L99  (helix)
  - I96 ↔ K100  (helix)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=44 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=371 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=163 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0172 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
