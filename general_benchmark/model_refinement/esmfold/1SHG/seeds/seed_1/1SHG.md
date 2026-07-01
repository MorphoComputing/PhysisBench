# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1SHG\seeds\seed_1\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 0.301 A
- tm_score_ca_ordered: 0.9861069304739505
- heavy_atom_rmsd: 2.969 A
- sidechain_heavy_atom_rmsd: 3.864 A
- **all-atom quality (honest):** heavy 2.969 A, sidechain 3.864 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1378
- bin_accuracy: 0.950

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=0.3109050402364694 -> 0.30981760721202956 A
- topology_reconvergence: applied=True accepted=6/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.30143570190439634
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.309417911257211  localized_anchor_rmsd: 0.30139770405204414

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=21 · 3-10(G)=12 · coil(C)=13

```
EEGGGGECEECGEHHEGEEECHEGGCCHCCHEGEEEGECGCHEGECECHHHEECC
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=0 · sheet=39
  - Y7 ↔ T18  (sheet)
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ T18  (sheet)
  - Y9 ↔ M19  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ D23  (sheet)
  - Q10 ↔ E16  (sheet)
  - Q10 ↔ T18  (sheet)
  - Q10 ↔ M19  (sheet)
  - Q10 ↔ K20  (sheet)
  - S13 ↔ T18  (sheet)
  - E16 ↔ W35  (sheet)
  - E16 ↔ W36  (sheet)
  - T18 ↔ D23  (sheet)
  - T18 ↔ V38  (sheet)
  - M19 ↔ V38  (sheet)
  - D23 ↔ V38  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=201 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=121 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1402 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
