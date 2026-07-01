# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\4PTI\seeds\seed_0\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 1.647 A
- tm_score_ca_ordered: 0.7450429504466951
- heavy_atom_rmsd: 3.973 A
- sidechain_heavy_atom_rmsd: 5.292 A
- **all-atom quality (honest):** heavy 3.973 A, sidechain 5.292 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 1431
- bin_accuracy: 0.342

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.6464825238457685
- ga_delta_rmsd: 1.385789901029  ga_fitness_mode: energy
- pre_local_rmsd: 1.6943635864298954  localized_anchor_rmsd: 1.6465132771293958

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** A26-G35 → 402 conflicts (44%); R38-K45 → 252 conflicts (28%); D2-T10 → 141 conflicts (16%)
- explained: 795/906 conflicts by 3 root cause(s)
- metrics: hubs=56 (frac 1.0), conflicts/hub=16.2, max_incompat=9.5Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): A26-G35 + R38-K45 + D2-T10 — explain ~795/906 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y22** — severity 29.85, 41 conflict(s); suspect input ~`Y34` (group: push_out)
  - pull-in (wants closer): C13@18.1Å(now 21.2,conf 0.18), T53@6.5Å(now 9.9,conf 0.30), P7@5.6Å(now 10.0,conf 0.38), Y34@8.9Å(now 13.9,conf 0.19), K40@7.5Å(now 12.5,conf 0.24)
  - push-out (wants farther): L28@9.2Å(now 4.0,conf 0.18), G35@22.5Å(now 17.4,conf 0.33), Y9@17.4Å(now 13.1,conf 0.17), I18@16.3Å(now 12.2,conf 0.15), N43@10.3Å(now 6.7,conf 0.15)
  - E48↔P7: targets 6.6/5.6Å but partners are 18.7Å apart → too_far_apart by 6.5Å
  - G35↔Y34: targets 22.5/8.9Å but partners are 4.1Å apart → too_close_together by 9.5Å
  - G55↔P7: targets 5.8/5.6Å but partners are 16.4Å apart → too_far_apart by 4.9Å
- **Y9** — severity 25.27, 38 conflict(s); suspect input ~`N23` (group: push_out)
  - pull-in (wants closer): G56@18.4Å(now 21.7,conf 0.19), R52@17.1Å(now 19.9,conf 0.16), N23@8.1Å(now 13.8,conf 0.22), L5@8.0Å(now 12.9,conf 0.22), C37@6.4Å(now 9.1,conf 0.32), C4@9.8Å(now 13.4,conf 0.16)
  - push-out (wants farther): G27@20.7Å(now 17.4,conf 0.25), Q30@17.4Å(now 13.6,conf 0.17), Y22@17.4Å(now 13.1,conf 0.17)
  - G27↔N23: targets 20.7/8.1Å but partners are 4.3Å apart → too_close_together by 8.3Å
  - A26↔N23: targets 19.3/8.1Å but partners are 4.1Å apart → too_close_together by 7.1Å
  - N23↔C37: targets 8.1/6.4Å but partners are 20.9Å apart → too_far_apart by 6.4Å
- **K45** — severity 23.63, 37 conflict(s); suspect input ~`N42` (group: pull_in)
  - pull-in (wants closer): V33@8.5Å(now 12.0,conf 0.20), N42@7.6Å(now 11.0,conf 0.24), T10@9.5Å(now 15.0,conf 0.17)
  - push-out (wants farther): A26@18.4Å(now 15.3,conf 0.19), D2@21.9Å(now 16.4,conf 0.30), P1@22.7Å(now 15.3,conf 0.34), R16@16.3Å(now 12.7,conf 0.15), G55@17.4Å(now 12.7,conf 0.17), P8@17.0Å(now 13.2,conf 0.16), P7@20.9Å(now 15.8,conf 0.26)
  - P1↔C50: targets 22.7/6.0Å but partners are 9.4Å apart → too_close_together by 7.2Å
  - D2↔N42: targets 21.9/7.6Å but partners are 7.5Å apart → too_close_together by 6.8Å
  - P1↔N42: targets 22.7/7.6Å but partners are 8.5Å apart → too_close_together by 6.6Å
- **T10** — severity 21.14, 34 conflict(s); suspect input ~`C29` (group: pull_in)
  - pull-in (wants closer): M51@17.1Å(now 19.7,conf 0.16), T31@7.2Å(now 9.8,conf 0.26), C29@9.2Å(now 15.5,conf 0.18), F44@9.1Å(now 13.5,conf 0.18), K45@9.5Å(now 15.0,conf 0.17)
  - push-out (wants farther): A26@23.6Å(now 17.6,conf 0.40), D2@21.7Å(now 18.7,conf 0.29), D49@22.8Å(now 19.6,conf 0.35), C4@18.7Å(now 15.4,conf 0.20), N23@18.6Å(now 14.3,conf 0.19)
  - A26↔T31: targets 23.6/7.2Å but partners are 10.0Å apart → too_close_together by 6.5Å
  - A26↔C29: targets 23.6/9.2Å but partners are 7.4Å apart → too_close_together by 7.0Å
  - D49↔F44: targets 22.8/9.1Å but partners are 6.8Å apart → too_close_together by 6.9Å
- **P7** — severity 17.29, 19 conflict(s); suspect input ~`C29` (group: pull_in)
  - pull-in (wants closer): L28@9.2Å(now 12.6,conf 0.18), Y20@9.0Å(now 11.7,conf 0.18), D2@9.6Å(now 12.8,conf 0.17), Y22@5.6Å(now 10.0,conf 0.38)
  - push-out (wants farther): A15@21.7Å(now 17.4,conf 0.29), S46@21.1Å(now 17.8,conf 0.27), P12@17.4Å(now 13.5,conf 0.17), C29@17.8Å(now 12.9,conf 0.17), G36@19.2Å(now 15.9,conf 0.21), K45@20.9Å(now 15.8,conf 0.26)
  - K45↔Y22: targets 20.9/5.6Å but partners are 9.3Å apart → too_close_together by 5.9Å
  - C29↔Y22: targets 17.8/5.6Å but partners are 4.2Å apart → too_close_together by 8.0Å
  - S46↔Y22: targets 21.1/5.6Å but partners are 10.8Å apart → too_close_together by 4.7Å
- **C29** — severity 16.58, 25 conflict(s); suspect input ~`T10` (group: pull_in)
  - pull-in (wants closer): M51@5.6Å(now 9.2,conf 0.38), L5@8.7Å(now 12.0,conf 0.19), R41@10.4Å(now 13.6,conf 0.15), T10@9.2Å(now 15.5,conf 0.18), D49@5.6Å(now 8.8,conf 0.38)
  - push-out (wants farther): P12@24.8Å(now 21.7,conf 0.50), Y20@9.0Å(now 5.3,conf 0.18), P7@17.8Å(now 12.9,conf 0.17), I18@19.8Å(now 10.8,conf 0.22), Y34@18.2Å(now 14.4,conf 0.18), P1@17.6Å(now 14.4,conf 0.17)
  - P12↔T10: targets 24.8/9.2Å but partners are 7.2Å apart → too_close_together by 8.3Å
  - I18↔F32: targets 19.8/9.2Å but partners are 3.8Å apart → too_close_together by 6.8Å
  - I18↔R19: targets 19.8/9.4Å but partners are 4.1Å apart → too_close_together by 6.2Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=24 · 3-10(G)=9 · coil(C)=3

```
EEHHCEGECEEHEEEECHHEGGGGHGHEHEHGHEGEEEEEGHEEHHEHHHHHHEHE
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=8 · sheet=32
  - K25 ↔ C29  (helix)
  - C29 ↔ V33  (helix)
  - N42 ↔ S46  (helix)
  - K45 ↔ D49  (helix)
  - S46 ↔ C50  (helix)
  - E48 ↔ R52  (helix)
  - D49 ↔ T53  (helix)
  - M51 ↔ G55  (helix)
  - P1 ↔ E6  (sheet)
  - P8 ↔ Y20  (sheet)
  - T10 ↔ A15  (sheet)
  - T10 ↔ R16  (sheet)
  - T10 ↔ Y20  (sheet)
  - G11 ↔ R16  (sheet)
  - K14 ↔ Y34  (sheet)
  - A15 ↔ Y34  (sheet)
  - R16 ↔ Y34  (sheet)
  - R16 ↔ G36  (sheet)
  - Y20 ↔ L28  (sheet)
  - Y20 ↔ Q30  (sheet)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=215 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=118 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7072 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`4PTI.ensemble.pdb`)
- RMSF mean=3.534Å max=9.813Å (per-residue in .per_residue.csv)
- most flexible residues: 25, 26, 53, 31, 24

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `4PTI.pae.csv`
- mean=0.198Å · max=0.918Å · AlphaFold-PAE analog (low block = rigid unit/domain)
