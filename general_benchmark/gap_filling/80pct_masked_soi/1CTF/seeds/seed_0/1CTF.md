# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CTF\seeds\seed_0\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 5.563 A
- tm_score_ca_ordered: 0.4945723698825418
- heavy_atom_rmsd: 6.412 A
- sidechain_heavy_atom_rmsd: 7.236 A
- **all-atom quality (honest):** heavy 6.412 A, sidechain 7.236 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 22
- distogram_pairs: 643
- bin_accuracy: 0.429

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_window_topology_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.563478298816603
- ga_delta_rmsd: 2.4294310833518393  ga_fitness_mode: energy
- pre_local_rmsd: 5.5831749920687015  localized_anchor_rmsd: 5.5634972689477875

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R20-A22 → 83 conflicts (48%); A37-P38 → 44 conflicts (25%); K31 → 8 conflicts (5%)
- explained: 135/173 conflicts by 3 root cause(s)
- metrics: hubs=41 (frac 0.621), conflicts/hub=4.2, max_incompat=9.34Å, chain_span=0.955
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R20-A22 + A37-P38 + K31 — explain ~135/173 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G26** — severity 42.04, 16 conflict(s); suspect input ~`P38` (group: push_out)
  - pull-in (wants closer): V19@9.0Å(now 12.0,conf 1.00), G21@9.0Å(now 11.7,conf 0.99), A56@18.4Å(now 21.8,conf 0.55)
  - push-out (wants farther): P38@19.0Å(now 9.9,conf 0.56), A37@17.1Å(now 11.8,conf 0.55)
  - R20↔P38: targets 5.0/19.0Å but partners are 4.7Å apart → too_close_together by 9.3Å
  - A30↔P38: targets 6.9/19.0Å but partners are 3.5Å apart → too_close_together by 8.6Å
  - K31↔P38: targets 9.0/19.0Å but partners are 3.3Å apart → too_close_together by 6.7Å
- **R20** — severity 29.02, 12 conflict(s); suspect input ~`P38` (group: push_out)
  - pull-in (wants closer): K17@5.0Å(now 7.8,conf 0.99), E51@17.3Å(now 20.6,conf 0.55), E58@14.6Å(now 18.4,conf 0.55), K54@14.1Å(now 17.7,conf 0.55)
  - push-out (wants farther): L27@7.0Å(now 3.6,conf 1.00), P38@16.9Å(now 4.7,conf 0.55), L33@10.6Å(now 7.3,conf 0.55)
  - K17↔G26: targets 5.0/5.0Å but partners are 14.1Å apart → too_far_apart by 4.1Å
  - T23↔P38: targets 5.0/16.9Å but partners are 4.8Å apart → too_close_together by 7.0Å
  - L25↔P38: targets 5.2/16.9Å but partners are 5.3Å apart → too_close_together by 6.4Å
- **A18** — severity 24.98, 12 conflict(s); suspect input ~`P38` (group: pull_in)
  - pull-in (wants closer): T23@9.0Å(now 12.3,conf 0.99)
  - push-out (wants farther): A14@6.6Å(now 4.0,conf 0.79), A40@14.9Å(now 11.7,conf 0.55), K31@11.1Å(now 7.7,conf 0.55), A37@14.8Å(now 8.7,conf 0.55), N11@10.8Å(now 7.7,conf 0.55), P38@16.2Å(now 7.5,conf 0.55), S36@15.8Å(now 7.4,conf 0.55), A7@13.7Å(now 10.4,conf 0.55)
  - G21↔P38: targets 5.0/16.2Å but partners are 4.4Å apart → too_close_together by 6.8Å
  - A22↔P38: targets 6.6/16.2Å but partners are 3.8Å apart → too_close_together by 5.8Å
  - G21↔A37: targets 5.0/14.8Å but partners are 4.9Å apart → too_close_together by 4.9Å
- **K28** — severity 18.11, 8 conflict(s); suspect input ~`P38` (group: pull_in)
  - pull-in (wants closer): D32@6.6Å(now 9.4,conf 0.79)
  - push-out (wants farther): A22@15.0Å(now 11.9,conf 1.00), G21@13.1Å(now 7.2,conf 0.91), P38@17.1Å(now 9.1,conf 0.55), I16@9.7Å(now 7.0,conf 0.55), G24@11.8Å(now 8.0,conf 0.55)
  - K31↔P38: targets 5.2/17.1Å but partners are 3.3Å apart → too_close_together by 8.6Å
  - G21↔K31: targets 13.1/5.2Å but partners are 3.0Å apart → too_close_together by 4.9Å
  - A22↔K31: targets 15.0/5.2Å but partners are 5.0Å apart → too_close_together by 4.8Å
- **K17** — severity 15.80, 7 conflict(s); suspect input ~`P38` (group: push_out)
  - pull-in (wants closer): R20@5.0Å(now 7.8,conf 0.99), A60@8.3Å(now 10.8,conf 0.55)
  - push-out (wants farther): P38@17.3Å(now 8.1,conf 0.55), D32@12.6Å(now 10.0,conf 0.55)
  - R20↔P38: targets 5.0/17.3Å but partners are 4.7Å apart → too_close_together by 7.6Å
  - G21↔P38: targets 6.3/17.3Å but partners are 4.4Å apart → too_close_together by 6.5Å
  - A22↔P38: targets 9.0/17.3Å but partners are 3.8Å apart → too_close_together by 4.5Å
- **G21** — severity 15.02, 9 conflict(s); suspect input ~`A18` (group: pull_in)
  - pull-in (wants closer): G26@9.0Å(now 11.7,conf 0.99), A52@12.6Å(now 16.0,conf 0.55)
  - push-out (wants farther): L27@11.0Å(now 8.1,conf 1.00), A14@11.0Å(now 7.2,conf 0.99), I16@9.0Å(now 5.8,conf 0.99), K28@13.1Å(now 7.2,conf 0.91), G9@19.2Å(now 13.5,conf 0.56), L5@14.8Å(now 11.9,conf 0.55), D32@15.5Å(now 6.3,conf 0.55), A40@16.2Å(now 9.3,conf 0.55), V15@9.8Å(now 6.9,conf 0.55)
  - G24↔D32: targets 7.0/15.5Å but partners are 3.6Å apart → too_close_together by 4.9Å
  - A18↔G9: targets 5.0/19.2Å but partners are 9.9Å apart → too_close_together by 4.3Å
  - G26↔A18: targets 9.0/5.0Å but partners are 16.0Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=17 · 3-10(G)=10 · coil(C)=6

```
CECECEEGEHHEHHHHEHEHHGHHHHEHGHEHHHHGGHEGEHEHHGHHHHHHEHEHGGHHCEGCEC
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=16 · sheet=23
  - N11 ↔ V15  (helix)
  - I16 ↔ R20  (helix)
  - R20 ↔ G24  (helix)
  - G21 ↔ L25  (helix)
  - G24 ↔ K28  (helix)
  - G26 ↔ A30  (helix)
  - K28 ↔ D32  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - P38 ↔ K42  (helix)
  - G44 ↔ D48  (helix)
  - V45 ↔ D49  (helix)
  - K47 ↔ E51  (helix)
  - D48 ↔ A52  (helix)
  - A52 ↔ A56  (helix)
  - A56 ↔ A60  (helix)
  - I4 ↔ V19  (sheet)
  - K6 ↔ K12  (sheet)
  - K6 ↔ V19  (sheet)
  - A7 ↔ K12  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=301 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=149 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.3525 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=22 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
