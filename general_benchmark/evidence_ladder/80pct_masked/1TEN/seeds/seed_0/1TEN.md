# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1TEN/sequence/1TEN.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1TEN/seeds/seed_0/1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 4.427 A
- tm_score_ca_ordered: 0.5411039308256214
- heavy_atom_rmsd: 5.439 A
- sidechain_heavy_atom_rmsd: 6.341 A
- **all-atom quality (honest):** heavy 5.439 A, sidechain 6.341 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 26
- distogram_pairs: 731
- bin_accuracy: 0.506

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=51
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.427039146882296
- ga_delta_rmsd: 2.3551934793269638  ga_fitness_mode: energy
- pre_local_rmsd: 4.427438473875977  localized_anchor_rmsd: 4.427045463410061

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K62-T65 → 61 conflicts (44%); T16-W21 → 27 conflicts (19%); E53-Y56 → 12 conflicts (9%)
- explained: 100/140 conflicts by 3 root cause(s)
- metrics: hubs=43 (frac 0.489), conflicts/hub=3.3, max_incompat=8.57Å, chain_span=0.92
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K62-T65 + T16-W21 + E53-Y56 — explain ~100/140 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K38** — severity 20.07, 12 conflict(s); suspect input ~`E68` (group: pull_in)
  - pull-in (wants closer): E68@5.0Å(now 8.0,conf 0.57), E85@10.0Å(now 12.6,conf 0.55)
  - push-out (wants farther): D52@27.4Å(now 24.6,conf 0.95), T16@15.6Å(now 8.3,conf 0.55)
  - Y67↔T16: targets 4.8/15.6Å but partners are 4.1Å apart → too_close_together by 6.7Å
  - D52↔E68: targets 27.4/5.0Å but partners are 16.8Å apart → too_close_together by 5.6Å
  - I31↔E68: targets 20.2/5.0Å but partners are 12.2Å apart → too_close_together by 3.0Å
- **T20** — severity 19.95, 10 conflict(s); suspect input ~`V9` (group: pull_in)
  - pull-in (wants closer): V9@6.5Å(now 10.5,conf 0.55)
  - push-out (wants farther): D64@21.1Å(now 15.2,conf 0.60), P63@20.7Å(now 16.8,conf 0.59), L25@15.7Å(now 13.1,conf 0.55)
  - D64↔V9: targets 21.1/6.5Å but partners are 6.0Å apart → too_close_together by 8.6Å
  - D64↔E8: targets 21.1/5.5Å but partners are 9.4Å apart → too_close_together by 6.2Å
  - P63↔V9: targets 20.7/6.5Å but partners are 9.6Å apart → too_close_together by 4.6Å
- **W21** — severity 18.94, 9 conflict(s); suspect input ~`L18` (group: push_out)
  - push-out (wants farther): K62@22.9Å(now 18.2,conf 0.72), T65@22.1Å(now 18.4,conf 0.64), N60@21.2Å(now 13.4,conf 0.60), G76@20.8Å(now 17.7,conf 0.59), L61@20.2Å(now 14.4,conf 0.58), G59@18.1Å(now 10.7,conf 0.55)
  - N60↔L18: targets 21.2/10.2Å but partners are 3.1Å apart → too_close_together by 7.8Å
  - T65↔L18: targets 22.1/10.2Å but partners are 7.6Å apart → too_close_together by 4.3Å
  - L61↔L18: targets 20.2/10.2Å but partners are 5.8Å apart → too_close_together by 4.2Å
- **E53** — severity 16.69, 11 conflict(s); suspect input ~`L18` (group: push_out)
  - push-out (wants farther): D64@27.5Å(now 22.8,conf 0.98), P63@27.1Å(now 22.5,conf 0.87), L61@21.4Å(now 18.1,conf 0.60), G36@20.2Å(now 15.8,conf 0.58), L49@6.3Å(now 3.1,conf 0.55), E27@13.0Å(now 10.5,conf 0.55)
  - P63↔L18: targets 27.1/12.8Å but partners are 9.5Å apart → too_close_together by 4.9Å
  - D64↔E8: targets 27.5/14.5Å but partners are 9.4Å apart → too_close_together by 3.5Å
  - D64↔L18: targets 27.5/12.8Å but partners are 11.2Å apart → too_close_together by 3.5Å
- **A17** — severity 10.43, 7 conflict(s); suspect input ~`Y56` (group: pull_in)
  - pull-in (wants closer): Y56@8.5Å(now 12.1,conf 0.55)
  - push-out (wants farther): G42@20.3Å(now 14.8,conf 0.59), L61@8.4Å(now 4.1,conf 0.55), G36@12.2Å(now 8.5,conf 0.55), T65@12.1Å(now 4.2,conf 0.55)
  - T13↔Y56: targets 6.5/8.5Å but partners are 18.7Å apart → too_far_apart by 3.7Å
  - A26↔Y56: targets 27.2/8.5Å but partners are 15.1Å apart → too_close_together by 3.7Å
  - L49↔Y56: targets 16.7/8.5Å but partners are 5.0Å apart → too_close_together by 3.2Å
- **T65** — severity 10.30, 6 conflict(s); suspect input ~`T88` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 31.5,conf 1.00), T88@5.4Å(now 8.4,conf 0.56)
  - push-out (wants farther): D48@23.4Å(now 20.5,conf 0.76), F22@26.4Å(now 21.7,conf 0.75), S5@24.3Å(now 20.6,conf 0.72), L49@24.3Å(now 20.0,conf 0.72), W21@22.1Å(now 18.4,conf 0.64), V9@14.4Å(now 7.6,conf 0.55), A17@12.1Å(now 4.2,conf 0.55)
  - S5↔T88: targets 24.3/5.4Å but partners are 15.3Å apart → too_close_together by 3.6Å
  - T88↔V9: targets 5.4/14.4Å but partners are 5.3Å apart → too_close_together by 3.6Å
  - D48↔E68: targets 23.4/10.1Å but partners are 9.9Å apart → too_close_together by 3.3Å

## Secondary Structure (DSSP-like)

- helix(H)=42 · strand(E)=33 · 3-10(G)=9 · coil(C)=4

```
EEHHEHHEHEHHHHGEECEEEEGHHEHHHHGGHEHEHHEHHHEHHEEHHGHHHHEHEEHEEHHHEGHEHGEEEHHEHECHCCGGEHEE
```

## Backbone H-bond Network

- total=80 · helix(i→i+4)=18 · sheet=62
  - A3 ↔ I7  (helix)
  - I7 ↔ D11  (helix)
  - V9 ↔ T13  (helix)
  - P24 ↔ I28  (helix)
  - L25 ↔ D29  (helix)
  - D29 ↔ L33  (helix)
  - L33 ↔ I37  (helix)
  - I37 ↔ P41  (helix)
  - K38 ↔ G42  (helix)
  - V40 ↔ R44  (helix)
  - P41 ↔ T45  (helix)
  - R44 ↔ D48  (helix)
  - T45 ↔ L49  (helix)
  - D48 ↔ D52  (helix)
  - L49 ↔ E53  (helix)
  - D52 ↔ Y56  (helix)
  - G59 ↔ P63  (helix)
  - P63 ↔ Y67  (helix)
  - D2 ↔ W21  (sheet)
  - D2 ↔ F22  (sheet)
  - … +60 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=491 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=355 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6068 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=26 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
