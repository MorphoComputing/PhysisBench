# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1NXB\sequence\1NXB.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1NXB\seeds\seed_1\1NXB.pdb`
- residues: 60
- mode: oracle
- ca_rmsd: 2.451 A
- tm_score_ca_ordered: 0.6341853684377189
- heavy_atom_rmsd: 3.546 A
- sidechain_heavy_atom_rmsd: 4.235 A
- **all-atom quality (honest):** heavy 3.546 A, sidechain 4.235 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 4/4
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/55 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 1653
- bin_accuracy: 0.339

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=42
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.450700877176711
- ga_delta_rmsd: 0.038886684024173945  ga_fitness_mode: energy
- pre_local_rmsd: 2.483020638384274  localized_anchor_rmsd: 2.4507873817460886

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S22-S29 → 453 conflicts (45%); T34-C40 → 181 conflicts (18%); C2-S8 → 129 conflicts (13%)
- explained: 763/1009 conflicts by 3 root cause(s)
- metrics: hubs=60 (frac 1.0), conflicts/hub=16.8, max_incompat=9.52Å, chain_span=0.983
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S22-S29 + T34-C40 + C2-S8 — explain ~763/1009 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S29** — severity 40.02, 54 conflict(s); suspect input ~`N60` (group: pull_in)
  - pull-in (wants closer): N60@9.3Å(now 16.1,conf 0.17), S7@6.5Å(now 10.0,conf 0.30), H6@8.3Å(now 11.6,conf 0.21)
  - push-out (wants farther): V58@23.9Å(now 20.8,conf 0.42), C2@25.0Å(now 20.2,conf 0.53), C59@22.5Å(now 19.8,conf 0.33), C54@23.2Å(now 20.3,conf 0.37), C40@22.6Å(now 19.6,conf 0.33), C23@23.6Å(now 20.1,conf 0.40), Q11@21.1Å(now 18.5,conf 0.27), Q5@20.9Å(now 15.1,conf 0.26), Q9@19.8Å(now 15.5,conf 0.22), V45@17.5Å(now 14.9,conf 0.17)
  - S7↔Q5: targets 6.5/20.9Å but partners are 6.7Å apart → too_close_together by 7.7Å
  - Q5↔H6: targets 20.9/8.3Å but partners are 3.9Å apart → too_close_together by 8.8Å
  - V58↔N60: targets 23.9/9.3Å but partners are 5.1Å apart → too_close_together by 9.5Å
- **H25** — severity 25.82, 37 conflict(s); suspect input ~`Q11` (group: push_out)
  - pull-in (wants closer): G39@6.2Å(now 8.8,conf 0.33), C40@7.8Å(now 10.5,conf 0.23), Q11@9.9Å(now 14.6,conf 0.16), H6@6.7Å(now 10.6,conf 0.29), Q5@6.3Å(now 10.7,conf 0.32)
  - push-out (wants farther): N60@7.4Å(now 4.0,conf 0.25), I36@8.4Å(now 5.5,conf 0.20), D30@19.6Å(now 16.1,conf 0.22), C16@19.9Å(now 15.0,conf 0.23), P47@19.2Å(now 16.1,conf 0.21), G48@17.4Å(now 14.7,conf 0.17)
  - G39↔C16: targets 6.2/19.9Å but partners are 6.5Å apart → too_close_together by 7.2Å
  - C16↔C40: targets 19.9/7.8Å but partners are 6.0Å apart → too_close_together by 6.1Å
  - P18↔G39: targets 21.9/6.2Å but partners are 11.4Å apart → too_close_together by 4.2Å
- **W28** — severity 24.21, 30 conflict(s); suspect input ~`G39` (group: pull_in)
  - pull-in (wants closer): E20@18.9Å(now 22.4,conf 0.20), S17@19.6Å(now 23.0,conf 0.22), K14@16.3Å(now 20.4,conf 0.15), R32@7.7Å(now 11.3,conf 0.23), G39@9.3Å(now 15.2,conf 0.18), T44@9.1Å(now 13.5,conf 0.18), P47@7.3Å(now 10.1,conf 0.26)
  - push-out (wants farther): T13@22.3Å(now 19.8,conf 0.32), S22@22.5Å(now 19.3,conf 0.33), I35@8.9Å(now 5.3,conf 0.19), K50@7.8Å(now 4.2,conf 0.23), G41@19.1Å(now 15.6,conf 0.20), N60@17.9Å(now 13.3,conf 0.18), Y24@22.0Å(now 11.6,conf 0.30), Q9@21.1Å(now 17.5,conf 0.27)
  - I36↔Y24: targets 5.6/22.0Å but partners are 8.6Å apart → too_close_together by 7.7Å
  - Y24↔H25: targets 22.0/9.5Å but partners are 4.4Å apart → too_close_together by 8.1Å
  - G39↔Y24: targets 9.3/22.0Å but partners are 5.2Å apart → too_close_together by 7.5Å
- **G39** — severity 23.51, 38 conflict(s); suspect input ~`W28` (group: push_out)
  - pull-in (wants closer): H25@6.2Å(now 8.8,conf 0.33), K26@6.3Å(now 9.6,conf 0.32), W28@9.3Å(now 15.2,conf 0.18), I36@7.8Å(now 11.4,conf 0.23), T12@7.6Å(now 10.3,conf 0.24), S7@9.8Å(now 12.9,conf 0.16)
  - push-out (wants farther): R32@23.2Å(now 19.3,conf 0.38), C23@8.9Å(now 5.5,conf 0.19), C2@7.4Å(now 4.1,conf 0.25)
  - C42↔T12: targets 6.9/7.6Å but partners are 18.9Å apart → too_far_apart by 4.5Å
  - K14↔K26: targets 5.8/6.3Å but partners are 15.6Å apart → too_far_apart by 3.4Å
  - K14↔W28: targets 5.8/9.3Å but partners are 20.4Å apart → too_far_apart by 5.4Å
- **T44** — severity 23.30, 33 conflict(s); suspect input ~`C23` (group: push_out)
  - pull-in (wants closer): T13@18.2Å(now 20.8,conf 0.18), I1@16.8Å(now 19.8,conf 0.16), C23@8.3Å(now 12.4,conf 0.21), S22@8.3Å(now 12.2,conf 0.21), K50@5.6Å(now 10.5,conf 0.38), W28@9.1Å(now 13.5,conf 0.18)
  - push-out (wants farther): C59@20.8Å(now 17.0,conf 0.25), C16@21.0Å(now 17.5,conf 0.26), C54@19.8Å(now 12.6,conf 0.22), G48@17.7Å(now 10.9,conf 0.17)
  - T34↔K50: targets 21.9/5.6Å but partners are 11.7Å apart → too_close_together by 4.6Å
  - C54↔G41: targets 19.8/7.7Å but partners are 6.3Å apart → too_close_together by 5.8Å
  - C23↔C54: targets 8.3/19.8Å but partners are 5.3Å apart → too_close_together by 6.1Å
- **K26** — severity 21.67, 35 conflict(s); suspect input ~`Q9` (group: pull_in)
  - pull-in (wants closer): G39@6.3Å(now 9.6,conf 0.32), S22@8.8Å(now 13.5,conf 0.19)
  - push-out (wants farther): S52@9.2Å(now 5.6,conf 0.18), E57@17.0Å(now 14.4,conf 0.16), S56@16.8Å(now 13.2,conf 0.16), E55@17.8Å(now 13.3,conf 0.18), Q9@21.5Å(now 15.5,conf 0.28), T12@19.7Å(now 16.2,conf 0.22), S8@16.9Å(now 11.7,conf 0.16)
  - Q9↔H6: targets 21.5/7.8Å but partners are 6.5Å apart → too_close_together by 7.3Å
  - E37↔Q9: targets 5.8/21.5Å but partners are 11.0Å apart → too_close_together by 4.8Å
  - P18↔G39: targets 21.6/6.3Å but partners are 11.4Å apart → too_close_together by 3.9Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=23 · 3-10(G)=11 · coil(C)=4

```
CCHHEEHHEEHEGEGHGGEEHHGEHHHEGEHEEGCHEGEEHEEHHGGHCEHEHEHEGHHE
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=10 · sheet=40
  - F3 ↔ S7  (helix)
  - N4 ↔ S8  (helix)
  - S7 ↔ Q11  (helix)
  - S21 ↔ H25  (helix)
  - S22 ↔ K26  (helix)
  - Q27 ↔ F31  (helix)
  - G41 ↔ V45  (helix)
  - T44 ↔ G48  (helix)
  - L51 ↔ E55  (helix)
  - E55 ↔ C59  (helix)
  - Q5 ↔ P10  (sheet)
  - Q5 ↔ T12  (sheet)
  - Q5 ↔ K14  (sheet)
  - Q5 ↔ Y24  (sheet)
  - H6 ↔ T12  (sheet)
  - H6 ↔ K14  (sheet)
  - H6 ↔ Y24  (sheet)
  - K14 ↔ G19  (sheet)
  - K14 ↔ E20  (sheet)
  - K14 ↔ Y24  (sheet)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=224 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=141 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.632 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=4: C2–C23, C16–C40, C42–C53, C54–C59

## Side-chain Rotamers (χ1/χ2)

- 55 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
