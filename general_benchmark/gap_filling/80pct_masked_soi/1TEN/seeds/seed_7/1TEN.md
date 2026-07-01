# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TEN\seeds\seed_7\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 7.383 A
- tm_score_ca_ordered: 0.3064990851107977
- heavy_atom_rmsd: 8.389 A
- sidechain_heavy_atom_rmsd: 9.388 A
- **all-atom quality (honest):** heavy 8.389 A, sidechain 9.388 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 45
- distogram_pairs: 1074
- bin_accuracy: 0.538

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.382668969864065
- ga_delta_rmsd: 0.3760760812288293  ga_fitness_mode: energy
- pre_local_rmsd: 7.400018077416743  localized_anchor_rmsd: 7.382627484425411

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D48-N54 → 89 conflicts (54%); E85-T86 → 30 conflicts (18%); I37-V40 → 16 conflicts (10%)
- explained: 135/164 conflicts by 3 root cause(s)
- metrics: hubs=45 (frac 0.511), conflicts/hub=3.6, max_incompat=7.64Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D48-N54 + E85-T86 + I37-V40 — explain ~135/164 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T13** — severity 33.58, 18 conflict(s); suspect input ~`E53` (group: pull_in)
  - pull-in (wants closer): G76@27.5Å(now 33.2,conf 1.00), L1@27.5Å(now 32.4,conf 1.00)
  - push-out (wants farther): E51@27.3Å(now 24.3,conf 0.91), T50@26.3Å(now 22.8,conf 0.74), E53@22.0Å(now 19.1,conf 0.63)
  - E51↔K10: targets 27.3/7.1Å but partners are 16.8Å apart → too_close_together by 3.4Å
  - L18↔E51: targets 9.0/27.3Å but partners are 15.5Å apart → too_close_together by 2.8Å
  - L18↔T50: targets 9.0/26.3Å but partners are 13.9Å apart → too_close_together by 3.3Å
- **V40** — severity 28.62, 14 conflict(s); suspect input ~`N54` (group: pull_in)
  - pull-in (wants closer): Y35@10.9Å(now 13.7,conf 0.91)
  - push-out (wants farther): N54@27.1Å(now 22.0,conf 0.86), I58@17.8Å(now 14.6,conf 0.55), K62@12.7Å(now 7.3,conf 0.55)
  - Y35↔I47: targets 10.9/18.9Å but partners are 3.7Å apart → too_close_together by 4.3Å
  - Y35↔N54: targets 10.9/27.1Å but partners are 12.6Å apart → too_close_together by 3.6Å
  - I37↔N54: targets 5.1/27.1Å but partners are 18.8Å apart → too_close_together by 3.1Å
- **K38** — severity 15.44, 8 conflict(s); suspect input ~`G59` (group: push_out)
  - push-out (wants farther): R44@9.0Å(now 5.3,conf 0.99), D52@27.4Å(now 23.0,conf 0.95), D43@8.6Å(now 5.4,conf 0.79), P41@8.0Å(now 5.5,conf 0.72), T45@12.0Å(now 9.4,conf 0.72), G59@16.2Å(now 8.3,conf 0.55), E85@10.0Å(now 6.6,conf 0.55)
  - Y67↔G59: targets 4.8/16.2Å but partners are 3.8Å apart → too_close_together by 7.6Å
  - E68↔G59: targets 5.0/16.2Å but partners are 6.4Å apart → too_close_together by 4.8Å
  - D52↔Y35: targets 27.4/8.9Å but partners are 16.4Å apart → too_close_together by 2.1Å
- **P41** — severity 14.27, 7 conflict(s); suspect input ~`N60` (group: push_out)
  - push-out (wants farther): D48@21.0Å(now 16.4,conf 0.99), K38@8.0Å(now 5.5,conf 0.72), N60@18.6Å(now 10.5,conf 0.55)
  - I37↔N60: targets 8.0/18.6Å but partners are 3.9Å apart → too_close_together by 6.7Å
  - N60↔G36: targets 18.6/8.3Å but partners are 5.9Å apart → too_close_together by 4.4Å
  - K38↔N60: targets 8.0/18.6Å but partners are 7.0Å apart → too_close_together by 3.6Å
- **D52** — severity 12.44, 6 conflict(s); suspect input ~`K38` (group: push_out)
  - push-out (wants farther): K38@27.4Å(now 23.0,conf 0.95), T15@26.4Å(now 23.3,conf 0.76), A83@18.6Å(now 15.6,conf 0.55), L18@16.5Å(now 13.4,conf 0.55), A3@14.8Å(now 11.4,conf 0.55), L71@14.7Å(now 12.2,conf 0.55), W21@11.5Å(now 4.6,conf 0.55), F22@10.5Å(now 3.8,conf 0.55), T20@12.4Å(now 7.6,conf 0.55), P4@12.3Å(now 7.3,conf 0.55)
  - Q55↔K38: targets 9.0/27.4Å but partners are 14.1Å apart → too_close_together by 4.3Å
  - K38↔Y56: targets 27.4/11.4Å but partners are 13.4Å apart → too_close_together by 2.6Å
  - Y56↔T15: targets 11.4/26.4Å but partners are 12.4Å apart → too_close_together by 2.5Å
- **E51** — severity 11.88, 8 conflict(s); suspect input ~`I7` (group: pull_in)
  - pull-in (wants closer): D29@5.6Å(now 9.3,conf 0.56)
  - push-out (wants farther): E66@27.4Å(now 24.2,conf 0.97), T13@27.3Å(now 24.3,conf 0.91), R44@21.6Å(now 18.7,conf 0.79), K84@18.7Å(now 16.0,conf 0.56), Y35@18.6Å(now 14.5,conf 0.55), L25@11.2Å(now 7.8,conf 0.55), I7@15.3Å(now 8.5,conf 0.55), I72@11.6Å(now 7.9,conf 0.55)
  - N54↔I7: targets 7.0/15.3Å but partners are 3.4Å apart → too_close_together by 4.9Å
  - T13↔Y56: targets 27.3/12.0Å but partners are 12.8Å apart → too_close_together by 2.5Å
  - I47↔Y35: targets 12.0/18.6Å but partners are 3.7Å apart → too_close_together by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=32 · 3-10(G)=10 · coil(C)=10

```
CEHEECGGHECCEHHEEECEECEEHHEGHEHHHEEECHHHEHGHHEHHHHHHGHEGHHEHHHHHHHEECEEGCEHEHGGCEEHEHEGE
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=13 · sheet=45
  - L25 ↔ D29  (helix)
  - D29 ↔ L33  (helix)
  - K38 ↔ G42  (helix)
  - V40 ↔ R44  (helix)
  - R44 ↔ D48  (helix)
  - I47 ↔ E51  (helix)
  - D48 ↔ D52  (helix)
  - T50 ↔ N54  (helix)
  - N54 ↔ I58  (helix)
  - S57 ↔ L61  (helix)
  - I58 ↔ K62  (helix)
  - N60 ↔ D64  (helix)
  - K62 ↔ E66  (helix)
  - P4 ↔ T20  (sheet)
  - P4 ↔ W21  (sheet)
  - P4 ↔ K23  (sheet)
  - P4 ↔ P24  (sheet)
  - S5 ↔ T20  (sheet)
  - S5 ↔ W21  (sheet)
  - S5 ↔ K23  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=38 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=510 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=387 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.5561 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=45 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
