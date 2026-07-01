# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1KTH/sequence/1KTH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1KTH/seeds/seed_1/1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 7.202 A
- tm_score_ca_ordered: 0.27829551824571
- heavy_atom_rmsd: 8.446 A
- sidechain_heavy_atom_rmsd: 9.465 A
- **all-atom quality (honest):** heavy 8.446 A, sidechain 9.465 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 286
- bin_accuracy: 0.741

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.202174032067437
- ga_delta_rmsd: -0.8052354533672146  ga_fitness_mode: energy
- pre_local_rmsd: 7.2021758909166005  localized_anchor_rmsd: 7.2021758909166005

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=24 · 3-10(G)=5 · coil(C)=5

```
EEHHHGEEEHEHEEHHCCEEEECHHGHEEEEGEHHEECEEHHEHHEHHHGHHCHGE
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=5 · sheet=56
  - T12 ↔ F16  (helix)
  - E41 ↔ G45  (helix)
  - G45 ↔ E49  (helix)
  - Q47 ↔ E51  (helix)
  - K48 ↔ K52  (helix)
  - D2 ↔ P7  (sheet)
  - D2 ↔ Y21  (sheet)
  - D2 ↔ Y22  (sheet)
  - P7 ↔ K19  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - P7 ↔ Y22  (sheet)
  - K8 ↔ K19  (sheet)
  - K8 ↔ W20  (sheet)
  - K8 ↔ Y21  (sheet)
  - K8 ↔ Y22  (sheet)
  - D9 ↔ R14  (sheet)
  - D9 ↔ K19  (sheet)
  - D9 ↔ W20  (sheet)
  - D9 ↔ Y21  (sheet)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=246 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=154 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7489 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
