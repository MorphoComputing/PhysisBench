# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HRC\seeds\seed_0\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 4.922 A
- tm_score_ca_ordered: 0.542093552099098
- heavy_atom_rmsd: 5.995 A
- sidechain_heavy_atom_rmsd: 6.954 A
- **all-atom quality (honest):** heavy 5.995 A, sidechain 6.954 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 31
- distogram_pairs: 1045
- bin_accuracy: 0.485

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.922076728381621
- ga_delta_rmsd: 0.8503876322785082  ga_fitness_mode: energy
- pre_local_rmsd: 4.940161549192747  localized_anchor_rmsd: 4.922030765845528

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T48-A50 → 103 conflicts (30%); A100-T101 → 77 conflicts (22%)
- explained: 180/344 conflicts by 2 root cause(s)
- metrics: hubs=64 (frac 0.627), conflicts/hub=5.4, max_incompat=8.04Å, chain_span=0.971
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T48-A50 + A100-T101 — explain ~180/344 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A50** — severity 53.55, 22 conflict(s); suspect input ~`K54` (group: pull_in)
  - pull-in (wants closer): N53@5.2Å(now 8.8,conf 0.82), G76@5.9Å(now 11.6,conf 0.55)
  - push-out (wants farther): P43@17.0Å(now 6.8,conf 1.00), F45@14.9Å(now 3.2,conf 0.91), T57@14.9Å(now 6.3,conf 0.91), T46@12.0Å(now 5.8,conf 0.72), K59@18.5Å(now 10.4,conf 0.55), G44@16.9Å(now 8.0,conf 0.55), W58@15.1Å(now 6.5,conf 0.55), G40@8.7Å(now 5.4,conf 0.55), I56@11.7Å(now 7.7,conf 0.55), L63@16.1Å(now 8.9,conf 0.55)
  - P43↔N53: targets 17.0/5.2Å but partners are 4.6Å apart → too_close_together by 7.2Å
  - P43↔K54: targets 17.0/5.1Å but partners are 6.8Å apart → too_close_together by 5.1Å
  - K54↔T57: targets 5.1/14.9Å but partners are 5.2Å apart → too_close_together by 4.6Å
- **L97** — severity 46.92, 25 conflict(s); suspect input ~`E3` (group: push_out)
  - pull-in (wants closer): T101@5.1Å(now 9.0,conf 0.91), A100@5.1Å(now 7.8,conf 0.57), E3@10.5Å(now 13.7,conf 0.55)
  - push-out (wants farther): K21@12.9Å(now 8.5,conf 0.55), Q15@15.3Å(now 12.8,conf 0.55), V19@7.8Å(now 5.0,conf 0.55)
  - T101↔E3: targets 5.1/10.5Å but partners are 20.9Å apart → too_far_apart by 5.3Å
  - T101↔G5: targets 5.1/7.7Å but partners are 17.9Å apart → too_far_apart by 5.1Å
  - T101↔E68: targets 5.1/15.4Å but partners are 25.4Å apart → too_far_apart by 4.8Å
- **K21** — severity 44.06, 11 conflict(s); suspect input ~`P75` (group: push_out)
  - push-out (wants farther): P75@27.5Å(now 19.4,conf 0.98), L97@12.9Å(now 8.5,conf 0.55), A100@9.4Å(now 6.7,conf 0.55), N102@8.5Å(now 4.1,conf 0.55), K99@12.4Å(now 9.0,conf 0.55)
  - G28↔P75: targets 15.0/27.5Å but partners are 6.1Å apart → too_close_together by 6.4Å
  - P75↔T18: targets 27.5/9.1Å but partners are 11.9Å apart → too_close_together by 6.5Å
  - H25↔P75: targets 11.0/27.5Å but partners are 10.8Å apart → too_close_together by 5.6Å
- **D92** — severity 36.92, 17 conflict(s); suspect input ~`A100` (group: push_out)
  - pull-in (wants closer): T88@5.0Å(now 7.9,conf 1.00), A100@12.5Å(now 15.0,conf 0.55)
  - push-out (wants farther): T48@27.4Å(now 17.7,conf 0.95), F35@15.4Å(now 10.8,conf 0.55)
  - T48↔E89: targets 27.4/5.0Å but partners are 17.7Å apart → too_close_together by 4.7Å
  - T88↔T48: targets 5.0/27.4Å but partners are 19.2Å apart → too_close_together by 3.2Å
  - T88↔A100: targets 5.0/12.5Å but partners are 22.2Å apart → too_far_apart by 4.7Å
- **Y96** — severity 36.30, 18 conflict(s); suspect input ~`T101` (group: push_out)
  - pull-in (wants closer): N102@10.6Å(now 13.6,conf 0.79), A100@6.0Å(now 9.9,conf 0.72), K59@13.0Å(now 16.1,conf 0.55), T101@8.3Å(now 12.1,conf 0.55)
  - push-out (wants farther): N51@22.4Å(now 19.8,conf 0.66), T18@13.0Å(now 10.4,conf 0.55)
  - E3↔T101: targets 6.8/8.3Å but partners are 20.9Å apart → too_far_apart by 5.7Å
  - A100↔E3: targets 6.0/6.8Å but partners are 18.4Å apart → too_far_apart by 5.5Å
  - N102↔E3: targets 10.6/6.8Å but partners are 22.6Å apart → too_far_apart by 5.2Å
- **E60** — severity 23.25, 11 conflict(s); suspect input ~`D49` (group: pull_in)
  - pull-in (wants closer): T101@12.8Å(now 21.5,conf 0.55), A95@8.5Å(now 12.8,conf 0.55)
  - push-out (wants farther): D49@22.6Å(now 15.3,conf 0.69), A14@19.5Å(now 16.1,conf 0.57), T88@12.6Å(now 8.6,conf 0.55), K87@12.0Å(now 6.1,conf 0.55)
  - T57↔D49: targets 9.1/22.6Å but partners are 5.7Å apart → too_close_together by 7.8Å
  - L63↔D49: targets 5.0/22.6Å but partners are 13.1Å apart → too_close_together by 4.5Å
  - I56↔D49: targets 13.0/22.6Å but partners are 5.3Å apart → too_close_together by 4.3Å

## Secondary Structure (DSSP-like)

- helix(H)=52 · strand(E)=34 · 3-10(G)=12 · coil(C)=4

```
EHHGHHHHHHGEGGHCEEECECECEEHHEHHHHGHEEEEHHHGHEHHHHHHHHEHHEHEHEHHHGHHHHEHEEEEHHHHGEGEEGEHHEGHEEHHHHGHEEE
```

## Backbone H-bond Network

- total=77 · helix(i→i+4)=22 · sheet=55
  - V2 ↔ K6  (helix)
  - G5 ↔ F9  (helix)
  - K6 ↔ V10  (helix)
  - T27 ↔ L31  (helix)
  - L31 ↔ F35  (helix)
  - G40 ↔ G44  (helix)
  - A42 ↔ T46  (helix)
  - G44 ↔ T48  (helix)
  - T46 ↔ A50  (helix)
  - Y47 ↔ N51  (helix)
  - T48 ↔ K52  (helix)
  - D49 ↔ N53  (helix)
  - N51 ↔ G55  (helix)
  - K52 ↔ I56  (helix)
  - I56 ↔ E60  (helix)
  - E60 ↔ M64  (helix)
  - L63 ↔ L67  (helix)
  - M64 ↔ E68  (helix)
  - L67 ↔ K71  (helix)
  - K87 ↔ E91  (helix)
  - … +57 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=44 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=537 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=298 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.9461 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=31 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
