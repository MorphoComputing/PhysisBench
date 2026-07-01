# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1CRN\seeds\seed_0\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 2.705 A
- tm_score_ca_ordered: 0.48348599554433525
- heavy_atom_rmsd: 3.760 A
- sidechain_heavy_atom_rmsd: 4.621 A
- **all-atom quality (honest):** heavy 3.760 A, sidechain 4.621 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 861
- bin_accuracy: 0.316

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.7047933925829653
- ga_delta_rmsd: 0.7219239176980805  ga_fitness_mode: energy
- pre_local_rmsd: 2.8332503184797355  localized_anchor_rmsd: 2.704764870626909

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T1-V14 → 270 conflicts (60%); G30-P35 → 142 conflicts (31%); T38-A44 → 31 conflicts (7%)
- explained: 443/453 conflicts by 3 root cause(s)
- metrics: hubs=44 (frac 1.0), conflicts/hub=10.3, max_incompat=8.78Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T1-V14 + G30-P35 + T38-A44 — explain ~443/453 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D42** — severity 17.97, 23 conflict(s); suspect input ~`P35` (group: pull_in)
  - pull-in (wants closer): I24@16.5Å(now 21.6,conf 0.15), A23@16.6Å(now 19.3,conf 0.15), I32@5.7Å(now 14.2,conf 0.38), I6@7.0Å(now 9.6,conf 0.27)
  - push-out (wants farther): R16@21.8Å(now 18.3,conf 0.29), N13@20.9Å(now 15.2,conf 0.26), P35@21.2Å(now 17.7,conf 0.27), S10@16.5Å(now 11.9,conf 0.15), T1@16.5Å(now 11.2,conf 0.15), V7@16.6Å(now 11.9,conf 0.15)
  - P35↔I32: targets 21.2/5.7Å but partners are 8.9Å apart → too_close_together by 6.7Å
  - P35↔C39: targets 21.2/5.9Å but partners are 10.0Å apart → too_close_together by 5.2Å
  - E22↔I32: targets 20.0/5.7Å but partners are 8.5Å apart → too_close_together by 5.9Å
- **P40** — severity 14.69, 21 conflict(s); suspect input ~`G30` (group: pull_in)
  - pull-in (wants closer): C31@7.1Å(now 11.4,conf 0.27), G30@7.4Å(now 13.2,conf 0.25)
  - push-out (wants farther): V14@22.3Å(now 19.7,conf 0.32), N11@22.1Å(now 18.1,conf 0.31), S10@17.5Å(now 14.5,conf 0.17), A23@19.8Å(now 17.1,conf 0.22), A44@8.7Å(now 5.3,conf 0.19), S5@17.0Å(now 10.2,conf 0.16)
  - A23↔C31: targets 19.8/7.1Å but partners are 6.6Å apart → too_close_together by 6.1Å
  - I24↔C31: targets 20.7/7.1Å but partners are 9.0Å apart → too_close_together by 4.7Å
  - T20↔C31: targets 24.8/7.1Å but partners are 13.7Å apart → too_close_together by 4.0Å
- **P21** — severity 14.22, 22 conflict(s); suspect input ~`T1` (group: pull_in)
  - pull-in (wants closer): R9@9.4Å(now 14.9,conf 0.17), G30@8.5Å(now 13.2,conf 0.20), T1@8.6Å(now 12.0,conf 0.20)
  - push-out (wants farther): Y43@23.2Å(now 16.6,conf 0.37), C3@18.4Å(now 14.7,conf 0.19), P35@16.6Å(now 14.0,conf 0.15)
  - Y43↔T1: targets 23.2/8.6Å but partners are 6.4Å apart → too_close_together by 8.2Å
  - Y43↔R9: targets 23.2/9.4Å but partners are 7.2Å apart → too_close_together by 6.6Å
  - C3↔G30: targets 18.4/8.5Å but partners are 5.1Å apart → too_close_together by 4.8Å
- **V14** — severity 14.17, 15 conflict(s); suspect input ~`R9` (group: pull_in)
  - pull-in (wants closer): G36@18.3Å(now 21.9,conf 0.19), R9@5.8Å(now 10.2,conf 0.36), A8@9.4Å(now 12.4,conf 0.17)
  - push-out (wants farther): G41@25.4Å(now 19.5,conf 0.57), P40@22.3Å(now 19.7,conf 0.32), E22@16.9Å(now 12.8,conf 0.16), P4@21.0Å(now 16.3,conf 0.26)
  - G41↔R9: targets 25.4/5.8Å but partners are 12.1Å apart → too_close_together by 7.5Å
  - R9↔P4: targets 5.8/21.0Å but partners are 6.4Å apart → too_close_together by 8.8Å
  - P40↔R9: targets 22.3/5.8Å but partners are 11.6Å apart → too_close_together by 4.9Å
- **N11** — severity 13.39, 20 conflict(s); suspect input ~`T27` (group: pull_in)
  - pull-in (wants closer): V7@6.1Å(now 8.8,conf 0.34), P4@8.8Å(now 12.7,conf 0.19), C31@7.4Å(now 11.4,conf 0.25)
  - push-out (wants farther): P40@22.1Å(now 18.1,conf 0.31), A44@20.4Å(now 14.0,conf 0.24), T27@17.9Å(now 10.9,conf 0.18), Y43@16.5Å(now 13.5,conf 0.15)
  - P40↔P4: targets 22.1/8.8Å but partners are 7.3Å apart → too_close_together by 6.1Å
  - T29↔T27: targets 6.8/17.9Å but partners are 5.0Å apart → too_close_together by 6.1Å
  - T27↔C25: targets 17.9/8.4Å but partners are 3.4Å apart → too_close_together by 6.1Å
- **A44** — severity 12.70, 18 conflict(s); suspect input ~`I32` (group: pull_in)
  - pull-in (wants closer): G19@16.8Å(now 20.2,conf 0.16), I32@8.3Å(now 11.6,conf 0.21)
  - push-out (wants farther): P18@24.6Å(now 20.3,conf 0.49), T20@23.0Å(now 19.7,conf 0.36), L17@22.0Å(now 17.4,conf 0.30), I24@22.4Å(now 18.7,conf 0.33), A23@22.2Å(now 16.3,conf 0.32), P4@9.4Å(now 6.9,conf 0.17), P40@8.7Å(now 5.3,conf 0.19), N11@20.4Å(now 14.0,conf 0.24), N13@18.1Å(now 12.7,conf 0.18), T29@16.8Å(now 13.0,conf 0.16), F12@16.6Å(now 13.1,conf 0.15)
  - A23↔I32: targets 22.2/8.3Å but partners are 6.4Å apart → too_close_together by 7.5Å
  - N11↔S10: targets 20.4/8.7Å but partners are 4.0Å apart → too_close_together by 7.7Å
  - A23↔C3: targets 22.2/6.9Å but partners are 10.6Å apart → too_close_together by 4.7Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=15 · 3-10(G)=6 · coil(C)=1

```
CGEEEHHHHEHHEHHEHEHHEEHHHHGHEHEGHHEEGHEGGHHE
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=11 · sheet=24
  - V7 ↔ N11  (helix)
  - A8 ↔ F12  (helix)
  - N11 ↔ C15  (helix)
  - C15 ↔ G19  (helix)
  - G19 ↔ A23  (helix)
  - T20 ↔ I24  (helix)
  - I24 ↔ Y28  (helix)
  - A26 ↔ G30  (helix)
  - G30 ↔ I34  (helix)
  - I34 ↔ T38  (helix)
  - T38 ↔ D42  (helix)
  - C3 ↔ S10  (sheet)
  - C3 ↔ N13  (sheet)
  - C3 ↔ E22  (sheet)
  - P4 ↔ S10  (sheet)
  - S5 ↔ S10  (sheet)
  - S5 ↔ N13  (sheet)
  - S10 ↔ R16  (sheet)
  - S10 ↔ T29  (sheet)
  - N13 ↔ P18  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=156 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=63 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8058 (restraint satisfaction; lower=better)
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
