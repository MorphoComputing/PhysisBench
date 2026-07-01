# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1TIT\seeds\seed_3\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 13.426 A
- tm_score_ca_ordered: 0.11412696731410651
- heavy_atom_rmsd: 14.361 A
- sidechain_heavy_atom_rmsd: 15.322 A
- **all-atom quality (honest):** heavy 14.361 A, sidechain 15.322 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 27
- distogram_pairs: 513
- bin_accuracy: 0.345

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F20-I22 → 255 conflicts (29%); W33-K34 → 166 conflicts (19%); V70-F72 → 68 conflicts (8%)
- explained: 489/876 conflicts by 3 root cause(s)
- metrics: hubs=68 (frac 0.782), conflicts/hub=12.9, max_incompat=21.77Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F20-I22 + W33-K34 + V70-F72 — explain ~489/876 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W33** — severity 162.53, 81 conflict(s); suspect input ~`Q73` (group: push_out)
  - pull-in (wants closer): F72@3.8Å(now 16.2,conf 0.47), Q73@4.7Å(now 20.3,conf 0.38), H55@4.9Å(now 9.8,conf 0.35), F20@5.0Å(now 10.7,conf 0.27), V70@5.1Å(now 14.7,conf 0.27), L7@5.2Å(now 16.0,conf 0.26), I56@5.2Å(now 12.7,conf 0.26), L57@5.2Å(now 9.5,conf 0.26)
  - push-out (wants farther): P27@16.4Å(now 3.8,conf 0.52), D28@13.9Å(now 4.2,conf 0.52), E26@19.2Å(now 5.1,conf 0.49), H30@8.2Å(now 4.8,conf 0.40), V29@11.2Å(now 6.6,conf 0.34)
  - Q38↔F72: targets 8.1/3.8Å but partners are 25.5Å apart → too_far_apart by 13.6Å
  - Q38↔Q73: targets 8.1/4.7Å but partners are 29.5Å apart → too_far_apart by 16.8Å
  - K36↔Q73: targets 7.9/4.7Å but partners are 28.9Å apart → too_far_apart by 16.3Å
- **F72** — severity 122.52, 42 conflict(s); suspect input ~`K34` (group: push_out)
  - pull-in (wants closer): W33@3.8Å(now 16.2,conf 0.47), S79@4.3Å(now 8.2,conf 0.41), K34@4.5Å(now 21.4,conf 0.39), L24@5.1Å(now 19.0,conf 0.27), G31@5.1Å(now 14.9,conf 0.27), I22@5.6Å(now 13.6,conf 0.23), H55@5.8Å(now 11.1,conf 0.23)
  - push-out (wants farther): E69@7.4Å(now 3.2,conf 0.79), G68@9.0Å(now 5.4,conf 0.40), T67@9.4Å(now 3.8,conf 0.26)
  - S79↔K34: targets 4.3/4.5Å but partners are 28.7Å apart → too_far_apart by 19.9Å
  - A80↔K34: targets 4.3/4.5Å but partners are 27.5Å apart → too_far_apart by 18.8Å
  - K78↔K34: targets 8.3/4.5Å but partners are 29.5Å apart → too_far_apart by 16.7Å
- **V70** — severity 119.75, 39 conflict(s); suspect input ~`K34` (group: push_out)
  - pull-in (wants closer): L35@4.0Å(now 22.8,conf 0.45), N82@4.2Å(now 7.9,conf 0.43), W33@5.1Å(now 14.7,conf 0.27), K34@5.1Å(now 19.8,conf 0.27)
  - push-out (wants farther): T67@7.8Å(now 4.4,conf 0.69)
  - L35↔N82: targets 4.0/4.2Å but partners are 30.0Å apart → too_far_apart by 21.8Å
  - L35↔A81: targets 4.0/4.1Å but partners are 29.0Å apart → too_far_apart by 20.9Å
  - Q73↔L35: targets 9.0/4.0Å but partners are 28.7Å apart → too_far_apart by 15.7Å
- **I22** — severity 92.00, 46 conflict(s); suspect input ~`S79` (group: pull_in)
  - pull-in (wants closer): G15@9.9Å(now 12.6,conf 0.49), H55@4.3Å(now 11.8,conf 0.41), P6@4.7Å(now 11.7,conf 0.38), S79@4.7Å(now 20.4,conf 0.38), E16@8.6Å(now 12.0,conf 0.34), L7@5.0Å(now 11.3,conf 0.27), F72@5.6Å(now 13.6,conf 0.23)
  - S25↔S79: targets 8.6/4.7Å but partners are 30.2Å apart → too_far_apart by 17.0Å
  - E26↔S79: targets 6.8/4.7Å but partners are 27.3Å apart → too_far_apart by 15.8Å
  - P27↔S79: targets 7.0/4.7Å but partners are 25.7Å apart → too_far_apart by 14.0Å
- **K34** — severity 91.92, 27 conflict(s); suspect input ~`V70` (group: push_out)
  - pull-in (wants closer): L40@4.2Å(now 7.1,conf 0.43), S71@4.3Å(now 23.0,conf 0.41), F72@4.5Å(now 21.4,conf 0.39), V70@5.1Å(now 19.8,conf 0.27)
  - push-out (wants farther): D28@16.2Å(now 6.9,conf 0.49), P27@19.8Å(now 3.8,conf 0.43), V29@12.4Å(now 9.5,conf 0.26)
  - L40↔S71: targets 4.2/4.3Å but partners are 27.4Å apart → too_far_apart by 18.9Å
  - S71↔Q38: targets 4.3/4.8Å but partners are 27.2Å apart → too_far_apart by 18.0Å
  - L40↔F72: targets 4.2/4.5Å but partners are 25.0Å apart → too_far_apart by 16.3Å
- **Q32** — severity 79.10, 24 conflict(s); suspect input ~`A74` (group: pull_in)
  - pull-in (wants closer): Q73@4.2Å(now 19.7,conf 0.43), A74@4.7Å(now 20.1,conf 0.38)
  - push-out (wants farther): D28@11.6Å(now 3.8,conf 0.82), E26@14.9Å(now 7.4,conf 0.58), P27@13.8Å(now 3.6,conf 0.58), V29@9.5Å(now 2.1,conf 0.58), S25@19.6Å(now 10.9,conf 0.43)
  - L35↔Q73: targets 10.0/4.2Å but partners are 28.7Å apart → too_far_apart by 14.6Å
  - Q73↔G37: targets 4.2/10.6Å but partners are 29.3Å apart → too_far_apart by 14.5Å
  - K36↔Q73: targets 11.6/4.2Å but partners are 28.9Å apart → too_far_apart by 13.1Å

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=40 · 3-10(G)=10 · coil(C)=3

```
CEHHCHEEHEHHEHEGHGEGEHHEHEEHHHHHHEHHEEHEEEEHEHEEGEEEEGHHGEEGEGEHEGHHEHHHEEEGCEEEEEHHHHE
```

## Backbone H-bond Network

- total=149 · helix(i→i+4)=9 · sheet=140
  - S25 ↔ V29  (helix)
  - D28 ↔ Q32  (helix)
  - V29 ↔ W33  (helix)
  - G31 ↔ L35  (helix)
  - Q32 ↔ K36  (helix)
  - L35 ↔ P39  (helix)
  - L64 ↔ G68  (helix)
  - T67 ↔ S71  (helix)
  - G68 ↔ F72  (helix)
  - E2 ↔ L7  (sheet)
  - E2 ↔ V10  (sheet)
  - E2 ↔ F13  (sheet)
  - E2 ↔ G15  (sheet)
  - L7 ↔ F13  (sheet)
  - L7 ↔ G15  (sheet)
  - L7 ↔ H19  (sheet)
  - L7 ↔ E21  (sheet)
  - Y8 ↔ F13  (sheet)
  - Y8 ↔ G15  (sheet)
  - Y8 ↔ H19  (sheet)
  - … +129 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=507 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=346 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.4631 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=27 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
