# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1UBQ\seeds\seed_0\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 1.593 A
- tm_score_ca_ordered: 0.8092047440044744
- heavy_atom_rmsd: 3.164 A
- sidechain_heavy_atom_rmsd: 3.950 A
- **all-atom quality (honest):** heavy 3.164 A, sidechain 3.950 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 2556
- bin_accuracy: 0.346

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.5931506007067768
- ga_delta_rmsd: -0.0016572263899212736  ga_fitness_mode: energy
- pre_local_rmsd: 1.6071475158174897  localized_anchor_rmsd: 1.5930531307461429

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L66-G74 → 514 conflicts (32%); T21-K26 → 319 conflicts (20%); K10-V16 → 244 conflicts (15%)
- explained: 1077/1588 conflicts by 3 root cause(s)
- metrics: hubs=74 (frac 1.0), conflicts/hub=21.5, max_incompat=10.61Å, chain_span=0.986
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L66-G74 + T21-K26 + K10-V16 — explain ~1077/1588 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R41** — severity 38.33, 63 conflict(s); suspect input ~`Q1` (group: pull_in)
  - pull-in (wants closer): Q1@10.3Å(now 19.9,conf 0.15), V25@8.2Å(now 13.3,conf 0.21), T6@7.9Å(now 11.4,conf 0.23), K10@8.6Å(now 16.1,conf 0.20), G74@10.0Å(now 13.2,conf 0.16), K28@9.9Å(now 14.3,conf 0.16)
  - push-out (wants farther): V69@7.5Å(now 4.9,conf 0.24), E63@21.4Å(now 17.1,conf 0.28), V16@20.6Å(now 17.8,conf 0.25), D20@19.4Å(now 16.0,conf 0.21), R73@18.0Å(now 10.5,conf 0.18), L7@17.4Å(now 11.7,conf 0.17), K32@20.4Å(now 15.7,conf 0.24), L14@20.1Å(now 17.1,conf 0.23), G9@20.3Å(now 15.6,conf 0.24)
  - T6↔G9: targets 7.9/20.3Å but partners are 4.5Å apart → too_close_together by 7.9Å
  - Q1↔G74: targets 10.3/10.0Å but partners are 30.8Å apart → too_far_apart by 10.6Å
  - K10↔G9: targets 8.6/20.3Å but partners are 4.4Å apart → too_close_together by 7.3Å
- **G74** — severity 35.23, 59 conflict(s); suspect input ~`R41` (group: push_out)
  - pull-in (wants closer): K62@26.9Å(now 31.0,conf 0.81), Q61@26.4Å(now 30.7,conf 0.71), N59@26.6Å(now 29.3,conf 0.74), S19@26.1Å(now 30.0,conf 0.67), P18@25.4Å(now 30.4,conf 0.57), Q1@25.3Å(now 30.8,conf 0.56), S64@25.2Å(now 28.5,conf 0.55), V16@22.8Å(now 28.6,conf 0.35), Y58@24.0Å(now 26.6,conf 0.43), I2@22.8Å(now 27.9,conf 0.35), D20@23.4Å(now 26.4,conf 0.39), G9@19.2Å(now 22.4,conf 0.21), V69@10.3Å(now 14.1,conf 0.15), R41@10.0Å(now 13.2,conf 0.16)
  - push-out (wants farther): K47@24.4Å(now 20.8,conf 0.47), G52@22.9Å(now 20.3,conf 0.35), L49@21.3Å(now 18.3,conf 0.27), E50@25.1Å(now 17.5,conf 0.53), D51@21.7Å(now 17.8,conf 0.29), H67@22.2Å(now 18.3,conf 0.31), I29@25.4Å(now 18.8,conf 0.57), L42@19.9Å(now 16.5,conf 0.23), L68@20.3Å(now 15.6,conf 0.24), G34@19.7Å(now 15.0,conf 0.22), I35@18.7Å(now 12.9,conf 0.20), Q40@17.3Å(now 12.6,conf 0.17), P37@19.5Å(now 13.8,conf 0.21), L70@16.7Å(now 10.5,conf 0.16)
  - I29↔Q39: targets 25.4/8.4Å but partners are 10.2Å apart → too_close_together by 6.8Å
  - E50↔R41: targets 25.1/10.0Å but partners are 7.0Å apart → too_close_together by 8.1Å
  - Q39↔P37: targets 8.4/19.5Å but partners are 5.4Å apart → too_close_together by 5.7Å
- **I12** — severity 29.50, 37 conflict(s); suspect input ~`L42` (group: pull_in)
  - pull-in (wants closer): R73@20.4Å(now 23.1,conf 0.24), S19@16.7Å(now 19.8,conf 0.16), D51@17.4Å(now 20.3,conf 0.17), T8@7.8Å(now 10.4,conf 0.23), E33@6.3Å(now 9.9,conf 0.32), H67@7.7Å(now 10.7,conf 0.23), Q1@5.6Å(now 10.1,conf 0.38)
  - push-out (wants farther): L72@23.3Å(now 18.9,conf 0.38), A45@20.2Å(now 17.6,conf 0.24), P18@24.6Å(now 17.0,conf 0.48), D20@20.3Å(now 17.7,conf 0.24), F44@18.4Å(now 15.2,conf 0.19), L42@18.5Å(now 12.5,conf 0.19), P37@19.1Å(now 15.1,conf 0.20), Q61@18.5Å(now 15.7,conf 0.19)
  - P18↔Q1: targets 24.6/5.6Å but partners are 10.1Å apart → too_close_together by 8.9Å
  - E33↔Q1: targets 6.3/5.6Å but partners are 17.4Å apart → too_far_apart by 5.5Å
  - V4↔P18: targets 5.8/24.6Å but partners are 15.2Å apart → too_close_together by 3.7Å
- **L42** — severity 28.66, 44 conflict(s); suspect input ~`D38` (group: pull_in)
  - pull-in (wants closer): D38@7.8Å(now 10.3,conf 0.23), I35@8.1Å(now 10.8,conf 0.22), E63@8.1Å(now 13.3,conf 0.22), A45@7.4Å(now 10.6,conf 0.25), K5@6.1Å(now 9.6,conf 0.34), T6@7.2Å(now 10.1,conf 0.26)
  - push-out (wants farther): G74@19.9Å(now 16.5,conf 0.23), L49@10.3Å(now 5.7,conf 0.15), H67@8.6Å(now 5.3,conf 0.20), K62@17.5Å(now 14.8,conf 0.17), I12@18.5Å(now 12.5,conf 0.19), K10@17.7Å(now 13.8,conf 0.17), T11@17.9Å(now 12.7,conf 0.18), S56@17.8Å(now 13.9,conf 0.17), G34@17.0Å(now 14.3,conf 0.16), L7@16.8Å(now 11.4,conf 0.16), T13@17.1Å(now 12.9,conf 0.16)
  - D38↔E63: targets 7.8/8.1Å but partners are 22.2Å apart → too_far_apart by 6.3Å
  - T11↔K5: targets 17.9/6.1Å but partners are 4.4Å apart → too_close_together by 7.5Å
  - D38↔A45: targets 7.8/7.4Å but partners are 20.6Å apart → too_far_apart by 5.4Å
- **I29** — severity 26.65, 38 conflict(s); suspect input ~`E50` (group: pull_in)
  - pull-in (wants closer): V16@9.6Å(now 12.2,conf 0.17), E50@9.7Å(now 15.4,conf 0.17), K10@9.8Å(now 14.5,conf 0.16), T13@6.0Å(now 11.3,conf 0.34), K5@8.5Å(now 13.1,conf 0.20)
  - push-out (wants farther): G74@25.4Å(now 18.8,conf 0.57), R73@21.6Å(now 18.8,conf 0.29), K62@21.2Å(now 16.8,conf 0.27), S19@21.0Å(now 16.7,conf 0.26), V69@17.3Å(now 13.9,conf 0.17), Q48@20.0Å(now 16.9,conf 0.23), E17@18.3Å(now 12.8,conf 0.18), P37@9.2Å(now 6.4,conf 0.18)
  - V25↔S19: targets 5.6/21.0Å but partners are 9.6Å apart → too_close_together by 5.7Å
  - G74↔G34: targets 25.4/6.1Å but partners are 15.0Å apart → too_close_together by 4.3Å
  - K62↔T13: targets 21.2/6.0Å but partners are 9.8Å apart → too_close_together by 5.3Å
- **K32** — severity 26.38, 39 conflict(s); suspect input ~`I22` (group: pull_in)
  - pull-in (wants closer): F3@8.9Å(now 13.5,conf 0.19), I22@8.5Å(now 14.3,conf 0.20), N24@9.5Å(now 12.5,conf 0.17), V4@9.5Å(now 12.0,conf 0.17), L68@9.9Å(now 12.5,conf 0.16)
  - push-out (wants farther): Q61@25.4Å(now 20.8,conf 0.57), T54@21.0Å(now 17.7,conf 0.26), L72@20.0Å(now 16.6,conf 0.23), D38@16.4Å(now 12.2,conf 0.15), L70@21.3Å(now 15.7,conf 0.28), R41@20.4Å(now 15.7,conf 0.24)
  - T54↔I22: targets 21.0/8.5Å but partners are 3.9Å apart → too_close_together by 8.5Å
  - Q61↔F3: targets 25.4/8.9Å but partners are 9.5Å apart → too_close_together by 7.0Å
  - E63↔F3: targets 18.6/8.9Å but partners are 4.1Å apart → too_close_together by 5.6Å

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=23 · 3-10(G)=12 · coil(C)=2

```
CEEGGEHEHEEGGEEGHHGEHHHHHHHHGHHHEHEHHHEEHGHHHGHHEEEHEGGEEECGHHHHEEHHHHHHHE
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=13 · sheet=34
  - P18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - K26 ↔ Q30  (helix)
  - Q30 ↔ G34  (helix)
  - G34 ↔ D38  (helix)
  - P37 ↔ R41  (helix)
  - R41 ↔ A45  (helix)
  - Q48 ↔ G52  (helix)
  - S64 ↔ L68  (helix)
  - L68 ↔ L72  (helix)
  - V69 ↔ R73  (helix)
  - I2 ↔ K10  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ L14  (sheet)
  - I2 ↔ E15  (sheet)
  - F3 ↔ K10  (sheet)
  - F3 ↔ T11  (sheet)
  - F3 ↔ L14  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=273 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=128 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7003 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1UBQ.ensemble.pdb`)
- RMSF mean=0.095Å max=0.216Å (per-residue in .per_residue.csv)
- most flexible residues: 74, 15, 42, 16, 8

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1UBQ.pae.csv`
- mean=0.056Å · max=0.27Å · AlphaFold-PAE analog (low block = rigid unit/domain)
