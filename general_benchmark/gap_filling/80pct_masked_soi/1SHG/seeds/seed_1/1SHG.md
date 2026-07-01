# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1SHG\seeds\seed_1\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 8.727 A
- tm_score_ca_ordered: 0.24403933000601896
- heavy_atom_rmsd: 10.188 A
- sidechain_heavy_atom_rmsd: 11.362 A
- **all-atom quality (honest):** heavy 10.188 A, sidechain 11.362 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 474
- bin_accuracy: 0.523

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.726754289478539
- ga_delta_rmsd: 0.5853611697598726  ga_fitness_mode: energy
- pre_local_rmsd: 8.777971747661434  localized_anchor_rmsd: 8.726782469901805

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P48-V52 → 70 conflicts (52%); E1-L2 → 42 conflicts (31%); R43-Q44 → 11 conflicts (8%)
- explained: 123/136 conflicts by 3 root cause(s)
- metrics: hubs=32 (frac 0.582), conflicts/hub=4.2, max_incompat=8.93Å, chain_span=0.964
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P48-V52 + E1-L2 + R43-Q44 — explain ~123/136 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R43** — severity 56.99, 14 conflict(s); suspect input ~`V40` (group: push_out)
  - push-out (wants farther): P48@15.0Å(now 6.4,conf 1.00), A50@19.0Å(now 9.8,conf 0.99), A49@17.0Å(now 6.9,conf 0.94), F46@9.1Å(now 5.5,conf 0.91), L55@19.6Å(now 10.0,conf 0.57), Y51@17.3Å(now 10.3,conf 0.55), V47@11.8Å(now 5.7,conf 0.55)
  - V40↔A50: targets 5.0/19.0Å but partners are 6.3Å apart → too_close_together by 7.7Å
  - V40↔A49: targets 5.0/17.0Å but partners are 4.2Å apart → too_close_together by 7.8Å
  - P48↔V40: targets 15.0/5.0Å but partners are 3.8Å apart → too_close_together by 6.2Å
- **Q44** — severity 25.64, 13 conflict(s); suspect input ~`V40` (group: push_out)
  - push-out (wants farther): N41@9.0Å(now 6.0,conf 1.00), Y51@15.0Å(now 12.0,conf 0.99), A50@17.0Å(now 11.3,conf 0.94), A49@14.8Å(now 9.0,conf 0.82), P48@12.6Å(now 8.7,conf 0.79), K54@16.9Å(now 7.6,conf 0.55)
  - E39↔K54: targets 5.0/16.9Å but partners are 5.9Å apart → too_close_together by 6.0Å
  - E39↔A50: targets 5.0/17.0Å but partners are 9.2Å apart → too_close_together by 2.8Å
  - A50↔V40: targets 17.0/6.3Å but partners are 6.3Å apart → too_close_together by 4.4Å
- **Y7** — severity 23.64, 9 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): E1@19.0Å(now 13.0,conf 1.00), L2@15.0Å(now 10.2,conf 1.00)
  - E1↔L4: targets 19.0/9.0Å but partners are 3.9Å apart → too_close_together by 6.1Å
  - L2↔L4: targets 15.0/9.0Å but partners are 1.8Å apart → too_close_together by 4.2Å
  - E1↔V3: targets 19.0/11.1Å but partners are 3.9Å apart → too_close_together by 4.0Å
- **D34** — severity 20.91, 7 conflict(s); suspect input ~`P48` (group: push_out)
  - pull-in (wants closer): P48@5.8Å(now 16.3,conf 0.55), K53@13.0Å(now 18.5,conf 0.55)
  - push-out (wants farther): L2@17.1Å(now 13.3,conf 0.55)
  - V40↔P48: targets 18.6/5.8Å but partners are 3.8Å apart → too_close_together by 8.9Å
  - N41↔P48: targets 21.0/5.8Å but partners are 6.4Å apart → too_close_together by 8.8Å
  - R43↔P48: targets 19.3/5.8Å but partners are 6.4Å apart → too_close_together by 7.1Å
- **P48** — severity 19.17, 8 conflict(s); suspect input ~`D34` (group: pull_in)
  - pull-in (wants closer): D34@5.8Å(now 16.3,conf 0.55), T31@12.3Å(now 17.9,conf 0.55)
  - push-out (wants farther): R43@15.0Å(now 6.4,conf 1.00), N41@17.0Å(now 6.4,conf 0.99), L55@15.0Å(now 11.2,conf 0.99), K54@12.9Å(now 10.2,conf 0.91), D42@17.4Å(now 9.0,conf 0.79), Q44@12.6Å(now 8.7,conf 0.79), K21@12.9Å(now 10.0,conf 0.55), E1@16.2Å(now 12.8,conf 0.55)
  - Y51↔D34: targets 5.1/5.8Å but partners are 18.3Å apart → too_far_apart by 7.4Å
  - N41↔Y51: targets 17.0/5.1Å but partners are 8.1Å apart → too_close_together by 3.8Å
  - N41↔V52: targets 17.0/7.0Å but partners are 6.7Å apart → too_close_together by 3.3Å
- **W36** — severity 18.56, 10 conflict(s); suspect input ~`Y51` (group: push_out)
  - pull-in (wants closer): V52@8.8Å(now 12.5,conf 0.55), Y51@9.7Å(now 14.7,conf 0.55)
  - push-out (wants farther): L55@14.4Å(now 11.7,conf 0.55), L2@11.8Å(now 8.6,conf 0.55)
  - K33↔Y51: targets 7.1/9.7Å but partners are 21.3Å apart → too_far_apart by 4.5Å
  - T31↔Y51: targets 7.4/9.7Å but partners are 21.2Å apart → too_far_apart by 4.1Å
  - K33↔V52: targets 7.1/8.8Å but partners are 19.9Å apart → too_far_apart by 4.0Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=20 · 3-10(G)=11 · coil(C)=8

```
EHHHEHEGEGEHEHHEEGGEEHGCCCCHEEHGHHEEEEEGGGGHHCECGHHEECC
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=1 · sheet=52
  - L2 ↔ L6  (helix)
  - E1 ↔ K20  (sheet)
  - E1 ↔ K21  (sheet)
  - A5 ↔ V17  (sheet)
  - A5 ↔ K20  (sheet)
  - A5 ↔ K21  (sheet)
  - Y7 ↔ V17  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ K21  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ V17  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ K21  (sheet)
  - E11 ↔ E16  (sheet)
  - E11 ↔ V17  (sheet)
  - E11 ↔ K20  (sheet)
  - E16 ↔ S30  (sheet)
  - E16 ↔ W35  (sheet)
  - E16 ↔ W36  (sheet)
  - V17 ↔ N29  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=268 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=178 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.7789 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
