# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1FKF/sequence/1FKF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1FKF/seeds/seed_0/1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 10.860 A
- tm_score_ca_ordered: 0.16167182341869324
- heavy_atom_rmsd: 11.983 A
- sidechain_heavy_atom_rmsd: 13.188 A
- **all-atom quality (honest):** heavy 11.983 A, sidechain 13.188 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 127
- distogram_pairs: 688
- bin_accuracy: 0.179

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.859547863808029
- ga_delta_rmsd: 0.33077288359573664  ga_fitness_mode: energy
- pre_local_rmsd: 10.85957415374249  localized_anchor_rmsd: 10.85957415374249

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G27-D36 → 310 conflicts (31%); F47-G50 → 98 conflicts (10%); V67 → 87 conflicts (9%)
- explained: 495/993 conflicts by 3 root cause(s)
- metrics: hubs=101 (frac 0.962), conflicts/hub=9.8, max_incompat=15.59Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G27-D36 + F47-G50 + V67 — explain ~495/993 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V67** — severity 171.38, 61 conflict(s); suspect input ~`A71` (group: pull_in)
  - pull-in (wants closer): G9@5.2Å(now 11.7,conf 0.57)
  - push-out (wants farther): G88@27.5Å(now 17.1,conf 1.00), P91@27.5Å(now 19.6,conf 1.00), H93@27.5Å(now 16.0,conf 1.00), G85@27.5Å(now 16.7,conf 1.00), D78@27.1Å(now 9.8,conf 0.88), S76@23.6Å(now 11.3,conf 0.76), T74@19.2Å(now 11.8,conf 0.56), E4@15.0Å(now 10.8,conf 0.55), G61@13.1Å(now 3.5,conf 0.55), F47@14.6Å(now 6.1,conf 0.55), T20@12.1Å(now 6.3,conf 0.55)
  - H93↔A71: targets 27.5/11.2Å but partners are 4.0Å apart → too_close_together by 12.3Å
  - G88↔A71: targets 27.5/11.2Å but partners are 6.0Å apart → too_close_together by 10.3Å
  - G85↔A71: targets 27.5/11.2Å but partners are 6.5Å apart → too_close_together by 9.8Å
- **E30** — severity 131.75, 48 conflict(s); suspect input ~`V97` (group: pull_in)
  - pull-in (wants closer): V97@6.2Å(now 9.9,conf 0.55), G82@14.8Å(now 17.4,conf 0.55), A94@8.1Å(now 12.1,conf 0.55)
  - push-out (wants farther): K51@27.4Å(now 17.5,conf 0.94), P15@26.9Å(now 12.5,conf 0.82), M48@26.6Å(now 16.1,conf 0.78), F47@23.6Å(now 16.8,conf 0.76), C21@24.4Å(now 7.5,conf 0.71), V23@20.8Å(now 9.4,conf 0.59), D40@19.7Å(now 14.9,conf 0.57), G88@17.1Å(now 14.2,conf 0.55), A71@15.2Å(now 9.6,conf 0.55), E4@14.4Å(now 8.3,conf 0.55)
  - M48↔V97: targets 26.6/6.2Å but partners are 6.9Å apart → too_close_together by 13.5Å
  - K51↔V97: targets 27.4/6.2Å but partners are 9.5Å apart → too_close_together by 11.6Å
  - C21↔V97: targets 24.4/6.2Å but partners are 6.6Å apart → too_close_together by 11.5Å
- **K33** — severity 96.31, 29 conflict(s); suspect input ~`V97` (group: pull_in)
  - pull-in (wants closer): P92@15.4Å(now 18.4,conf 0.55), V97@9.6Å(now 12.4,conf 0.55), G88@14.3Å(now 17.9,conf 0.55)
  - push-out (wants farther): R17@27.5Å(now 6.2,conf 1.00), G50@27.5Å(now 12.6,conf 1.00), C21@25.0Å(now 8.6,conf 0.69), V23@20.1Å(now 10.2,conf 0.58), R41@17.6Å(now 9.3,conf 0.55), R39@15.4Å(now 4.0,conf 0.55), S37@11.5Å(now 3.3,conf 0.55), T74@13.7Å(now 10.4,conf 0.55)
  - G50↔V97: targets 27.5/9.6Å but partners are 3.4Å apart → too_close_together by 14.5Å
  - R17↔S37: targets 27.5/11.5Å but partners are 5.9Å apart → too_close_together by 10.2Å
  - G50↔D99: targets 27.5/12.3Å but partners are 5.3Å apart → too_close_together by 9.9Å
- **I6** — severity 84.91, 33 conflict(s); suspect input ~`R70` (group: pull_in)
  - pull-in (wants closer): R70@5.4Å(now 10.7,conf 0.56)
  - push-out (wants farther): G18@26.5Å(now 8.8,conf 0.77), E53@24.5Å(now 18.2,conf 0.71), L49@22.3Å(now 19.5,conf 0.66), T20@22.1Å(now 10.7,conf 0.64), D31@18.0Å(now 8.5,conf 0.55), L29@17.9Å(now 11.4,conf 0.55), V22@17.7Å(now 6.8,conf 0.55), T13@17.4Å(now 11.4,conf 0.55), F14@16.7Å(now 12.8,conf 0.55), V23@14.7Å(now 10.3,conf 0.55), D10@13.3Å(now 4.9,conf 0.55), G9@9.7Å(now 5.3,conf 0.55), M28@15.9Å(now 9.7,conf 0.55)
  - G18↔M65: targets 26.5/11.3Å but partners are 4.2Å apart → too_close_together by 11.0Å
  - T20↔R70: targets 22.1/5.4Å but partners are 6.6Å apart → too_close_together by 10.0Å
  - G18↔R70: targets 26.5/5.4Å but partners are 11.6Å apart → too_close_together by 9.5Å
- **D40** — severity 79.84, 27 conflict(s); suspect input ~`T26` (group: pull_in)
  - pull-in (wants closer): I89@16.8Å(now 20.5,conf 0.55), T26@8.7Å(now 12.5,conf 0.55), G27@11.4Å(now 14.0,conf 0.55)
  - push-out (wants farther): V1@23.7Å(now 10.1,conf 0.75), S66@23.1Å(now 10.7,conf 0.74), Q2@24.0Å(now 7.3,conf 0.74), E60@24.1Å(now 9.0,conf 0.73), E30@19.7Å(now 14.9,conf 0.57), V97@16.8Å(now 12.9,conf 0.55), K46@15.3Å(now 9.4,conf 0.55), L103@16.1Å(now 8.7,conf 0.55)
  - V1↔T26: targets 23.7/8.7Å but partners are 3.8Å apart → too_close_together by 11.2Å
  - E60↔P44: targets 24.1/9.8Å but partners are 4.5Å apart → too_close_together by 9.8Å
  - Q2↔P44: targets 24.0/9.8Å but partners are 4.6Å apart → too_close_together by 9.5Å
- **G50** — severity 78.76, 17 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): G18@7.0Å(now 13.2,conf 0.55), Q19@9.4Å(now 14.0,conf 0.55), E53@7.7Å(now 10.7,conf 0.55)
  - push-out (wants farther): D31@27.5Å(now 14.0,conf 1.00), K33@27.5Å(now 12.6,conf 1.00), R39@24.1Å(now 11.1,conf 0.73), R41@26.1Å(now 9.3,conf 0.73), S38@21.6Å(now 12.4,conf 0.61)
  - K33↔G18: targets 27.5/7.0Å but partners are 4.9Å apart → too_close_together by 15.6Å
  - R39↔G18: targets 24.1/7.0Å but partners are 3.3Å apart → too_close_together by 13.8Å
  - R41↔G18: targets 26.1/7.0Å but partners are 6.7Å apart → too_close_together by 12.4Å

## Secondary Structure (DSSP-like)

- helix(H)=78 · strand(E)=12 · 3-10(G)=11 · coil(C)=4

```
CHHEHHHHHHEHHHEHHHHHHHHHHEHHHHHEGHHHEHHGHEHHHHHHHHHHHGHHHHHHHHHHEHHHHHHHHHGHGGHHEGHCGHGGHCHHEHEGHHHEHHHHC
```

## Backbone H-bond Network

- total=68 · helix(i→i+4)=53 · sheet=15
  - Q2 ↔ I6  (helix)
  - T5 ↔ G9  (helix)
  - I6 ↔ D10  (helix)
  - P8 ↔ R12  (helix)
  - G9 ↔ T13  (helix)
  - D10 ↔ F14  (helix)
  - R12 ↔ K16  (helix)
  - T13 ↔ R17  (helix)
  - F14 ↔ G18  (helix)
  - K16 ↔ T20  (helix)
  - R17 ↔ C21  (helix)
  - G18 ↔ V22  (helix)
  - Q19 ↔ V23  (helix)
  - T20 ↔ H24  (helix)
  - C21 ↔ Y25  (helix)
  - V23 ↔ G27  (helix)
  - H24 ↔ M28  (helix)
  - Y25 ↔ L29  (helix)
  - G27 ↔ D31  (helix)
  - E30 ↔ K34  (helix)
  - … +48 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=40 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1356 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1074 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=7.5977 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=127 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
