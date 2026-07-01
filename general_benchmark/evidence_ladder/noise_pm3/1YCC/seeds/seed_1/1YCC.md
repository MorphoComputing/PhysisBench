# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1YCC\seeds\seed_1\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 2.107 A
- tm_score_ca_ordered: 0.7886986699117091
- heavy_atom_rmsd: 3.760 A
- sidechain_heavy_atom_rmsd: 4.748 A
- **all-atom quality (honest):** heavy 3.760 A, sidechain 4.748 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 3282
- bin_accuracy: 0.316

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.1070681275779517
- ga_delta_rmsd: 2.8645392634807085  ga_fitness_mode: energy
- pre_local_rmsd: 2.1341180859197633  localized_anchor_rmsd: 2.1070594952503217

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T79-K100 → 966 conflicts (45%); H30-G38 → 449 conflicts (21%); L62-T73 → 372 conflicts (17%)
- explained: 1787/2161 conflicts by 3 root cause(s)
- metrics: hubs=103 (frac 1.0), conflicts/hub=21.0, max_incompat=10.12Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T79-K100 + H30-G38 + L62-T73 — explain ~1787/2161 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q46** — severity 41.36, 50 conflict(s); suspect input ~`Y71` (group: push_out)
  - pull-in (wants closer): D91@21.8Å(now 24.6,conf 0.30), Y71@9.0Å(now 16.1,conf 0.18), K58@7.8Å(now 11.5,conf 0.23), N35@6.8Å(now 10.7,conf 0.28), L62@7.0Å(now 12.5,conf 0.27), G41@7.8Å(now 10.8,conf 0.23), N60@7.2Å(now 12.1,conf 0.26), H30@7.5Å(now 11.2,conf 0.24), G28@10.0Å(now 14.3,conf 0.16)
  - push-out (wants farther): L99@19.5Å(now 16.8,conf 0.21), C21@18.8Å(now 14.9,conf 0.20), G78@19.1Å(now 16.6,conf 0.20), R42@10.3Å(now 6.6,conf 0.15), H22@17.5Å(now 14.9,conf 0.17), E25@19.2Å(now 15.4,conf 0.21), K31@19.7Å(now 12.8,conf 0.22), P29@18.6Å(now 14.1,conf 0.19), T23@17.5Å(now 14.2,conf 0.17), S51@10.2Å(now 7.5,conf 0.15)
  - N35↔K31: targets 6.8/19.7Å but partners are 4.8Å apart → too_close_together by 8.1Å
  - K31↔H30: targets 19.7/7.5Å but partners are 4.6Å apart → too_close_together by 7.5Å
  - N60↔H30: targets 7.2/7.5Å but partners are 20.9Å apart → too_far_apart by 6.2Å
- **K80** — severity 41.20, 60 conflict(s); suspect input ~`C18` (group: push_out)
  - pull-in (wants closer): A102@20.6Å(now 24.5,conf 0.25), T97@17.4Å(now 23.0,conf 0.17), K100@16.7Å(now 23.2,conf 0.16), K101@21.7Å(now 25.4,conf 0.29), I76@6.6Å(now 9.6,conf 0.30), K31@9.6Å(now 15.4,conf 0.17), G33@7.5Å(now 10.7,conf 0.24), K59@10.0Å(now 12.9,conf 0.16), S44@8.4Å(now 12.7,conf 0.20), S51@6.7Å(now 11.5,conf 0.29), N74@8.9Å(now 11.7,conf 0.19), C18@8.0Å(now 13.5,conf 0.22)
  - push-out (wants farther): E89@25.5Å(now 20.6,conf 0.58), C103@25.6Å(now 22.9,conf 0.59), R92@23.5Å(now 20.4,conf 0.39), K87@18.2Å(now 14.9,conf 0.18), G49@20.0Å(now 15.6,conf 0.23), A47@20.5Å(now 17.1,conf 0.24), R17@17.2Å(now 13.9,conf 0.17), P34@19.2Å(now 14.8,conf 0.21)
  - G49↔S51: targets 20.0/6.7Å but partners are 5.7Å apart → too_close_together by 7.7Å
  - G33↔P34: targets 7.5/19.2Å but partners are 4.8Å apart → too_close_together by 6.9Å
  - S51↔A47: targets 6.7/20.5Å but partners are 8.1Å apart → too_close_together by 5.7Å
- **M68** — severity 38.51, 63 conflict(s); suspect input ~`G33` (group: pull_in)
  - pull-in (wants closer): R17@10.4Å(now 16.3,conf 0.15), V24@10.3Å(now 17.4,conf 0.15), G5@8.9Å(now 12.6,conf 0.19), G33@8.6Å(now 15.5,conf 0.20), Y75@5.8Å(now 9.2,conf 0.36)
  - push-out (wants farther): G78@18.1Å(now 14.8,conf 0.18), K58@21.2Å(now 14.6,conf 0.27), I57@20.5Å(now 14.6,conf 0.25), A7@18.8Å(now 14.6,conf 0.20), Y98@17.0Å(now 12.5,conf 0.16), F14@18.3Å(now 14.0,conf 0.18), K101@16.5Å(now 13.6,conf 0.15)
  - K58↔I76: targets 21.2/7.9Å but partners are 7.7Å apart → too_close_together by 5.6Å
  - G33↔F2: targets 8.6/7.8Å but partners are 22.6Å apart → too_far_apart by 6.1Å
  - K100↔Y75: targets 8.5/5.8Å but partners are 19.5Å apart → too_far_apart by 5.2Å
- **F14** — severity 34.94, 55 conflict(s); suspect input ~`M68` (group: push_out)
  - pull-in (wants closer): G85@7.3Å(now 12.0,conf 0.26), T73@9.5Å(now 13.7,conf 0.17), R92@6.5Å(now 10.7,conf 0.31), K101@9.9Å(now 13.2,conf 0.16), L36@7.8Å(now 10.6,conf 0.23), P34@9.2Å(now 13.5,conf 0.18), L72@5.6Å(now 11.8,conf 0.38)
  - push-out (wants farther): R17@9.0Å(now 6.0,conf 0.18), D64@20.0Å(now 17.2,conf 0.23), K87@17.0Å(now 14.2,conf 0.16), I39@19.4Å(now 13.8,conf 0.21), G33@17.4Å(now 12.1,conf 0.17), G84@16.8Å(now 14.2,conf 0.16), F40@19.3Å(now 15.5,conf 0.21), M68@18.3Å(now 14.0,conf 0.18), K100@16.6Å(now 12.5,conf 0.15)
  - K59↔L72: targets 23.4/5.6Å but partners are 14.0Å apart → too_close_together by 3.7Å
  - A11↔L72: targets 5.7/5.6Å but partners are 15.0Å apart → too_far_apart by 3.7Å
  - M68↔L72: targets 18.3/5.6Å but partners are 5.4Å apart → too_close_together by 7.3Å
- **L99** — severity 33.29, 49 conflict(s); suspect input ~`E70` (group: pull_in)
  - pull-in (wants closer): S69@8.6Å(now 13.7,conf 0.20), E70@9.3Å(now 15.7,conf 0.17), K15@10.3Å(now 13.0,conf 0.15), R92@5.8Å(now 10.8,conf 0.36), L19@10.3Å(now 13.5,conf 0.15)
  - push-out (wants farther): Q46@19.5Å(now 16.8,conf 0.21), N74@21.1Å(now 18.6,conf 0.27), V61@19.9Å(now 17.1,conf 0.23), E1@20.1Å(now 16.2,conf 0.23), K3@16.6Å(now 11.8,conf 0.15), F2@16.9Å(now 13.9,conf 0.16), P29@18.3Å(now 13.3,conf 0.18), H30@18.1Å(now 14.4,conf 0.18), W63@18.1Å(now 12.0,conf 0.18), G27@18.1Å(now 11.9,conf 0.18)
  - E25↔R92: targets 6.3/5.8Å but partners are 18.9Å apart → too_far_apart by 6.7Å
  - C103↔R92: targets 5.6/5.8Å but partners are 15.4Å apart → too_far_apart by 3.9Å
  - E25↔G27: targets 6.3/18.1Å but partners are 4.0Å apart → too_close_together by 7.7Å
- **H37** — severity 32.83, 47 conflict(s); suspect input ~`H43` (group: pull_in)
  - pull-in (wants closer): G84@18.2Å(now 22.9,conf 0.18), G85@17.2Å(now 20.0,conf 0.16), L86@16.7Å(now 20.3,conf 0.16), E70@16.4Å(now 19.6,conf 0.15), I96@9.8Å(now 12.8,conf 0.16), L19@9.4Å(now 13.7,conf 0.17), H43@7.9Å(now 12.2,conf 0.22), D64@7.2Å(now 14.1,conf 0.26)
  - push-out (wants farther): K8@19.0Å(now 16.2,conf 0.20), D94@21.2Å(now 16.9,conf 0.27), N60@21.1Å(now 17.8,conf 0.27), I57@19.9Å(now 16.8,conf 0.22), M81@19.8Å(now 17.1,conf 0.22), N56@23.2Å(now 17.5,conf 0.37), A102@9.3Å(now 6.7,conf 0.17), V32@17.4Å(now 13.0,conf 0.17), K31@17.9Å(now 11.3,conf 0.18), Y50@17.7Å(now 12.9,conf 0.17), L95@16.8Å(now 13.8,conf 0.16), G49@16.4Å(now 11.5,conf 0.15)
  - N60↔H43: targets 21.1/7.9Å but partners are 6.3Å apart → too_close_together by 6.8Å
  - N56↔H43: targets 23.2/7.9Å but partners are 8.5Å apart → too_close_together by 6.7Å
  - D64↔G28: targets 7.2/7.3Å but partners are 20.1Å apart → too_far_apart by 5.7Å

## Secondary Structure (DSSP-like)

- helix(H)=44 · strand(E)=41 · 3-10(G)=10 · coil(C)=8

```
ECECEECEHHHHHHEHEHHHEEEEEHEEEHEGEHHHHHHHHEEECCHGCEGEGEHEHEEEEGHEHEHHHGHEHCEEGCEHHHHEGHHEEHHEHHHGEHEHGHE
```

## Backbone H-bond Network

- total=105 · helix(i→i+4)=21 · sheet=84
  - K9 ↔ L13  (helix)
  - G10 ↔ F14  (helix)
  - F14 ↔ C18  (helix)
  - T16 ↔ Q20  (helix)
  - K26 ↔ H30  (helix)
  - H30 ↔ P34  (helix)
  - P34 ↔ G38  (helix)
  - N35 ↔ I39  (helix)
  - H37 ↔ G41  (helix)
  - W63 ↔ N67  (helix)
  - E65 ↔ S69  (helix)
  - N67 ↔ Y71  (helix)
  - S69 ↔ T73  (helix)
  - A82 ↔ L86  (helix)
  - F83 ↔ K87  (helix)
  - L86 ↔ K90  (helix)
  - K87 ↔ D91  (helix)
  - K90 ↔ D94  (helix)
  - D91 ↔ L95  (helix)
  - D94 ↔ Y98  (helix)
  - … +85 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=51 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=449 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=213 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.657 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
