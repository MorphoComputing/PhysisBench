# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HRC\seeds\seed_4\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 9.705 A
- tm_score_ca_ordered: 0.2835920824652668
- heavy_atom_rmsd: 10.525 A
- sidechain_heavy_atom_rmsd: 11.293 A
- **all-atom quality (honest):** heavy 10.525 A, sidechain 11.293 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 58
- distogram_pairs: 1043
- bin_accuracy: 0.344

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=rejected_window_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.704779145634655
- ga_delta_rmsd: 0.5137767320108182  ga_fitness_mode: energy
- pre_local_rmsd: 9.722272800731345  localized_anchor_rmsd: 9.704804549579624

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K72-K78 → 365 conflicts (35%); Y47-I56 → 255 conflicts (24%); K24-T27 → 98 conflicts (9%)
- explained: 718/1050 conflicts by 3 root cause(s)
- metrics: hubs=96 (frac 0.941), conflicts/hub=10.9, max_incompat=13.29Å, chain_span=0.98
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K72-K78 + Y47-I56 + K24-T27 — explain ~718/1050 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T88** — severity 159.62, 42 conflict(s); suspect input ~`E91` (group: pull_in)
  - pull-in (wants closer): E60@12.6Å(now 16.3,conf 0.55)
  - push-out (wants farther): G83@13.0Å(now 6.0,conf 1.00), I84@9.0Å(now 3.8,conf 1.00), Y47@27.5Å(now 23.0,conf 0.99), K24@27.5Å(now 16.2,conf 0.99), G76@27.1Å(now 13.2,conf 0.88), A82@16.6Å(now 7.4,conf 0.79), K85@8.6Å(now 5.8,conf 0.79), K78@25.3Å(now 14.8,conf 0.69), F81@18.1Å(now 8.3,conf 0.55), V10@16.7Å(now 13.0,conf 0.55), K7@13.3Å(now 10.6,conf 0.55)
  - K24↔D92: targets 27.5/5.1Å but partners are 13.5Å apart → too_close_together by 8.8Å
  - D92↔G76: targets 5.1/27.1Å but partners are 13.6Å apart → too_close_together by 8.4Å
  - K24↔L93: targets 27.5/8.9Å but partners are 10.7Å apart → too_close_together by 7.9Å
- **G76** — severity 116.15, 33 conflict(s); suspect input ~`K71` (group: pull_in)
  - pull-in (wants closer): A50@5.9Å(now 16.3,conf 0.55), T48@7.4Å(now 17.2,conf 0.55)
  - push-out (wants farther): V2@27.5Å(now 19.6,conf 1.00), N69@13.0Å(now 6.1,conf 0.99), G83@15.0Å(now 8.0,conf 0.99), K72@9.0Å(now 4.7,conf 0.94), A100@27.4Å(now 13.6,conf 0.94), T88@27.1Å(now 13.2,conf 0.88), K71@7.2Å(now 3.4,conf 0.82), Y73@9.2Å(now 3.4,conf 0.82), A82@13.4Å(now 7.7,conf 0.79), I80@10.0Å(now 6.6,conf 0.72), P70@10.2Å(now 3.4,conf 0.69), F81@12.4Å(now 5.7,conf 0.69), E65@16.4Å(now 12.2,conf 0.55)
  - A100↔M79: targets 27.4/8.6Å but partners are 7.0Å apart → too_close_together by 11.8Å
  - K72↔T88: targets 9.0/27.1Å but partners are 8.6Å apart → too_close_together by 9.5Å
  - A100↔K71: targets 27.4/7.2Å but partners are 10.4Å apart → too_close_together by 9.8Å
- **T77** — severity 106.71, 37 conflict(s); suspect input ~`Y47` (group: pull_in)
  - pull-in (wants closer): G28@10.8Å(now 13.4,conf 0.55), Y47@8.4Å(now 22.0,conf 0.55)
  - push-out (wants farther): F81@11.0Å(now 7.2,conf 0.99), K71@6.9Å(now 3.9,conf 0.91), A95@23.2Å(now 10.6,conf 0.76), G5@23.2Å(now 16.4,conf 0.75), E89@21.9Å(now 13.2,conf 0.62), K86@21.6Å(now 16.5,conf 0.61), L34@17.0Å(now 9.0,conf 0.55)
  - I80↔Y47: targets 7.1/8.4Å but partners are 26.4Å apart → too_far_apart by 10.9Å
  - A95↔I74: targets 23.2/5.4Å but partners are 9.3Å apart → too_close_together by 8.5Å
  - K71↔A95: targets 6.9/23.2Å but partners are 10.3Å apart → too_close_together by 6.1Å
- **I74** — severity 102.58, 31 conflict(s); suspect input ~`T77` (group: pull_in)
  - pull-in (wants closer): F45@16.7Å(now 20.2,conf 0.55), I56@10.9Å(now 16.2,conf 0.55), T48@9.6Å(now 12.1,conf 0.55), K52@9.7Å(now 14.9,conf 0.55)
  - push-out (wants farther): F81@12.7Å(now 4.7,conf 0.82), L67@10.6Å(now 4.5,conf 0.79), K99@23.7Å(now 12.9,conf 0.75), A100@23.1Å(now 12.9,conf 0.75), P70@6.0Å(now 3.1,conf 0.72), A95@21.8Å(now 9.3,conf 0.62), K98@20.8Å(now 9.7,conf 0.59), T27@16.8Å(now 12.2,conf 0.55), N69@8.8Å(now 5.5,conf 0.55), E65@10.7Å(now 7.8,conf 0.55), P29@15.3Å(now 11.8,conf 0.55), E68@11.6Å(now 6.6,conf 0.55), L63@11.7Å(now 7.6,conf 0.55), G28@14.3Å(now 9.7,conf 0.55)
  - K78↔A100: targets 9.0/23.1Å but partners are 6.2Å apart → too_close_together by 7.9Å
  - K71↔A100: targets 5.0/23.1Å but partners are 10.4Å apart → too_close_together by 7.7Å
  - K98↔T77: targets 20.8/5.4Å but partners are 5.6Å apart → too_close_together by 9.8Å
- **A50** — severity 101.70, 32 conflict(s); suspect input ~`G76` (group: pull_in)
  - pull-in (wants closer): G76@5.9Å(now 16.3,conf 0.55), K72@11.5Å(now 14.8,conf 0.55)
  - push-out (wants farther): P43@17.0Å(now 9.9,conf 1.00), F45@15.0Å(now 9.2,conf 1.00), T46@11.1Å(now 6.5,conf 0.91), T57@13.4Å(now 3.8,conf 0.79), K59@18.5Å(now 5.0,conf 0.55), G44@16.9Å(now 9.5,conf 0.55), T27@16.6Å(now 6.9,conf 0.55), W58@15.1Å(now 4.0,conf 0.55), G40@8.7Å(now 6.0,conf 0.55), I56@11.7Å(now 6.9,conf 0.55), L63@16.1Å(now 7.9,conf 0.55)
  - P43↔N53: targets 17.0/5.0Å but partners are 3.2Å apart → too_close_together by 8.8Å
  - N53↔G76: targets 5.0/5.9Å but partners are 22.4Å apart → too_far_apart by 11.5Å
  - Y47↔G76: targets 9.0/5.9Å but partners are 24.6Å apart → too_far_apart by 9.6Å
- **E3** — severity 100.34, 27 conflict(s); suspect input ~`Y96` (group: pull_in)
  - pull-in (wants closer): Y96@6.8Å(now 10.2,conf 0.55), A95@8.9Å(now 12.2,conf 0.55), L97@10.5Å(now 14.9,conf 0.55)
  - push-out (wants farther): D49@27.5Å(now 23.3,conf 1.00), T48@27.5Å(now 22.4,conf 1.00), P75@27.5Å(now 16.0,conf 1.00), A14@14.8Å(now 8.5,conf 0.55), C13@14.8Å(now 8.2,conf 0.55)
  - K7↔P75: targets 5.0/27.5Å but partners are 13.1Å apart → too_close_together by 9.4Å
  - P75↔F9: targets 27.5/7.4Å but partners are 8.1Å apart → too_close_together by 11.9Å
  - P75↔I8: targets 27.5/7.0Å but partners are 11.4Å apart → too_close_together by 9.1Å

## Secondary Structure (DSSP-like)

- helix(H)=64 · strand(E)=27 · 3-10(G)=8 · coil(C)=3

```
EHHEHEHHHHHEEGHEHEHCHCEHHHHHHEHHHEHEHEEHEHEGHHHHHHHHHHHHEHEGHEHHEHHHEEHHHEHHEHEHHHGHHHHHGGHHEHEGGHHCHE
```

## Backbone H-bond Network

- total=93 · helix(i→i+4)=33 · sheet=60
  - E3 ↔ K7  (helix)
  - K7 ↔ Q11  (helix)
  - Q11 ↔ Q15  (helix)
  - Q15 ↔ V19  (helix)
  - K24 ↔ G28  (helix)
  - T27 ↔ L31  (helix)
  - P29 ↔ G33  (helix)
  - L31 ↔ F35  (helix)
  - G33 ↔ R37  (helix)
  - A42 ↔ T46  (helix)
  - F45 ↔ D49  (helix)
  - T46 ↔ A50  (helix)
  - Y47 ↔ N51  (helix)
  - T48 ↔ K52  (helix)
  - D49 ↔ N53  (helix)
  - A50 ↔ K54  (helix)
  - N51 ↔ G55  (helix)
  - K52 ↔ I56  (helix)
  - K54 ↔ W58  (helix)
  - L63 ↔ L67  (helix)
  - … +73 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=785 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=523 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=7.2501 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=58 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
