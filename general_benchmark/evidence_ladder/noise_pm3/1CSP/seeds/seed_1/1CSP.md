# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1CSP\seeds\seed_1\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 1.580 A
- tm_score_ca_ordered: 0.7869423300902194
- heavy_atom_rmsd: 2.997 A
- sidechain_heavy_atom_rmsd: 3.845 A
- **all-atom quality (honest):** heavy 2.997 A, sidechain 3.845 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.015
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 1953
- bin_accuracy: 0.310

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=2.126566165817605 -> 1.7787719204140857 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.5795567156508228
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.6085961002559024  localized_anchor_rmsd: 1.5795199613274047

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K12-E41 → 1018 conflicts (80%); V46-E65 → 224 conflicts (18%)
- explained: 1242/1275 conflicts by 2 root cause(s)
- metrics: hubs=65 (frac 1.0), conflicts/hub=19.6, max_incompat=9.77Å, chain_span=0.985
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K12-E41 + V46-E65 — explain ~1242/1275 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E52** — severity 46.28, 57 conflict(s); suspect input ~`F26` (group: pull_in)
  - pull-in (wants closer): E41@19.0Å(now 23.0,conf 0.20), F26@6.5Å(now 10.1,conf 0.30), D23@8.4Å(now 11.3,conf 0.20), H28@9.5Å(now 12.4,conf 0.17)
  - push-out (wants farther): K38@24.3Å(now 20.9,conf 0.46), W7@21.9Å(now 19.0,conf 0.30), K6@24.6Å(now 18.8,conf 0.48), G13@21.7Å(now 18.5,conf 0.29), G56@7.3Å(now 4.5,conf 0.25), V5@21.8Å(now 18.2,conf 0.30), T63@21.0Å(now 18.3,conf 0.26), E2@20.2Å(now 15.6,conf 0.24), G21@18.7Å(now 13.4,conf 0.19), D24@18.8Å(now 13.2,conf 0.20), V19@18.1Å(now 13.3,conf 0.18)
  - K6↔Q58: targets 24.6/5.6Å but partners are 12.0Å apart → too_close_together by 7.0Å
  - K6↔F26: targets 24.6/6.5Å but partners are 10.9Å apart → too_close_together by 7.1Å
  - G13↔F26: targets 21.7/6.5Å but partners are 9.7Å apart → too_close_together by 5.4Å
- **G36** — severity 33.09, 48 conflict(s); suspect input ~`A31` (group: push_out)
  - pull-in (wants closer): G21@26.1Å(now 29.5,conf 0.66), E20@22.8Å(now 27.0,conf 0.35), G56@21.7Å(now 26.8,conf 0.29), R55@24.6Å(now 27.2,conf 0.48), V51@19.0Å(now 21.6,conf 0.20), D24@22.2Å(now 25.0,conf 0.31), K6@17.8Å(now 20.4,conf 0.17), S47@9.1Å(now 15.6,conf 0.18), A31@7.7Å(now 12.4,conf 0.24)
  - push-out (wants farther): E49@21.8Å(now 19.1,conf 0.30), F16@24.3Å(now 20.3,conf 0.46), W7@24.6Å(now 20.1,conf 0.49), V5@22.3Å(now 19.2,conf 0.32), A45@20.8Å(now 17.0,conf 0.25), E11@23.3Å(now 17.2,conf 0.38), V46@18.8Å(now 15.2,conf 0.20)
  - G53↔A31: targets 26.6/7.7Å but partners are 13.2Å apart → too_close_together by 5.8Å
  - E2↔S47: targets 20.2/9.1Å but partners are 4.1Å apart → too_close_together by 7.1Å
  - G3↔S47: targets 22.1/9.1Å but partners are 6.0Å apart → too_close_together by 7.1Å
- **N9** — severity 25.97, 32 conflict(s); suspect input ~`I17` (group: pull_in)
  - pull-in (wants closer): E41@6.5Å(now 9.3,conf 0.31), V5@8.6Å(now 12.6,conf 0.20), K38@8.0Å(now 12.0,conf 0.22), I17@7.7Å(now 12.1,conf 0.24)
  - push-out (wants farther): E65@22.6Å(now 18.6,conf 0.34), G3@21.9Å(now 19.1,conf 0.30), G43@16.7Å(now 12.8,conf 0.16), V25@17.6Å(now 13.8,conf 0.17), Q58@18.8Å(now 14.9,conf 0.20)
  - E65↔E41: targets 22.6/6.5Å but partners are 10.6Å apart → too_close_together by 5.5Å
  - G3↔I17: targets 21.9/7.7Å but partners are 8.1Å apart → too_close_together by 6.2Å
  - E20↔I17: targets 23.1/7.7Å but partners are 10.0Å apart → too_close_together by 5.4Å
- **V27** — severity 24.77, 37 conflict(s); suspect input ~`G56` (group: push_out)
  - pull-in (wants closer): K64@9.4Å(now 13.2,conf 0.17), A45@9.9Å(now 13.3,conf 0.16), D24@5.7Å(now 9.7,conf 0.38), E18@7.0Å(now 10.2,conf 0.27), E42@9.6Å(now 12.9,conf 0.17), K6@6.3Å(now 10.4,conf 0.32), G56@7.4Å(now 11.4,conf 0.25)
  - push-out (wants farther): F16@7.8Å(now 5.1,conf 0.23), G21@20.2Å(now 16.8,conf 0.23), N54@16.4Å(now 13.7,conf 0.15)
  - D24↔I32: targets 5.7/7.2Å but partners are 17.8Å apart → too_far_apart by 4.9Å
  - K6↔G56: targets 6.3/7.4Å but partners are 18.2Å apart → too_far_apart by 4.6Å
  - K64↔G56: targets 9.4/7.4Å but partners are 23.1Å apart → too_far_apart by 6.3Å
- **V51** — severity 24.21, 37 conflict(s); suspect input ~`T63` (group: pull_in)
  - pull-in (wants closer): G36@19.0Å(now 21.6,conf 0.20), G43@18.5Å(now 21.7,conf 0.19), E42@17.6Å(now 21.5,conf 0.17), E65@16.4Å(now 19.0,conf 0.15), T63@7.5Å(now 15.3,conf 0.24), F26@7.1Å(now 9.7,conf 0.27), H28@7.9Å(now 10.5,conf 0.23)
  - push-out (wants farther): K12@22.0Å(now 19.5,conf 0.30), K38@20.9Å(now 18.0,conf 0.26), A59@9.7Å(now 6.7,conf 0.16), A60@10.4Å(now 7.1,conf 0.15), K4@19.5Å(now 15.7,conf 0.21), G3@19.1Å(now 13.4,conf 0.20), E18@17.5Å(now 14.0,conf 0.17), F14@17.8Å(now 15.1,conf 0.17)
  - K64↔T63: targets 19.3/7.5Å but partners are 4.1Å apart → too_close_together by 7.6Å
  - L40↔T63: targets 21.4/7.5Å but partners are 8.3Å apart → too_close_together by 5.6Å
  - T63↔R55: targets 7.5/8.8Å but partners are 22.1Å apart → too_far_apart by 5.8Å
- **S47** — severity 21.13, 34 conflict(s); suspect input ~`G36` (group: pull_in)
  - pull-in (wants closer): G36@9.1Å(now 15.6,conf 0.18), I50@7.3Å(now 10.3,conf 0.26)
  - push-out (wants farther): E2@8.2Å(now 4.1,conf 0.21), V62@7.3Å(now 3.4,conf 0.26), G43@16.5Å(now 13.0,conf 0.15), G21@17.4Å(now 14.9,conf 0.17), W7@17.1Å(now 14.5,conf 0.16), A59@18.3Å(now 9.0,conf 0.18), E35@18.7Å(now 14.9,conf 0.20)
  - A59↔I50: targets 18.3/7.3Å but partners are 3.6Å apart → too_close_together by 7.4Å
  - G36↔E35: targets 9.1/18.7Å but partners are 3.4Å apart → too_close_together by 6.2Å
  - L1↔G36: targets 5.9/9.1Å but partners are 21.0Å apart → too_far_apart by 6.1Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=33 · 3-10(G)=13 · coil(C)=8

```
EEEEEEECEHEHCCEEEEECHEEHGGGEGHHEGECGEGEEEGCEEGGEGHGHECGCEEEEHHEHE
```

## Backbone H-bond Network

- total=79 · helix(i→i+4)=0 · sheet=79
  - L1 ↔ I17  (sheet)
  - L1 ↔ E18  (sheet)
  - L1 ↔ V19  (sheet)
  - E2 ↔ I17  (sheet)
  - E2 ↔ E18  (sheet)
  - E2 ↔ V19  (sheet)
  - E2 ↔ Q22  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ I17  (sheet)
  - G3 ↔ E18  (sheet)
  - G3 ↔ V19  (sheet)
  - G3 ↔ Q22  (sheet)
  - G3 ↔ D23  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ I17  (sheet)
  - K4 ↔ E18  (sheet)
  - K4 ↔ V19  (sheet)
  - K4 ↔ Q22  (sheet)
  - K4 ↔ D23  (sheet)
  - … +59 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=246 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=149 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7386 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0154

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
