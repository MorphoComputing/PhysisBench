# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1KTH\seeds\seed_1\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 2.096 A
- tm_score_ca_ordered: 0.6966510545043282
- heavy_atom_rmsd: 4.094 A
- sidechain_heavy_atom_rmsd: 5.279 A
- **all-atom quality (honest):** heavy 4.094 A, sidechain 5.279 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 1431
- bin_accuracy: 0.344

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=2.7298750336437667 -> 2.453091405768076 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.096180964707168
- ga_delta_rmsd: -0.42801941116144127  ga_fitness_mode: energy
- pre_local_rmsd: 2.137332066748596  localized_anchor_rmsd: 2.096203092567398

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R31-C54 → 638 conflicts (83%); K8-R14 → 78 conflicts (10%)
- explained: 716/767 conflicts by 2 root cause(s)
- metrics: hubs=56 (frac 1.0), conflicts/hub=13.7, max_incompat=9.99Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R31-C54 + K8-R14 — explain ~716/767 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C37** — severity 27.44, 36 conflict(s); suspect input ~`Y21` (group: pull_in)
  - pull-in (wants closer): P56@23.2Å(now 26.1,conf 0.37), E51@16.9Å(now 21.4,conf 0.16), C54@20.4Å(now 22.9,conf 0.24), Y21@9.2Å(now 14.8,conf 0.18), K43@7.6Å(now 10.4,conf 0.24)
  - push-out (wants farther): C29@22.3Å(now 19.7,conf 0.32), C50@23.4Å(now 19.6,conf 0.39), A30@19.7Å(now 17.1,conf 0.22), R31@19.4Å(now 15.2,conf 0.21), K19@17.1Å(now 11.3,conf 0.16), K8@20.4Å(now 12.3,conf 0.24), Y34@9.5Å(now 5.6,conf 0.17)
  - E10↔K8: targets 7.0/20.4Å but partners are 6.5Å apart → too_close_together by 7.0Å
  - K8↔D9: targets 20.4/9.0Å but partners are 3.5Å apart → too_close_together by 7.9Å
  - C50↔K43: targets 23.4/7.6Å but partners are 9.7Å apart → too_close_together by 6.1Å
- **E51** — severity 24.88, 35 conflict(s); suspect input ~`N42` (group: pull_in)
  - pull-in (wants closer): C37@16.9Å(now 21.4,conf 0.16), N42@6.7Å(now 10.7,conf 0.29), R31@8.2Å(now 10.8,conf 0.21)
  - push-out (wants farther): G11@21.7Å(now 19.1,conf 0.29), I17@22.9Å(now 16.9,conf 0.35), Y34@20.3Å(now 17.5,conf 0.24), W33@18.9Å(now 16.4,conf 0.20), I3@16.7Å(now 12.5,conf 0.16), D2@17.6Å(now 15.1,conf 0.17), L18@19.0Å(now 14.2,conf 0.20)
  - G11↔N42: targets 21.7/6.7Å but partners are 9.5Å apart → too_close_together by 5.5Å
  - I17↔Y21: targets 22.9/5.6Å but partners are 12.9Å apart → too_close_together by 4.3Å
  - I17↔W20: targets 22.9/7.6Å but partners are 9.5Å apart → too_close_together by 5.8Å
- **R14** — severity 22.06, 40 conflict(s); suspect input ~`K19` (group: pull_in)
  - pull-in (wants closer): K27@23.0Å(now 27.6,conf 0.36), D2@20.7Å(now 24.4,conf 0.25), C29@20.4Å(now 23.1,conf 0.24), K19@9.6Å(now 13.6,conf 0.17), W33@8.8Å(now 12.9,conf 0.19), F32@9.5Å(now 15.2,conf 0.17)
  - push-out (wants farther): Q47@24.9Å(now 21.3,conf 0.51), E41@18.5Å(now 15.0,conf 0.19), G45@22.6Å(now 16.1,conf 0.34), K43@17.6Å(now 13.9,conf 0.17), G38@10.1Å(now 7.2,conf 0.16), G39@17.2Å(now 9.8,conf 0.17), D9@16.4Å(now 13.8,conf 0.15)
  - G45↔K19: targets 22.6/9.6Å but partners are 4.0Å apart → too_close_together by 8.9Å
  - G36↔G45: targets 6.1/22.6Å but partners are 12.3Å apart → too_close_together by 4.1Å
  - G35↔G45: targets 5.6/22.6Å but partners are 12.9Å apart → too_close_together by 4.0Å
- **G45** — severity 20.73, 23 conflict(s); suspect input ~`G36` (group: pull_in)
  - pull-in (wants closer): W33@7.3Å(now 11.1,conf 0.26), G36@8.5Å(now 12.3,conf 0.20), K52@7.4Å(now 12.9,conf 0.25)
  - push-out (wants farther): R14@22.6Å(now 16.1,conf 0.34), A55@19.3Å(now 15.6,conf 0.21), G35@17.4Å(now 12.9,conf 0.17)
  - R14↔G36: targets 22.6/8.5Å but partners are 4.1Å apart → too_close_together by 10.0Å
  - R14↔I17: targets 22.6/7.0Å but partners are 9.3Å apart → too_close_together by 6.3Å
  - R14↔L18: targets 22.6/5.8Å but partners are 11.8Å apart → too_close_together by 5.0Å
- **C54** — severity 18.85, 24 conflict(s); suspect input ~`K43` (group: pull_in)
  - pull-in (wants closer): C37@20.4Å(now 22.9,conf 0.24), K43@8.4Å(now 13.1,conf 0.20)
  - push-out (wants farther): G11@22.5Å(now 19.5,conf 0.33), W33@24.1Å(now 19.8,conf 0.44), E10@22.9Å(now 19.8,conf 0.35), C50@8.8Å(now 5.2,conf 0.19), L18@21.2Å(now 17.7,conf 0.27), N40@18.7Å(now 15.1,conf 0.19), T26@17.8Å(now 13.2,conf 0.18)
  - W33↔K43: targets 24.1/8.4Å but partners are 7.6Å apart → too_close_together by 8.2Å
  - E10↔K43: targets 22.9/8.4Å but partners are 8.1Å apart → too_close_together by 6.4Å
  - G11↔K43: targets 22.5/8.4Å but partners are 8.3Å apart → too_close_together by 5.8Å
- **Y34** — severity 16.88, 21 conflict(s); suspect input ~`W20` (group: pull_in)
  - pull-in (wants closer): A55@18.5Å(now 21.3,conf 0.19), T12@6.4Å(now 9.9,conf 0.32), E41@8.0Å(now 12.9,conf 0.22), C13@6.4Å(now 10.8,conf 0.32)
  - push-out (wants farther): N25@22.8Å(now 19.1,conf 0.35), V53@22.0Å(now 19.1,conf 0.30), E51@20.3Å(now 17.5,conf 0.24), C29@20.4Å(now 15.4,conf 0.24), Q47@18.9Å(now 14.4,conf 0.20), C37@9.5Å(now 5.6,conf 0.17), Y22@18.3Å(now 14.7,conf 0.19)
  - W20↔C29: targets 7.0/20.4Å but partners are 6.5Å apart → too_close_together by 6.9Å
  - W20↔C13: targets 7.0/6.4Å but partners are 17.7Å apart → too_far_apart by 4.4Å
  - W20↔Q47: targets 7.0/18.9Å but partners are 6.1Å apart → too_close_together by 5.9Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=19 · 3-10(G)=11 · coil(C)=5

```
CECHCEEGGGGEEGHCECEEEEHHGHHEHGGEEEGHHGEGHHEEHHHHHHHHHEHE
```

## Backbone H-bond Network

- total=48 · helix(i→i+4)=7 · sheet=41
  - D23 ↔ K27  (helix)
  - C37 ↔ E41  (helix)
  - E41 ↔ G45  (helix)
  - G45 ↔ E49  (helix)
  - K48 ↔ K52  (helix)
  - E49 ↔ V53  (helix)
  - E51 ↔ A55  (helix)
  - D2 ↔ P7  (sheet)
  - D2 ↔ Y22  (sheet)
  - L6 ↔ W20  (sheet)
  - L6 ↔ Y21  (sheet)
  - L6 ↔ Y22  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - P7 ↔ Y22  (sheet)
  - T12 ↔ I17  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ W33  (sheet)
  - I17 ↔ Y34  (sheet)
  - K19 ↔ F32  (sheet)
  - … +28 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=223 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=128 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7021 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1KTH.ensemble.pdb`)
- RMSF mean=3.235Å max=8.382Å (per-residue in .per_residue.csv)
- most flexible residues: 26, 53, 25, 32, 2

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1KTH.pae.csv`
- mean=0.286Å · max=1.772Å · AlphaFold-PAE analog (low block = rigid unit/domain)
