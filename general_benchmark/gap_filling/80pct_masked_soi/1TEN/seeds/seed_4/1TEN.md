# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TEN\seeds\seed_4\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 7.258 A
- tm_score_ca_ordered: 0.31600821059475703
- heavy_atom_rmsd: 7.930 A
- sidechain_heavy_atom_rmsd: 8.496 A
- **all-atom quality (honest):** heavy 7.930 A, sidechain 8.496 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 29
- distogram_pairs: 1073
- bin_accuracy: 0.445

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.258295748592735
- ga_delta_rmsd: 1.027484945209956  ga_fitness_mode: energy
- pre_local_rmsd: 7.295867690093919  localized_anchor_rmsd: 7.258323050812935

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L1-V9 → 168 conflicts (44%); I28-I37 → 104 conflicts (27%); P41-T46 → 25 conflicts (6%)
- explained: 297/385 conflicts by 3 root cause(s)
- metrics: hubs=74 (frac 0.841), conflicts/hub=5.2, max_incompat=7.86Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L1-V9 + I28-I37 + P41-T46 — explain ~297/385 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T46** — severity 37.85, 16 conflict(s); suspect input ~`E32` (group: push_out)
  - push-out (wants farther): L25@22.0Å(now 15.9,conf 0.63), D64@21.6Å(now 17.3,conf 0.61), Q6@19.7Å(now 8.3,conf 0.57), L1@19.0Å(now 13.2,conf 0.56), T88@18.7Å(now 13.7,conf 0.56), P24@18.6Å(now 13.3,conf 0.55), K23@18.1Å(now 11.3,conf 0.55), E85@14.8Å(now 7.6,conf 0.55), L71@9.3Å(now 5.4,conf 0.55), I72@10.5Å(now 7.4,conf 0.55), A17@15.5Å(now 11.2,conf 0.55), A3@16.2Å(now 6.8,conf 0.55), T20@15.7Å(now 11.5,conf 0.55)
  - K23↔E32: targets 18.1/6.5Å but partners are 3.8Å apart → too_close_together by 7.9Å
  - L25↔E32: targets 22.0/6.5Å but partners are 9.4Å apart → too_close_together by 6.2Å
  - L25↔I31: targets 22.0/10.0Å but partners are 6.1Å apart → too_close_together by 5.9Å
- **G42** — severity 29.62, 12 conflict(s); suspect input ~`I7` (group: pull_in)
  - pull-in (wants closer): M78@24.1Å(now 27.7,conf 0.73)
  - push-out (wants farther): A26@27.5Å(now 23.9,conf 1.00), G36@8.6Å(now 5.4,conf 0.79), G30@23.3Å(now 20.5,conf 0.76), T20@23.6Å(now 19.0,conf 0.76), I7@23.0Å(now 14.0,conf 0.73), K10@24.1Å(now 20.4,conf 0.73), T86@16.4Å(now 13.8,conf 0.55)
  - T45↔I7: targets 9.0/23.0Å but partners are 7.3Å apart → too_close_together by 6.7Å
  - G36↔I7: targets 8.6/23.0Å but partners are 9.2Å apart → too_close_together by 5.3Å
  - Y35↔I7: targets 11.0/23.0Å but partners are 7.0Å apart → too_close_together by 5.0Å
- **V12** — severity 27.97, 15 conflict(s); suspect input ~`Q6` (group: push_out)
  - push-out (wants farther): Q6@17.1Å(now 13.0,conf 0.91), V40@20.0Å(now 14.5,conf 0.58), S5@19.7Å(now 16.2,conf 0.57), I7@14.3Å(now 10.1,conf 0.55)
  - A17↔Q6: targets 5.0/17.1Å but partners are 8.1Å apart → too_close_together by 4.0Å
  - I19↔Q6: targets 9.0/17.1Å but partners are 5.0Å apart → too_close_together by 3.1Å
  - V9↔V40: targets 7.1/20.0Å but partners are 9.1Å apart → too_close_together by 3.8Å
- **T45** — severity 26.71, 9 conflict(s); suspect input ~`P4` (group: push_out)
  - push-out (wants farther): K38@12.2Å(now 8.9,conf 0.69), L1@22.1Å(now 15.5,conf 0.64), Q6@21.3Å(now 9.9,conf 0.60), P4@18.4Å(now 9.0,conf 0.55), I7@18.0Å(now 7.3,conf 0.55), E85@15.0Å(now 10.2,conf 0.55), P82@15.0Å(now 10.5,conf 0.55)
  - Q6↔Y35: targets 21.3/5.5Å but partners are 8.1Å apart → too_close_together by 7.7Å
  - Q6↔T34: targets 21.3/5.4Å but partners are 8.6Å apart → too_close_together by 7.3Å
  - T34↔P4: targets 5.4/18.4Å but partners are 6.3Å apart → too_close_together by 6.7Å
- **T13** — severity 25.38, 11 conflict(s); suspect input ~`Q6` (group: pull_in)
  - pull-in (wants closer): G76@27.5Å(now 31.8,conf 1.00), I58@10.4Å(now 13.7,conf 0.55)
  - push-out (wants farther): I7@17.0Å(now 13.1,conf 1.00), K10@8.8Å(now 4.3,conf 0.82), Q6@20.6Å(now 15.8,conf 0.79), P41@22.8Å(now 19.1,conf 0.71), D39@19.8Å(now 14.9,conf 0.57)
  - L18↔Q6: targets 9.0/20.6Å but partners are 6.9Å apart → too_close_together by 4.7Å
  - Q6↔A17: targets 20.6/6.5Å but partners are 8.1Å apart → too_close_together by 6.0Å
  - Q6↔T16: targets 20.6/5.4Å but partners are 11.6Å apart → too_close_together by 3.5Å
- **D43** — severity 24.05, 9 conflict(s); suspect input ~`I47` (group: pull_in)
  - pull-in (wants closer): L61@11.7Å(now 18.1,conf 0.55)
  - push-out (wants farther): L1@26.9Å(now 21.7,conf 0.82), S5@23.9Å(now 17.8,conf 0.74), Q6@24.1Å(now 15.1,conf 0.73)
  - Q6↔I47: targets 24.1/14.0Å but partners are 3.8Å apart → too_close_together by 6.3Å
  - Q6↔G36: targets 24.1/5.1Å but partners are 12.4Å apart → too_close_together by 6.5Å
  - T46↔Q6: targets 11.0/24.1Å but partners are 8.3Å apart → too_close_together by 4.8Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=33 · 3-10(G)=13 · coil(C)=9

```
CEHEHEHHHEHHGHHEGCCEECHHEHHHHEHGEEEECCHHEHEHHHHEGEGHEGHGEEEEEGHEHHEEGHEGHEHEHCEGCGHECGEE
```

## Backbone H-bond Network

- total=55 · helix(i→i+4)=11 · sheet=44
  - A3 ↔ I7  (helix)
  - S5 ↔ V9  (helix)
  - I7 ↔ D11  (helix)
  - E8 ↔ V12  (helix)
  - D11 ↔ T15  (helix)
  - K23 ↔ E27  (helix)
  - P24 ↔ I28  (helix)
  - E27 ↔ I31  (helix)
  - G42 ↔ T46  (helix)
  - E66 ↔ S70  (helix)
  - S73 ↔ D77  (helix)
  - D2 ↔ W21  (sheet)
  - P4 ↔ T20  (sheet)
  - P4 ↔ W21  (sheet)
  - Q6 ↔ T16  (sheet)
  - Q6 ↔ T20  (sheet)
  - Q6 ↔ W21  (sheet)
  - K10 ↔ T16  (sheet)
  - K10 ↔ T20  (sheet)
  - T16 ↔ G36  (sheet)
  - … +35 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=42 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=372 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=243 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.084 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=29 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
