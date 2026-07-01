# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1SHG\seeds\seed_1\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 0.046 A
- tm_score_ca_ordered: 0.9996422337903398
- heavy_atom_rmsd: 2.810 A
- sidechain_heavy_atom_rmsd: 3.605 A
- **all-atom quality (honest):** heavy 2.810 A, sidechain 3.605 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 689
- bin_accuracy: 0.987

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.04623213278420997
- ga_delta_rmsd: 0.008675410790539462  ga_fitness_mode: energy
- pre_local_rmsd: 0.04679693320248202  localized_anchor_rmsd: 0.046181786031740106

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=24 · 3-10(G)=13 · coil(C)=10

```
EEGECGECGGCEEGHEECEECHEGGGGEEHHEGEEEGECGHGEEECECHHHEECC
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=0 · sheet=50
  - L4 ↔ M19  (sheet)
  - L4 ↔ K20  (sheet)
  - L4 ↔ D23  (sheet)
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - K12 ↔ V17  (sheet)
  - K12 ↔ M19  (sheet)
  - E16 ↔ W35  (sheet)
  - E16 ↔ W36  (sheet)
  - V17 ↔ D23  (sheet)
  - V17 ↔ W35  (sheet)
  - V17 ↔ W36  (sheet)
  - M19 ↔ W36  (sheet)
  - M19 ↔ V38  (sheet)
  - D23 ↔ V38  (sheet)
  - L28 ↔ W35  (sheet)
  - L28 ↔ W36  (sheet)
  - L28 ↔ V38  (sheet)
  - L28 ↔ R43  (sheet)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=202 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=124 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6933 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
