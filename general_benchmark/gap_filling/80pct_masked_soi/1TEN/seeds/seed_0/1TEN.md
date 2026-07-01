# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TEN\seeds\seed_0\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 7.063 A
- tm_score_ca_ordered: 0.3321409392049918
- heavy_atom_rmsd: 7.963 A
- sidechain_heavy_atom_rmsd: 8.815 A
- **all-atom quality (honest):** heavy 7.963 A, sidechain 8.815 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 28
- distogram_pairs: 1077
- bin_accuracy: 0.438

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_domain_topology_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.062566505494141
- ga_delta_rmsd: 1.984822655438566  ga_fitness_mode: energy
- pre_local_rmsd: 7.065716137795452  localized_anchor_rmsd: 7.062570208021267

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G36-I58 → 150 conflicts (56%); Q6-A17 → 48 conflicts (18%); V69-I72 → 24 conflicts (9%)
- explained: 222/270 conflicts by 3 root cause(s)
- metrics: hubs=71 (frac 0.807), conflicts/hub=3.8, max_incompat=7.68Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G36-I58 + Q6-A17 + V69-I72 — explain ~222/270 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V40** — severity 57.01, 20 conflict(s); suspect input ~`N54` (group: push_out)
  - push-out (wants farther): N54@27.1Å(now 19.2,conf 0.86), E8@21.8Å(now 19.2,conf 0.62), V12@20.0Å(now 16.8,conf 0.58), D14@18.4Å(now 13.4,conf 0.55), I58@17.8Å(now 11.3,conf 0.55), P63@15.1Å(now 12.6,conf 0.55), T86@13.3Å(now 8.8,conf 0.55)
  - R44↔N54: targets 9.0/27.1Å but partners are 11.2Å apart → too_close_together by 6.9Å
  - I37↔N54: targets 5.1/27.1Å but partners are 16.2Å apart → too_close_together by 5.8Å
  - G36↔N54: targets 7.1/27.1Å but partners are 14.4Å apart → too_close_together by 5.6Å
- **D52** — severity 30.72, 10 conflict(s); suspect input ~`K38` (group: pull_in)
  - pull-in (wants closer): Q55@9.0Å(now 11.9,conf 0.99)
  - push-out (wants farther): K38@27.4Å(now 22.9,conf 0.95), L49@8.9Å(now 6.2,conf 0.91), T15@26.4Å(now 22.0,conf 0.76), R44@23.0Å(now 19.5,conf 0.73), A3@14.8Å(now 12.2,conf 0.55), W21@11.5Å(now 7.1,conf 0.55), F22@10.5Å(now 3.8,conf 0.55), P4@12.3Å(now 9.6,conf 0.55)
  - Q55↔K38: targets 9.0/27.4Å but partners are 12.2Å apart → too_close_together by 6.2Å
  - Q55↔R44: targets 9.0/23.0Å but partners are 8.1Å apart → too_close_together by 5.9Å
  - K38↔Y56: targets 27.4/11.4Å but partners are 11.0Å apart → too_close_together by 5.0Å
- **V9** — severity 17.13, 7 conflict(s); suspect input ~`T86` (group: pull_in)
  - pull-in (wants closer): T86@8.4Å(now 16.6,conf 0.55)
  - push-out (wants farther): T15@13.0Å(now 10.3,conf 0.99), D77@27.5Å(now 23.2,conf 0.98), G59@13.1Å(now 8.3,conf 0.55), T16@10.4Å(now 7.8,conf 0.55), N60@15.7Å(now 10.9,conf 0.55)
  - Q6↔T86: targets 9.1/8.4Å but partners are 24.0Å apart → too_far_apart by 6.5Å
  - T20↔T86: targets 6.5/8.4Å but partners are 21.2Å apart → too_far_apart by 6.3Å
  - A17↔T86: targets 6.7/8.4Å but partners are 19.6Å apart → too_far_apart by 4.5Å
- **L61** — severity 15.90, 7 conflict(s); suspect input ~`T15` (group: pull_in)
  - pull-in (wants closer): T15@4.5Å(now 15.7,conf 0.60), A17@8.4Å(now 14.1,conf 0.55), I19@13.6Å(now 17.0,conf 0.55)
  - push-out (wants farther): D64@9.0Å(now 3.8,conf 0.99), T65@9.0Å(now 3.2,conf 0.99), Y67@9.0Å(now 5.5,conf 0.99), K38@12.2Å(now 9.4,conf 0.55)
  - E66↔T15: targets 9.2/4.5Å but partners are 21.0Å apart → too_far_apart by 7.3Å
  - D64↔T15: targets 9.0/4.5Å but partners are 18.9Å apart → too_far_apart by 5.4Å
  - T65↔T15: targets 9.0/4.5Å but partners are 17.0Å apart → too_far_apart by 3.5Å
- **T45** — severity 15.62, 8 conflict(s); suspect input ~`E85` (group: pull_in)
  - pull-in (wants closer): T34@5.4Å(now 9.7,conf 0.56), Y35@5.5Å(now 10.9,conf 0.56)
  - push-out (wants farther): P41@11.0Å(now 7.3,conf 0.94), D39@13.1Å(now 9.0,conf 0.91), G42@8.6Å(now 5.9,conf 0.79), K38@12.0Å(now 8.8,conf 0.72), L1@22.1Å(now 17.6,conf 0.64), Q6@21.3Å(now 18.7,conf 0.60), P4@18.4Å(now 11.2,conf 0.55), I7@18.0Å(now 14.4,conf 0.55), E85@15.0Å(now 9.9,conf 0.55), P82@15.0Å(now 8.3,conf 0.55)
  - D48↔L1: targets 11.0/22.1Å but partners are 7.3Å apart → too_close_together by 3.9Å
  - T34↔I7: targets 5.4/18.0Å but partners are 8.2Å apart → too_close_together by 4.4Å
  - T34↔E85: targets 5.4/15.0Å but partners are 5.3Å apart → too_close_together by 4.3Å
- **I72** — severity 14.77, 9 conflict(s); suspect input ~`D29` (group: pull_in)
  - pull-in (wants closer): P82@4.9Å(now 8.7,conf 0.58)
  - push-out (wants farther): T65@23.5Å(now 20.8,conf 1.00), K62@23.8Å(now 20.9,conf 0.75), S57@17.2Å(now 14.4,conf 0.55), E51@11.6Å(now 7.4,conf 0.55), D48@9.8Å(now 3.8,conf 0.55)
  - P82↔D29: targets 4.9/11.1Å but partners are 20.7Å apart → too_far_apart by 4.7Å
  - P82↔L25: targets 4.9/13.0Å but partners are 22.3Å apart → too_far_apart by 4.4Å
  - P82↔F22: targets 4.9/12.4Å but partners are 21.3Å apart → too_far_apart by 4.0Å

## Secondary Structure (DSSP-like)

- helix(H)=43 · strand(E)=23 · 3-10(G)=16 · coil(C)=6

```
CEHHHGHEHHEHHHGGEGHGEHHGHGHHHHEHHGEEGHHHEHHHHHHHHEGHEECECCCEEGHHHHEEHHHEHEGCGHGGEHEGHHEE
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=19 · sheet=28
  - A3 ↔ I7  (helix)
  - S5 ↔ V9  (helix)
  - V9 ↔ T13  (helix)
  - K10 ↔ D14  (helix)
  - I19 ↔ K23  (helix)
  - K23 ↔ E27  (helix)
  - L25 ↔ D29  (helix)
  - I28 ↔ E32  (helix)
  - D29 ↔ L33  (helix)
  - K38 ↔ G42  (helix)
  - D39 ↔ D43  (helix)
  - D43 ↔ I47  (helix)
  - T45 ↔ L49  (helix)
  - D48 ↔ D52  (helix)
  - T65 ↔ V69  (helix)
  - E66 ↔ S70  (helix)
  - V69 ↔ S73  (helix)
  - M78 ↔ P82  (helix)
  - P82 ↔ T86  (helix)
  - E8 ↔ A17  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=39 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=419 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=298 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.558 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=28 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
