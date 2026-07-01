# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/2ACY/sequence/2ACY.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/2ACY/seeds/seed_1/2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 10.234 A
- tm_score_ca_ordered: 0.22017198331438173
- heavy_atom_rmsd: 11.222 A
- sidechain_heavy_atom_rmsd: 12.047 A
- **all-atom quality (honest):** heavy 11.222 A, sidechain 12.047 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 51
- distogram_pairs: 874
- bin_accuracy: 0.278

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.233670940847626
- ga_delta_rmsd: -0.33916805108720105  ga_fitness_mode: energy
- pre_local_rmsd: 10.25906882672252  localized_anchor_rmsd: 10.233652476938845

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** H80-F93 → 230 conflicts (52%); I12-V16 → 58 conflicts (13%); I6-D9 → 38 conflicts (8%)
- explained: 326/446 conflicts by 3 root cause(s)
- metrics: hubs=83 (frac 0.865), conflicts/hub=5.4, max_incompat=11.12Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): H80-F93 + I12-V16 + I6-D9 — explain ~326/446 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E65** — severity 41.63, 14 conflict(s); suspect input ~`Q61` (group: pull_in)
  - pull-in (wants closer): V16@11.5Å(now 17.1,conf 0.55)
  - push-out (wants farther): V86@26.6Å(now 16.4,conf 0.78), K87@26.2Å(now 18.2,conf 0.74), V84@21.1Å(now 15.2,conf 0.60), G36@17.1Å(now 12.9,conf 0.55), S72@11.1Å(now 6.5,conf 0.55), W37@16.4Å(now 13.0,conf 0.55), H80@13.9Å(now 3.8,conf 0.55), K71@14.0Å(now 10.2,conf 0.55)
  - V86↔Q61: targets 26.6/6.3Å but partners are 9.2Å apart → too_close_together by 11.1Å
  - V86↔M60: targets 26.6/8.6Å but partners are 7.6Å apart → too_close_together by 10.4Å
  - K87↔Q61: targets 26.2/6.3Å but partners are 10.6Å apart → too_close_together by 9.3Å
- **A77** — severity 39.66, 18 conflict(s); suspect input ~`Q61` (group: pull_in)
  - pull-in (wants closer): I12@4.6Å(now 10.7,conf 0.59), G44@13.3Å(now 16.7,conf 0.55)
  - push-out (wants farther): D89@22.7Å(now 15.6,conf 0.70), Y90@22.0Å(now 14.8,conf 0.63), K30@19.8Å(now 15.5,conf 0.57), A27@18.5Å(now 12.2,conf 0.55), G68@10.7Å(now 4.3,conf 0.55), K71@16.4Å(now 9.4,conf 0.55), V38@13.5Å(now 10.9,conf 0.55), M60@11.6Å(now 8.5,conf 0.55), S7@15.8Å(now 12.8,conf 0.55)
  - I12↔A27: targets 4.6/18.5Å but partners are 4.8Å apart → too_close_together by 9.1Å
  - I12↔Q26: targets 4.6/16.6Å but partners are 5.1Å apart → too_close_together by 6.8Å
  - I12↔V38: targets 4.6/13.5Å but partners are 3.2Å apart → too_close_together by 5.6Å
- **F21** — severity 32.30, 17 conflict(s); suspect input ~`G68` (group: pull_in)
  - pull-in (wants closer): G68@6.4Å(now 14.4,conf 0.55), S72@7.0Å(now 13.7,conf 0.55)
  - push-out (wants farther): V84@27.1Å(now 23.4,conf 0.88), H80@19.9Å(now 12.9,conf 0.58), G14@11.3Å(now 4.9,conf 0.55), Q39@9.5Å(now 5.5,conf 0.55), S78@16.1Å(now 10.8,conf 0.55)
  - H80↔G68: targets 19.9/6.4Å but partners are 7.2Å apart → too_close_together by 6.4Å
  - G68↔K15: targets 6.4/9.6Å but partners are 21.4Å apart → too_far_apart by 5.5Å
  - V84↔R58: targets 27.1/18.5Å but partners are 3.7Å apart → too_close_together by 5.0Å
- **V84** — severity 30.49, 17 conflict(s); suspect input ~`V8` (group: pull_in)
  - pull-in (wants closer): I6@4.6Å(now 7.8,conf 0.60), V8@9.0Å(now 12.0,conf 0.55)
  - push-out (wants farther): K71@27.5Å(now 23.0,conf 1.00), H73@27.5Å(now 21.8,conf 1.00), F21@27.1Å(now 23.4,conf 0.88), I95@23.1Å(now 18.9,conf 0.74), G68@24.7Å(now 16.2,conf 0.70), E65@21.1Å(now 15.2,conf 0.60), S78@18.1Å(now 14.1,conf 0.55), G36@14.8Å(now 12.2,conf 0.55), S55@12.6Å(now 9.7,conf 0.55)
  - I95↔I6: targets 23.1/4.6Å but partners are 12.6Å apart → too_close_together by 5.9Å
  - I95↔V8: targets 23.1/9.0Å but partners are 8.0Å apart → too_close_together by 6.1Å
  - I95↔S7: targets 23.1/6.5Å but partners are 11.3Å apart → too_close_together by 5.3Å
- **R76** — severity 28.73, 13 conflict(s); suspect input ~`M60` (group: pull_in)
  - pull-in (wants closer): G14@6.7Å(now 12.6,conf 0.55), V16@10.4Å(now 13.3,conf 0.55)
  - push-out (wants farther): V86@27.5Å(now 19.0,conf 1.00), K87@27.5Å(now 20.1,conf 1.00), D89@27.1Å(now 18.8,conf 0.86), F93@21.9Å(now 14.9,conf 0.63), S7@19.6Å(now 15.7,conf 0.57), E28@18.6Å(now 12.5,conf 0.55), H73@9.2Å(now 6.2,conf 0.55), M60@14.5Å(now 11.7,conf 0.55), V19@16.1Å(now 13.3,conf 0.55), S72@11.8Å(now 5.0,conf 0.55)
  - G14↔G18: targets 6.7/17.2Å but partners are 3.6Å apart → too_close_together by 6.9Å
  - G14↔V19: targets 6.7/16.1Å but partners are 3.6Å apart → too_close_together by 5.8Å
  - V86↔M60: targets 27.5/14.5Å but partners are 7.6Å apart → too_close_together by 5.4Å
- **F13** — severity 24.84, 16 conflict(s); suspect input ~`L64` (group: pull_in)
  - pull-in (wants closer): G52@22.8Å(now 26.7,conf 0.71), I74@6.1Å(now 15.2,conf 0.55), L64@10.1Å(now 15.9,conf 0.55), S72@10.1Å(now 17.1,conf 0.55)
  - push-out (wants farther): T4@27.5Å(now 23.0,conf 0.98), I85@27.2Å(now 24.7,conf 0.90), L88@27.0Å(now 23.7,conf 0.84), F93@20.2Å(now 16.5,conf 0.58), T25@14.1Å(now 5.3,conf 0.55)
  - I85↔L64: targets 27.2/10.1Å but partners are 10.6Å apart → too_close_together by 6.5Å
  - I85↔I74: targets 27.2/6.1Å but partners are 16.9Å apart → too_close_together by 4.2Å
  - L88↔L64: targets 27.0/10.1Å but partners are 13.0Å apart → too_close_together by 3.9Å

## Secondary Structure (DSSP-like)

- helix(H)=54 · strand(E)=28 · 3-10(G)=10 · coil(C)=4

```
EEHGHHEEEEHHGHHHHEHHEGGHCGHCHHEHHHHEEHHEHHEHEHGGECEEEEHGEHHHEGHHHHHEHHHHHHHHHHHEEHEHHHHHHHHEGEEC
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=26 · sheet=35
  - E11 ↔ K15  (helix)
  - I12 ↔ V16  (helix)
  - K15 ↔ V19  (helix)
  - V16 ↔ F20  (helix)
  - F20 ↔ Y24  (helix)
  - G29 ↔ G33  (helix)
  - K30 ↔ L34  (helix)
  - V35 ↔ Q39  (helix)
  - D42 ↔ V46  (helix)
  - S55 ↔ H59  (helix)
  - H59 ↔ W63  (helix)
  - W63 ↔ K67  (helix)
  - E65 ↔ S69  (helix)
  - T66 ↔ P70  (helix)
  - K67 ↔ K71  (helix)
  - S69 ↔ H73  (helix)
  - P70 ↔ I74  (helix)
  - K71 ↔ D75  (helix)
  - S72 ↔ R76  (helix)
  - H73 ↔ A77  (helix)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=37 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=660 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=440 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.3598 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=51 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
