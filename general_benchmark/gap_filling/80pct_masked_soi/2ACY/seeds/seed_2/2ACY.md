# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2ACY\seeds\seed_2\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 10.796 A
- tm_score_ca_ordered: 0.24322578040316548
- heavy_atom_rmsd: 11.791 A
- sidechain_heavy_atom_rmsd: 12.705 A
- **all-atom quality (honest):** heavy 11.791 A, sidechain 12.705 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 23
- distogram_pairs: 1236
- bin_accuracy: 0.376

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.796255127958707
- ga_delta_rmsd: -0.4671037781238052  ga_fitness_mode: energy
- pre_local_rmsd: 10.808441659274601  localized_anchor_rmsd: 10.796224762163398

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K56-H73 → 668 conflicts (54%); E1-F21 → 419 conflicts (34%); N81-F93 → 90 conflicts (7%)
- explained: 1177/1235 conflicts by 3 root cause(s)
- metrics: hubs=92 (frac 0.958), conflicts/hub=13.4, max_incompat=15.06Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K56-H73 + E1-F21 + N81-F93 — explain ~1177/1235 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H73** — severity 154.79, 34 conflict(s); suspect input ~`D92` (group: pull_in)
  - pull-in (wants closer): V19@9.3Å(now 15.1,conf 0.55), Q47@15.3Å(now 19.0,conf 0.55), G18@11.5Å(now 17.9,conf 0.55)
  - push-out (wants farther): F79@17.0Å(now 13.4,conf 1.00), H80@21.0Å(now 15.4,conf 1.00), L88@27.5Å(now 21.3,conf 1.00), V84@27.5Å(now 24.3,conf 1.00), T91@27.5Å(now 15.8,conf 1.00), D92@26.6Å(now 12.1,conf 0.78), V8@21.7Å(now 18.5,conf 0.61), D9@19.9Å(now 14.6,conf 0.58), I95@19.7Å(now 9.1,conf 0.57)
  - T91↔K67: targets 27.5/7.0Å but partners are 8.2Å apart → too_close_together by 12.3Å
  - K67↔D92: targets 7.0/26.6Å but partners are 4.5Å apart → too_close_together by 15.1Å
  - G68↔D92: targets 7.0/26.6Å but partners are 7.1Å apart → too_close_together by 12.5Å
- **G68** — severity 104.14, 31 conflict(s); suspect input ~`K87` (group: pull_in)
  - pull-in (wants closer): F21@6.4Å(now 12.7,conf 0.55), F20@9.1Å(now 16.2,conf 0.55), G44@15.2Å(now 18.9,conf 0.55)
  - push-out (wants farther): K87@27.3Å(now 19.1,conf 0.93), K83@23.1Å(now 17.4,conf 0.75), V84@24.7Å(now 19.8,conf 0.70), V96@17.3Å(now 5.3,conf 0.55)
  - W63↔K87: targets 7.0/27.3Å but partners are 11.8Å apart → too_close_together by 8.6Å
  - L64↔K87: targets 5.0/27.3Å but partners are 14.3Å apart → too_close_together by 8.0Å
  - L64↔K83: targets 5.0/23.1Å but partners are 10.6Å apart → too_close_together by 7.5Å
- **G44** — severity 99.77, 17 conflict(s); suspect input ~`L5` (group: pull_in)
  - pull-in (wants closer): G68@15.2Å(now 18.9,conf 0.55), G18@9.9Å(now 14.4,conf 0.55)
  - push-out (wants farther): T4@27.5Å(now 18.3,conf 1.00), L5@27.5Å(now 17.5,conf 1.00)
  - Q39↔T4: targets 11.0/27.5Å but partners are 8.3Å apart → too_close_together by 8.2Å
  - L5↔Q47: targets 27.5/10.9Å but partners are 8.4Å apart → too_close_together by 8.3Å
  - T4↔T41: targets 27.5/7.0Å but partners are 13.2Å apart → too_close_together by 7.3Å
- **P70** — severity 96.70, 28 conflict(s); suspect input ~`Y90` (group: push_out)
  - pull-in (wants closer): W63@11.0Å(now 14.4,conf 1.00), L64@11.0Å(now 14.3,conf 0.99), G48@19.5Å(now 23.8,conf 0.57), Q39@18.0Å(now 25.4,conf 0.55), T25@11.1Å(now 15.7,conf 0.55), F20@8.4Å(now 17.6,conf 0.55)
  - push-out (wants farther): D89@27.5Å(now 16.8,conf 1.00), L5@27.5Å(now 24.1,conf 0.99), Y90@27.3Å(now 13.1,conf 0.92), F93@19.9Å(now 10.7,conf 0.58)
  - K67↔Y90: targets 7.0/27.3Å but partners are 8.8Å apart → too_close_together by 11.5Å
  - W63↔Y90: targets 11.0/27.3Å but partners are 6.7Å apart → too_close_together by 9.6Å
  - W63↔D89: targets 11.0/27.5Å but partners are 8.2Å apart → too_close_together by 8.2Å
- **T45** — severity 95.16, 24 conflict(s); suspect input ~`E1` (group: push_out)
  - pull-in (wants closer): N40@5.4Å(now 8.3,conf 0.79), K71@15.0Å(now 19.1,conf 0.55), S78@11.0Å(now 14.0,conf 0.55), G18@10.8Å(now 15.0,conf 0.55), I74@10.2Å(now 13.2,conf 0.55)
  - push-out (wants farther): E1@27.4Å(now 14.1,conf 0.95), S7@19.9Å(now 13.3,conf 0.58), A27@18.7Å(now 16.1,conf 0.55), Y10@10.4Å(now 3.5,conf 0.55)
  - T41↔E1: targets 5.0/27.4Å but partners are 11.5Å apart → too_close_together by 10.9Å
  - E1↔Q39: targets 27.4/8.6Å but partners are 6.7Å apart → too_close_together by 12.1Å
  - E1↔N40: targets 27.4/5.4Å but partners are 9.9Å apart → too_close_together by 12.1Å
- **Y90** — severity 89.05, 19 conflict(s); suspect input ~`S69` (group: pull_in)
  - pull-in (wants closer): V46@18.8Å(now 21.5,conf 0.56), E11@18.5Å(now 21.9,conf 0.55), V38@12.5Å(now 17.7,conf 0.55), Q47@15.8Å(now 20.2,conf 0.55)
  - push-out (wants farther): D75@27.5Å(now 19.5,conf 0.98), G14@27.3Å(now 24.2,conf 0.93), P70@27.3Å(now 13.1,conf 0.92), S69@23.1Å(now 11.2,conf 0.74), A77@22.0Å(now 17.1,conf 0.63), W63@20.5Å(now 6.7,conf 0.59), S55@18.0Å(now 13.9,conf 0.55), M60@16.6Å(now 10.8,conf 0.55), K56@15.7Å(now 10.8,conf 0.55)
  - Q94↔P70: targets 9.0/27.3Å but partners are 6.6Å apart → too_close_together by 11.7Å
  - V96↔P70: targets 13.0/27.3Å but partners are 3.8Å apart → too_close_together by 10.5Å
  - Q94↔S69: targets 9.0/23.1Å but partners are 3.3Å apart → too_close_together by 10.8Å

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=31 · 3-10(G)=17 · coil(C)=10

```
EHHHCEEEGEECHHGHEGHHHEHGEGHEHEGGHGHHHHEEEHHGEHEGEGEEGEHHGEGHEHHCHEGGCHCCHEHEHHHHEEEHEGCCECHEHHHC
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=12 · sheet=41
  - V16 ↔ F20  (helix)
  - V19 ↔ K23  (helix)
  - K23 ↔ A27  (helix)
  - G29 ↔ G33  (helix)
  - G33 ↔ W37  (helix)
  - V38 ↔ D42  (helix)
  - D42 ↔ V46  (helix)
  - K56 ↔ M60  (helix)
  - H73 ↔ A77  (helix)
  - D75 ↔ F79  (helix)
  - H80 ↔ V84  (helix)
  - T91 ↔ I95  (helix)
  - E1 ↔ I6  (sheet)
  - E1 ↔ S7  (sheet)
  - E1 ↔ V8  (sheet)
  - Y10 ↔ R22  (sheet)
  - Y10 ↔ T25  (sheet)
  - E11 ↔ Q17  (sheet)
  - E11 ↔ R22  (sheet)
  - E11 ↔ T25  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=45 · exposed=27 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=421 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=232 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.8858 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=23 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
