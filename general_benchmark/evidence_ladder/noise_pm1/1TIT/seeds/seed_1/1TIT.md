# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1TIT\seeds\seed_1\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 0.521 A
- tm_score_ca_ordered: 0.9770664645595621
- heavy_atom_rmsd: 2.642 A
- sidechain_heavy_atom_rmsd: 3.475 A
- **all-atom quality (honest):** heavy 2.642 A, sidechain 3.475 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 3570
- bin_accuracy: 0.667

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.6875268861468687 -> 0.6234471968005785 A
- topology_reconvergence: applied=True accepted=4/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5213166374963161
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5303546791672471  localized_anchor_rmsd: 0.5213244006405344

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V12-F13 → 48 conflicts (39%); E87 → 25 conflicts (20%); P27 → 8 conflicts (6%)
- explained: 81/123 conflicts by 3 root cause(s)
- metrics: hubs=39 (frac 0.448), conflicts/hub=3.2, max_incompat=4.99Å, chain_span=0.943
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V12-F13 + E87 + P27 — explain ~81/123 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F13** — severity 18.65, 15 conflict(s); suspect input ~`E87` (group: push_out)
  - pull-in (wants closer): E26@27.5Å(now 33.5,conf 1.00), I1@27.4Å(now 33.8,conf 0.97), D28@27.5Å(now 33.9,conf 0.99), P27@27.5Å(now 33.2,conf 0.99), S25@27.5Å(now 32.6,conf 0.99), N76@27.5Å(now 32.5,conf 0.99), A75@27.4Å(now 32.0,conf 0.95), V29@27.5Å(now 31.3,conf 0.98), E2@27.4Å(now 31.2,conf 0.95), K53@27.3Å(now 29.8,conf 0.92)
  - push-out (wants farther): I56@23.0Å(now 20.2,conf 0.49)
  - D28↔E87: targets 27.5/5.5Å but partners are 37.7Å apart → too_far_apart by 4.7Å
  - E26↔E87: targets 27.5/5.5Å but partners are 37.3Å apart → too_far_apart by 4.4Å
  - P27↔E87: targets 27.5/5.5Å but partners are 37.2Å apart → too_far_apart by 4.3Å
- **V12** — severity 12.96, 14 conflict(s); suspect input ~`L59` (group: pull_in)
  - pull-in (wants closer): E26@27.4Å(now 30.1,conf 0.97), D28@27.4Å(now 30.9,conf 0.95), I1@27.4Å(now 30.3,conf 0.96), P27@27.3Å(now 30.1,conf 0.91), L59@6.4Å(now 9.8,conf 0.39)
  - S43↔L59: targets 19.4/6.4Å but partners are 9.5Å apart → too_close_together by 3.5Å
  - I49↔L59: targets 20.3/6.4Å but partners are 10.6Å apart → too_close_together by 3.2Å
  - E47↔L59: targets 15.6/6.4Å but partners are 5.7Å apart → too_close_together by 3.5Å
- **L59** — severity 12.33, 12 conflict(s); suspect input ~`V12` (group: pull_in)
  - pull-in (wants closer): V12@6.4Å(now 9.8,conf 0.39)
  - V12↔S43: targets 6.4/7.6Å but partners are 18.5Å apart → too_far_apart by 4.5Å
  - A42↔V12: targets 8.3/6.4Å but partners are 18.8Å apart → too_far_apart by 4.0Å
  - I49↔V12: targets 9.5/6.4Å but partners are 19.4Å apart → too_far_apart by 3.5Å
- **V14** — severity 8.23, 8 conflict(s); suspect input ~`E87` (group: push_out)
  - pull-in (wants closer): E26@27.5Å(now 33.0,conf 0.99), I1@27.5Å(now 33.5,conf 0.98), D28@27.5Å(now 32.8,conf 0.98), S25@27.5Å(now 32.5,conf 0.99), P27@27.5Å(now 32.5,conf 0.99), N76@27.4Å(now 31.8,conf 0.94), E2@27.4Å(now 31.1,conf 0.96), A75@27.4Å(now 31.0,conf 0.95), V29@27.4Å(now 30.1,conf 0.96)
  - push-out (wants farther): V70@18.7Å(now 15.8,conf 0.38)
  - D28↔E87: targets 27.5/6.4Å but partners are 37.7Å apart → too_far_apart by 3.8Å
  - E26↔E87: targets 27.5/6.4Å but partners are 37.3Å apart → too_far_apart by 3.4Å
  - P27↔E87: targets 27.5/6.4Å but partners are 37.2Å apart → too_far_apart by 3.3Å
- **K53** — severity 7.57, 5 conflict(s); suspect input ~`P27` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 34.0,conf 1.00), K86@27.5Å(now 31.8,conf 0.98), L64@27.4Å(now 30.9,conf 0.94), F13@27.3Å(now 29.8,conf 0.92), G65@27.3Å(now 30.2,conf 0.92), Q63@26.1Å(now 29.1,conf 0.69)
  - E87↔P27: targets 27.5/4.7Å but partners are 37.2Å apart → too_far_apart by 5.0Å
  - E87↔E26: targets 27.5/5.8Å but partners are 37.3Å apart → too_far_apart by 4.0Å
  - K86↔P27: targets 27.5/4.7Å but partners are 34.9Å apart → too_far_apart by 2.7Å
- **G52** — severity 5.96, 4 conflict(s); suspect input ~`D28` (group: push_out)
  - pull-in (wants closer): E87@27.5Å(now 33.1,conf 0.99), K86@27.4Å(now 31.0,conf 0.95)
  - push-out (wants farther): W33@16.2Å(now 13.4,conf 0.35)
  - E87↔D28: targets 27.5/5.3Å but partners are 37.7Å apart → too_far_apart by 4.9Å
  - K86↔D28: targets 27.4/5.3Å but partners are 35.5Å apart → too_far_apart by 2.8Å
  - E87↔V29: targets 27.5/4.8Å but partners are 34.8Å apart → too_far_apart by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=44 · 3-10(G)=16 · coil(C)=12

```
CEEHEEEECGCGGGHEEEEEEEEGHEEGEEEEEEEHCEHEECEHHEGCCEHCHECEEGGEGEEGHHHEEGGGEEHHCEGEGCCEHEE
```

## Backbone H-bond Network

- total=87 · helix(i→i+4)=0 · sheet=87
  - E2 ↔ I22  (sheet)
  - V3 ↔ E21  (sheet)
  - V3 ↔ I22  (sheet)
  - V3 ↔ E23  (sheet)
  - K5 ↔ F20  (sheet)
  - K5 ↔ E21  (sheet)
  - K5 ↔ I22  (sheet)
  - K5 ↔ E23  (sheet)
  - P6 ↔ H19  (sheet)
  - P6 ↔ F20  (sheet)
  - P6 ↔ E21  (sheet)
  - P6 ↔ I22  (sheet)
  - P6 ↔ E23  (sheet)
  - L7 ↔ A18  (sheet)
  - L7 ↔ H19  (sheet)
  - L7 ↔ F20  (sheet)
  - L7 ↔ E21  (sheet)
  - L7 ↔ I22  (sheet)
  - L7 ↔ E23  (sheet)
  - Y8 ↔ A18  (sheet)
  - … +67 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=39 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=342 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=219 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9724 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
