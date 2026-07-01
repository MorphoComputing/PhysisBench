# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1TIT\seeds\seed_8\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 14.488 A
- tm_score_ca_ordered: 0.1322520635691656
- heavy_atom_rmsd: 15.140 A
- sidechain_heavy_atom_rmsd: 15.875 A
- **all-atom quality (honest):** heavy 15.140 A, sidechain 15.875 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 29
- distogram_pairs: 514
- bin_accuracy: 0.350

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F20-L24 → 343 conflicts (33%); W33-K34 → 187 conflicts (18%); V70-F72 → 64 conflicts (6%)
- explained: 594/1050 conflicts by 3 root cause(s)
- metrics: hubs=76 (frac 0.874), conflicts/hub=13.8, max_incompat=25.69Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F20-L24 + W33-K34 + V70-F72 — explain ~594/1050 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H55** — severity 198.36, 49 conflict(s); suspect input ~`L24` (group: push_out)
  - pull-in (wants closer): G52@5.3Å(now 10.3,conf 0.82), I49@7.2Å(now 11.2,conf 0.59), E50@4.0Å(now 12.0,conf 0.45), I22@4.3Å(now 19.1,conf 0.41), D51@4.7Å(now 11.4,conf 0.38), E23@4.7Å(now 21.7,conf 0.37), L24@4.8Å(now 23.7,conf 0.36), G31@4.9Å(now 12.6,conf 0.35), W33@4.9Å(now 12.9,conf 0.35), F72@5.8Å(now 10.7,conf 0.23)
  - push-out (wants farther): I58@9.5Å(now 6.9,conf 0.58)
  - E50↔L24: targets 4.0/4.8Å but partners are 34.5Å apart → too_far_apart by 25.7Å
  - E50↔E23: targets 4.0/4.7Å but partners are 33.1Å apart → too_far_apart by 24.4Å
  - D51↔L24: targets 4.7/4.8Å but partners are 34.8Å apart → too_far_apart by 25.3Å
- **W33** — severity 181.36, 94 conflict(s); suspect input ~`I48` (group: push_out)
  - pull-in (wants closer): F72@3.8Å(now 10.6,conf 0.47), Q73@4.7Å(now 15.2,conf 0.38), H55@4.9Å(now 12.9,conf 0.35), V70@5.1Å(now 11.7,conf 0.27), I48@5.2Å(now 20.3,conf 0.26), I56@5.2Å(now 17.4,conf 0.26), L57@5.2Å(now 15.0,conf 0.26)
  - push-out (wants farther): D28@10.8Å(now 8.2,conf 0.59)
  - Q73↔E21: targets 4.7/4.9Å but partners are 21.7Å apart → too_far_apart by 12.2Å
  - G37↔Q73: targets 8.8/4.7Å but partners are 24.4Å apart → too_far_apart by 10.9Å
  - K36↔Q73: targets 9.1/4.7Å but partners are 24.6Å apart → too_far_apart by 10.8Å
- **L57** — severity 133.44, 35 conflict(s); suspect input ~`E21` (group: push_out)
  - pull-in (wants closer): E50@5.1Å(now 9.8,conf 0.84), D51@6.7Å(now 9.8,conf 0.52), F20@4.3Å(now 20.1,conf 0.41), E21@4.3Å(now 19.9,conf 0.41), I49@4.5Å(now 8.1,conf 0.39), W33@5.2Å(now 15.0,conf 0.26)
  - push-out (wants farther): K54@8.7Å(now 5.5,conf 0.82)
  - E50↔E21: targets 5.1/4.3Å but partners are 29.5Å apart → too_far_apart by 20.1Å
  - E50↔F20: targets 5.1/4.3Å but partners are 29.3Å apart → too_far_apart by 19.9Å
  - D51↔F20: targets 6.7/4.3Å but partners are 29.4Å apart → too_far_apart by 18.4Å
- **F72** — severity 117.24, 63 conflict(s); suspect input ~`L24` (group: push_out)
  - pull-in (wants closer): K78@7.2Å(now 9.8,conf 0.59), W33@3.8Å(now 10.6,conf 0.47), S79@4.3Å(now 7.0,conf 0.41), K34@4.5Å(now 13.7,conf 0.39), L24@5.1Å(now 18.9,conf 0.27), G31@5.1Å(now 9.3,conf 0.27), I22@5.6Å(now 15.2,conf 0.23), H55@5.8Å(now 10.7,conf 0.23)
  - push-out (wants farther): T67@11.6Å(now 8.7,conf 0.69), E69@9.5Å(now 5.2,conf 0.59), G68@10.7Å(now 8.1,conf 0.52), M66@11.4Å(now 7.2,conf 0.34)
  - K78↔K34: targets 7.2/4.5Å but partners are 22.6Å apart → too_far_apart by 10.9Å
  - K78↔W33: targets 7.2/3.8Å but partners are 19.7Å apart → too_far_apart by 8.7Å
  - S79↔K34: targets 4.3/4.5Å but partners are 18.4Å apart → too_far_apart by 9.6Å
- **F20** — severity 108.03, 50 conflict(s); suspect input ~`I58` (group: push_out)
  - pull-in (wants closer): L57@4.3Å(now 20.1,conf 0.41), I58@4.5Å(now 20.5,conf 0.39), A81@4.7Å(now 14.1,conf 0.37), L83@5.4Å(now 10.6,conf 0.24), V70@5.5Å(now 14.4,conf 0.24)
  - push-out (wants farther): L24@9.4Å(now 6.4,conf 0.52)
  - S25↔L57: targets 10.7/4.3Å but partners are 27.5Å apart → too_far_apart by 12.4Å
  - L24↔L57: targets 9.4/4.3Å but partners are 25.1Å apart → too_far_apart by 11.4Å
  - S25↔I58: targets 10.7/4.5Å but partners are 26.9Å apart → too_far_apart by 11.7Å
- **V70** — severity 98.13, 48 conflict(s); suspect input ~`L35` (group: pull_in)
  - pull-in (wants closer): L35@4.0Å(now 17.9,conf 0.45), L7@4.5Å(now 10.4,conf 0.39), W33@5.1Å(now 11.7,conf 0.27), K34@5.1Å(now 14.5,conf 0.27), F20@5.5Å(now 14.4,conf 0.24)
  - push-out (wants farther): Q73@9.0Å(now 6.3,conf 0.58), A74@11.8Å(now 9.2,conf 0.49), A77@12.6Å(now 8.0,conf 0.49), N76@14.0Å(now 10.9,conf 0.26)
  - L64↔L35: targets 8.8/4.0Å but partners are 28.3Å apart → too_far_apart by 15.4Å
  - T67↔L35: targets 7.9/4.0Å but partners are 24.4Å apart → too_far_apart by 12.5Å
  - L35↔G65: targets 4.0/10.8Å but partners are 27.5Å apart → too_far_apart by 12.7Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=36 · 3-10(G)=14 · coil(C)=5

```
CEHHGHHHHEGHEHEEGEEGHHHHGGEHHGEEHEHECEEEGEEEEGEECECHGEHHGGEEGEEGEHHEHHHHEHEHEHCEHEHEHHE
```

## Backbone H-bond Network

- total=132 · helix(i→i+4)=10 · sheet=122
  - V3 ↔ L7  (helix)
  - E4 ↔ Y8  (helix)
  - Y8 ↔ V12  (helix)
  - L24 ↔ D28  (helix)
  - V29 ↔ W33  (helix)
  - G52 ↔ I56  (helix)
  - M66 ↔ V70  (helix)
  - T67 ↔ S71  (helix)
  - F72 ↔ N76  (helix)
  - A81 ↔ V85  (helix)
  - E2 ↔ V10  (sheet)
  - E2 ↔ F13  (sheet)
  - E2 ↔ A18  (sheet)
  - V10 ↔ G15  (sheet)
  - V10 ↔ E16  (sheet)
  - V10 ↔ A18  (sheet)
  - V10 ↔ H19  (sheet)
  - V10 ↔ P27  (sheet)
  - F13 ↔ A18  (sheet)
  - F13 ↔ H19  (sheet)
  - … +112 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=522 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=359 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.4551 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=29 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
