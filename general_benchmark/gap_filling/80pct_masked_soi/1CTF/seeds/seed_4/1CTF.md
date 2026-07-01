# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CTF\seeds\seed_4\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 8.055 A
- tm_score_ca_ordered: 0.2695855070057257
- heavy_atom_rmsd: 8.496 A
- sidechain_heavy_atom_rmsd: 8.908 A
- **all-atom quality (honest):** heavy 8.496 A, sidechain 8.908 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 642
- bin_accuracy: 0.503

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.054586034675454
- ga_delta_rmsd: 0.3630573702306581  ga_fitness_mode: energy
- pre_local_rmsd: 8.067424766918727  localized_anchor_rmsd: 8.054605872716426

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F1-A8 → 100 conflicts (55%); E59-A60 → 30 conflicts (16%); V34-E35 → 13 conflicts (7%)
- explained: 143/182 conflicts by 3 root cause(s)
- metrics: hubs=34 (frac 0.515), conflicts/hub=5.4, max_incompat=7.36Å, chain_span=0.97
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F1-A8 + E59-A60 + V34-E35 — explain ~143/182 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A40** — severity 36.17, 22 conflict(s); suspect input ~`K6` (group: pull_in)
  - pull-in (wants closer): I4@4.4Å(now 9.8,conf 0.61), L5@6.3Å(now 12.4,conf 0.55), K6@8.5Å(now 16.1,conf 0.55)
  - push-out (wants farther): A60@17.0Å(now 13.1,conf 0.55), E51@14.5Å(now 8.6,conf 0.55), G21@16.2Å(now 13.5,conf 0.55), L53@12.2Å(now 7.4,conf 0.55)
  - E43↔K6: targets 7.0/8.5Å but partners are 20.9Å apart → too_far_apart by 5.5Å
  - V34↔K6: targets 9.1/8.5Å but partners are 22.6Å apart → too_far_apart by 5.0Å
  - V34↔I4: targets 9.1/4.4Å but partners are 17.6Å apart → too_far_apart by 4.0Å
- **A52** — severity 29.56, 16 conflict(s); suspect input ~`D48` (group: pull_in)
  - pull-in (wants closer): E59@10.9Å(now 14.7,conf 0.91), A56@6.0Å(now 8.7,conf 0.72), A60@12.5Å(now 15.2,conf 0.55)
  - push-out (wants farther): A37@19.6Å(now 15.8,conf 0.57), A7@17.8Å(now 13.6,conf 0.55), V66@10.7Å(now 6.3,conf 0.55), E65@12.2Å(now 7.2,conf 0.55), V3@10.2Å(now 4.4,conf 0.55), K42@12.0Å(now 8.0,conf 0.55)
  - D49↔E59: targets 5.0/10.9Å but partners are 19.3Å apart → too_far_apart by 3.4Å
  - E59↔K47: targets 10.9/8.6Å but partners are 23.3Å apart → too_far_apart by 3.8Å
  - A56↔A37: targets 6.0/19.6Å but partners are 8.9Å apart → too_close_together by 4.7Å
- **P38** — severity 18.90, 8 conflict(s); suspect input ~`A7` (group: push_out)
  - pull-in (wants closer): A7@6.2Å(now 16.1,conf 0.55), A8@9.2Å(now 16.1,conf 0.55)
  - push-out (wants farther): L53@15.8Å(now 11.5,conf 0.55)
  - A7↔V34: targets 6.2/8.1Å but partners are 21.6Å apart → too_far_apart by 7.4Å
  - E35↔A7: targets 9.0/6.2Å but partners are 22.0Å apart → too_far_apart by 6.8Å
  - A7↔D32: targets 6.2/11.4Å but partners are 22.0Å apart → too_far_apart by 4.4Å
- **V15** — severity 18.31, 7 conflict(s); suspect input ~`V34` (group: pull_in)
  - pull-in (wants closer): V34@7.5Å(now 13.8,conf 0.55)
  - push-out (wants farther): D2@17.5Å(now 13.9,conf 0.55)
  - A8↔V34: targets 7.0/7.5Å but partners are 20.6Å apart → too_far_apart by 6.2Å
  - V34↔A10: targets 7.5/9.6Å but partners are 23.1Å apart → too_far_apart by 6.1Å
  - N11↔V34: targets 7.0/7.5Å but partners are 20.2Å apart → too_far_apart by 5.8Å
- **K31** — severity 17.57, 10 conflict(s); suspect input ~`A8` (group: pull_in)
  - pull-in (wants closer): A8@10.9Å(now 17.7,conf 0.55), G9@12.6Å(now 17.1,conf 0.55)
  - L27↔A8: targets 5.4/10.9Å but partners are 21.1Å apart → too_far_apart by 4.8Å
  - V34↔A8: targets 5.3/10.9Å but partners are 20.6Å apart → too_far_apart by 4.4Å
  - G26↔A8: targets 8.0/10.9Å but partners are 23.2Å apart → too_far_apart by 4.4Å
- **A30** — severity 17.21, 8 conflict(s); suspect input ~`A7` (group: pull_in)
  - pull-in (wants closer): A7@13.5Å(now 18.0,conf 0.55), L5@11.6Å(now 16.4,conf 0.55), K6@14.4Å(now 19.3,conf 0.55)
  - G26↔A7: targets 6.0/13.5Å but partners are 24.6Å apart → too_far_apart by 5.1Å
  - G26↔K6: targets 6.0/14.4Å but partners are 25.2Å apart → too_far_apart by 4.9Å
  - G26↔L5: targets 6.0/11.6Å but partners are 22.1Å apart → too_far_apart by 4.5Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=21 · 3-10(G)=4 · coil(C)=8

```
CEEHCHHEGHEEHHHHHHHGHHEEGHEHHHEHHHHHEHEEGCCCCECEHEHEHEHHHEHEHEHEHC
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=19 · sheet=23
  - K6 ↔ A10  (helix)
  - A10 ↔ A14  (helix)
  - V13 ↔ K17  (helix)
  - A14 ↔ A18  (helix)
  - V15 ↔ V19  (helix)
  - A18 ↔ A22  (helix)
  - A22 ↔ G26  (helix)
  - G26 ↔ A30  (helix)
  - K28 ↔ D32  (helix)
  - E29 ↔ L33  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - D49 ↔ L53  (helix)
  - E51 ↔ K55  (helix)
  - L53 ↔ L57  (helix)
  - K55 ↔ E59  (helix)
  - L57 ↔ G61  (helix)
  - E59 ↔ E63  (helix)
  - G61 ↔ E65  (helix)
  - V3 ↔ A8  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=262 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=111 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.2957 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
