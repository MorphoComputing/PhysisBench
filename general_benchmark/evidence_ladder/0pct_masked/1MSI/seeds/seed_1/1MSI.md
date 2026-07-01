# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1MSI/sequence/1MSI.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1MSI/seeds/seed_1/1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 0.081 A
- tm_score_ca_ordered: 0.9991181206037973
- heavy_atom_rmsd: 2.547 A
- sidechain_heavy_atom_rmsd: 3.441 A
- **all-atom quality (honest):** heavy 2.547 A, sidechain 3.441 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1891
- bin_accuracy: 0.969

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.08138589853780304
- ga_delta_rmsd: 0.04891945645776519  ga_fitness_mode: energy
- pre_local_rmsd: 0.08530960137377772  localized_anchor_rmsd: 0.08140509908268882

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=20 · 3-10(G)=18 · coil(C)=8

```
CEEECGGHEGGEGHECEEGHHCEEEGEEGGGCCHHHHHHHHHEEGGECGEGHEGGGHHHEGHEC
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=5 · sheet=18
  - A34 ↔ P38  (helix)
  - E35 ↔ R39  (helix)
  - D36 ↔ L40  (helix)
  - P38 ↔ S42  (helix)
  - D58 ↔ G62  (helix)
  - A3 ↔ R23  (sheet)
  - S4 ↔ R23  (sheet)
  - S4 ↔ S24  (sheet)
  - Q9 ↔ T15  (sheet)
  - Q9 ↔ L17  (sheet)
  - Q9 ↔ T18  (sheet)
  - Q9 ↔ R23  (sheet)
  - Q9 ↔ S24  (sheet)
  - P12 ↔ L17  (sheet)
  - P12 ↔ T18  (sheet)
  - L17 ↔ R23  (sheet)
  - T18 ↔ R23  (sheet)
  - M43 ↔ V60  (sheet)
  - M43 ↔ Y63  (sheet)
  - Q44 ↔ V60  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=239 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=140 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6766 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
