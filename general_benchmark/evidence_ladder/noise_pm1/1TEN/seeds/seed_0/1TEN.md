# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1TEN\seeds\seed_0\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 0.496 A
- tm_score_ca_ordered: 0.9792127318366813
- heavy_atom_rmsd: 3.007 A
- sidechain_heavy_atom_rmsd: 3.942 A
- **all-atom quality (honest):** heavy 3.007 A, sidechain 3.942 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 3655
- bin_accuracy: 0.678

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.5741631787257064 -> 0.5312959615362542 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4962631017800812
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5009601879558161  localized_anchor_rmsd: 0.4961908715719491

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P63-D64 → 49 conflicts (32%); E8 → 27 conflicts (18%); S73 → 18 conflicts (12%)
- explained: 94/154 conflicts by 3 root cause(s)
- metrics: hubs=41 (frac 0.466), conflicts/hub=3.8, max_incompat=4.6Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P63-D64 + E8 + S73 — explain ~94/154 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D14** — severity 20.94, 16 conflict(s); suspect input ~`P63` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 36.8,conf 1.00), G76@27.5Å(now 35.9,conf 0.99), M78@27.5Å(now 35.2,conf 0.99), E27@27.5Å(now 35.0,conf 1.00), A26@27.5Å(now 34.8,conf 0.99), R75@27.5Å(now 34.2,conf 0.99), L1@27.5Å(now 33.6,conf 0.98), L25@27.4Å(now 33.3,conf 0.97), I28@27.5Å(now 32.8,conf 0.99), D29@27.5Å(now 32.1,conf 0.99), S79@27.4Å(now 31.9,conf 0.97), D2@27.4Å(now 31.7,conf 0.97), S80@27.4Å(now 31.1,conf 0.96), R74@27.4Å(now 30.8,conf 0.95), P24@27.4Å(now 29.9,conf 0.95), L71@19.5Å(now 22.3,conf 0.39)
  - D77↔P63: targets 27.5/4.9Å but partners are 36.6Å apart → too_far_apart by 4.2Å
  - E27↔P63: targets 27.5/4.9Å but partners are 36.5Å apart → too_far_apart by 4.1Å
  - A26↔P63: targets 27.5/4.9Å but partners are 36.2Å apart → too_far_apart by 3.8Å
- **P4** — severity 10.46, 13 conflict(s); suspect input ~`E8` (group: pull_in)
  - pull-in (wants closer): E8@8.0Å(now 10.8,conf 0.35)
  - E8↔L1: targets 8.0/8.1Å but partners are 19.7Å apart → too_far_apart by 3.6Å
  - E8↔L25: targets 8.0/6.7Å but partners are 17.6Å apart → too_far_apart by 3.0Å
  - E8↔K10: targets 8.0/16.9Å but partners are 6.0Å apart → too_close_together by 2.9Å
- **E8** — severity 10.40, 12 conflict(s); suspect input ~`T13` (group: pull_in)
  - pull-in (wants closer): T13@11.9Å(now 15.0,conf 0.34), P4@8.0Å(now 10.8,conf 0.35)
  - D2↔P4: targets 18.4/8.0Å but partners are 6.4Å apart → too_close_together by 4.0Å
  - S5↔T13: targets 8.2/11.9Å but partners are 24.1Å apart → too_far_apart by 4.0Å
  - T13↔P4: targets 11.9/8.0Å but partners are 23.8Å apart → too_far_apart by 3.8Å
- **P63** — severity 8.65, 6 conflict(s); suspect input ~`D14` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 36.6,conf 1.00), E27@27.5Å(now 36.5,conf 1.00), G76@27.5Å(now 36.0,conf 1.00), A26@27.5Å(now 36.2,conf 1.00), M78@27.5Å(now 35.1,conf 0.99), R75@27.5Å(now 34.7,conf 1.00), L25@27.5Å(now 35.1,conf 0.98), L1@27.5Å(now 34.3,conf 0.99), I28@27.5Å(now 34.0,conf 0.99), D29@27.5Å(now 33.1,conf 0.99), D2@27.5Å(now 32.7,conf 0.98), S79@27.5Å(now 31.9,conf 0.98), R74@27.4Å(now 31.2,conf 0.96), P24@27.4Å(now 31.6,conf 0.95), S80@27.4Å(now 31.3,conf 0.97), E51@27.3Å(now 30.6,conf 0.92), D52@27.3Å(now 30.1,conf 0.92), K23@27.2Å(now 29.8,conf 0.89), A3@26.2Å(now 29.0,conf 0.70)
  - D77↔D14: targets 27.5/4.9Å but partners are 36.8Å apart → too_far_apart by 4.4Å
  - G76↔D14: targets 27.5/4.9Å but partners are 35.9Å apart → too_far_apart by 3.5Å
  - M78↔D14: targets 27.5/4.9Å but partners are 35.2Å apart → too_far_apart by 2.8Å
- **S73** — severity 8.57, 10 conflict(s); suspect input ~`E53` (group: pull_in)
  - pull-in (wants closer): N81@5.1Å(now 8.2,conf 0.47)
  - push-out (wants farther): Q6@16.4Å(now 13.8,conf 0.35), G76@13.0Å(now 9.9,conf 0.34)
  - N81↔E53: targets 5.1/10.2Å but partners are 19.4Å apart → too_far_apart by 4.1Å
  - N81↔T50: targets 5.1/9.1Å but partners are 18.1Å apart → too_far_apart by 3.9Å
  - L49↔N81: targets 8.8/5.1Å but partners are 17.1Å apart → too_far_apart by 3.1Å
- **N81** — severity 7.07, 8 conflict(s); suspect input ~`G30` (group: pull_in)
  - pull-in (wants closer): S73@5.1Å(now 8.2,conf 0.47)
  - S73↔G30: targets 5.1/15.4Å but partners are 5.6Å apart → too_close_together by 4.6Å
  - D29↔S73: targets 16.2/5.1Å but partners are 8.0Å apart → too_close_together by 3.0Å
  - T50↔S73: targets 18.0/5.1Å but partners are 10.1Å apart → too_close_together by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=48 · 3-10(G)=15 · coil(C)=12

```
EEGCEGEECEHCEHEEEEGEEGCCHEHEHEGGGEEEGCHEGHHEEEGGEEHCEHEEEGEHEEEHEEEECEGEGEGCHEEECCEEECEE
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=3 · sheet=71
  - L25 ↔ D29  (helix)
  - D39 ↔ D43  (helix)
  - N60 ↔ D64  (helix)
  - D2 ↔ W21  (sheet)
  - S5 ↔ T20  (sheet)
  - S5 ↔ W21  (sheet)
  - I7 ↔ L18  (sheet)
  - I7 ↔ T20  (sheet)
  - I7 ↔ W21  (sheet)
  - E8 ↔ A17  (sheet)
  - E8 ↔ L18  (sheet)
  - E8 ↔ T20  (sheet)
  - E8 ↔ W21  (sheet)
  - K10 ↔ T16  (sheet)
  - K10 ↔ A17  (sheet)
  - K10 ↔ L18  (sheet)
  - K10 ↔ T20  (sheet)
  - K10 ↔ W21  (sheet)
  - T13 ↔ L18  (sheet)
  - T16 ↔ Y35  (sheet)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=35 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=314 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=199 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9162 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
