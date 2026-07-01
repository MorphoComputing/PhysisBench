# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1NXB\seeds\seed_5\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 6.444 A
- tm_score_ca_ordered: 0.3585217150407413
- heavy_atom_rmsd: 7.453 A
- sidechain_heavy_atom_rmsd: 8.312 A
- **all-atom quality (honest):** heavy 7.453 A, sidechain 8.312 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.017
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 546
- bin_accuracy: 0.771

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.444395816141494
- ga_delta_rmsd: -3.1789612340752833  ga_fitness_mode: energy
- pre_local_rmsd: 6.4444472286748935  localized_anchor_rmsd: 6.444423366515532

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=31 · 3-10(G)=9 · coil(C)=10

```
CEEEEEHGEHEGCEHCCEGGHECEEEEEEEGGHHECEEECECEHHEGHCCEEEGEEEHGE
```

## Backbone H-bond Network

- total=89 · helix(i→i+4)=1 · sheet=88
  - T44 ↔ G48  (helix)
  - C2 ↔ Q11  (sheet)
  - C2 ↔ K14  (sheet)
  - C2 ↔ P18  (sheet)
  - C2 ↔ S22  (sheet)
  - F3 ↔ Q9  (sheet)
  - F3 ↔ Q11  (sheet)
  - F3 ↔ K14  (sheet)
  - F3 ↔ S22  (sheet)
  - N4 ↔ Q9  (sheet)
  - N4 ↔ Q11  (sheet)
  - N4 ↔ K14  (sheet)
  - N4 ↔ S22  (sheet)
  - N4 ↔ Y24  (sheet)
  - Q5 ↔ Q11  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ Y24  (sheet)
  - Q5 ↔ H25  (sheet)
  - H6 ↔ Q11  (sheet)
  - H6 ↔ K14  (sheet)
  - … +69 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=218 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=133 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5872 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0167

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
