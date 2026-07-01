# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1TIT\seeds\seed_2\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 11.217 A
- tm_score_ca_ordered: 0.1752604301400395
- heavy_atom_rmsd: 12.000 A
- sidechain_heavy_atom_rmsd: 12.785 A
- **all-atom quality (honest):** heavy 12.000 A, sidechain 12.785 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 39
- distogram_pairs: 512
- bin_accuracy: 0.311

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V70-Q73 → 170 conflicts (26%); F20-L24 → 105 conflicts (16%); C62-T67 → 95 conflicts (15%)
- explained: 370/641 conflicts by 3 root cause(s)
- metrics: hubs=67 (frac 0.77), conflicts/hub=9.6, max_incompat=13.92Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V70-Q73 + F20-L24 + C62-T67 — explain ~370/641 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F72** — severity 58.85, 39 conflict(s); suspect input ~`H55` (group: pull_in)
  - pull-in (wants closer): W33@3.8Å(now 9.9,conf 0.47), A80@4.3Å(now 8.8,conf 0.41), S79@4.3Å(now 8.3,conf 0.41), K34@4.5Å(now 9.5,conf 0.39), L24@5.1Å(now 12.8,conf 0.27), G31@5.1Å(now 9.6,conf 0.27), I22@5.6Å(now 9.1,conf 0.23), H55@5.8Å(now 13.8,conf 0.23)
  - W33↔A80: targets 3.8/4.3Å but partners are 18.4Å apart → too_far_apart by 10.2Å
  - W33↔S79: targets 3.8/4.3Å but partners are 16.9Å apart → too_far_apart by 8.7Å
  - A80↔K34: targets 4.3/4.5Å but partners are 17.0Å apart → too_far_apart by 8.2Å
- **L7** — severity 54.94, 34 conflict(s); suspect input ~`E21` (group: push_out)
  - pull-in (wants closer): V70@4.5Å(now 8.0,conf 0.39), S79@4.7Å(now 9.4,conf 0.38), A80@4.7Å(now 10.7,conf 0.37), E21@4.8Å(now 12.4,conf 0.36), A81@4.8Å(now 8.8,conf 0.36), I22@5.0Å(now 8.0,conf 0.27), W33@5.2Å(now 8.5,conf 0.26)
  - push-out (wants farther): V12@12.1Å(now 9.3,conf 0.59), F13@13.5Å(now 10.2,conf 0.59), V14@14.7Å(now 7.8,conf 0.49)
  - A80↔E21: targets 4.7/4.8Å but partners are 22.6Å apart → too_far_apart by 13.1Å
  - S79↔E21: targets 4.7/4.8Å but partners are 21.7Å apart → too_far_apart by 12.2Å
  - E21↔A81: targets 4.8/4.8Å but partners are 19.9Å apart → too_far_apart by 10.2Å
- **W33** — severity 42.42, 36 conflict(s); suspect input ~`I56` (group: pull_in)
  - pull-in (wants closer): F72@3.8Å(now 9.9,conf 0.47), Q73@4.7Å(now 11.2,conf 0.38), H55@4.9Å(now 7.6,conf 0.35), V70@5.1Å(now 11.6,conf 0.27), L7@5.2Å(now 8.5,conf 0.26), I56@5.2Å(now 10.1,conf 0.26), L57@5.2Å(now 7.8,conf 0.26)
  - push-out (wants farther): K36@9.2Å(now 5.7,conf 0.82), E26@12.8Å(now 7.7,conf 0.66), D28@10.2Å(now 4.0,conf 0.59), V29@8.4Å(now 3.5,conf 0.59), P27@10.9Å(now 5.1,conf 0.49), G37@9.7Å(now 4.5,conf 0.49)
  - Q73↔E21: targets 4.7/4.9Å but partners are 16.5Å apart → too_far_apart by 7.0Å
  - Q73↔I56: targets 4.7/5.2Å but partners are 18.6Å apart → too_far_apart by 8.7Å
  - F72↔I56: targets 3.8/5.2Å but partners are 17.0Å apart → too_far_apart by 8.0Å
- **V70** — severity 39.72, 31 conflict(s); suspect input ~`A81` (group: push_out)
  - pull-in (wants closer): L35@4.0Å(now 12.3,conf 0.45), A81@4.1Å(now 7.3,conf 0.43), N82@4.2Å(now 7.3,conf 0.43), L7@4.5Å(now 8.0,conf 0.39), W33@5.1Å(now 11.6,conf 0.27), K34@5.1Å(now 12.3,conf 0.27), F20@5.5Å(now 9.3,conf 0.24)
  - push-out (wants farther): Q73@8.8Å(now 6.3,conf 0.82)
  - L35↔N82: targets 4.0/4.2Å but partners are 17.5Å apart → too_far_apart by 9.3Å
  - L35↔A81: targets 4.0/4.1Å but partners are 16.4Å apart → too_far_apart by 8.3Å
  - N82↔W33: targets 4.2/5.1Å but partners are 17.4Å apart → too_far_apart by 8.2Å
- **K34** — severity 36.36, 20 conflict(s); suspect input ~`V70` (group: push_out)
  - pull-in (wants closer): L40@4.2Å(now 9.3,conf 0.43), S71@4.3Å(now 12.7,conf 0.41), F72@4.5Å(now 9.5,conf 0.39), V70@5.1Å(now 12.3,conf 0.27)
  - push-out (wants farther): P27@13.9Å(now 3.8,conf 0.49), V29@11.6Å(now 3.1,conf 0.43), D28@12.2Å(now 6.9,conf 0.40)
  - L40↔S71: targets 4.2/4.3Å but partners are 20.3Å apart → too_far_apart by 11.7Å
  - S71↔Q38: targets 4.3/4.8Å but partners are 18.8Å apart → too_far_apart by 9.6Å
  - L40↔F72: targets 4.2/4.5Å but partners are 16.6Å apart → too_far_apart by 7.9Å
- **F20** — severity 34.41, 29 conflict(s); suspect input ~`A81` (group: pull_in)
  - pull-in (wants closer): L57@4.3Å(now 8.0,conf 0.41), A81@4.7Å(now 13.8,conf 0.37), Y8@5.0Å(now 8.7,conf 0.27), L83@5.4Å(now 9.9,conf 0.24), G9@5.5Å(now 8.3,conf 0.24), V10@5.5Å(now 8.5,conf 0.24), V70@5.5Å(now 9.3,conf 0.24)
  - push-out (wants farther): E26@14.6Å(now 9.9,conf 0.84), V14@12.6Å(now 3.7,conf 0.67), T17@10.1Å(now 7.1,conf 0.67), P27@12.7Å(now 5.4,conf 0.59), G15@12.2Å(now 8.4,conf 0.52), F13@12.8Å(now 7.6,conf 0.49)
  - L57↔A81: targets 4.3/4.7Å but partners are 19.0Å apart → too_far_apart by 9.9Å
  - I58↔A81: targets 4.5/4.7Å but partners are 17.9Å apart → too_far_apart by 8.7Å
  - E23↔A81: targets 8.2/4.7Å but partners are 19.3Å apart → too_far_apart by 6.4Å

## Secondary Structure (DSSP-like)

- helix(H)=44 · strand(E)=27 · 3-10(G)=6 · coil(C)=10

```
CECHHEHHHHEHHHHGHHEHEHHHHHHHHHHHHHEHEEEEHEHECEEHEHHEHHHHEHHGHEEEGGCEECHGECECCCECGHHEHHE
```

## Backbone H-bond Network

- total=91 · helix(i→i+4)=21 · sheet=70
  - E4 ↔ Y8  (helix)
  - K5 ↔ G9  (helix)
  - Y8 ↔ V12  (helix)
  - G9 ↔ F13  (helix)
  - V10 ↔ V14  (helix)
  - F13 ↔ T17  (helix)
  - V14 ↔ A18  (helix)
  - A18 ↔ I22  (helix)
  - I22 ↔ E26  (helix)
  - E23 ↔ P27  (helix)
  - L24 ↔ D28  (helix)
  - S25 ↔ V29  (helix)
  - E26 ↔ H30  (helix)
  - P27 ↔ G31  (helix)
  - D28 ↔ Q32  (helix)
  - V29 ↔ W33  (helix)
  - H30 ↔ K34  (helix)
  - Q32 ↔ K36  (helix)
  - D51 ↔ H55  (helix)
  - H55 ↔ L59  (helix)
  - … +71 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=33 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=622 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=444 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.765 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=39 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
