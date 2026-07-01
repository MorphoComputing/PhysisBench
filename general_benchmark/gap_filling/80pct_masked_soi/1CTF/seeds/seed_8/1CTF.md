# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CTF\seeds\seed_8\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 5.896 A
- tm_score_ca_ordered: 0.46509142362208933
- heavy_atom_rmsd: 6.958 A
- sidechain_heavy_atom_rmsd: 8.104 A
- **all-atom quality (honest):** heavy 6.958 A, sidechain 8.104 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 645
- bin_accuracy: 0.530

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=7.104866348966045 -> 6.331656222309507 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.895485898399857
- ga_delta_rmsd: -0.13361829723362817  ga_fitness_mode: energy
- pre_local_rmsd: 5.897697272347038  localized_anchor_rmsd: 5.8955118396897355

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** A40 → 48 conflicts (26%); A52 → 23 conflicts (12%); A30 → 19 conflicts (10%)
- explained: 90/187 conflicts by 3 root cause(s)
- metrics: hubs=44 (frac 0.667), conflicts/hub=4.2, max_incompat=7.71Å, chain_span=0.909
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): A40 + A52 + A30 — explain ~90/187 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A40** — severity 34.15, 18 conflict(s); suspect input ~`K6` (group: pull_in)
  - pull-in (wants closer): I4@4.4Å(now 11.8,conf 0.61), A10@19.5Å(now 22.3,conf 0.57), L5@6.3Å(now 14.3,conf 0.55), K6@8.5Å(now 17.1,conf 0.55)
  - push-out (wants farther): K47@16.6Å(now 10.6,conf 0.79), A60@17.0Å(now 11.3,conf 0.55), G61@16.7Å(now 13.3,conf 0.55), S46@14.9Å(now 11.9,conf 0.55), E51@14.5Å(now 7.1,conf 0.55), L53@12.2Å(now 5.5,conf 0.55)
  - E43↔K6: targets 7.0/8.5Å but partners are 22.5Å apart → too_far_apart by 7.0Å
  - E43↔L5: targets 7.0/6.3Å but partners are 19.0Å apart → too_far_apart by 5.8Å
  - V34↔I4: targets 9.1/4.4Å but partners are 18.6Å apart → too_far_apart by 5.1Å
- **A52** — severity 24.98, 11 conflict(s); suspect input ~`A37` (group: push_out)
  - push-out (wants farther): V45@11.0Å(now 7.9,conf 1.00), E35@21.9Å(now 15.9,conf 0.63), A37@19.6Å(now 10.6,conf 0.57), A30@18.6Å(now 15.0,conf 0.55), V66@10.7Å(now 6.8,conf 0.55), V64@11.7Å(now 8.4,conf 0.55), E65@12.2Å(now 7.7,conf 0.55), K42@12.0Å(now 4.6,conf 0.55)
  - K55↔A37: targets 5.0/19.6Å but partners are 6.9Å apart → too_close_together by 7.7Å
  - A56↔A37: targets 6.0/19.6Å but partners are 6.7Å apart → too_close_together by 6.9Å
  - A56↔E35: targets 6.0/21.9Å but partners are 11.2Å apart → too_close_together by 4.7Å
- **A30** — severity 22.07, 14 conflict(s); suspect input ~`K6` (group: push_out)
  - pull-in (wants closer): V34@6.0Å(now 8.8,conf 0.72), A7@13.5Å(now 17.6,conf 0.55), L5@11.6Å(now 16.1,conf 0.55), K6@14.4Å(now 19.0,conf 0.55)
  - push-out (wants farther): A52@18.6Å(now 15.0,conf 0.55), A56@15.2Å(now 9.7,conf 0.55)
  - L25↔A7: targets 5.4/13.5Å but partners are 22.9Å apart → too_far_apart by 4.0Å
  - L27↔K6: targets 5.3/14.4Å but partners are 23.4Å apart → too_far_apart by 3.8Å
  - L25↔K6: targets 5.4/14.4Å but partners are 23.5Å apart → too_far_apart by 3.7Å
- **P38** — severity 19.69, 9 conflict(s); suspect input ~`A7` (group: pull_in)
  - pull-in (wants closer): A7@6.2Å(now 15.2,conf 0.55), A8@9.2Å(now 15.1,conf 0.55)
  - push-out (wants farther): S46@20.8Å(now 17.8,conf 0.59), L53@15.8Å(now 10.2,conf 0.55)
  - A7↔V34: targets 6.2/8.1Å but partners are 21.7Å apart → too_far_apart by 7.5Å
  - E35↔A7: targets 9.0/6.2Å but partners are 21.3Å apart → too_far_apart by 6.1Å
  - E43↔A7: targets 13.1/6.2Å but partners are 23.6Å apart → too_far_apart by 4.3Å
- **V15** — severity 15.49, 6 conflict(s); suspect input ~`V34` (group: pull_in)
  - pull-in (wants closer): V34@7.5Å(now 15.2,conf 0.55)
  - K12↔V34: targets 5.0/7.5Å but partners are 19.0Å apart → too_far_apart by 6.6Å
  - A8↔V34: targets 7.0/7.5Å but partners are 20.6Å apart → too_far_apart by 6.1Å
  - V34↔A10: targets 7.5/9.6Å but partners are 21.9Å apart → too_far_apart by 4.9Å
- **E35** — severity 14.73, 6 conflict(s); suspect input ~`A52` (group: pull_in)
  - pull-in (wants closer): I4@13.3Å(now 19.7,conf 0.55), A14@12.6Å(now 16.7,conf 0.55)
  - push-out (wants farther): D49@23.0Å(now 20.2,conf 0.74), A52@21.9Å(now 15.9,conf 0.63)
  - A40↔A52: targets 12.6/21.9Å but partners are 3.4Å apart → too_close_together by 5.9Å
  - A52↔A39: targets 21.9/9.3Å but partners are 6.7Å apart → too_close_together by 5.9Å
  - P38↔A52: targets 9.0/21.9Å but partners are 8.9Å apart → too_close_together by 4.0Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=24 · 3-10(G)=6 · coil(C)=4

```
EEHEEGEECHEGHEHEHHHHEHECEEEHHHEGHHHEEHECHEHHHGHHEHHHHHGHHHGHEEHEEC
```

## Backbone H-bond Network

- total=44 · helix(i→i+4)=15 · sheet=29
  - V13 ↔ K17  (helix)
  - V15 ↔ V19  (helix)
  - A18 ↔ A22  (helix)
  - E29 ↔ L33  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - L41 ↔ V45  (helix)
  - E43 ↔ K47  (helix)
  - K47 ↔ E51  (helix)
  - D48 ↔ A52  (helix)
  - A50 ↔ K54  (helix)
  - A52 ↔ A56  (helix)
  - L53 ↔ L57  (helix)
  - K54 ↔ E58  (helix)
  - A56 ↔ A60  (helix)
  - I4 ↔ A14  (sheet)
  - I4 ↔ I16  (sheet)
  - I4 ↔ G21  (sheet)
  - L5 ↔ N11  (sheet)
  - L5 ↔ A14  (sheet)
  - … +24 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=29 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=277 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=130 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.7298 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
