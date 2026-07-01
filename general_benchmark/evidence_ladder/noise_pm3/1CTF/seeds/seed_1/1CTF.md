# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1CTF\seeds\seed_1\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 1.393 A
- tm_score_ca_ordered: 0.8246222090844635
- heavy_atom_rmsd: 2.609 A
- sidechain_heavy_atom_rmsd: 3.310 A
- **all-atom quality (honest):** heavy 2.609 A, sidechain 3.310 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 2016
- bin_accuracy: 0.322

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=1.7516783830936504 -> 1.479959053216225 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.392967388849536
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.4045257433648544  localized_anchor_rmsd: 1.3929649330198295

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V3-K12 → 495 conflicts (40%); A37-L41 → 261 conflicts (21%); V15-V19 → 150 conflicts (12%)
- explained: 906/1231 conflicts by 3 root cause(s)
- metrics: hubs=66 (frac 1.0), conflicts/hub=18.7, max_incompat=9.67Å, chain_span=0.985
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V3-K12 + A37-L41 + V15-V19 — explain ~906/1231 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V19** — severity 32.87, 57 conflict(s); suspect input ~`D49` (group: push_out)
  - pull-in (wants closer): L53@8.3Å(now 10.9,conf 0.21), A7@9.4Å(now 13.2,conf 0.17), A10@9.2Å(now 14.8,conf 0.18), V3@7.6Å(now 12.1,conf 0.24), I4@9.0Å(now 13.8,conf 0.18), A62@6.8Å(now 11.1,conf 0.28), P38@10.0Å(now 14.0,conf 0.16), D49@9.5Å(now 13.9,conf 0.17)
  - push-out (wants farther): A30@8.2Å(now 4.8,conf 0.21), G44@20.5Å(now 16.8,conf 0.24), E63@16.5Å(now 14.0,conf 0.15), N11@17.1Å(now 12.0,conf 0.16)
  - L25↔A62: targets 5.6/6.8Å but partners are 16.7Å apart → too_far_apart by 4.3Å
  - G44↔L41: targets 20.5/6.1Å but partners are 10.1Å apart → too_close_together by 4.3Å
  - G24↔A62: targets 7.0/6.8Å but partners are 17.7Å apart → too_far_apart by 3.8Å
- **L41** — severity 29.57, 53 conflict(s); suspect input ~`K28` (group: pull_in)
  - pull-in (wants closer): K28@9.0Å(now 13.5,conf 0.18), S36@7.3Å(now 9.8,conf 0.26), R20@8.0Å(now 12.5,conf 0.22), E65@6.5Å(now 10.0,conf 0.31), A22@8.5Å(now 11.6,conf 0.20), G26@10.4Å(now 13.6,conf 0.15)
  - push-out (wants farther): V3@8.9Å(now 5.5,conf 0.19), L27@16.6Å(now 13.8,conf 0.15), K12@18.4Å(now 15.1,conf 0.19), G61@19.1Å(now 15.6,conf 0.20), G21@16.9Å(now 13.6,conf 0.16), G44@18.0Å(now 10.1,conf 0.18), K31@16.7Å(now 12.3,conf 0.16), K55@18.1Å(now 15.0,conf 0.18)
  - K28↔E65: targets 9.0/6.5Å but partners are 22.2Å apart → too_far_apart by 6.8Å
  - K28↔F1: targets 9.0/8.5Å but partners are 22.9Å apart → too_far_apart by 5.4Å
  - R20↔G21: targets 8.0/16.9Å but partners are 3.5Å apart → too_close_together by 5.4Å
- **A40** — severity 29.09, 40 conflict(s); suspect input ~`V15` (group: pull_in)
  - pull-in (wants closer): D49@9.7Å(now 13.7,conf 0.16), T23@9.2Å(now 14.2,conf 0.18), V15@8.3Å(now 14.5,conf 0.21), A50@6.8Å(now 10.0,conf 0.29)
  - push-out (wants farther): A10@23.2Å(now 19.1,conf 0.37), V3@9.6Å(now 4.0,conf 0.17), E59@22.1Å(now 18.7,conf 0.31), A14@21.8Å(now 19.1,conf 0.29), D2@8.8Å(now 4.3,conf 0.19), D48@20.8Å(now 15.0,conf 0.25), E58@20.7Å(now 16.0,conf 0.25), E35@16.9Å(now 13.9,conf 0.16), G24@21.0Å(now 16.9,conf 0.26), K47@16.9Å(now 13.2,conf 0.16), A30@18.1Å(now 15.3,conf 0.18)
  - D48↔A50: targets 20.8/6.8Å but partners are 5.3Å apart → too_close_together by 8.7Å
  - A14↔V15: targets 21.8/8.3Å but partners are 4.8Å apart → too_close_together by 8.6Å
  - G24↔T23: targets 21.0/9.2Å but partners are 4.2Å apart → too_close_together by 7.6Å
- **V66** — severity 26.80, 34 conflict(s); suspect input ~`A37` (group: pull_in)
  - pull-in (wants closer): K28@18.1Å(now 23.2,conf 0.18), V13@19.0Å(now 21.6,conf 0.20), L5@7.0Å(now 10.0,conf 0.27), A37@9.1Å(now 15.4,conf 0.18), K6@6.5Å(now 11.6,conf 0.30)
  - push-out (wants farther): K31@24.4Å(now 20.9,conf 0.46), N11@22.8Å(now 19.1,conf 0.35), E35@22.9Å(now 19.4,conf 0.35), D2@9.7Å(now 5.6,conf 0.17), V15@18.9Å(now 15.9,conf 0.20), E59@20.6Å(now 14.9,conf 0.25), E51@10.0Å(now 6.7,conf 0.16), A22@18.6Å(now 15.3,conf 0.19), A60@18.8Å(now 15.8,conf 0.20)
  - E35↔K6: targets 22.9/6.5Å but partners are 10.8Å apart → too_close_together by 5.5Å
  - E35↔L5: targets 22.9/7.0Å but partners are 9.8Å apart → too_close_together by 6.0Å
  - S36↔A37: targets 20.2/9.1Å but partners are 3.6Å apart → too_close_together by 7.5Å
- **K17** — severity 24.73, 40 conflict(s); suspect input ~`V3` (group: push_out)
  - pull-in (wants closer): V3@9.2Å(now 17.0,conf 0.18), G61@7.8Å(now 11.1,conf 0.23), E59@8.5Å(now 11.6,conf 0.20), L5@9.5Å(now 13.9,conf 0.17), A8@6.4Å(now 11.1,conf 0.32), K55@9.1Å(now 15.7,conf 0.18)
  - push-out (wants farther): L53@16.7Å(now 14.1,conf 0.16), K6@19.9Å(now 16.2,conf 0.23), S36@17.8Å(now 14.7,conf 0.17), A30@9.5Å(now 6.9,conf 0.17), A39@21.3Å(now 15.8,conf 0.27)
  - K6↔A8: targets 19.9/6.4Å but partners are 6.2Å apart → too_close_together by 7.3Å
  - A39↔A8: targets 21.3/6.4Å but partners are 10.4Å apart → too_close_together by 4.5Å
  - K6↔L5: targets 19.9/9.5Å but partners are 3.6Å apart → too_close_together by 6.8Å
- **P38** — severity 22.02, 32 conflict(s); suspect input ~`V15` (group: pull_in)
  - pull-in (wants closer): K31@10.2Å(now 14.1,conf 0.15), A8@5.6Å(now 9.4,conf 0.38), V15@8.6Å(now 13.3,conf 0.20), V19@10.0Å(now 14.0,conf 0.16)
  - push-out (wants farther): S46@22.7Å(now 18.5,conf 0.34), K47@21.3Å(now 18.5,conf 0.28), L5@10.1Å(now 5.2,conf 0.16), E59@21.4Å(now 18.7,conf 0.28), I4@8.5Å(now 5.9,conf 0.20), R20@21.5Å(now 18.5,conf 0.28), K12@17.0Å(now 14.3,conf 0.16), A10@18.0Å(now 15.1,conf 0.18), V13@21.6Å(now 17.2,conf 0.29), K54@18.4Å(now 14.9,conf 0.19)
  - A8↔V13: targets 5.6/21.6Å but partners are 9.3Å apart → too_close_together by 6.7Å
  - V13↔V15: targets 21.6/8.6Å but partners are 5.7Å apart → too_close_together by 7.3Å
  - A14↔V15: targets 20.4/8.6Å but partners are 4.8Å apart → too_close_together by 7.0Å

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=18 · 3-10(G)=6 · coil(C)=5

```
CEEHHHHHHGHEHHHHHHHGGEEGEGHHEHEEHHHEEHHHHHHHHEHEHHEHCEHCHHCHGEHEEC
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=12 · sheet=21
  - I4 ↔ A8  (helix)
  - L5 ↔ G9  (helix)
  - G9 ↔ V13  (helix)
  - N11 ↔ V15  (helix)
  - V13 ↔ K17  (helix)
  - V15 ↔ V19  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - E35 ↔ A39  (helix)
  - A40 ↔ G44  (helix)
  - L41 ↔ V45  (helix)
  - V45 ↔ D49  (helix)
  - K12 ↔ E29  (sheet)
  - K12 ↔ K31  (sheet)
  - K12 ↔ D32  (sheet)
  - T23 ↔ E29  (sheet)
  - L25 ↔ K31  (sheet)
  - L25 ↔ D32  (sheet)
  - E29 ↔ S36  (sheet)
  - E29 ↔ A37  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=271 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=112 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7485 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
