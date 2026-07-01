# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1CTF\seeds\seed_0\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 1.501 A
- tm_score_ca_ordered: 0.8065513449793081
- heavy_atom_rmsd: 2.670 A
- sidechain_heavy_atom_rmsd: 3.366 A
- **all-atom quality (honest):** heavy 2.670 A, sidechain 3.366 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 2016
- bin_accuracy: 0.322

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=1.7157780059633552 -> 1.5971814743689987 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.5011848862554222
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.509904604132285  localized_anchor_rmsd: 1.5012173185683222

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V3-K12 → 489 conflicts (41%); A37-L41 → 256 conflicts (22%); V15-V19 → 134 conflicts (11%)
- explained: 879/1186 conflicts by 3 root cause(s)
- metrics: hubs=66 (frac 1.0), conflicts/hub=18.0, max_incompat=9.45Å, chain_span=0.985
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V3-K12 + A37-L41 + V15-V19 — explain ~879/1186 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V19** — severity 31.77, 53 conflict(s); suspect input ~`D49` (group: push_out)
  - pull-in (wants closer): A7@9.4Å(now 13.2,conf 0.17), A10@9.2Å(now 14.8,conf 0.18), V3@7.6Å(now 11.8,conf 0.24), I4@9.0Å(now 13.8,conf 0.18), L41@6.1Å(now 8.7,conf 0.34), A62@6.8Å(now 10.7,conf 0.28), A39@8.3Å(now 10.8,conf 0.21), P38@10.0Å(now 14.0,conf 0.16), D49@9.5Å(now 13.8,conf 0.17)
  - push-out (wants farther): A30@8.2Å(now 5.2,conf 0.21), G44@20.5Å(now 17.1,conf 0.24), E63@16.5Å(now 13.8,conf 0.15), N11@17.1Å(now 11.9,conf 0.16)
  - L25↔A62: targets 5.6/6.8Å but partners are 16.5Å apart → too_far_apart by 4.0Å
  - G44↔L41: targets 20.5/6.1Å but partners are 10.3Å apart → too_close_together by 4.1Å
  - G24↔A62: targets 7.0/6.8Å but partners are 17.5Å apart → too_far_apart by 3.6Å
- **L41** — severity 31.00, 55 conflict(s); suspect input ~`K28` (group: push_out)
  - pull-in (wants closer): K28@9.0Å(now 13.2,conf 0.18), S36@7.3Å(now 9.9,conf 0.26), R20@8.0Å(now 12.8,conf 0.22), V19@6.1Å(now 8.7,conf 0.34), E65@6.5Å(now 10.2,conf 0.31), A22@8.5Å(now 11.6,conf 0.20), G26@10.4Å(now 13.4,conf 0.15)
  - push-out (wants farther): V3@8.9Å(now 5.7,conf 0.19), L27@16.6Å(now 13.6,conf 0.15), K12@18.4Å(now 15.3,conf 0.19), G61@19.1Å(now 15.7,conf 0.20), G21@16.9Å(now 14.0,conf 0.16), G44@18.0Å(now 10.3,conf 0.18), K31@16.7Å(now 12.4,conf 0.16), K55@18.1Å(now 15.3,conf 0.18)
  - K28↔E65: targets 9.0/6.5Å but partners are 22.3Å apart → too_far_apart by 6.8Å
  - K28↔F1: targets 9.0/8.5Å but partners are 22.8Å apart → too_far_apart by 5.3Å
  - F1↔G44: targets 8.5/18.0Å but partners are 4.5Å apart → too_close_together by 5.1Å
- **A40** — severity 30.29, 40 conflict(s); suspect input ~`V15` (group: pull_in)
  - pull-in (wants closer): D49@9.7Å(now 13.8,conf 0.16), T23@9.2Å(now 14.4,conf 0.18), V15@8.3Å(now 14.9,conf 0.21), A50@6.8Å(now 9.8,conf 0.29)
  - push-out (wants farther): A10@23.2Å(now 19.4,conf 0.37), V3@9.6Å(now 4.5,conf 0.17), E59@22.1Å(now 18.7,conf 0.31), D2@8.8Å(now 4.5,conf 0.19), D48@20.8Å(now 15.0,conf 0.25), E58@20.7Å(now 15.9,conf 0.25), E35@16.9Å(now 14.1,conf 0.16), G24@21.0Å(now 17.1,conf 0.26), K47@16.9Å(now 13.1,conf 0.16), A30@18.1Å(now 15.3,conf 0.18)
  - D48↔A50: targets 20.8/6.8Å but partners are 5.5Å apart → too_close_together by 8.5Å
  - A14↔V15: targets 21.8/8.3Å but partners are 4.7Å apart → too_close_together by 8.8Å
  - N11↔V15: targets 20.4/8.3Å but partners are 5.7Å apart → too_close_together by 6.4Å
- **V66** — severity 25.55, 33 conflict(s); suspect input ~`A37` (group: pull_in)
  - pull-in (wants closer): K28@18.1Å(now 23.4,conf 0.18), V13@19.0Å(now 21.8,conf 0.20), L5@7.0Å(now 10.2,conf 0.27), A37@9.1Å(now 15.7,conf 0.18), K6@6.5Å(now 11.6,conf 0.30)
  - push-out (wants farther): K31@24.4Å(now 21.2,conf 0.46), N11@22.8Å(now 19.2,conf 0.35), E35@22.9Å(now 20.0,conf 0.35), D2@9.7Å(now 5.5,conf 0.17), V15@18.9Å(now 16.0,conf 0.20), E59@20.6Å(now 14.7,conf 0.25), E51@10.0Å(now 6.8,conf 0.16), A22@18.6Å(now 15.3,conf 0.19), A60@18.8Å(now 15.7,conf 0.20)
  - E35↔L5: targets 22.9/7.0Å but partners are 10.4Å apart → too_close_together by 5.5Å
  - E35↔K6: targets 22.9/6.5Å but partners are 11.7Å apart → too_close_together by 4.6Å
  - S36↔A37: targets 20.2/9.1Å but partners are 3.4Å apart → too_close_together by 7.8Å
- **K17** — severity 24.95, 41 conflict(s); suspect input ~`V3` (group: push_out)
  - pull-in (wants closer): S46@20.0Å(now 22.6,conf 0.23), V3@9.2Å(now 16.8,conf 0.18), G61@7.8Å(now 11.1,conf 0.23), E59@8.5Å(now 11.6,conf 0.20), L5@9.5Å(now 13.8,conf 0.17), A8@6.4Å(now 11.2,conf 0.32), K55@9.1Å(now 16.0,conf 0.18), L33@10.4Å(now 13.5,conf 0.15)
  - push-out (wants farther): L53@16.7Å(now 14.0,conf 0.16), K6@19.9Å(now 16.4,conf 0.23), S36@17.8Å(now 15.2,conf 0.17), A39@21.3Å(now 16.1,conf 0.27)
  - K6↔A8: targets 19.9/6.4Å but partners are 6.3Å apart → too_close_together by 7.2Å
  - K6↔L5: targets 19.9/9.5Å but partners are 3.6Å apart → too_close_together by 6.9Å
  - A39↔A8: targets 21.3/6.4Å but partners are 10.8Å apart → too_close_together by 4.1Å
- **A8** — severity 23.22, 30 conflict(s); suspect input ~`L57` (group: push_out)
  - pull-in (wants closer): A14@6.6Å(now 9.8,conf 0.30), L57@5.9Å(now 9.4,conf 0.35), P38@5.6Å(now 9.7,conf 0.38), L27@10.4Å(now 15.0,conf 0.15), K17@6.4Å(now 11.2,conf 0.32)
  - push-out (wants farther): D49@23.8Å(now 19.1,conf 0.41), A50@18.8Å(now 16.0,conf 0.20), V15@10.2Å(now 6.1,conf 0.15), A22@20.3Å(now 15.4,conf 0.24)
  - D49↔L57: targets 23.8/5.9Å but partners are 12.1Å apart → too_close_together by 5.7Å
  - P38↔K17: targets 5.6/6.4Å but partners are 18.1Å apart → too_far_apart by 6.1Å
  - A14↔P38: targets 6.6/5.6Å but partners are 18.4Å apart → too_far_apart by 6.2Å

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=18 · 3-10(G)=7 · coil(C)=4

```
CEEHHHHHHHHEGHHGHHHHHEEGEGHHEHEEHHHEEHHHHHEHHHHEHHEHCEHEHHCHGEGGEC
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=13 · sheet=22
  - I4 ↔ A8  (helix)
  - L5 ↔ G9  (helix)
  - K6 ↔ A10  (helix)
  - A10 ↔ A14  (helix)
  - N11 ↔ V15  (helix)
  - V15 ↔ V19  (helix)
  - K17 ↔ G21  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - E35 ↔ A39  (helix)
  - A40 ↔ G44  (helix)
  - L41 ↔ V45  (helix)
  - V45 ↔ D49  (helix)
  - K12 ↔ E29  (sheet)
  - K12 ↔ K31  (sheet)
  - K12 ↔ D32  (sheet)
  - T23 ↔ E29  (sheet)
  - L25 ↔ K31  (sheet)
  - L25 ↔ D32  (sheet)
  - E29 ↔ S36  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=266 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=106 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.741 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
