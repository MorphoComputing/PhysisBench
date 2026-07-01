# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1FKF\seeds\seed_3\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 9.403 A
- tm_score_ca_ordered: 0.23544198830096297
- heavy_atom_rmsd: 10.320 A
- sidechain_heavy_atom_rmsd: 11.149 A
- **all-atom quality (honest):** heavy 10.320 A, sidechain 11.149 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 59
- distogram_pairs: 1090
- bin_accuracy: 0.328

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=57
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.402567485424658
- ga_delta_rmsd: 1.9497184033452797  ga_fitness_mode: energy
- pre_local_rmsd: 9.402607248881251  localized_anchor_rmsd: 9.402607248881251

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G27-S37 → 345 conflicts (30%); V1-G9 → 306 conflicts (26%); V67-K72 → 178 conflicts (15%)
- explained: 829/1165 conflicts by 3 root cause(s)
- metrics: hubs=102 (frac 0.971), conflicts/hub=11.4, max_incompat=11.83Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G27-S37 + V1-G9 + V67-K72 — explain ~829/1165 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V67** — severity 121.60, 37 conflict(s); suspect input ~`A63` (group: pull_in)
  - pull-in (wants closer): G9@5.2Å(now 12.2,conf 0.57)
  - push-out (wants farther): G88@27.5Å(now 15.6,conf 1.00), G85@27.5Å(now 22.2,conf 1.00), D78@27.1Å(now 19.2,conf 0.88), S76@23.6Å(now 15.2,conf 0.76), E4@15.0Å(now 11.5,conf 0.55), A71@11.2Å(now 8.6,conf 0.55)
  - G88↔R70: targets 27.5/9.1Å but partners are 8.3Å apart → too_close_together by 10.1Å
  - G88↔V62: targets 27.5/9.4Å but partners are 7.0Å apart → too_close_together by 11.0Å
  - G88↔A63: targets 27.5/10.4Å but partners are 6.2Å apart → too_close_together by 10.9Å
- **M48** — severity 113.39, 30 conflict(s); suspect input ~`V54` (group: push_out)
  - push-out (wants farther): D31@27.5Å(now 20.3,conf 0.99), G32@27.2Å(now 15.6,conf 0.90), E30@26.6Å(now 17.1,conf 0.78), K34@23.6Å(now 13.2,conf 0.76), K51@8.6Å(now 3.4,conf 0.67), Q69@17.4Å(now 9.6,conf 0.55)
  - Q52↔G32: targets 7.1/27.2Å but partners are 11.3Å apart → too_close_together by 8.8Å
  - G32↔V54: targets 27.2/8.0Å but partners are 8.7Å apart → too_close_together by 10.5Å
  - G32↔E53: targets 27.2/5.4Å but partners are 13.0Å apart → too_close_together by 8.8Å
- **E30** — severity 85.69, 35 conflict(s); suspect input ~`K51` (group: pull_in)
  - pull-in (wants closer): P77@11.6Å(now 16.4,conf 0.55), E4@14.4Å(now 18.9,conf 0.55), A94@8.1Å(now 13.9,conf 0.55)
  - push-out (wants farther): H24@19.0Å(now 16.0,conf 1.00), K51@27.4Å(now 16.5,conf 0.94), P15@26.9Å(now 23.1,conf 0.82), M48@26.6Å(now 17.1,conf 0.78), F47@23.6Å(now 18.7,conf 0.76), C21@24.4Å(now 21.2,conf 0.71), V23@20.8Å(now 15.9,conf 0.59), G88@17.1Å(now 14.0,conf 0.55), G57@15.0Å(now 6.7,conf 0.55), W58@16.3Å(now 8.4,conf 0.55)
  - F35↔K51: targets 11.0/27.4Å but partners are 8.1Å apart → too_close_together by 8.3Å
  - K33↔K51: targets 7.0/27.4Å but partners are 12.9Å apart → too_close_together by 7.5Å
  - K34↔K51: targets 9.0/27.4Å but partners are 12.2Å apart → too_close_together by 6.2Å
- **G50** — severity 82.61, 21 conflict(s); suspect input ~`I55` (group: pull_in)
  - pull-in (wants closer): G18@7.0Å(now 12.6,conf 0.55)
  - push-out (wants farther): K43@23.5Å(now 20.6,conf 1.00), D31@27.5Å(now 20.9,conf 1.00), K33@27.5Å(now 15.3,conf 1.00), F45@17.0Å(now 14.1,conf 0.99), R39@24.1Å(now 16.6,conf 0.73), R41@26.1Å(now 22.8,conf 0.73), S38@21.6Å(now 18.3,conf 0.61)
  - K33↔I55: targets 27.5/9.0Å but partners are 6.7Å apart → too_close_together by 11.8Å
  - K33↔R56: targets 27.5/9.0Å but partners are 8.7Å apart → too_close_together by 9.8Å
  - D31↔I55: targets 27.5/9.0Å but partners are 10.9Å apart → too_close_together by 7.6Å
- **P91** — severity 77.88, 21 conflict(s); suspect input ~`G88` (group: pull_in)
  - pull-in (wants closer): G88@7.9Å(now 11.5,conf 0.55), G32@14.3Å(now 17.2,conf 0.55), D36@14.3Å(now 24.6,conf 0.55)
  - push-out (wants farther): L105@27.5Å(now 19.1,conf 1.00), F14@27.5Å(now 22.3,conf 1.00), R56@17.9Å(now 10.9,conf 0.55)
  - L105↔H86: targets 27.5/5.1Å but partners are 14.1Å apart → too_close_together by 8.3Å
  - L105↔P87: targets 27.5/9.0Å but partners are 10.6Å apart → too_close_together by 7.8Å
  - L105↔G85: targets 27.5/3.4Å but partners are 15.5Å apart → too_close_together by 8.6Å
- **G18** — severity 74.44, 21 conflict(s); suspect input ~`I6` (group: pull_in)
  - pull-in (wants closer): G50@7.0Å(now 12.6,conf 0.55), Q52@12.1Å(now 17.0,conf 0.55)
  - push-out (wants farther): F35@27.5Å(now 20.8,conf 0.99), I6@26.5Å(now 11.5,conf 0.77), P15@7.6Å(now 4.9,conf 0.69), G11@19.5Å(now 16.7,conf 0.58)
  - I6↔P15: targets 26.5/7.6Å but partners are 8.4Å apart → too_close_together by 10.5Å
  - T13↔I6: targets 13.2/26.5Å but partners are 4.0Å apart → too_close_together by 9.3Å
  - F14↔I6: targets 11.2/26.5Å but partners are 6.7Å apart → too_close_together by 8.6Å

## Secondary Structure (DSSP-like)

- helix(H)=54 · strand(E)=27 · 3-10(G)=12 · coil(C)=12

```
CEHHHHHHHHHHEGGHGHHHECEGGHHEGHGEGGHHHHHEHECHCEGCHHEHHEEHGHHEHEHHHHHGCECHEHHHEHHHHHHHHHEHEEECHHCCCEECEHEEE
```

## Backbone H-bond Network

- total=63 · helix(i→i+4)=21 · sheet=42
  - V3 ↔ S7  (helix)
  - E4 ↔ P8  (helix)
  - T5 ↔ G9  (helix)
  - I6 ↔ D10  (helix)
  - S7 ↔ G11  (helix)
  - P8 ↔ R12  (helix)
  - R12 ↔ K16  (helix)
  - K16 ↔ T20  (helix)
  - T26 ↔ E30  (helix)
  - F35 ↔ R39  (helix)
  - L49 ↔ E53  (helix)
  - Q52 ↔ R56  (helix)
  - E59 ↔ A63  (helix)
  - G61 ↔ M65  (helix)
  - A63 ↔ V67  (helix)
  - K72 ↔ S76  (helix)
  - T74 ↔ D78  (helix)
  - I75 ↔ Y79  (helix)
  - S76 ↔ A80  (helix)
  - Y79 ↔ A83  (helix)
  - … +43 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=39 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=692 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=494 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.8368 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=59 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
