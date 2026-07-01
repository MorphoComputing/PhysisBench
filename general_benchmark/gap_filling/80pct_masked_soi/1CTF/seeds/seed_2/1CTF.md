# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CTF\seeds\seed_2\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 5.928 A
- tm_score_ca_ordered: 0.42855814474982706
- heavy_atom_rmsd: 7.156 A
- sidechain_heavy_atom_rmsd: 8.411 A
- **all-atom quality (honest):** heavy 7.156 A, sidechain 8.411 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 642
- bin_accuracy: 0.438

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.927731968002117
- ga_delta_rmsd: -0.734511191575538  ga_fitness_mode: energy
- pre_local_rmsd: 5.976215719673163  localized_anchor_rmsd: 5.927727871763242

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F1-G9 → 210 conflicts (62%); A39-K42 → 31 conflicts (9%); E59 → 23 conflicts (7%)
- explained: 264/336 conflicts by 3 root cause(s)
- metrics: hubs=53 (frac 0.803), conflicts/hub=6.3, max_incompat=9.99Å, chain_span=0.97
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F1-G9 + A39-K42 + E59 — explain ~264/336 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A40** — severity 63.05, 23 conflict(s); suspect input ~`I4` (group: pull_in)
  - pull-in (wants closer): I4@4.4Å(now 14.2,conf 0.61), L5@6.3Å(now 12.2,conf 0.55), K6@8.5Å(now 16.2,conf 0.55)
  - push-out (wants farther): K47@16.9Å(now 10.9,conf 0.91), A60@17.0Å(now 10.3,conf 0.55), G61@16.7Å(now 13.6,conf 0.55), E51@14.5Å(now 5.8,conf 0.55), L53@12.2Å(now 4.9,conf 0.55)
  - E43↔I4: targets 7.0/4.4Å but partners are 21.4Å apart → too_far_apart by 10.0Å
  - G44↔I4: targets 11.0/4.4Å but partners are 23.3Å apart → too_far_apart by 7.8Å
  - I4↔G61: targets 4.4/16.7Å but partners are 3.8Å apart → too_close_together by 8.4Å
- **F1** — severity 48.37, 20 conflict(s); suspect input ~`G44` (group: pull_in)
  - pull-in (wants closer): G44@5.2Å(now 16.4,conf 0.56), V45@5.2Å(now 12.5,conf 0.56), E43@6.1Å(now 15.3,conf 0.55), D49@8.8Å(now 12.7,conf 0.55)
  - push-out (wants farther): L5@13.0Å(now 7.8,conf 0.99), K6@15.0Å(now 10.5,conf 0.99), A7@19.0Å(now 12.3,conf 0.99), A8@20.9Å(now 15.2,conf 0.91), K12@23.3Å(now 14.7,conf 0.76), E59@19.7Å(now 11.6,conf 0.57), A62@18.1Å(now 11.1,conf 0.55), V19@17.1Å(now 9.5,conf 0.55), E58@16.9Å(now 10.3,conf 0.55)
  - V66↔G44: targets 7.6/5.2Å but partners are 21.3Å apart → too_far_apart by 8.5Å
  - I4↔G44: targets 10.6/5.2Å but partners are 23.3Å apart → too_far_apart by 7.5Å
  - V66↔E43: targets 7.6/6.1Å but partners are 20.6Å apart → too_far_apart by 6.9Å
- **K42** — severity 46.10, 20 conflict(s); suspect input ~`D2` (group: push_out)
  - pull-in (wants closer): V3@5.3Å(now 14.4,conf 0.56), D2@5.7Å(now 17.8,conf 0.55), L5@9.3Å(now 13.5,conf 0.55)
  - push-out (wants farther): A52@12.0Å(now 6.7,conf 0.55)
  - S46↔D2: targets 10.0/5.7Å but partners are 25.4Å apart → too_far_apart by 9.8Å
  - V45↔D2: targets 7.0/5.7Å but partners are 21.2Å apart → too_far_apart by 8.5Å
  - S46↔V3: targets 10.0/5.3Å but partners are 22.4Å apart → too_far_apart by 7.1Å
- **K12** — severity 45.21, 18 conflict(s); suspect input ~`F1` (group: pull_in)
  - pull-in (wants closer): D48@24.0Å(now 26.6,conf 0.73)
  - push-out (wants farther): L5@11.0Å(now 8.3,conf 0.99), A7@9.1Å(now 5.8,conf 0.91), G9@6.6Å(now 3.9,conf 0.79), F1@23.3Å(now 14.7,conf 0.76), D2@20.5Å(now 11.0,conf 0.59), K6@12.1Å(now 8.4,conf 0.55)
  - V15↔F1: targets 4.9/23.3Å but partners are 10.7Å apart → too_close_together by 7.7Å
  - A18↔F1: targets 9.0/23.3Å but partners are 9.2Å apart → too_close_together by 5.0Å
  - L5↔F1: targets 11.0/23.3Å but partners are 7.8Å apart → too_close_together by 4.5Å
- **G9** — severity 24.83, 11 conflict(s); suspect input ~`K6` (group: pull_in)
  - pull-in (wants closer): S36@11.1Å(now 15.8,conf 0.55), L41@16.4Å(now 20.3,conf 0.55)
  - push-out (wants farther): D2@21.0Å(now 8.8,conf 0.99), V3@17.0Å(now 8.3,conf 0.99), I4@14.9Å(now 6.2,conf 0.91), V15@9.1Å(now 6.4,conf 0.91), K12@6.6Å(now 3.9,conf 0.79), A14@9.4Å(now 5.5,conf 0.79), K6@10.0Å(now 5.5,conf 0.72), G21@19.2Å(now 15.9,conf 0.56), E65@15.0Å(now 12.4,conf 0.55), L5@10.9Å(now 6.8,conf 0.55)
  - D2↔K6: targets 21.0/10.0Å but partners are 3.9Å apart → too_close_together by 7.1Å
  - D2↔K12: targets 21.0/6.6Å but partners are 11.0Å apart → too_close_together by 3.4Å
  - D2↔E63: targets 21.0/8.5Å but partners are 7.9Å apart → too_close_together by 4.6Å
- **A8** — severity 23.23, 9 conflict(s); suspect input ~`F1` (group: pull_in)
  - pull-in (wants closer): E63@6.2Å(now 10.5,conf 0.55), E51@17.7Å(now 22.0,conf 0.55), K31@10.9Å(now 15.2,conf 0.55), P38@9.2Å(now 17.5,conf 0.55)
  - push-out (wants farther): I4@11.0Å(now 6.9,conf 0.99), D2@17.0Å(now 8.7,conf 0.94), F1@20.9Å(now 15.2,conf 0.91), V3@14.0Å(now 9.1,conf 0.72), N11@5.6Å(now 1.9,conf 0.69), E59@11.3Å(now 8.3,conf 0.55)
  - F1↔L5: targets 20.9/7.1Å but partners are 7.8Å apart → too_close_together by 6.0Å
  - D2↔L5: targets 17.0/7.1Å but partners are 6.0Å apart → too_close_together by 3.9Å
  - L5↔V3: targets 7.1/14.0Å but partners are 2.7Å apart → too_close_together by 4.2Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=21 · 3-10(G)=8 · coil(C)=4

```
CEGHHGHEHHHEHEHEGHHHEHEGEEEHEHEGGHHEEEECHHEHHCEEGHHHHEHHHGHHHHHHEC
```

## Backbone H-bond Network

- total=54 · helix(i→i+4)=16 · sheet=38
  - L5 ↔ G9  (helix)
  - A7 ↔ N11  (helix)
  - G9 ↔ V13  (helix)
  - N11 ↔ V15  (helix)
  - V15 ↔ V19  (helix)
  - A18 ↔ A22  (helix)
  - A30 ↔ V34  (helix)
  - L41 ↔ V45  (helix)
  - E51 ↔ K55  (helix)
  - A52 ↔ A56  (helix)
  - L53 ↔ L57  (helix)
  - K55 ↔ E59  (helix)
  - A56 ↔ A60  (helix)
  - L57 ↔ G61  (helix)
  - E59 ↔ E63  (helix)
  - A60 ↔ V64  (helix)
  - D2 ↔ A8  (sheet)
  - D2 ↔ K12  (sheet)
  - D2 ↔ A14  (sheet)
  - A8 ↔ A14  (sheet)
  - … +34 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=292 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=119 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.2396 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
