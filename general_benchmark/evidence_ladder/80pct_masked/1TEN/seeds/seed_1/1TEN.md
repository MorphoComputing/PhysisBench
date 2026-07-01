# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1TEN/sequence/1TEN.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1TEN/seeds/seed_1/1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 2.634 A
- tm_score_ca_ordered: 0.7536280492299933
- heavy_atom_rmsd: 3.949 A
- sidechain_heavy_atom_rmsd: 4.849 A
- **all-atom quality (honest):** heavy 3.949 A, sidechain 4.849 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.011
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 17
- distogram_pairs: 731
- bin_accuracy: 0.644

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=3.5762256020684866 -> 2.9996806403569387 A
- topology_reconvergence: applied=True accepted=4/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.6338111645773488
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.646213660370201  localized_anchor_rmsd: 2.6337675796153195

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** N60-K62 → 9 conflicts (56%)
- explained: 9/16 conflicts by 1 root cause(s)
- metrics: hubs=13 (frac 0.148), conflicts/hub=1.2, max_incompat=3.09Å, chain_span=0.898
- **fix-first:** [LOW_CONFLICT] Root cause(s): N60-K62 — explain ~9/16 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V9** — severity 3.26, 2 conflict(s); suspect input ~`N60` (group: push_out)
  - push-out (wants farther): G59@13.1Å(now 9.4,conf 0.55), N60@15.7Å(now 10.7,conf 0.55)
  - A17↔N60: targets 6.7/15.7Å but partners are 5.9Å apart → too_close_together by 3.1Å
  - A17↔G59: targets 6.7/13.1Å but partners are 3.5Å apart → too_close_together by 2.9Å
- **A83** — severity 2.13, 2 conflict(s); suspect input ~`V69` (group: push_out)
  - push-out (wants farther): K62@22.6Å(now 19.9,conf 0.69)
  - K62↔V69: targets 22.6/8.4Å but partners are 12.2Å apart → too_close_together by 2.0Å
  - K62↔Y67: targets 22.6/14.2Å but partners are 6.5Å apart → too_close_together by 1.9Å
- **L61** — severity 2.01, 2 conflict(s); suspect input ~`D39` (group: pull_in)
  - pull-in (wants closer): M78@27.5Å(now 30.1,conf 1.00)
  - push-out (wants farther): E8@17.4Å(now 13.3,conf 0.55), I37@8.9Å(now 5.4,conf 0.55), D39@14.5Å(now 8.7,conf 0.55), K38@12.2Å(now 8.7,conf 0.55)
  - I37↔D39: targets 8.9/14.5Å but partners are 3.5Å apart → too_close_together by 2.0Å
  - M78↔T15: targets 27.5/4.5Å but partners are 33.5Å apart → too_far_apart by 1.5Å
- **E68** — severity 1.40, 1 conflict(s); suspect input ~`N60` (group: push_out)
  - push-out (wants farther): N60@14.9Å(now 11.7,conf 0.55), Y56@14.2Å(now 10.7,conf 0.55), I47@13.9Å(now 10.2,conf 0.55)
  - I37↔N60: targets 6.2/14.9Å but partners are 6.1Å apart → too_close_together by 2.6Å
- **T15** — severity 1.37, 1 conflict(s); suspect input ~`I37` (group: push_out)
  - pull-in (wants closer): D29@27.5Å(now 30.3,conf 1.00)
  - push-out (wants farther): I37@12.4Å(now 9.6,conf 0.55)
  - L61↔I37: targets 4.5/12.4Å but partners are 5.4Å apart → too_close_together by 2.5Å
- **I72** — severity 1.22, 1 conflict(s); suspect input ~`S57` (group: push_out)
  - push-out (wants farther): S57@17.2Å(now 14.7,conf 0.55)
  - L33↔S57: targets 6.8/17.2Å but partners are 8.2Å apart → too_close_together by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=35 · 3-10(G)=20 · coil(C)=9

```
CEECEHCEHEHCEHEEEEGGEEEEHEGGHEEGGGEGHGHHHHGEEEGEHHHHCECEHHEEGHHGGGGHHECEGGHEHHEGCECEGEEE
```

## Backbone H-bond Network

- total=60 · helix(i→i+4)=3 · sheet=57
  - L25 ↔ D29  (helix)
  - I37 ↔ P41  (helix)
  - I58 ↔ K62  (helix)
  - D2 ↔ F22  (sheet)
  - A3 ↔ W21  (sheet)
  - A3 ↔ F22  (sheet)
  - A3 ↔ K23  (sheet)
  - S5 ↔ W21  (sheet)
  - S5 ↔ F22  (sheet)
  - S5 ↔ K23  (sheet)
  - S5 ↔ P24  (sheet)
  - E8 ↔ T13  (sheet)
  - E8 ↔ T16  (sheet)
  - E8 ↔ A17  (sheet)
  - E8 ↔ L18  (sheet)
  - E8 ↔ W21  (sheet)
  - E8 ↔ F22  (sheet)
  - K10 ↔ T15  (sheet)
  - K10 ↔ T16  (sheet)
  - K10 ↔ A17  (sheet)
  - … +40 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=38 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=416 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=279 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8779 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=17 (steric clashes)
- ramachandran_forbidden_fraction=0.0114

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
