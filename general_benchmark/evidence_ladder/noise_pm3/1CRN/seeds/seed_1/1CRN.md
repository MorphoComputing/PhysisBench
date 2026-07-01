# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1CRN\seeds\seed_1\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 2.590 A
- tm_score_ca_ordered: 0.5029492009435157
- heavy_atom_rmsd: 4.015 A
- sidechain_heavy_atom_rmsd: 5.062 A
- **all-atom quality (honest):** heavy 4.015 A, sidechain 5.062 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 861
- bin_accuracy: 0.321

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.5902524835168763
- ga_delta_rmsd: -0.20658655480528854  ga_fitness_mode: energy
- pre_local_rmsd: 2.7082162694281786  localized_anchor_rmsd: 2.590269111287224

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G30-A44 → 315 conflicts (72%); T1-V14 → 105 conflicts (24%)
- explained: 420/437 conflicts by 2 root cause(s)
- metrics: hubs=43 (frac 0.977), conflicts/hub=10.2, max_incompat=9.26Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G30-A44 + T1-V14 — explain ~420/437 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D42** — severity 19.66, 26 conflict(s); suspect input ~`P35` (group: pull_in)
  - pull-in (wants closer): I24@16.5Å(now 21.2,conf 0.15), I32@5.7Å(now 13.9,conf 0.38), I6@7.0Å(now 10.1,conf 0.27)
  - push-out (wants farther): R16@21.8Å(now 18.6,conf 0.29), N13@20.9Å(now 15.3,conf 0.26), P35@21.2Å(now 16.8,conf 0.27), S10@16.5Å(now 12.3,conf 0.15), T1@16.5Å(now 9.9,conf 0.15), V7@16.6Å(now 12.3,conf 0.15)
  - P35↔I32: targets 21.2/5.7Å but partners are 8.4Å apart → too_close_together by 7.1Å
  - P35↔C39: targets 21.2/5.9Å but partners are 9.5Å apart → too_close_together by 5.7Å
  - E22↔I32: targets 20.0/5.7Å but partners are 8.7Å apart → too_close_together by 5.6Å
- **P40** — severity 14.45, 20 conflict(s); suspect input ~`G30` (group: pull_in)
  - pull-in (wants closer): C31@7.1Å(now 11.5,conf 0.27), G30@7.4Å(now 13.3,conf 0.25)
  - push-out (wants farther): N11@22.1Å(now 18.3,conf 0.31), A23@19.8Å(now 16.9,conf 0.22), A44@8.7Å(now 5.6,conf 0.19), S5@17.0Å(now 11.2,conf 0.16)
  - A23↔C31: targets 19.8/7.1Å but partners are 6.5Å apart → too_close_together by 6.2Å
  - I24↔C31: targets 20.7/7.1Å but partners are 8.9Å apart → too_close_together by 4.7Å
  - T20↔C31: targets 24.8/7.1Å but partners are 13.7Å apart → too_close_together by 4.0Å
- **P21** — severity 13.99, 20 conflict(s); suspect input ~`T1` (group: push_out)
  - pull-in (wants closer): R9@9.4Å(now 15.0,conf 0.17), G30@8.5Å(now 12.9,conf 0.20), T1@8.6Å(now 12.6,conf 0.20)
  - push-out (wants farther): Y43@23.2Å(now 16.5,conf 0.37), C3@18.4Å(now 14.8,conf 0.19)
  - Y43↔T1: targets 23.2/8.6Å but partners are 5.4Å apart → too_close_together by 9.3Å
  - Y43↔R9: targets 23.2/9.4Å but partners are 7.8Å apart → too_close_together by 6.0Å
  - C3↔G30: targets 18.4/8.5Å but partners are 4.6Å apart → too_close_together by 5.3Å
- **A44** — severity 13.83, 20 conflict(s); suspect input ~`I32` (group: pull_in)
  - pull-in (wants closer): G19@16.8Å(now 20.6,conf 0.16), I32@8.3Å(now 11.8,conf 0.21), A37@8.4Å(now 11.2,conf 0.20)
  - push-out (wants farther): P18@24.6Å(now 20.8,conf 0.49), T20@23.0Å(now 20.0,conf 0.36), L17@22.0Å(now 18.0,conf 0.30), I24@22.4Å(now 18.6,conf 0.33), A23@22.2Å(now 16.2,conf 0.32), P4@9.4Å(now 6.9,conf 0.17), P40@8.7Å(now 5.6,conf 0.19), N11@20.4Å(now 13.8,conf 0.24), N13@18.1Å(now 12.6,conf 0.18), T29@16.8Å(now 12.8,conf 0.16), F12@16.6Å(now 13.1,conf 0.15)
  - A23↔I32: targets 22.2/8.3Å but partners are 6.4Å apart → too_close_together by 7.5Å
  - N11↔S10: targets 20.4/8.7Å but partners are 3.8Å apart → too_close_together by 7.8Å
  - A23↔C3: targets 22.2/6.9Å but partners are 10.6Å apart → too_close_together by 4.7Å
- **V14** — severity 13.00, 15 conflict(s); suspect input ~`R9` (group: pull_in)
  - pull-in (wants closer): G36@18.3Å(now 21.8,conf 0.19), R9@5.8Å(now 10.5,conf 0.36), A8@9.4Å(now 12.6,conf 0.17)
  - push-out (wants farther): G41@25.4Å(now 19.7,conf 0.57), C2@19.9Å(now 17.4,conf 0.23), E22@16.9Å(now 12.2,conf 0.16), P4@21.0Å(now 16.3,conf 0.26)
  - G41↔R9: targets 25.4/5.8Å but partners are 13.0Å apart → too_close_together by 6.6Å
  - R9↔P4: targets 5.8/21.0Å but partners are 6.3Å apart → too_close_together by 8.8Å
  - L17↔R9: targets 5.6/5.8Å but partners are 15.2Å apart → too_far_apart by 3.8Å
- **I24** — severity 11.19, 17 conflict(s); suspect input ~`I33` (group: pull_in)
  - pull-in (wants closer): D42@16.5Å(now 21.2,conf 0.15), I33@6.7Å(now 10.0,conf 0.29), R9@10.2Å(now 14.0,conf 0.15)
  - push-out (wants farther): A44@22.4Å(now 18.6,conf 0.33), T27@9.3Å(now 3.0,conf 0.17), V7@20.2Å(now 16.8,conf 0.23), I34@18.5Å(now 13.4,conf 0.19)
  - T38↔I33: targets 21.9/6.7Å but partners are 10.0Å apart → too_close_together by 5.2Å
  - I33↔I34: targets 6.7/18.5Å but partners are 4.6Å apart → too_close_together by 7.1Å
  - A44↔I33: targets 22.4/6.7Å but partners are 12.7Å apart → too_close_together by 3.0Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=17 · 3-10(G)=3 · coil(C)=3

```
CHEEEHHHEEHHEHHEHEHEEEHHHHHHGHEGHHEEGCECHEHE
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=10 · sheet=24
  - C2 ↔ I6  (helix)
  - V7 ↔ N11  (helix)
  - A8 ↔ F12  (helix)
  - N11 ↔ C15  (helix)
  - C15 ↔ G19  (helix)
  - G19 ↔ A23  (helix)
  - A23 ↔ T27  (helix)
  - I24 ↔ Y28  (helix)
  - A26 ↔ G30  (helix)
  - G30 ↔ I34  (helix)
  - C3 ↔ R9  (sheet)
  - C3 ↔ S10  (sheet)
  - C3 ↔ N13  (sheet)
  - C3 ↔ E22  (sheet)
  - P4 ↔ R9  (sheet)
  - P4 ↔ S10  (sheet)
  - S5 ↔ S10  (sheet)
  - S5 ↔ N13  (sheet)
  - R9 ↔ R16  (sheet)
  - R9 ↔ E22  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=157 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=59 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7988 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
