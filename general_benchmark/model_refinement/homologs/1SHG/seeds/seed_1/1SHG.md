# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\1SHG\seeds\seed_1\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 0.607 A
- tm_score_ca_ordered: 0.950029336272894
- heavy_atom_rmsd: 2.718 A
- sidechain_heavy_atom_rmsd: 3.452 A
- **all-atom quality (honest):** heavy 2.718 A, sidechain 3.452 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1328
- bin_accuracy: 0.931

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.6070000677414628
- ga_delta_rmsd: 0.02318736970053359  ga_fitness_mode: energy
- pre_local_rmsd: 0.6147210571962722  localized_anchor_rmsd: 0.6069910525443987

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=6 · strand(E)=28 · 3-10(G)=11 · coil(C)=10

```
EEGEGGECEECEEGHEEGEECGEGECCCEHHEGEEEGEEEGEEEECECHHHEGCC
```

## Backbone H-bond Network

- total=73 · helix(i→i+4)=0 · sheet=73
  - L4 ↔ Y9  (sheet)
  - L4 ↔ M19  (sheet)
  - L4 ↔ K20  (sheet)
  - L4 ↔ D23  (sheet)
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ V17  (sheet)
  - Y9 ↔ M19  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ D23  (sheet)
  - Q10 ↔ E16  (sheet)
  - Q10 ↔ V17  (sheet)
  - Q10 ↔ M19  (sheet)
  - Q10 ↔ K20  (sheet)
  - K12 ↔ V17  (sheet)
  - K12 ↔ M19  (sheet)
  - E16 ↔ W35  (sheet)
  - E16 ↔ W36  (sheet)
  - … +53 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=197 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=118 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1679 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
