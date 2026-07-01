# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\4PTI\seeds\seed_1\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 8.072 A
- tm_score_ca_ordered: 0.2412957850390892
- heavy_atom_rmsd: 9.190 A
- sidechain_heavy_atom_rmsd: 10.166 A
- **all-atom quality (honest):** heavy 9.190 A, sidechain 10.166 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 1431
- bin_accuracy: 0.324

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.071958101427795
- ga_delta_rmsd: -5.501988762847999  ga_fitness_mode: energy
- pre_local_rmsd: 8.094712001429903  localized_anchor_rmsd: 8.071969372846919

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R16-N23 → 391 conflicts (41%); R38-K45 → 259 conflicts (27%); C4-T10 → 136 conflicts (14%)
- explained: 786/945 conflicts by 3 root cause(s)
- metrics: hubs=56 (frac 1.0), conflicts/hub=16.9, max_incompat=9.76Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R16-N23 + R38-K45 + C4-T10 — explain ~786/945 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y22** — severity 33.98, 47 conflict(s); suspect input ~`Y34` (group: push_out)
  - pull-in (wants closer): T53@6.5Å(now 9.6,conf 0.30), E48@6.6Å(now 9.3,conf 0.30), P7@5.6Å(now 10.2,conf 0.38), Y34@8.9Å(now 13.4,conf 0.19), K40@7.5Å(now 11.5,conf 0.24)
  - push-out (wants farther): L28@9.2Å(now 4.8,conf 0.18), C4@7.5Å(now 4.7,conf 0.24), G35@22.5Å(now 16.6,conf 0.33), F44@9.9Å(now 7.2,conf 0.16), Y9@17.4Å(now 12.7,conf 0.17), I18@16.3Å(now 11.9,conf 0.15), N43@10.3Å(now 5.5,conf 0.15)
  - E48↔P7: targets 6.6/5.6Å but partners are 19.3Å apart → too_far_apart by 7.0Å
  - G55↔P7: targets 5.8/5.6Å but partners are 17.2Å apart → too_far_apart by 5.7Å
  - G35↔Y34: targets 22.5/8.9Å but partners are 3.8Å apart → too_close_together by 9.8Å
- **K45** — severity 24.75, 41 conflict(s); suspect input ~`N42` (group: pull_in)
  - pull-in (wants closer): V33@8.5Å(now 12.2,conf 0.20), Y34@9.6Å(now 12.3,conf 0.17), N42@7.6Å(now 11.0,conf 0.24), T10@9.5Å(now 15.3,conf 0.17)
  - push-out (wants farther): A26@18.4Å(now 14.5,conf 0.19), D2@21.9Å(now 18.2,conf 0.30), G27@17.4Å(now 14.5,conf 0.17), P1@22.7Å(now 16.6,conf 0.34), R16@16.3Å(now 12.8,conf 0.15), G55@17.4Å(now 12.6,conf 0.17), P8@17.0Å(now 14.1,conf 0.16), P7@20.9Å(now 16.6,conf 0.26)
  - P1↔C50: targets 22.7/6.0Å but partners are 9.9Å apart → too_close_together by 6.8Å
  - P1↔N42: targets 22.7/7.6Å but partners are 8.7Å apart → too_close_together by 6.4Å
  - D2↔N42: targets 21.9/7.6Å but partners are 8.6Å apart → too_close_together by 5.8Å
- **Y9** — severity 24.23, 36 conflict(s); suspect input ~`L5` (group: push_out)
  - pull-in (wants closer): G56@18.4Å(now 21.6,conf 0.19), R52@17.1Å(now 20.3,conf 0.16), V33@6.2Å(now 8.9,conf 0.33), F44@9.3Å(now 12.3,conf 0.18), N23@8.1Å(now 13.2,conf 0.22), L5@8.0Å(now 12.7,conf 0.22), C37@6.4Å(now 9.5,conf 0.32), C4@9.8Å(now 13.4,conf 0.16)
  - push-out (wants farther): G27@20.7Å(now 17.2,conf 0.25), K25@19.1Å(now 16.6,conf 0.20), Q30@17.4Å(now 13.6,conf 0.17), Y22@17.4Å(now 12.7,conf 0.17)
  - G27↔N23: targets 20.7/8.1Å but partners are 4.7Å apart → too_close_together by 7.9Å
  - A26↔N23: targets 19.3/8.1Å but partners are 4.6Å apart → too_close_together by 6.6Å
  - L5↔C37: targets 8.0/6.4Å but partners are 20.3Å apart → too_far_apart by 6.0Å
- **T10** — severity 21.72, 35 conflict(s); suspect input ~`C29` (group: pull_in)
  - pull-in (wants closer): E48@18.5Å(now 21.1,conf 0.19), M51@17.1Å(now 20.3,conf 0.16), C54@16.7Å(now 19.4,conf 0.16), T31@7.2Å(now 10.4,conf 0.26), C29@9.2Å(now 16.0,conf 0.18), F44@9.1Å(now 13.7,conf 0.18), K45@9.5Å(now 15.3,conf 0.17)
  - push-out (wants farther): Y34@6.5Å(now 3.8,conf 0.30), A26@23.6Å(now 18.2,conf 0.40), G35@10.0Å(now 5.9,conf 0.16), D49@22.8Å(now 19.9,conf 0.35), C4@18.7Å(now 15.8,conf 0.20), N23@18.6Å(now 14.3,conf 0.19)
  - A26↔T31: targets 23.6/7.2Å but partners are 9.8Å apart → too_close_together by 6.6Å
  - A26↔C29: targets 23.6/9.2Å but partners are 7.1Å apart → too_close_together by 7.3Å
  - D49↔F44: targets 22.8/9.1Å but partners are 6.6Å apart → too_close_together by 7.1Å
- **C29** — severity 19.41, 31 conflict(s); suspect input ~`T10` (group: push_out)
  - pull-in (wants closer): M51@5.6Å(now 9.1,conf 0.38), L5@8.7Å(now 12.7,conf 0.19), R41@10.4Å(now 13.3,conf 0.15), T10@9.2Å(now 16.0,conf 0.18), D49@5.6Å(now 8.6,conf 0.38), R52@7.6Å(now 10.2,conf 0.24)
  - push-out (wants farther): P12@24.8Å(now 21.9,conf 0.50), Y20@9.0Å(now 5.5,conf 0.18), P7@17.8Å(now 13.7,conf 0.17), I18@19.8Å(now 10.7,conf 0.22), Y34@18.2Å(now 14.0,conf 0.18), P1@17.6Å(now 14.8,conf 0.17)
  - P12↔T10: targets 24.8/9.2Å but partners are 6.8Å apart → too_close_together by 8.7Å
  - I18↔F32: targets 19.8/9.2Å but partners are 3.8Å apart → too_close_together by 6.8Å
  - I18↔R19: targets 19.8/9.4Å but partners are 3.9Å apart → too_close_together by 6.5Å
- **P7** — severity 18.21, 20 conflict(s); suspect input ~`C29` (group: pull_in)
  - pull-in (wants closer): L28@9.2Å(now 13.1,conf 0.18), Y20@9.0Å(now 12.0,conf 0.18), D2@9.6Å(now 12.8,conf 0.17), Y22@5.6Å(now 10.2,conf 0.38), C4@6.7Å(now 9.5,conf 0.29)
  - push-out (wants farther): A15@21.7Å(now 17.2,conf 0.29), S46@21.1Å(now 18.1,conf 0.27), P12@17.4Å(now 13.3,conf 0.17), C29@17.8Å(now 13.7,conf 0.17), G36@19.2Å(now 15.8,conf 0.21), K45@20.9Å(now 16.6,conf 0.26)
  - K45↔Y22: targets 20.9/5.6Å but partners are 9.5Å apart → too_close_together by 5.8Å
  - S46↔Y22: targets 21.1/5.6Å but partners are 10.2Å apart → too_close_together by 5.3Å
  - Y20↔K45: targets 9.0/20.9Å but partners are 5.1Å apart → too_close_together by 6.8Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=23 · 3-10(G)=5 · coil(C)=4

```
EEHHHEHEEHEHEEEECHHEHHHHGHHEGECEGHHECEEEEGEGHHEHHHEHHEHC
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=9 · sheet=30
  - F3 ↔ P7  (helix)
  - I18 ↔ Y22  (helix)
  - R19 ↔ N23  (helix)
  - Y22 ↔ A26  (helix)
  - N23 ↔ G27  (helix)
  - K45 ↔ D49  (helix)
  - S46 ↔ C50  (helix)
  - E48 ↔ R52  (helix)
  - D49 ↔ T53  (helix)
  - P1 ↔ E6  (sheet)
  - E6 ↔ G11  (sheet)
  - E6 ↔ Y20  (sheet)
  - P8 ↔ Y20  (sheet)
  - Y9 ↔ K14  (sheet)
  - Y9 ↔ A15  (sheet)
  - Y9 ↔ R16  (sheet)
  - Y9 ↔ Y20  (sheet)
  - G11 ↔ R16  (sheet)
  - A15 ↔ F32  (sheet)
  - R16 ↔ F32  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=222 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=123 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7175 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
