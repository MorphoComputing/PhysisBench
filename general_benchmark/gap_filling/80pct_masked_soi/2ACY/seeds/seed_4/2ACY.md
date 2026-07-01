# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2ACY\seeds\seed_4\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 9.099 A
- tm_score_ca_ordered: 0.27898977572309575
- heavy_atom_rmsd: 10.451 A
- sidechain_heavy_atom_rmsd: 11.692 A
- **all-atom quality (honest):** heavy 10.451 A, sidechain 11.692 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 22
- distogram_pairs: 1236
- bin_accuracy: 0.434

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.098991150931756
- ga_delta_rmsd: 1.189841671403192  ga_fitness_mode: energy
- pre_local_rmsd: 9.098974321781117  localized_anchor_rmsd: 9.098974321781117

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K23-L32 → 419 conflicts (52%); L5-D9 → 122 conflicts (15%); K67-P70 → 70 conflicts (9%)
- explained: 611/799 conflicts by 3 root cause(s)
- metrics: hubs=82 (frac 0.854), conflicts/hub=9.7, max_incompat=12.27Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K23-L32 + L5-D9 + K67-P70 — explain ~611/799 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y24** — severity 106.40, 43 conflict(s); suspect input ~`A27` (group: pull_in)
  - pull-in (wants closer): K31@11.0Å(now 14.5,conf 0.99), A27@5.2Å(now 8.2,conf 0.57), S69@5.6Å(now 12.8,conf 0.56), H59@14.6Å(now 20.7,conf 0.55), K56@16.2Å(now 19.2,conf 0.55), L64@10.3Å(now 14.4,conf 0.55)
  - push-out (wants farther): V86@27.4Å(now 20.6,conf 0.95), E1@23.5Å(now 16.3,conf 0.76), V84@26.0Å(now 21.4,conf 0.72), T4@25.2Å(now 16.5,conf 0.69), V8@18.7Å(now 12.2,conf 0.56), T41@16.7Å(now 12.4,conf 0.55), N40@13.1Å(now 9.2,conf 0.55), Y10@15.5Å(now 9.7,conf 0.55), Q94@11.7Å(now 7.8,conf 0.55), Q39@12.2Å(now 8.9,conf 0.55)
  - K31↔V86: targets 11.0/27.4Å but partners are 7.1Å apart → too_close_together by 9.3Å
  - V86↔E28: targets 27.4/6.9Å but partners are 14.2Å apart → too_close_together by 6.3Å
  - K31↔V84: targets 11.0/26.0Å but partners are 7.3Å apart → too_close_together by 7.8Å
- **E28** — severity 90.05, 33 conflict(s); suspect input ~`K31` (group: pull_in)
  - pull-in (wants closer): L32@7.0Å(now 10.3,conf 0.99), K31@5.0Å(now 8.1,conf 0.57), K56@10.5Å(now 15.0,conf 0.55), E62@11.5Å(now 17.1,conf 0.55), S69@9.9Å(now 15.1,conf 0.55)
  - push-out (wants farther): Q43@23.1Å(now 20.3,conf 0.75), V86@22.7Å(now 14.2,conf 0.70), N81@21.1Å(now 13.3,conf 0.60), K83@21.1Å(now 13.2,conf 0.60), E82@19.5Å(now 12.6,conf 0.57), L88@18.0Å(now 9.9,conf 0.55), I6@17.2Å(now 9.4,conf 0.55), Y10@14.9Å(now 10.6,conf 0.55), Q39@14.7Å(now 10.6,conf 0.55), S7@16.4Å(now 7.8,conf 0.55), T91@15.6Å(now 10.3,conf 0.55), D92@12.4Å(now 9.1,conf 0.55), G36@11.6Å(now 7.8,conf 0.55), G48@13.8Å(now 9.8,conf 0.55)
  - V86↔K31: targets 22.7/5.0Å but partners are 7.1Å apart → too_close_together by 10.5Å
  - K83↔K31: targets 21.1/5.0Å but partners are 6.3Å apart → too_close_together by 9.8Å
  - L32↔K83: targets 7.0/21.1Å but partners are 5.0Å apart → too_close_together by 9.1Å
- **V84** — severity 82.11, 30 conflict(s); suspect input ~`I6` (group: pull_in)
  - pull-in (wants closer): I6@4.6Å(now 9.0,conf 0.60), E1@10.3Å(now 15.7,conf 0.55)
  - push-out (wants farther): F21@27.1Å(now 24.0,conf 0.88), Y24@26.0Å(now 21.4,conf 0.72), G68@24.7Å(now 21.3,conf 0.70), R22@25.0Å(now 20.9,conf 0.69), Q26@21.8Å(now 16.0,conf 0.62), K30@20.1Å(now 10.8,conf 0.58), G29@18.4Å(now 12.6,conf 0.55)
  - I6↔K30: targets 4.6/20.1Å but partners are 7.3Å apart → too_close_together by 8.1Å
  - K30↔S7: targets 20.1/6.5Å but partners are 5.6Å apart → too_close_together by 8.0Å
  - Q26↔I6: targets 21.8/4.6Å but partners are 10.1Å apart → too_close_together by 7.1Å
- **K71** — severity 70.95, 20 conflict(s); suspect input ~`E82` (group: pull_in)
  - pull-in (wants closer): A27@15.6Å(now 18.5,conf 0.55)
  - push-out (wants farther): R76@15.0Å(now 12.4,conf 1.00), S78@19.0Å(now 15.4,conf 1.00), N81@27.5Å(now 16.6,conf 0.99), E82@27.5Å(now 19.1,conf 0.98), E11@17.9Å(now 11.1,conf 0.55), T45@15.0Å(now 11.6,conf 0.55), A77@16.4Å(now 11.3,conf 0.55)
  - G68↔N81: targets 7.0/27.5Å but partners are 12.7Å apart → too_close_together by 7.8Å
  - L64↔N81: targets 13.0/27.5Å but partners are 7.0Å apart → too_close_together by 7.5Å
  - N81↔T66: targets 27.5/11.0Å but partners are 9.3Å apart → too_close_together by 7.2Å
- **P70** — severity 62.54, 30 conflict(s); suspect input ~`A27` (group: pull_in)
  - pull-in (wants closer): G33@21.1Å(now 24.4,conf 0.60), L34@20.6Å(now 23.2,conf 0.59), F93@19.9Å(now 22.9,conf 0.58), K30@17.7Å(now 21.5,conf 0.55), A27@13.1Å(now 18.5,conf 0.55), T25@11.1Å(now 16.0,conf 0.55)
  - push-out (wants farther): T4@27.5Å(now 23.4,conf 1.00), L5@27.5Å(now 22.1,conf 0.99), D75@15.0Å(now 7.4,conf 0.99), E1@27.4Å(now 20.2,conf 0.97), I6@27.3Å(now 20.4,conf 0.93), R76@16.9Å(now 8.6,conf 0.91), A77@16.9Å(now 8.9,conf 0.91), H73@8.6Å(now 2.4,conf 0.79), V8@23.3Å(now 16.4,conf 0.76), G48@19.5Å(now 15.7,conf 0.57), I74@10.6Å(now 5.5,conf 0.55)
  - K67↔A77: targets 7.0/16.9Å but partners are 3.6Å apart → too_close_together by 6.3Å
  - K67↔R76: targets 7.0/16.9Å but partners are 5.9Å apart → too_close_together by 4.0Å
  - Y90↔A27: targets 27.3/13.1Å but partners are 7.9Å apart → too_close_together by 6.3Å
- **K23** — severity 54.40, 21 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): E1@26.8Å(now 13.5,conf 0.81), H80@22.2Å(now 13.6,conf 0.65), D89@21.2Å(now 14.7,conf 0.60), V8@19.5Å(now 10.4,conf 0.57)
  - Q26↔E1: targets 5.0/26.8Å but partners are 14.4Å apart → too_close_together by 7.4Å
  - F20↔E1: targets 5.0/26.8Å but partners are 15.9Å apart → too_close_together by 5.8Å
  - Q26↔V8: targets 5.0/19.5Å but partners are 7.5Å apart → too_close_together by 7.0Å

## Secondary Structure (DSSP-like)

- helix(H)=44 · strand(E)=35 · 3-10(G)=11 · coil(C)=6

```
EHEHHHEEEEHHHHHHEHGCHEHEEGHGHCCHEGHGEEEEEHHEHEECEEEEEEHHHHHHEHEHHHEGHHHEEHHHHHHHEHGHGCEGGEHEEGHC
```

## Backbone H-bond Network

- total=91 · helix(i→i+4)=16 · sheet=75
  - G2 ↔ I6  (helix)
  - E11 ↔ K15  (helix)
  - I12 ↔ V16  (helix)
  - G14 ↔ G18  (helix)
  - K23 ↔ A27  (helix)
  - K56 ↔ M60  (helix)
  - M60 ↔ L64  (helix)
  - E65 ↔ S69  (helix)
  - T66 ↔ P70  (helix)
  - P70 ↔ I74  (helix)
  - K71 ↔ D75  (helix)
  - I74 ↔ S78  (helix)
  - D75 ↔ F79  (helix)
  - S78 ↔ E82  (helix)
  - H80 ↔ V84  (helix)
  - T91 ↔ I95  (helix)
  - E1 ↔ S7  (sheet)
  - S7 ↔ R22  (sheet)
  - S7 ↔ T25  (sheet)
  - V8 ↔ R22  (sheet)
  - … +71 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=51 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=532 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=350 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.3006 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=22 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
