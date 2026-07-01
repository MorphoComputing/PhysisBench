# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1SHG\seeds\seed_3\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 8.511 A
- tm_score_ca_ordered: 0.29342230819502246
- heavy_atom_rmsd: 9.559 A
- sidechain_heavy_atom_rmsd: 10.400 A
- **all-atom quality (honest):** heavy 9.559 A, sidechain 10.400 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 20
- distogram_pairs: 474
- bin_accuracy: 0.445

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_window_topology_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.5110804677615
- ga_delta_rmsd: 1.3042429864805705  ga_fitness_mode: energy
- pre_local_rmsd: 8.518690578449329  localized_anchor_rmsd: 8.511132480801379

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E1-D8 → 39 conflicts (41%); P48-Y51 → 30 conflicts (32%); D42-R43 → 9 conflicts (10%)
- explained: 78/95 conflicts by 3 root cause(s)
- metrics: hubs=33 (frac 0.6), conflicts/hub=2.9, max_incompat=6.58Å, chain_span=0.945
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E1-D8 + P48-Y51 + D42-R43 — explain ~78/95 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P48** — severity 16.46, 9 conflict(s); suspect input ~`D34` (group: pull_in)
  - pull-in (wants closer): D34@5.8Å(now 17.9,conf 0.55), T31@12.3Å(now 16.4,conf 0.55)
  - push-out (wants farther): N41@17.0Å(now 9.2,conf 0.99), R43@15.0Å(now 10.9,conf 0.94), D42@17.1Å(now 13.2,conf 0.91), K21@12.9Å(now 7.1,conf 0.55), E1@16.2Å(now 13.2,conf 0.55), L4@12.2Å(now 7.4,conf 0.55)
  - D34↔K21: targets 5.8/12.9Å but partners are 24.7Å apart → too_far_apart by 6.0Å
  - Y51↔D34: targets 6.0/5.8Å but partners are 17.4Å apart → too_far_apart by 5.6Å
  - V52↔D34: targets 7.1/5.8Å but partners are 16.7Å apart → too_far_apart by 3.8Å
- **E39** — severity 15.89, 6 conflict(s); suspect input ~`L28` (group: push_out)
  - pull-in (wants closer): L28@6.9Å(now 13.3,conf 0.55), L2@9.6Å(now 14.2,conf 0.55)
  - push-out (wants farther): D34@16.6Å(now 13.9,conf 0.55), W35@13.2Å(now 9.7,conf 0.55)
  - D42↔L28: targets 6.9/6.9Å but partners are 20.4Å apart → too_far_apart by 6.6Å
  - R43↔L28: targets 5.0/6.9Å but partners are 18.4Å apart → too_far_apart by 6.5Å
  - R43↔L2: targets 5.0/9.6Å but partners are 19.4Å apart → too_far_apart by 4.8Å
- **D34** — severity 14.30, 6 conflict(s); suspect input ~`P48` (group: pull_in)
  - pull-in (wants closer): P48@5.8Å(now 17.9,conf 0.55), K53@13.0Å(now 18.1,conf 0.55)
  - push-out (wants farther): S30@9.0Å(now 6.2,conf 0.99), K37@11.0Å(now 8.1,conf 0.99), T31@9.5Å(now 4.5,conf 0.58), R43@19.3Å(now 16.3,conf 0.56), E39@16.6Å(now 13.9,conf 0.55)
  - N41↔P48: targets 21.1/5.8Å but partners are 9.2Å apart → too_close_together by 6.1Å
  - D23↔P48: targets 19.0/5.8Å but partners are 7.0Å apart → too_close_together by 6.1Å
  - V40↔P48: targets 18.0/5.8Å but partners are 6.3Å apart → too_close_together by 5.9Å
- **R43** — severity 14.24, 6 conflict(s); suspect input ~`P48` (group: pull_in)
  - pull-in (wants closer): R15@10.6Å(now 13.8,conf 0.55), E11@11.6Å(now 14.3,conf 0.55), T26@10.3Å(now 16.1,conf 0.55), S13@13.9Å(now 17.2,conf 0.55)
  - push-out (wants farther): A49@17.0Å(now 13.4,conf 1.00), P48@15.0Å(now 10.9,conf 0.94), D34@19.3Å(now 16.3,conf 0.56)
  - V40↔A49: targets 5.0/17.0Å but partners are 8.4Å apart → too_close_together by 3.6Å
  - V40↔P48: targets 5.0/15.0Å but partners are 6.3Å apart → too_close_together by 3.7Å
  - E39↔P48: targets 5.0/15.0Å but partners are 7.5Å apart → too_close_together by 2.5Å
- **E1** — severity 13.35, 5 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): K33@16.3Å(now 19.4,conf 0.55), Q44@14.2Å(now 19.3,conf 0.55), N41@14.1Å(now 19.7,conf 0.55)
  - push-out (wants farther): L4@11.0Å(now 6.1,conf 1.00), A5@13.0Å(now 9.3,conf 1.00), Y7@19.0Å(now 11.4,conf 1.00), D8@21.0Å(now 9.6,conf 0.99), K12@23.8Å(now 20.4,conf 0.75), Q10@21.8Å(now 17.5,conf 0.62), P48@16.2Å(now 13.2,conf 0.55), L6@15.7Å(now 5.4,conf 0.55)
  - L4↔D8: targets 11.0/21.0Å but partners are 5.4Å apart → too_close_together by 4.6Å
  - A5↔D8: targets 13.0/21.0Å but partners are 5.2Å apart → too_close_together by 2.8Å
  - A5↔Y7: targets 13.0/19.0Å but partners are 3.8Å apart → too_close_together by 2.2Å
- **K21** — severity 11.73, 6 conflict(s); suspect input ~`L6` (group: push_out)
  - pull-in (wants closer): L6@5.3Å(now 9.5,conf 0.56), W35@16.9Å(now 19.9,conf 0.55), W36@15.8Å(now 18.5,conf 0.55)
  - push-out (wants farther): P48@12.9Å(now 7.1,conf 0.55)
  - L6↔L2: targets 5.3/14.2Å but partners are 3.5Å apart → too_close_together by 5.5Å
  - T26↔L6: targets 14.6/5.3Å but partners are 4.4Å apart → too_close_together by 4.9Å
  - L6↔L28: targets 5.3/18.6Å but partners are 9.3Å apart → too_close_together by 4.0Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=21 · 3-10(G)=12 · coil(C)=7

```
EEHCGHEHECEGGHGECEGEEGGEEHHHEGHEHHEEGGECGHHHECEGCHHEEEC
```

## Backbone H-bond Network

- total=47 · helix(i→i+4)=1 · sheet=46
  - L27 ↔ T31  (helix)
  - E1 ↔ Y7  (sheet)
  - L2 ↔ Y7  (sheet)
  - L2 ↔ Y9  (sheet)
  - Y7 ↔ T18  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ K21  (sheet)
  - Y7 ↔ I24  (sheet)
  - Y7 ↔ L25  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ T18  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ K21  (sheet)
  - Y9 ↔ I24  (sheet)
  - Y9 ↔ L25  (sheet)
  - E11 ↔ E16  (sheet)
  - E11 ↔ T18  (sheet)
  - E11 ↔ K20  (sheet)
  - E16 ↔ N29  (sheet)
  - E16 ↔ W35  (sheet)
  - … +27 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=262 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=172 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.9845 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=20 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
