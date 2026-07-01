# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1TIT\seeds\seed_0\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 0.541 A
- tm_score_ca_ordered: 0.9753483248606717
- heavy_atom_rmsd: 2.768 A
- sidechain_heavy_atom_rmsd: 3.668 A
- **all-atom quality (honest):** heavy 2.768 A, sidechain 3.668 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 3570
- bin_accuracy: 0.673

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.6940057876470742 -> 0.6286767793007081 A
- topology_reconvergence: applied=True accepted=3/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5413073044371852
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5493838215612029  localized_anchor_rmsd: 0.5413339646809827

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V12-F13 → 46 conflicts (37%); E87 → 20 conflicts (16%); P27 → 8 conflicts (6%)
- explained: 74/124 conflicts by 3 root cause(s)
- metrics: hubs=38 (frac 0.437), conflicts/hub=3.3, max_incompat=4.64Å, chain_span=0.943
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V12-F13 + E87 + P27 — explain ~74/124 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F13** — severity 16.27, 14 conflict(s); suspect input ~`E87` (group: push_out)
  - pull-in (wants closer): E26@27.5Å(now 33.4,conf 1.00), I1@27.4Å(now 33.5,conf 0.97), D28@27.5Å(now 33.7,conf 0.99), P27@27.5Å(now 33.1,conf 0.99), S25@27.5Å(now 32.2,conf 0.99), N76@27.5Å(now 32.3,conf 0.99), A75@27.4Å(now 31.8,conf 0.95), V29@27.5Å(now 31.2,conf 0.98), E2@27.4Å(now 31.0,conf 0.95)
  - push-out (wants farther): I56@23.0Å(now 20.1,conf 0.49)
  - D28↔E87: targets 27.5/5.5Å but partners are 37.3Å apart → too_far_apart by 4.3Å
  - E26↔E87: targets 27.5/5.5Å but partners are 37.1Å apart → too_far_apart by 4.1Å
  - P27↔E87: targets 27.5/5.5Å but partners are 36.9Å apart → too_far_apart by 3.9Å
- **L59** — severity 13.46, 14 conflict(s); suspect input ~`V12` (group: push_out)
  - pull-in (wants closer): V12@6.4Å(now 9.9,conf 0.39)
  - push-out (wants farther): E16@10.7Å(now 8.1,conf 0.34)
  - V12↔S43: targets 6.4/7.6Å but partners are 18.6Å apart → too_far_apart by 4.6Å
  - A42↔V12: targets 8.3/6.4Å but partners are 18.8Å apart → too_far_apart by 4.0Å
  - I49↔V12: targets 9.5/6.4Å but partners are 19.4Å apart → too_far_apart by 3.4Å
- **V12** — severity 11.75, 12 conflict(s); suspect input ~`L59` (group: pull_in)
  - pull-in (wants closer): E26@27.4Å(now 30.0,conf 0.97), D28@27.4Å(now 30.8,conf 0.95), I1@27.4Å(now 30.0,conf 0.96), P27@27.3Å(now 29.9,conf 0.91), L59@6.4Å(now 9.9,conf 0.39)
  - S43↔L59: targets 19.4/6.4Å but partners are 9.5Å apart → too_close_together by 3.5Å
  - I49↔L59: targets 20.3/6.4Å but partners are 10.6Å apart → too_close_together by 3.2Å
  - E47↔L59: targets 15.6/6.4Å but partners are 5.8Å apart → too_close_together by 3.5Å
- **V14** — severity 7.43, 8 conflict(s); suspect input ~`E87` (group: push_out)
  - pull-in (wants closer): E26@27.5Å(now 32.9,conf 0.99), I1@27.5Å(now 33.2,conf 0.98), D28@27.5Å(now 32.5,conf 0.98), S25@27.5Å(now 32.0,conf 0.99), P27@27.5Å(now 32.3,conf 0.99), N76@27.4Å(now 31.6,conf 0.94), E2@27.4Å(now 30.9,conf 0.96), A75@27.4Å(now 30.8,conf 0.95)
  - push-out (wants farther): V70@18.7Å(now 15.7,conf 0.38)
  - D28↔E87: targets 27.5/6.4Å but partners are 37.3Å apart → too_far_apart by 3.4Å
  - E26↔E87: targets 27.5/6.4Å but partners are 37.1Å apart → too_far_apart by 3.1Å
  - P27↔E87: targets 27.5/6.4Å but partners are 36.9Å apart → too_far_apart by 3.0Å
- **K53** — severity 6.27, 4 conflict(s); suspect input ~`P27` (group: pull_in)
  - pull-in (wants closer): E87@27.5Å(now 33.7,conf 1.00), K86@27.5Å(now 31.5,conf 0.98), L64@27.4Å(now 30.6,conf 0.94), G65@27.3Å(now 30.0,conf 0.92), Q63@26.1Å(now 28.9,conf 0.69)
  - E87↔P27: targets 27.5/4.7Å but partners are 36.9Å apart → too_far_apart by 4.6Å
  - E87↔E26: targets 27.5/5.8Å but partners are 37.1Å apart → too_far_apart by 3.8Å
  - K86↔P27: targets 27.5/4.7Å but partners are 34.6Å apart → too_far_apart by 2.4Å
- **G52** — severity 5.32, 4 conflict(s); suspect input ~`D28` (group: push_out)
  - pull-in (wants closer): E87@27.5Å(now 32.7,conf 0.99), K86@27.4Å(now 30.7,conf 0.95)
  - push-out (wants farther): W33@16.2Å(now 13.2,conf 0.35)
  - E87↔D28: targets 27.5/5.3Å but partners are 37.3Å apart → too_far_apart by 4.5Å
  - K86↔D28: targets 27.4/5.3Å but partners are 35.1Å apart → too_far_apart by 2.4Å
  - E87↔P27: targets 27.5/6.6Å but partners are 36.9Å apart → too_far_apart by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=42 · 3-10(G)=21 · coil(C)=9

```
CEEHEEEEGGGGGGHEEGEEEEEGHEEGEGEEEEEHCEHEECEHHEGCCEHGHEGEGGGEGGECHHHEEGGGEEHHCEEEECCEHEE
```

## Backbone H-bond Network

- total=79 · helix(i→i+4)=0 · sheet=79
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
  - L7 ↔ H19  (sheet)
  - L7 ↔ F20  (sheet)
  - L7 ↔ E21  (sheet)
  - L7 ↔ I22  (sheet)
  - L7 ↔ E23  (sheet)
  - Y8 ↔ H19  (sheet)
  - Y8 ↔ F20  (sheet)
  - … +59 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=36 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=343 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=221 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9729 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
