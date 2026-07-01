# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1KTH\seeds\seed_0\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 7.390 A
- tm_score_ca_ordered: 0.28992816547361416
- heavy_atom_rmsd: 8.617 A
- sidechain_heavy_atom_rmsd: 9.584 A
- **all-atom quality (honest):** heavy 8.617 A, sidechain 9.584 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 1431
- bin_accuracy: 0.321

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.389573951145757
- ga_delta_rmsd: -1.1800201821114946  ga_fitness_mode: energy
- pre_local_rmsd: 7.414818196005858  localized_anchor_rmsd: 7.389624346886303

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R31-C54 → 693 conflicts (87%); K8-R14 → 68 conflicts (9%)
- explained: 761/794 conflicts by 2 root cause(s)
- metrics: hubs=56 (frac 1.0), conflicts/hub=14.2, max_incompat=9.89Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R31-C54 + K8-R14 — explain ~761/794 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C37** — severity 27.16, 36 conflict(s); suspect input ~`Y21` (group: pull_in)
  - pull-in (wants closer): P56@23.2Å(now 26.0,conf 0.37), E51@16.9Å(now 20.9,conf 0.16), C54@20.4Å(now 22.9,conf 0.24), Y21@9.2Å(now 15.1,conf 0.18), K43@7.6Å(now 10.5,conf 0.24)
  - push-out (wants farther): C29@22.3Å(now 19.7,conf 0.32), C50@23.4Å(now 19.4,conf 0.39), A30@19.7Å(now 17.1,conf 0.22), R31@19.4Å(now 15.2,conf 0.21), K19@17.1Å(now 10.8,conf 0.16), K8@20.4Å(now 13.6,conf 0.24), Y34@9.5Å(now 6.2,conf 0.17)
  - K8↔D9: targets 20.4/9.0Å but partners are 3.5Å apart → too_close_together by 7.9Å
  - E10↔K8: targets 7.0/20.4Å but partners are 7.5Å apart → too_close_together by 6.0Å
  - C50↔Y21: targets 23.4/9.2Å but partners are 6.7Å apart → too_close_together by 7.5Å
- **R14** — severity 24.23, 38 conflict(s); suspect input ~`K19` (group: pull_in)
  - pull-in (wants closer): K27@23.0Å(now 27.1,conf 0.36), D2@20.7Å(now 23.6,conf 0.25), C29@20.4Å(now 23.2,conf 0.24), K19@9.6Å(now 14.2,conf 0.17), W33@8.8Å(now 14.0,conf 0.19), F32@9.5Å(now 15.5,conf 0.17)
  - push-out (wants farther): Q47@24.9Å(now 21.5,conf 0.51), E41@18.5Å(now 13.9,conf 0.19), G45@22.6Å(now 16.9,conf 0.34), K43@17.6Å(now 14.0,conf 0.17), G38@10.1Å(now 5.4,conf 0.16), G39@17.2Å(now 8.2,conf 0.17), G11@9.5Å(now 6.9,conf 0.17), D9@16.4Å(now 12.5,conf 0.15)
  - G45↔K19: targets 22.6/9.6Å but partners are 3.1Å apart → too_close_together by 9.9Å
  - G36↔G45: targets 6.1/22.6Å but partners are 11.5Å apart → too_close_together by 4.9Å
  - G35↔G45: targets 5.6/22.6Å but partners are 12.1Å apart → too_close_together by 4.9Å
- **E51** — severity 21.84, 28 conflict(s); suspect input ~`N42` (group: pull_in)
  - pull-in (wants closer): C37@16.9Å(now 20.9,conf 0.16), N42@6.7Å(now 10.5,conf 0.29)
  - push-out (wants farther): I17@22.9Å(now 16.1,conf 0.35), Y34@20.3Å(now 16.7,conf 0.24), W33@18.9Å(now 15.4,conf 0.20), I3@16.7Å(now 12.4,conf 0.16), L18@19.0Å(now 13.1,conf 0.20)
  - I17↔Y21: targets 22.9/5.6Å but partners are 12.8Å apart → too_close_together by 4.5Å
  - I17↔Q47: targets 22.9/5.8Å but partners are 12.7Å apart → too_close_together by 4.4Å
  - G11↔N42: targets 21.7/6.7Å but partners are 10.0Å apart → too_close_together by 5.0Å
- **C54** — severity 20.12, 25 conflict(s); suspect input ~`K43` (group: pull_in)
  - pull-in (wants closer): C37@20.4Å(now 22.9,conf 0.24), K43@8.4Å(now 13.9,conf 0.20), D2@8.4Å(now 11.2,conf 0.20)
  - push-out (wants farther): I17@21.7Å(now 19.1,conf 0.29), W33@24.1Å(now 19.5,conf 0.44), E10@22.9Å(now 19.7,conf 0.35), C50@8.8Å(now 5.2,conf 0.19), L18@21.2Å(now 15.8,conf 0.27), N40@18.7Å(now 15.5,conf 0.19), T26@17.8Å(now 13.6,conf 0.18)
  - W33↔K43: targets 24.1/8.4Å but partners are 6.9Å apart → too_close_together by 8.8Å
  - E10↔K43: targets 22.9/8.4Å but partners are 8.0Å apart → too_close_together by 6.5Å
  - W33↔F44: targets 24.1/9.1Å but partners are 8.4Å apart → too_close_together by 6.6Å
- **G45** — severity 17.57, 22 conflict(s); suspect input ~`G36` (group: pull_in)
  - pull-in (wants closer): D2@17.5Å(now 20.2,conf 0.17), G36@8.5Å(now 11.5,conf 0.20), K52@7.4Å(now 12.5,conf 0.25)
  - push-out (wants farther): K19@5.9Å(now 3.1,conf 0.36), T12@20.0Å(now 17.1,conf 0.23), R14@22.6Å(now 16.9,conf 0.34), A55@19.3Å(now 15.3,conf 0.21), G35@17.4Å(now 12.1,conf 0.17)
  - R14↔G36: targets 22.6/8.5Å but partners are 5.8Å apart → too_close_together by 8.3Å
  - R14↔I17: targets 22.6/7.0Å but partners are 10.1Å apart → too_close_together by 5.5Å
  - A55↔K52: targets 19.3/7.4Å but partners are 5.2Å apart → too_close_together by 6.7Å
- **K8** — severity 17.50, 25 conflict(s); suspect input ~`G35` (group: pull_in)
  - pull-in (wants closer): F32@7.5Å(now 12.1,conf 0.24), A30@8.5Å(now 11.9,conf 0.20), R31@8.9Å(now 13.6,conf 0.19), W33@7.7Å(now 14.3,conf 0.24), L18@9.6Å(now 13.2,conf 0.17), G35@8.1Å(now 13.7,conf 0.22), K19@9.9Å(now 12.6,conf 0.16)
  - push-out (wants farther): N42@10.0Å(now 4.3,conf 0.16), D15@19.3Å(now 15.9,conf 0.21), S46@18.5Å(now 15.7,conf 0.19), T1@17.7Å(now 11.6,conf 0.17), C37@20.4Å(now 13.6,conf 0.24), K27@19.0Å(now 13.4,conf 0.20), V53@19.1Å(now 14.6,conf 0.20), N40@10.4Å(now 6.0,conf 0.15)
  - C37↔G35: targets 20.4/8.1Å but partners are 2.8Å apart → too_close_together by 9.5Å
  - I3↔W33: targets 5.9/7.7Å but partners are 19.3Å apart → too_far_apart by 5.8Å
  - I3↔G35: targets 5.9/8.1Å but partners are 19.3Å apart → too_far_apart by 5.3Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=23 · 3-10(G)=7 · coil(C)=6

```
EECHGGHEEHCEHEECEGECEEEHHHEEHCEGEEHEEGECHGHHHHEHHHHGHEHE
```

## Backbone H-bond Network

- total=48 · helix(i→i+4)=4 · sheet=44
  - N25 ↔ C29  (helix)
  - E41 ↔ G45  (helix)
  - S46 ↔ C50  (helix)
  - E51 ↔ A55  (helix)
  - T1 ↔ K8  (sheet)
  - T1 ↔ Y21  (sheet)
  - D2 ↔ K8  (sheet)
  - D2 ↔ Y21  (sheet)
  - D2 ↔ Y22  (sheet)
  - K8 ↔ Y21  (sheet)
  - K8 ↔ Y22  (sheet)
  - K8 ↔ D23  (sheet)
  - D9 ↔ K19  (sheet)
  - D9 ↔ Y21  (sheet)
  - D9 ↔ Y22  (sheet)
  - D9 ↔ D23  (sheet)
  - T12 ↔ I17  (sheet)
  - R14 ↔ Y34  (sheet)
  - D15 ↔ Y34  (sheet)
  - I17 ↔ R31  (sheet)
  - … +28 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=230 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=135 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.725 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
