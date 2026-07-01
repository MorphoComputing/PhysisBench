# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2YXF\seeds\seed_6\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 7.577 A
- tm_score_ca_ordered: 0.40399892024629785
- heavy_atom_rmsd: 8.920 A
- sidechain_heavy_atom_rmsd: 9.928 A
- **all-atom quality (honest):** heavy 8.920 A, sidechain 9.928 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 27
- distogram_pairs: 1251
- bin_accuracy: 0.581

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.57725305876415
- ga_delta_rmsd: -0.222388206382659  ga_fitness_mode: energy
- pre_local_rmsd: 7.598823275217223  localized_anchor_rmsd: 7.577276818474985

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q2-I7 → 86 conflicts (48%); K19 → 20 conflicts (11%)
- explained: 106/179 conflicts by 2 root cause(s)
- metrics: hubs=56 (frac 0.577), conflicts/hub=3.2, max_incompat=6.36Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q2-I7 + K19 — explain ~106/179 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K19** — severity 26.08, 16 conflict(s); suspect input ~`S52` (group: pull_in)
  - pull-in (wants closer): T71@9.8Å(now 13.3,conf 0.55)
  - push-out (wants farther): G29@27.5Å(now 24.0,conf 1.00), I7@25.7Å(now 22.3,conf 0.70), Q8@22.2Å(now 19.1,conf 0.65), S52@21.6Å(now 15.0,conf 0.61), C25@19.7Å(now 13.8,conf 0.57), D96@19.2Å(now 13.9,conf 0.56), A15@8.9Å(now 3.9,conf 0.55)
  - R12↔S52: targets 7.1/21.6Å but partners are 9.8Å apart → too_close_together by 4.7Å
  - H13↔S52: targets 4.9/21.6Å but partners are 12.2Å apart → too_close_together by 4.5Å
  - N24↔S52: targets 13.0/21.6Å but partners are 4.6Å apart → too_close_together by 3.9Å
- **Q2** — severity 22.29, 9 conflict(s); suspect input ~`E47` (group: push_out)
  - pull-in (wants closer): T73@27.5Å(now 32.7,conf 1.00), H31@4.9Å(now 10.2,conf 0.58), T86@7.2Å(now 11.5,conf 0.55), L87@10.9Å(now 16.6,conf 0.55)
  - push-out (wants farther): E47@27.5Å(now 23.6,conf 0.99), L23@27.4Å(now 24.5,conf 0.94)
  - I7↔E47: targets 13.0/27.5Å but partners are 11.0Å apart → too_close_together by 3.5Å
  - P5↔E47: targets 7.0/27.5Å but partners are 17.2Å apart → too_close_together by 3.2Å
  - H31↔F56: targets 4.9/14.1Å but partners are 3.4Å apart → too_close_together by 5.8Å
- **E44** — severity 17.44, 7 conflict(s); suspect input ~`R3` (group: pull_in)
  - pull-in (wants closer): S57@27.5Å(now 30.5,conf 1.00)
  - push-out (wants farther): R3@27.3Å(now 20.9,conf 0.92), P5@21.6Å(now 18.3,conf 0.61), S11@18.4Å(now 15.7,conf 0.55)
  - D38↔R3: targets 9.0/27.3Å but partners are 13.8Å apart → too_close_together by 4.5Å
  - R3↔V37: targets 27.3/11.4Å but partners are 10.9Å apart → too_close_together by 4.9Å
  - L39↔R3: targets 7.0/27.3Å but partners are 16.6Å apart → too_close_together by 3.7Å
- **R3** — severity 17.43, 8 conflict(s); suspect input ~`I7` (group: pull_in)
  - pull-in (wants closer): S88@13.2Å(now 19.9,conf 0.55), V85@9.2Å(now 14.8,conf 0.55)
  - push-out (wants farther): E44@27.3Å(now 20.9,conf 0.92), G43@26.6Å(now 22.9,conf 0.79), Y78@25.0Å(now 22.3,conf 0.69), I35@11.8Å(now 7.2,conf 0.55)
  - E44↔I7: targets 27.3/9.4Å but partners are 12.7Å apart → too_close_together by 5.1Å
  - E44↔K6: targets 27.3/6.6Å but partners are 17.5Å apart → too_close_together by 3.2Å
  - K6↔V85: targets 6.6/9.2Å but partners are 20.2Å apart → too_far_apart by 4.5Å
- **T4** — severity 14.93, 8 conflict(s); suspect input ~`E47` (group: pull_in)
  - pull-in (wants closer): R97@24.6Å(now 27.2,conf 0.70), F30@5.5Å(now 9.2,conf 0.56), S88@10.8Å(now 14.4,conf 0.55)
  - push-out (wants farther): E47@24.0Å(now 19.8,conf 0.73), G43@22.5Å(now 19.8,conf 0.67), L39@18.4Å(now 14.3,conf 0.55), E36@12.8Å(now 4.9,conf 0.55), D59@15.4Å(now 12.2,conf 0.55), S33@10.5Å(now 5.3,conf 0.55), N83@10.1Å(now 6.9,conf 0.55)
  - I7↔E47: targets 8.9/24.0Å but partners are 11.0Å apart → too_close_together by 4.1Å
  - S88↔I1: targets 10.8/10.3Å but partners are 26.4Å apart → too_far_apart by 5.3Å
  - F30↔S55: targets 5.5/15.9Å but partners are 6.1Å apart → too_close_together by 4.4Å
- **P5** — severity 13.33, 9 conflict(s); suspect input ~`D96` (group: pull_in)
  - pull-in (wants closer): D96@18.9Å(now 23.7,conf 0.56), V27@5.8Å(now 9.5,conf 0.55), V85@10.1Å(now 14.6,conf 0.55)
  - push-out (wants farther): E44@21.6Å(now 18.3,conf 0.61), V49@19.6Å(now 15.2,conf 0.57), D34@11.1Å(now 7.5,conf 0.55), S33@9.8Å(now 6.5,conf 0.55), D38@13.9Å(now 11.2,conf 0.55)
  - Q2↔D96: targets 7.0/18.9Å but partners are 30.2Å apart → too_far_apart by 4.3Å
  - I1↔D96: targets 9.4/18.9Å but partners are 32.6Å apart → too_far_apart by 4.2Å
  - Q8↔V49: targets 9.4/19.6Å but partners are 7.1Å apart → too_close_together by 3.1Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=43 · 3-10(G)=10 · coil(C)=15

```
CEHHEGEECEECEEHHEHHCEEGHHGHEHHEHEHCEGCHEGHEECEEHHHHHEGECCEHEECECHECEEECEEHGGEECECGEEHHHEHEEHHEGEE
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=6 · sheet=52
  - A15 ↔ K19  (helix)
  - C25 ↔ G29  (helix)
  - F30 ↔ D34  (helix)
  - K48 ↔ S52  (helix)
  - V85 ↔ Q89  (helix)
  - Q89 ↔ V93  (helix)
  - Q8 ↔ S28  (sheet)
  - Y10 ↔ N21  (sheet)
  - Y10 ↔ F22  (sheet)
  - S11 ↔ N21  (sheet)
  - S11 ↔ F22  (sheet)
  - H13 ↔ N21  (sheet)
  - H13 ↔ F22  (sheet)
  - P14 ↔ N21  (sheet)
  - P14 ↔ F22  (sheet)
  - N17 ↔ F22  (sheet)
  - S28 ↔ S33  (sheet)
  - S28 ↔ E36  (sheet)
  - L40 ↔ I46  (sheet)
  - L40 ↔ E47  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=40 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=448 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=318 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.9399 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=27 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
