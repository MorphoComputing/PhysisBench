# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1FKF\seeds\seed_1\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 10.805 A
- tm_score_ca_ordered: 0.17971667540873656
- heavy_atom_rmsd: 11.360 A
- sidechain_heavy_atom_rmsd: 11.944 A
- **all-atom quality (honest):** heavy 11.360 A, sidechain 11.944 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 33
- distogram_pairs: 1087
- bin_accuracy: 0.283

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.804993455969191
- ga_delta_rmsd: 1.3042860182577805  ga_fitness_mode: energy
- pre_local_rmsd: 10.808434011426044  localized_anchor_rmsd: 10.804958335566914

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S38-G82 → 1126 conflicts (85%); G27-F35 → 102 conflicts (8%)
- explained: 1228/1326 conflicts by 2 root cause(s)
- metrics: hubs=102 (frac 0.971), conflicts/hub=13.0, max_incompat=14.11Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S38-G82 + G27-F35 — explain ~1228/1326 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V67** — severity 131.06, 45 conflict(s); suspect input ~`V62` (group: pull_in)
  - pull-in (wants closer): G9@5.2Å(now 20.5,conf 0.57), L102@5.5Å(now 9.2,conf 0.56), V22@9.7Å(now 15.0,conf 0.55), H24@12.2Å(now 17.1,conf 0.55)
  - push-out (wants farther): G88@27.5Å(now 13.4,conf 1.00), P91@27.5Å(now 21.3,conf 1.00), H93@27.5Å(now 24.5,conf 1.00), G85@27.5Å(now 20.4,conf 1.00), D78@27.1Å(now 20.6,conf 0.88), S76@23.6Å(now 16.8,conf 0.76), A71@11.2Å(now 8.5,conf 0.55), T20@12.1Å(now 8.2,conf 0.55)
  - R70↔G88: targets 9.0/27.5Å but partners are 4.4Å apart → too_close_together by 14.1Å
  - G88↔L102: targets 27.5/5.5Å but partners are 9.0Å apart → too_close_together by 13.0Å
  - G88↔V62: targets 27.5/9.4Å but partners are 9.2Å apart → too_close_together by 8.9Å
- **A63** — severity 96.77, 33 conflict(s); suspect input ~`F14` (group: push_out)
  - pull-in (wants closer): F14@6.4Å(now 19.7,conf 0.55), R17@8.9Å(now 13.2,conf 0.55), T5@13.5Å(now 16.4,conf 0.55), P8@14.3Å(now 18.8,conf 0.55), D10@13.8Å(now 24.0,conf 0.55)
  - push-out (wants farther): D36@21.3Å(now 15.8,conf 0.60), P44@17.5Å(now 9.5,conf 0.55), M48@10.6Å(now 5.1,conf 0.55), F45@15.6Å(now 10.3,conf 0.55)
  - E60↔F14: targets 5.4/6.4Å but partners are 24.0Å apart → too_far_apart by 12.2Å
  - G57↔F14: targets 9.0/6.4Å but partners are 26.6Å apart → too_far_apart by 11.2Å
  - F14↔R56: targets 6.4/10.8Å but partners are 28.0Å apart → too_far_apart by 10.8Å
- **L49** — severity 93.78, 40 conflict(s); suspect input ~`F14` (group: pull_in)
  - pull-in (wants closer): T20@7.5Å(now 15.9,conf 0.55), T13@14.6Å(now 20.7,conf 0.55), V22@11.4Å(now 20.2,conf 0.55), F14@11.6Å(now 22.8,conf 0.55), C21@8.0Å(now 14.2,conf 0.55)
  - push-out (wants farther): K46@11.0Å(now 7.6,conf 0.99), V54@7.0Å(now 3.3,conf 0.99), N42@23.4Å(now 15.7,conf 0.91), P44@16.9Å(now 9.8,conf 0.91), R56@10.9Å(now 6.9,conf 0.91), D36@20.9Å(now 15.8,conf 0.60), K43@19.5Å(now 13.3,conf 0.57), F45@13.2Å(now 9.5,conf 0.55)
  - E53↔F14: targets 6.0/11.6Å but partners are 27.1Å apart → too_far_apart by 9.5Å
  - Q52↔F14: targets 7.5/11.6Å but partners are 27.0Å apart → too_far_apart by 7.9Å
  - E53↔T20: targets 6.0/7.5Å but partners are 21.3Å apart → too_far_apart by 7.8Å
- **P77** — severity 92.16, 27 conflict(s); suspect input ~`Y81` (group: pull_in)
  - pull-in (wants closer): T95@5.3Å(now 9.8,conf 0.56), E30@11.6Å(now 14.4,conf 0.55)
  - push-out (wants farther): A71@19.0Å(now 11.2,conf 1.00), L73@13.0Å(now 6.0,conf 0.99), K43@27.0Å(now 11.3,conf 0.84), R70@22.9Å(now 12.4,conf 0.79), T74@10.6Å(now 2.5,conf 0.79), A80@4.9Å(now 1.3,conf 0.58), T84@9.2Å(now 3.7,conf 0.55), K72@15.8Å(now 9.9,conf 0.55), W58@12.2Å(now 8.3,conf 0.55)
  - K43↔Y81: targets 27.0/6.0Å but partners are 10.4Å apart → too_close_together by 10.5Å
  - K43↔T95: targets 27.0/5.3Å but partners are 9.3Å apart → too_close_together by 12.3Å
  - G82↔K43: targets 5.0/27.0Å but partners are 13.8Å apart → too_close_together by 8.2Å
- **M48** — severity 91.20, 26 conflict(s); suspect input ~`T20` (group: pull_in)
  - pull-in (wants closer): E53@5.1Å(now 8.1,conf 0.91), T20@4.8Å(now 15.7,conf 0.58), T13@15.2Å(now 21.5,conf 0.55)
  - push-out (wants farther): D31@27.5Å(now 24.7,conf 0.99), K51@9.0Å(now 4.7,conf 0.94), G32@27.2Å(now 19.7,conf 0.90), E30@26.6Å(now 22.1,conf 0.78), K34@23.6Å(now 18.4,conf 0.76), A63@10.6Å(now 5.1,conf 0.55), E60@12.1Å(now 6.7,conf 0.55)
  - F45↔G32: targets 10.9/27.2Å but partners are 7.4Å apart → too_close_together by 8.9Å
  - E53↔G32: targets 5.1/27.2Å but partners are 14.2Å apart → too_close_together by 7.9Å
  - E53↔T20: targets 5.1/4.8Å but partners are 21.3Å apart → too_far_apart by 11.4Å
- **Q64** — severity 88.19, 35 conflict(s); suspect input ~`F14` (group: pull_in)
  - pull-in (wants closer): F14@6.8Å(now 21.7,conf 0.55), R12@10.9Å(now 24.0,conf 0.55), G9@10.5Å(now 21.1,conf 0.55), Q2@10.0Å(now 17.1,conf 0.55)
  - push-out (wants farther): W58@9.0Å(now 6.0,conf 0.99), A71@11.0Å(now 5.6,conf 0.99), S38@20.6Å(now 12.9,conf 0.59), Q52@17.2Å(now 8.8,conf 0.55), V54@15.1Å(now 8.1,conf 0.55), T74@13.2Å(now 10.3,conf 0.55), F47@15.3Å(now 9.1,conf 0.55)
  - E60↔F14: targets 6.8/6.8Å but partners are 24.0Å apart → too_far_apart by 10.4Å
  - G57↔F14: targets 10.0/6.8Å but partners are 26.6Å apart → too_far_apart by 9.8Å
  - G61↔F14: targets 5.0/6.8Å but partners are 20.1Å apart → too_far_apart by 8.3Å

## Secondary Structure (DSSP-like)

- helix(H)=56 · strand(E)=29 · 3-10(G)=13 · coil(C)=7

```
CEHHHHHEGHGHCGEEHHEGHHEEEEEEEHHGHGHHHHGHEGGEHEEHHHHHHHHHHHHHHHHCEGCHHHEHHHHHEHHHHHHGGEEHEHEHEEECECEEGHHHC
```

## Backbone H-bond Network

- total=72 · helix(i→i+4)=27 · sheet=45
  - V3 ↔ S7  (helix)
  - I6 ↔ D10  (helix)
  - R17 ↔ C21  (helix)
  - G18 ↔ V22  (helix)
  - D31 ↔ F35  (helix)
  - K33 ↔ S37  (helix)
  - D36 ↔ D40  (helix)
  - F45 ↔ L49  (helix)
  - M48 ↔ Q52  (helix)
  - L49 ↔ E53  (helix)
  - G50 ↔ V54  (helix)
  - K51 ↔ I55  (helix)
  - Q52 ↔ R56  (helix)
  - E53 ↔ G57  (helix)
  - V54 ↔ W58  (helix)
  - I55 ↔ E59  (helix)
  - R56 ↔ E60  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - G68 ↔ K72  (helix)
  - … +52 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=42 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=634 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=413 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.9751 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=33 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
