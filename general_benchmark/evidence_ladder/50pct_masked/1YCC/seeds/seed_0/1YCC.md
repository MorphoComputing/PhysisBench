# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1YCC\seeds\seed_0\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 0.364 A
- tm_score_ca_ordered: 0.9912263639698927
- heavy_atom_rmsd: 3.074 A
- sidechain_heavy_atom_rmsd: 4.111 A
- **all-atom quality (honest):** heavy 3.074 A, sidechain 4.111 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 1641
- bin_accuracy: 0.918

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.3641596350046857
- ga_delta_rmsd: 0.09702789538639478  ga_fitness_mode: energy
- pre_local_rmsd: 0.37174387882275967  localized_anchor_rmsd: 0.36411459260663603

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=30 · 3-10(G)=20 · coil(C)=13

```
EEECECGGHHHHHHHGEHHHCEEGEGHEECEHEECGEHHCGEEEGCECHECEEHHHHGEGGGGEHGHHHHHHHCEEGCEHEGEGECGEGHHHHGHHHHHHHHC
```

## Backbone H-bond Network

- total=71 · helix(i→i+4)=14 · sheet=57
  - K9 ↔ L13  (helix)
  - G10 ↔ F14  (helix)
  - A11 ↔ K15  (helix)
  - K15 ↔ L19  (helix)
  - E65 ↔ S69  (helix)
  - N67 ↔ Y71  (helix)
  - M68 ↔ L72  (helix)
  - S69 ↔ T73  (helix)
  - D91 ↔ L95  (helix)
  - R92 ↔ I96  (helix)
  - N93 ↔ T97  (helix)
  - L95 ↔ L99  (helix)
  - I96 ↔ K100  (helix)
  - Y98 ↔ A102  (helix)
  - R17 ↔ H22  (sheet)
  - R17 ↔ T23  (sheet)
  - H22 ↔ G28  (sheet)
  - H22 ↔ P29  (sheet)
  - H22 ↔ K31  (sheet)
  - H22 ↔ G33  (sheet)
  - … +51 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=39 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=361 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=148 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6324 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
