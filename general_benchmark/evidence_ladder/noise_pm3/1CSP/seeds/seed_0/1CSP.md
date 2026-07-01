# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1CSP\seeds\seed_0\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 1.567 A
- tm_score_ca_ordered: 0.7944160609511777
- heavy_atom_rmsd: 3.363 A
- sidechain_heavy_atom_rmsd: 4.134 A
- **all-atom quality (honest):** heavy 3.363 A, sidechain 4.134 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 1953
- bin_accuracy: 0.320

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=2.3464326417435415 -> 2.0418930294653364 A
- topology_reconvergence: applied=True accepted=4/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=426 mode=rotamer
- phase_b_ca_rmsd_after: 1.5666851906978783
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.5898343581228755  localized_anchor_rmsd: 1.5667151677702935

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S47-A60 → 614 conflicts (49%); A31-E41 → 305 conflicts (24%); V5-N9 → 117 conflicts (9%)
- explained: 1036/1256 conflicts by 3 root cause(s)
- metrics: hubs=65 (frac 1.0), conflicts/hub=19.3, max_incompat=10.0Å, chain_span=0.985
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S47-A60 + A31-E41 + V5-N9 — explain ~1036/1256 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E52** — severity 38.41, 44 conflict(s); suspect input ~`F26` (group: pull_in)
  - pull-in (wants closer): E41@19.0Å(now 23.1,conf 0.20), F26@6.5Å(now 10.1,conf 0.30), D23@8.4Å(now 13.3,conf 0.20)
  - push-out (wants farther): K38@24.3Å(now 20.5,conf 0.46), K6@24.6Å(now 19.4,conf 0.48), G13@21.7Å(now 18.1,conf 0.29), V5@21.8Å(now 19.3,conf 0.30), T63@21.0Å(now 18.2,conf 0.26), E2@20.2Å(now 16.8,conf 0.24), G21@18.7Å(now 15.6,conf 0.19), D24@18.8Å(now 13.9,conf 0.20)
  - K6↔Q58: targets 24.6/5.6Å but partners are 12.5Å apart → too_close_together by 6.5Å
  - K6↔F26: targets 24.6/6.5Å but partners are 10.6Å apart → too_close_together by 7.5Å
  - W7↔F26: targets 21.9/6.5Å but partners are 9.9Å apart → too_close_together by 5.4Å
- **G36** — severity 35.00, 49 conflict(s); suspect input ~`A31` (group: push_out)
  - pull-in (wants closer): G21@26.1Å(now 29.5,conf 0.66), E20@22.8Å(now 27.0,conf 0.35), G56@21.7Å(now 26.6,conf 0.29), D24@22.2Å(now 25.4,conf 0.31), K6@17.8Å(now 21.3,conf 0.17), S47@9.1Å(now 15.5,conf 0.18), A31@7.7Å(now 12.8,conf 0.24), L40@8.9Å(now 11.5,conf 0.19)
  - push-out (wants farther): F26@22.1Å(now 19.4,conf 0.31), E49@21.8Å(now 18.8,conf 0.30), F16@24.3Å(now 20.8,conf 0.46), W7@24.6Å(now 21.0,conf 0.49), A45@20.8Å(now 16.8,conf 0.25), E11@23.3Å(now 17.6,conf 0.38), V46@18.8Å(now 15.3,conf 0.20)
  - G53↔A31: targets 26.6/7.7Å but partners are 12.5Å apart → too_close_together by 6.4Å
  - F26↔A31: targets 22.1/7.7Å but partners are 8.1Å apart → too_close_together by 6.3Å
  - E52↔A31: targets 25.2/7.7Å but partners are 11.9Å apart → too_close_together by 5.6Å
- **N9** — severity 30.69, 38 conflict(s); suspect input ~`I17` (group: pull_in)
  - pull-in (wants closer): E41@6.5Å(now 9.1,conf 0.31), V5@8.6Å(now 12.4,conf 0.20), K38@8.0Å(now 13.2,conf 0.22), I17@7.7Å(now 12.2,conf 0.24)
  - push-out (wants farther): G56@22.5Å(now 19.4,conf 0.33), E2@22.7Å(now 20.1,conf 0.34), E65@22.6Å(now 17.8,conf 0.34), G3@21.9Å(now 18.8,conf 0.30), G43@16.7Å(now 11.8,conf 0.16), K64@17.4Å(now 13.8,conf 0.17), V25@17.6Å(now 13.4,conf 0.17), Q58@18.8Å(now 14.5,conf 0.20)
  - E65↔E41: targets 22.6/6.5Å but partners are 9.9Å apart → too_close_together by 6.2Å
  - G3↔I17: targets 21.9/7.7Å but partners are 7.6Å apart → too_close_together by 6.6Å
  - E65↔L40: targets 22.6/7.5Å but partners are 9.6Å apart → too_close_together by 5.6Å
- **V27** — severity 28.46, 44 conflict(s); suspect input ~`G53` (group: push_out)
  - pull-in (wants closer): K64@9.4Å(now 12.3,conf 0.17), A45@9.9Å(now 12.5,conf 0.16), D24@5.7Å(now 9.6,conf 0.38), E18@7.0Å(now 10.6,conf 0.27), E42@9.6Å(now 12.1,conf 0.17), G53@10.1Å(now 12.8,conf 0.15), S10@8.7Å(now 11.2,conf 0.20), K6@6.3Å(now 10.2,conf 0.32), G56@7.4Å(now 11.2,conf 0.25)
  - push-out (wants farther): G21@20.2Å(now 16.7,conf 0.23)
  - D24↔I32: targets 5.7/7.2Å but partners are 17.9Å apart → too_far_apart by 5.0Å
  - K6↔G56: targets 6.3/7.4Å but partners are 18.2Å apart → too_far_apart by 4.5Å
  - K64↔G56: targets 9.4/7.4Å but partners are 23.0Å apart → too_far_apart by 6.2Å
- **V51** — severity 21.22, 29 conflict(s); suspect input ~`T63` (group: pull_in)
  - pull-in (wants closer): G43@18.5Å(now 21.8,conf 0.19), E42@17.6Å(now 21.3,conf 0.17), Q44@17.8Å(now 20.5,conf 0.17), E65@16.4Å(now 19.0,conf 0.15), Q58@5.6Å(now 8.2,conf 0.38), T63@7.5Å(now 15.2,conf 0.24)
  - push-out (wants farther): K12@22.0Å(now 19.0,conf 0.30), K38@20.9Å(now 17.6,conf 0.26), A59@9.7Å(now 6.1,conf 0.16), A60@10.4Å(now 6.7,conf 0.15), K4@19.5Å(now 16.7,conf 0.21), G3@19.1Å(now 14.5,conf 0.20), F14@17.8Å(now 15.0,conf 0.17)
  - K64↔T63: targets 19.3/7.5Å but partners are 4.6Å apart → too_close_together by 7.2Å
  - L40↔T63: targets 21.4/7.5Å but partners are 7.8Å apart → too_close_together by 6.1Å
  - K38↔T63: targets 20.9/7.5Å but partners are 8.5Å apart → too_close_together by 4.8Å
- **E41** — severity 19.85, 28 conflict(s); suspect input ~`F26` (group: pull_in)
  - pull-in (wants closer): E52@19.0Å(now 23.1,conf 0.20), N9@6.5Å(now 9.1,conf 0.31), G3@9.8Å(now 14.5,conf 0.16), F26@8.8Å(now 14.0,conf 0.19), F29@9.6Å(now 12.1,conf 0.17)
  - push-out (wants farther): E49@22.1Å(now 18.3,conf 0.31), Q58@20.8Å(now 17.4,conf 0.26), E2@19.2Å(now 15.1,conf 0.21), K12@16.7Å(now 14.0,conf 0.16), G34@18.0Å(now 14.7,conf 0.18), V19@19.1Å(now 15.5,conf 0.20), Q33@17.1Å(now 13.9,conf 0.16)
  - Q58↔F26: targets 20.8/8.8Å but partners are 3.8Å apart → too_close_together by 8.2Å
  - E2↔V46: targets 19.2/7.6Å but partners are 6.0Å apart → too_close_together by 5.6Å
  - E49↔V46: targets 22.1/7.6Å but partners are 9.8Å apart → too_close_together by 4.7Å

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=33 · 3-10(G)=15 · coil(C)=8

```
CEEEEEEGEGEHGEEEECEEHEEGECEGGHHEEEEEHGEGEGCECGGEGGGCECGCEHEEHHEHE
```

## Backbone H-bond Network

- total=83 · helix(i→i+4)=1 · sheet=82
  - Q58 ↔ V62  (helix)
  - E2 ↔ F16  (sheet)
  - E2 ↔ I17  (sheet)
  - E2 ↔ V19  (sheet)
  - E2 ↔ E20  (sheet)
  - E2 ↔ Q22  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ I17  (sheet)
  - G3 ↔ V19  (sheet)
  - G3 ↔ E20  (sheet)
  - G3 ↔ Q22  (sheet)
  - G3 ↔ D23  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ I17  (sheet)
  - K4 ↔ V19  (sheet)
  - K4 ↔ E20  (sheet)
  - K4 ↔ Q22  (sheet)
  - K4 ↔ D23  (sheet)
  - V5 ↔ G15  (sheet)
  - … +63 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=248 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=154 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7336 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
