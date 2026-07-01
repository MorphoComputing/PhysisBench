# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TEN\seeds\seed_2\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 6.224 A
- tm_score_ca_ordered: 0.39501822907005124
- heavy_atom_rmsd: 7.169 A
- sidechain_heavy_atom_rmsd: 8.047 A
- **all-atom quality (honest):** heavy 7.169 A, sidechain 8.047 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 23
- distogram_pairs: 1073
- bin_accuracy: 0.470

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.223918527344956
- ga_delta_rmsd: -0.254660412442532  ga_fitness_mode: energy
- pre_local_rmsd: 6.329382247982461  localized_anchor_rmsd: 6.223936940623541

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** A83-T88 → 151 conflicts (38%); L61-V69 → 108 conflicts (27%); K38-V40 → 47 conflicts (12%)
- explained: 306/400 conflicts by 3 root cause(s)
- metrics: hubs=72 (frac 0.818), conflicts/hub=5.6, max_incompat=9.6Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): A83-T88 + L61-V69 + K38-V40 — explain ~306/400 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V40** — severity 53.39, 24 conflict(s); suspect input ~`I58` (group: push_out)
  - push-out (wants farther): E51@27.5Å(now 23.7,conf 0.99), T50@27.4Å(now 22.8,conf 0.95), T45@12.9Å(now 9.3,conf 0.91), I47@18.9Å(now 16.3,conf 0.91), N54@27.1Å(now 20.4,conf 0.86), D43@6.0Å(now 2.6,conf 0.72), V12@20.0Å(now 15.3,conf 0.58), D14@18.4Å(now 12.7,conf 0.55), I58@17.8Å(now 9.7,conf 0.55), P63@15.1Å(now 7.5,conf 0.55), K62@12.7Å(now 3.8,conf 0.55)
  - N54↔I37: targets 27.1/5.4Å but partners are 15.7Å apart → too_close_together by 6.0Å
  - I37↔I58: targets 5.4/17.8Å but partners are 3.9Å apart → too_close_together by 8.4Å
  - G36↔N54: targets 7.1/27.1Å but partners are 15.6Å apart → too_close_together by 4.4Å
- **M78** — severity 39.97, 16 conflict(s); suspect input ~`F87` (group: push_out)
  - push-out (wants farther): K84@19.0Å(now 12.9,conf 0.99), E85@21.0Å(now 16.1,conf 0.99), F87@27.4Å(now 17.2,conf 0.97), A83@15.1Å(now 10.7,conf 0.91), R74@6.6Å(now 3.6,conf 0.79), N81@10.6Å(now 7.0,conf 0.79), P82@12.6Å(now 6.7,conf 0.79), L49@15.5Å(now 12.8,conf 0.55)
  - I72↔F87: targets 9.0/27.4Å but partners are 12.5Å apart → too_close_together by 5.9Å
  - F87↔R74: targets 27.4/6.6Å but partners are 14.7Å apart → too_close_together by 6.1Å
  - K84↔F87: targets 19.0/27.4Å but partners are 4.8Å apart → too_close_together by 3.6Å
- **D52** — severity 36.86, 10 conflict(s); suspect input ~`K38` (group: pull_in)
  - pull-in (wants closer): E32@12.7Å(now 15.7,conf 0.55), F22@10.5Å(now 13.9,conf 0.55)
  - push-out (wants farther): K38@27.4Å(now 17.1,conf 0.95), K84@20.3Å(now 13.2,conf 0.59), P82@18.8Å(now 11.6,conf 0.56), A83@18.6Å(now 7.5,conf 0.55), A3@14.8Å(now 10.2,conf 0.55), L71@14.7Å(now 9.9,conf 0.55), P4@12.3Å(now 8.8,conf 0.55)
  - S57↔K38: targets 15.0/27.4Å but partners are 3.5Å apart → too_close_together by 8.9Å
  - K38↔Y56: targets 27.4/11.1Å but partners are 7.8Å apart → too_close_together by 8.5Å
  - K38↔Q55: targets 27.4/9.1Å but partners are 10.5Å apart → too_close_together by 7.8Å
- **P63** — severity 31.03, 17 conflict(s); suspect input ~`T88` (group: pull_in)
  - pull-in (wants closer): S79@27.5Å(now 30.6,conf 1.00), K23@27.5Å(now 32.3,conf 1.00), T20@20.7Å(now 25.4,conf 0.59), E8@19.4Å(now 22.8,conf 0.57), T86@14.6Å(now 17.6,conf 0.55), T88@8.3Å(now 12.7,conf 0.55), T13@8.2Å(now 16.7,conf 0.55)
  - push-out (wants farther): G59@11.0Å(now 8.0,conf 0.99), E53@27.1Å(now 22.9,conf 0.87), S57@16.0Å(now 11.8,conf 0.72), N54@25.0Å(now 22.5,conf 0.69), Q55@21.4Å(now 18.7,conf 0.61), Y56@18.9Å(now 16.2,conf 0.56), V40@15.1Å(now 7.5,conf 0.55)
  - E66↔T13: targets 8.9/8.2Å but partners are 22.9Å apart → too_far_apart by 5.9Å
  - E53↔T88: targets 27.1/8.3Å but partners are 13.0Å apart → too_close_together by 5.8Å
  - V69↔E53: targets 15.1/27.1Å but partners are 8.8Å apart → too_close_together by 3.2Å
- **E51** — severity 29.88, 12 conflict(s); suspect input ~`D29` (group: pull_in)
  - pull-in (wants closer): D29@5.6Å(now 17.8,conf 0.56), I28@6.2Å(now 15.4,conf 0.55)
  - push-out (wants farther): V40@27.5Å(now 23.7,conf 0.99), E66@27.4Å(now 22.6,conf 0.97), K84@18.7Å(now 11.2,conf 0.56), I7@15.3Å(now 10.4,conf 0.55), I72@11.6Å(now 6.6,conf 0.55)
  - N54↔D29: targets 7.4/5.6Å but partners are 22.6Å apart → too_far_apart by 9.6Å
  - N54↔I28: targets 7.4/6.2Å but partners are 20.9Å apart → too_far_apart by 7.3Å
  - S57↔V40: targets 15.0/27.5Å but partners are 9.1Å apart → too_close_together by 3.4Å
- **V9** — severity 29.21, 11 conflict(s); suspect input ~`T86` (group: pull_in)
  - pull-in (wants closer): T20@6.5Å(now 9.0,conf 0.55), T86@8.4Å(now 16.2,conf 0.55)
  - push-out (wants farther): D2@21.0Å(now 18.1,conf 1.00), A3@17.0Å(now 14.4,conf 1.00), D77@27.5Å(now 23.4,conf 0.98), S79@21.9Å(now 19.3,conf 0.63), G59@13.1Å(now 10.5,conf 0.55), L71@12.3Å(now 9.8,conf 0.55)
  - T20↔T86: targets 6.5/8.4Å but partners are 23.8Å apart → too_far_apart by 8.9Å
  - A17↔T86: targets 6.7/8.4Å but partners are 22.5Å apart → too_far_apart by 7.4Å
  - T13↔T86: targets 10.0/8.4Å but partners are 25.7Å apart → too_far_apart by 7.2Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=35 · 3-10(G)=17 · coil(C)=6

```
EEEEGGGEHHHGHHHGEECHECCGHEEHHEEEGEEEHGHHHHHHEHHHEEGHHHEEEGEHGGCGEEEEGCEECEGEHHHEGGHEHEHE
```

## Backbone H-bond Network

- total=78 · helix(i→i+4)=10 · sheet=68
  - V9 ↔ T13  (helix)
  - K10 ↔ D14  (helix)
  - D11 ↔ T15  (helix)
  - L25 ↔ D29  (helix)
  - I37 ↔ P41  (helix)
  - D39 ↔ D43  (helix)
  - D43 ↔ I47  (helix)
  - D48 ↔ D52  (helix)
  - S79 ↔ A83  (helix)
  - A83 ↔ F87  (helix)
  - D2 ↔ W21  (sheet)
  - A3 ↔ W21  (sheet)
  - P4 ↔ W21  (sheet)
  - E8 ↔ A17  (sheet)
  - E8 ↔ L18  (sheet)
  - E8 ↔ W21  (sheet)
  - A17 ↔ Y35  (sheet)
  - A17 ↔ G36  (sheet)
  - L18 ↔ T34  (sheet)
  - L18 ↔ Y35  (sheet)
  - … +58 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=30 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=395 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=268 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.3465 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=23 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
