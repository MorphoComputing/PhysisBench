# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1TIT\seeds\seed_5\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 12.563 A
- tm_score_ca_ordered: 0.1399157938239949
- heavy_atom_rmsd: 13.333 A
- sidechain_heavy_atom_rmsd: 14.165 A
- **all-atom quality (honest):** heavy 13.333 A, sidechain 14.165 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 75
- distogram_pairs: 512
- bin_accuracy: 0.305

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** H55-L59 → 296 conflicts (27%); V70-Q73 → 219 conflicts (20%); F20-L24 → 160 conflicts (14%)
- explained: 675/1114 conflicts by 3 root cause(s)
- metrics: hubs=71 (frac 0.816), conflicts/hub=15.7, max_incompat=18.7Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): H55-L59 + V70-Q73 + F20-L24 — explain ~675/1114 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V70** — severity 121.11, 52 conflict(s); suspect input ~`L35` (group: push_out)
  - pull-in (wants closer): L35@4.0Å(now 18.1,conf 0.45), N82@4.2Å(now 7.4,conf 0.43), L7@4.5Å(now 13.8,conf 0.39), W33@5.1Å(now 11.0,conf 0.27), K34@5.1Å(now 15.1,conf 0.27), F20@5.5Å(now 8.2,conf 0.24)
  - push-out (wants farther): A77@15.2Å(now 7.6,conf 0.67), A75@13.1Å(now 10.3,conf 0.59), N76@15.3Å(now 7.2,conf 0.52)
  - L35↔N82: targets 4.0/4.2Å but partners are 21.7Å apart → too_far_apart by 13.5Å
  - M66↔L35: targets 5.2/4.0Å but partners are 21.9Å apart → too_far_apart by 12.7Å
  - G65↔L35: targets 4.8/4.0Å but partners are 21.2Å apart → too_far_apart by 12.4Å
- **W33** — severity 120.89, 80 conflict(s); suspect input ~`Q73` (group: push_out)
  - pull-in (wants closer): F72@3.8Å(now 9.1,conf 0.47), Q73@4.7Å(now 11.8,conf 0.38), H55@4.9Å(now 10.0,conf 0.35), V70@5.1Å(now 11.0,conf 0.27), L7@5.2Å(now 9.5,conf 0.26), I56@5.2Å(now 11.6,conf 0.26), L57@5.2Å(now 9.6,conf 0.26)
  - push-out (wants farther): E26@20.0Å(now 4.1,conf 0.58), P27@20.1Å(now 5.5,conf 0.49), D28@15.3Å(now 9.1,conf 0.40), P39@7.6Å(now 4.9,conf 0.34), L40@9.0Å(now 5.4,conf 0.34)
  - P27↔F72: targets 20.1/3.8Å but partners are 5.3Å apart → too_close_together by 10.9Å
  - E26↔F72: targets 20.0/3.8Å but partners are 6.3Å apart → too_close_together by 9.8Å
  - P27↔I48: targets 20.1/5.2Å but partners are 3.4Å apart → too_close_together by 11.5Å
- **L57** — severity 86.60, 37 conflict(s); suspect input ~`L64` (group: push_out)
  - pull-in (wants closer): G52@6.7Å(now 9.3,conf 0.52), F20@4.3Å(now 6.9,conf 0.41), E21@4.3Å(now 12.3,conf 0.41), E47@4.9Å(now 8.0,conf 0.35), I48@5.0Å(now 8.9,conf 0.27), W33@5.2Å(now 9.6,conf 0.26)
  - push-out (wants farther): Q63@19.2Å(now 13.5,conf 0.52), L64@24.0Å(now 12.4,conf 0.49), C62@16.0Å(now 11.4,conf 0.44)
  - G52↔L64: targets 6.7/24.0Å but partners are 4.2Å apart → too_close_together by 13.1Å
  - E50↔L64: targets 3.8/24.0Å but partners are 7.2Å apart → too_close_together by 13.0Å
  - D51↔L64: targets 7.0/24.0Å but partners are 5.2Å apart → too_close_together by 11.8Å
- **L7** — severity 81.21, 49 conflict(s); suspect input ~`E21` (group: push_out)
  - pull-in (wants closer): V70@4.5Å(now 13.8,conf 0.39), S79@4.7Å(now 16.7,conf 0.38), A80@4.7Å(now 13.5,conf 0.37), E21@4.8Å(now 8.2,conf 0.36), A81@4.8Å(now 10.0,conf 0.36), S71@4.9Å(now 14.4,conf 0.35), I22@5.0Å(now 10.7,conf 0.27), W33@5.2Å(now 9.5,conf 0.26)
  - push-out (wants farther): E2@17.6Å(now 5.8,conf 0.82), I1@18.5Å(now 7.8,conf 0.67), V3@13.8Å(now 5.4,conf 0.66)
  - E4↔S79: targets 11.1/4.7Å but partners are 25.9Å apart → too_far_apart by 10.2Å
  - I1↔F20: targets 18.5/4.7Å but partners are 3.7Å apart → too_close_together by 10.1Å
  - I1↔E21: targets 18.5/4.8Å but partners are 3.4Å apart → too_close_together by 10.3Å
- **M66** — severity 69.98, 27 conflict(s); suspect input ~`L35` (group: pull_in)
  - pull-in (wants closer): F72@7.3Å(now 10.8,conf 0.49), Q63@4.5Å(now 7.2,conf 0.39), L35@4.5Å(now 21.9,conf 0.39), V85@5.5Å(now 8.2,conf 0.24)
  - push-out (wants farther): L59@21.5Å(now 5.3,conf 0.49), N61@15.3Å(now 7.5,conf 0.49), C62@11.9Å(now 6.3,conf 0.49), H60@17.5Å(now 5.4,conf 0.43)
  - Q63↔L35: targets 4.5/4.5Å but partners are 27.7Å apart → too_far_apart by 18.7Å
  - E69↔L59: targets 4.5/21.5Å but partners are 3.3Å apart → too_close_together by 13.6Å
  - V70↔L59: targets 5.2/21.5Å but partners are 3.9Å apart → too_close_together by 12.3Å
- **I58** — severity 66.59, 25 conflict(s); suspect input ~`G65` (group: pull_in)
  - pull-in (wants closer): H19@3.8Å(now 15.7,conf 0.47), E47@4.2Å(now 10.2,conf 0.43), F20@4.5Å(now 10.2,conf 0.39)
  - push-out (wants farther): C62@13.5Å(now 10.2,conf 0.58), Q63@17.3Å(now 12.2,conf 0.52), G65@22.5Å(now 9.7,conf 0.49), L64@20.6Å(now 12.8,conf 0.43)
  - G52↔G65: targets 7.6/22.5Å but partners are 3.9Å apart → too_close_together by 11.1Å
  - D51↔G65: targets 8.3/22.5Å but partners are 3.4Å apart → too_close_together by 10.8Å
  - K53↔G65: targets 9.8/22.5Å but partners are 3.4Å apart → too_close_together by 9.4Å

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=37 · 3-10(G)=8 · coil(C)=4

```
CEEHCEHEEGEEEGGHHEHHEHHHHHEHGHHEHEEHEEEEEEEEHECHGGHHEHEHHHGEHHHHHHHHEEECEHHEHEEEHEGEHHE
```

## Backbone H-bond Network

- total=131 · helix(i→i+4)=14 · sheet=117
  - E16 ↔ F20  (helix)
  - H19 ↔ E23  (helix)
  - F20 ↔ L24  (helix)
  - L24 ↔ D28  (helix)
  - I48 ↔ G52  (helix)
  - G52 ↔ I56  (helix)
  - K54 ↔ I58  (helix)
  - L57 ↔ N61  (helix)
  - I58 ↔ C62  (helix)
  - N61 ↔ G65  (helix)
  - Q63 ↔ T67  (helix)
  - L64 ↔ G68  (helix)
  - A77 ↔ A81  (helix)
  - A81 ↔ V85  (helix)
  - E2 ↔ Y8  (sheet)
  - E2 ↔ G9  (sheet)
  - E2 ↔ E11  (sheet)
  - E2 ↔ V12  (sheet)
  - E2 ↔ F13  (sheet)
  - E2 ↔ A18  (sheet)
  - … +111 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=47 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=794 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=643 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.1965 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=75 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
