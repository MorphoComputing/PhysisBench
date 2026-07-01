# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1SHG\seeds\seed_9\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 5.338 A
- tm_score_ca_ordered: 0.4413452225737449
- heavy_atom_rmsd: 6.315 A
- sidechain_heavy_atom_rmsd: 7.006 A
- **all-atom quality (honest):** heavy 6.315 A, sidechain 7.006 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 476
- bin_accuracy: 0.481

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.3383699098746575
- ga_delta_rmsd: -0.5448763504954401  ga_fitness_mode: energy
- pre_local_rmsd: 5.439601400253613  localized_anchor_rmsd: 5.338340580674141

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P48-V52 → 96 conflicts (77%); V38-E39 → 12 conflicts (10%); Y7 → 7 conflicts (6%)
- explained: 115/124 conflicts by 3 root cause(s)
- metrics: hubs=28 (frac 0.509), conflicts/hub=4.4, max_incompat=10.83Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P48-V52 + V38-E39 + Y7 — explain ~115/124 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R43** — severity 59.27, 16 conflict(s); suspect input ~`E39` (group: pull_in)
  - pull-in (wants closer): E11@11.6Å(now 14.6,conf 0.55), T26@10.3Å(now 13.7,conf 0.55), S13@13.9Å(now 16.6,conf 0.55)
  - push-out (wants farther): P48@15.0Å(now 9.1,conf 1.00), A49@17.0Å(now 6.3,conf 0.99), A50@19.1Å(now 5.6,conf 0.91), L55@19.6Å(now 12.9,conf 0.57), Y51@17.3Å(now 9.9,conf 0.55)
  - E39↔A50: targets 5.0/19.1Å but partners are 3.6Å apart → too_close_together by 10.5Å
  - A49↔E39: targets 17.0/5.0Å but partners are 4.3Å apart → too_close_together by 7.7Å
  - P48↔E39: targets 15.0/5.0Å but partners are 4.3Å apart → too_close_together by 5.7Å
- **Q44** — severity 46.56, 13 conflict(s); suspect input ~`E39` (group: push_out)
  - push-out (wants farther): A49@15.0Å(now 3.6,conf 1.00), A50@17.0Å(now 3.4,conf 1.00), P48@13.0Å(now 7.1,conf 0.99), Y51@15.1Å(now 8.8,conf 0.91), K54@16.9Å(now 4.9,conf 0.55), A5@14.3Å(now 11.4,conf 0.55), E1@14.2Å(now 10.6,conf 0.55)
  - A50↔E39: targets 17.0/5.0Å but partners are 3.6Å apart → too_close_together by 8.4Å
  - A50↔V38: targets 17.0/5.4Å but partners are 3.7Å apart → too_close_together by 7.8Å
  - A49↔E39: targets 15.0/5.0Å but partners are 4.3Å apart → too_close_together by 5.7Å
- **D42** — severity 32.79, 9 conflict(s); suspect input ~`A50` (group: pull_in)
  - pull-in (wants closer): L28@12.7Å(now 15.8,conf 0.55), N29@15.9Å(now 18.7,conf 0.55)
  - push-out (wants farther): A49@19.1Å(now 4.7,conf 0.91), P48@18.0Å(now 10.6,conf 0.72), A50@21.3Å(now 7.6,conf 0.60)
  - E39↔A49: targets 6.9/19.1Å but partners are 4.3Å apart → too_close_together by 7.9Å
  - E39↔A50: targets 6.9/21.3Å but partners are 3.6Å apart → too_close_together by 10.8Å
  - E39↔P48: targets 6.9/18.0Å but partners are 4.3Å apart → too_close_together by 6.8Å
- **P48** — severity 24.57, 14 conflict(s); suspect input ~`D34` (group: pull_in)
  - pull-in (wants closer): D34@5.8Å(now 11.5,conf 0.55)
  - push-out (wants farther): R43@15.0Å(now 9.1,conf 1.00), N41@17.0Å(now 10.4,conf 0.99), Q44@13.0Å(now 7.1,conf 0.99), G45@11.0Å(now 5.7,conf 0.99), L55@15.0Å(now 12.1,conf 0.99), V52@6.9Å(now 4.3,conf 0.91), D42@18.0Å(now 10.6,conf 0.72), E1@16.2Å(now 11.1,conf 0.55), L4@12.2Å(now 8.6,conf 0.55)
  - D34↔K21: targets 5.8/12.9Å but partners are 24.6Å apart → too_far_apart by 5.9Å
  - Y51↔D34: targets 5.0/5.8Å but partners are 15.8Å apart → too_far_apart by 5.0Å
  - D34↔L6: targets 5.8/10.5Å but partners are 21.2Å apart → too_far_apart by 4.9Å
- **Y7** — severity 17.58, 10 conflict(s); suspect input ~`V52` (group: push_out)
  - pull-in (wants closer): V52@7.6Å(now 12.1,conf 0.55), A50@9.4Å(now 16.6,conf 0.55), K54@13.6Å(now 16.7,conf 0.55), K53@10.1Å(now 13.6,conf 0.55)
  - push-out (wants farther): E1@19.0Å(now 14.9,conf 1.00), L28@18.6Å(now 15.2,conf 0.55), D23@8.9Å(now 5.6,conf 0.55)
  - E1↔L4: targets 19.0/9.1Å but partners are 6.7Å apart → too_close_together by 3.2Å
  - K21↔A50: targets 4.5/9.4Å but partners are 18.9Å apart → too_far_apart by 5.0Å
  - E1↔V3: targets 19.0/12.9Å but partners are 3.6Å apart → too_close_together by 2.5Å
- **A49** — severity 15.90, 6 conflict(s); suspect input ~`V52` (group: pull_in)
  - pull-in (wants closer): K12@15.0Å(now 18.2,conf 0.55)
  - push-out (wants farther): Q44@15.0Å(now 3.6,conf 1.00), R43@17.0Å(now 6.3,conf 0.99), K54@9.1Å(now 5.0,conf 0.94), L55@13.0Å(now 8.3,conf 0.94), D42@19.1Å(now 4.7,conf 0.91), G45@12.9Å(now 8.4,conf 0.91), K53@8.0Å(now 3.5,conf 0.72), V52@5.7Å(now 3.0,conf 0.55)
  - K54↔D42: targets 9.1/19.1Å but partners are 5.4Å apart → too_close_together by 4.7Å
  - D42↔V52: targets 19.1/5.7Å but partners are 7.5Å apart → too_close_together by 5.9Å
  - D42↔K53: targets 19.1/8.0Å but partners are 6.7Å apart → too_close_together by 4.4Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=21 · 3-10(G)=9 · coil(C)=5

```
EHGEEHHHEEEEECHEGHEEGHHGEECHGHHHHCHCGEEGEHHHEEHEHHGGEEC
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=4 · sheet=48
  - L2 ↔ L6  (helix)
  - T18 ↔ G22  (helix)
  - L28 ↔ N32  (helix)
  - R43 ↔ V47  (helix)
  - L4 ↔ Y9  (sheet)
  - L4 ↔ M19  (sheet)
  - L4 ↔ K20  (sheet)
  - A5 ↔ M19  (sheet)
  - A5 ↔ K20  (sheet)
  - A5 ↔ L25  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ M19  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ L25  (sheet)
  - Y9 ↔ T26  (sheet)
  - Q10 ↔ E16  (sheet)
  - Q10 ↔ M19  (sheet)
  - Q10 ↔ K20  (sheet)
  - E11 ↔ E16  (sheet)
  - E11 ↔ M19  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=248 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=153 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.0597 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
