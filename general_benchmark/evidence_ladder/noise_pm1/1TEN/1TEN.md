# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1TEN\seeds\seed_1\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 0.495 A
- tm_score_ca_ordered: 0.9793443735997444
- heavy_atom_rmsd: 2.905 A
- sidechain_heavy_atom_rmsd: 3.751 A
- **all-atom quality (honest):** heavy 2.905 A, sidechain 3.751 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 3655
- bin_accuracy: 0.677

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=4 rmsd=0.5737005362289103 -> 0.5267377421997981 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.49456814469722843
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.4991268299440249  localized_anchor_rmsd: 0.494596898861726

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P63-D64 → 48 conflicts (30%); E8 → 26 conflicts (16%); T50 → 18 conflicts (11%)
- explained: 92/159 conflicts by 3 root cause(s)
- metrics: hubs=42 (frac 0.477), conflicts/hub=3.8, max_incompat=4.63Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P63-D64 + E8 + T50 — explain ~92/159 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D14** — severity 20.66, 16 conflict(s); suspect input ~`P63` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 36.8,conf 1.00), G76@27.5Å(now 35.9,conf 0.99), M78@27.5Å(now 35.2,conf 0.99), E27@27.5Å(now 34.9,conf 1.00), A26@27.5Å(now 34.7,conf 0.99), R75@27.5Å(now 34.2,conf 0.99), L1@27.5Å(now 33.6,conf 0.98), L25@27.4Å(now 33.2,conf 0.97), I28@27.5Å(now 32.8,conf 0.99), D29@27.5Å(now 32.1,conf 0.99), S79@27.4Å(now 31.9,conf 0.97), D2@27.4Å(now 31.7,conf 0.97), S80@27.4Å(now 31.1,conf 0.96), R74@27.4Å(now 30.8,conf 0.95), L71@19.5Å(now 22.4,conf 0.39)
  - D77↔P63: targets 27.5/4.9Å but partners are 36.6Å apart → too_far_apart by 4.2Å
  - E27↔P63: targets 27.5/4.9Å but partners are 36.4Å apart → too_far_apart by 4.0Å
  - A26↔P63: targets 27.5/4.9Å but partners are 36.1Å apart → too_far_apart by 3.7Å
- **E8** — severity 10.42, 12 conflict(s); suspect input ~`T13` (group: pull_in)
  - pull-in (wants closer): T13@11.9Å(now 14.9,conf 0.34), P4@8.0Å(now 10.8,conf 0.35)
  - D2↔P4: targets 18.4/8.0Å but partners are 6.4Å apart → too_close_together by 4.0Å
  - S5↔T13: targets 8.2/11.9Å but partners are 24.1Å apart → too_far_apart by 4.0Å
  - T13↔P4: targets 11.9/8.0Å but partners are 23.8Å apart → too_far_apart by 3.8Å
- **P4** — severity 9.87, 12 conflict(s); suspect input ~`E8` (group: pull_in)
  - pull-in (wants closer): E8@8.0Å(now 10.8,conf 0.35)
  - E8↔L1: targets 8.0/8.1Å but partners are 19.7Å apart → too_far_apart by 3.6Å
  - E8↔L25: targets 8.0/6.7Å but partners are 17.6Å apart → too_far_apart by 2.9Å
  - E8↔K10: targets 8.0/16.9Å but partners are 6.0Å apart → too_close_together by 2.9Å
- **S73** — severity 8.66, 10 conflict(s); suspect input ~`E53` (group: pull_in)
  - pull-in (wants closer): N81@5.1Å(now 8.2,conf 0.47)
  - push-out (wants farther): Q6@16.4Å(now 13.8,conf 0.35), G76@13.0Å(now 9.9,conf 0.34)
  - N81↔E53: targets 5.1/10.2Å but partners are 19.4Å apart → too_far_apart by 4.1Å
  - N81↔T50: targets 5.1/9.1Å but partners are 18.1Å apart → too_far_apart by 3.9Å
  - L49↔N81: targets 8.8/5.1Å but partners are 17.1Å apart → too_far_apart by 3.2Å
- **P63** — severity 8.62, 6 conflict(s); suspect input ~`D14` (group: pull_in)
  - pull-in (wants closer): D77@27.5Å(now 36.6,conf 1.00), E27@27.5Å(now 36.4,conf 1.00), G76@27.5Å(now 36.1,conf 1.00), A26@27.5Å(now 36.1,conf 1.00), M78@27.5Å(now 35.2,conf 0.99), R75@27.5Å(now 34.8,conf 1.00), L25@27.5Å(now 35.0,conf 0.98), L1@27.5Å(now 34.2,conf 0.99), I28@27.5Å(now 33.9,conf 0.99), D29@27.5Å(now 33.1,conf 0.99), D2@27.5Å(now 32.7,conf 0.98), S79@27.5Å(now 31.9,conf 0.98), R74@27.4Å(now 31.3,conf 0.96), P24@27.4Å(now 31.5,conf 0.95), S80@27.4Å(now 31.3,conf 0.97), E51@27.3Å(now 30.6,conf 0.92), D52@27.3Å(now 30.1,conf 0.92), K23@27.2Å(now 29.7,conf 0.89), A3@26.2Å(now 28.9,conf 0.70)
  - D77↔D14: targets 27.5/4.9Å but partners are 36.8Å apart → too_far_apart by 4.4Å
  - G76↔D14: targets 27.5/4.9Å but partners are 35.9Å apart → too_far_apart by 3.5Å
  - M78↔D14: targets 27.5/4.9Å but partners are 35.2Å apart → too_far_apart by 2.8Å
- **L71** — severity 8.03, 10 conflict(s); suspect input ~`T50` (group: pull_in)
  - pull-in (wants closer): D14@19.5Å(now 22.4,conf 0.39), T50@10.1Å(now 12.7,conf 0.34)
  - D14↔N81: targets 19.5/7.1Å but partners are 29.7Å apart → too_far_apart by 3.1Å
  - D14↔S79: targets 19.5/9.7Å but partners are 31.9Å apart → too_far_apart by 2.8Å
  - K84↔T50: targets 6.4/10.1Å but partners are 19.2Å apart → too_far_apart by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=46 · 3-10(G)=17 · coil(C)=13

```
CCGCEGEECEHEEHECEEGEEGCCHEHEHEGGGGEEGGHEGHHEEEGEEEHCEHEEEEEHEEEGEEEECEEGGEGCHEGECCEEECEE
```

## Backbone H-bond Network

- total=75 · helix(i→i+4)=2 · sheet=73
  - L25 ↔ D29  (helix)
  - D39 ↔ D43  (helix)
  - S5 ↔ T20  (sheet)
  - S5 ↔ W21  (sheet)
  - I7 ↔ L18  (sheet)
  - I7 ↔ T20  (sheet)
  - I7 ↔ W21  (sheet)
  - E8 ↔ A17  (sheet)
  - E8 ↔ L18  (sheet)
  - E8 ↔ T20  (sheet)
  - E8 ↔ W21  (sheet)
  - K10 ↔ A17  (sheet)
  - K10 ↔ L18  (sheet)
  - K10 ↔ T20  (sheet)
  - K10 ↔ W21  (sheet)
  - V12 ↔ A17  (sheet)
  - V12 ↔ L18  (sheet)
  - V12 ↔ T20  (sheet)
  - T13 ↔ L18  (sheet)
  - A17 ↔ Y35  (sheet)
  - … +55 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=34 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=315 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=200 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9168 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1TEN.ensemble.pdb`)
- RMSF mean=0.037Å max=0.1Å (per-residue in .per_residue.csv)
- most flexible residues: 65, 44, 63, 38, 62

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1TEN.pae.csv`
- mean=0.024Å · max=0.115Å · AlphaFold-PAE analog (low block = rigid unit/domain)
