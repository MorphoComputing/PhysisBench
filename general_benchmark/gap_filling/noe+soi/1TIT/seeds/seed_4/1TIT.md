# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1TIT\seeds\seed_4\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 13.098 A
- tm_score_ca_ordered: 0.12292458440535368
- heavy_atom_rmsd: 13.756 A
- sidechain_heavy_atom_rmsd: 14.389 A
- **all-atom quality (honest):** heavy 13.756 A, sidechain 14.389 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 34
- distogram_pairs: 509
- bin_accuracy: 0.293

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F20-L24 → 220 conflicts (22%); W33-K34 → 181 conflicts (18%); H55-L57 → 102 conflicts (10%)
- explained: 503/981 conflicts by 3 root cause(s)
- metrics: hubs=70 (frac 0.805), conflicts/hub=14.0, max_incompat=25.69Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F20-L24 + W33-K34 + H55-L57 — explain ~503/981 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W33** — severity 127.24, 88 conflict(s); suspect input ~`I56` (group: push_out)
  - pull-in (wants closer): F72@3.8Å(now 8.3,conf 0.47), Q73@4.7Å(now 11.2,conf 0.38), E21@4.9Å(now 8.7,conf 0.35), H55@4.9Å(now 14.1,conf 0.35), F20@5.0Å(now 13.2,conf 0.27), V70@5.1Å(now 9.8,conf 0.27), L7@5.2Å(now 17.8,conf 0.26), I48@5.2Å(now 11.4,conf 0.26), I56@5.2Å(now 17.2,conf 0.26), L57@5.2Å(now 13.0,conf 0.26)
  - push-out (wants farther): H30@9.6Å(now 6.4,conf 0.69), V29@12.8Å(now 9.8,conf 0.59), E26@16.8Å(now 10.3,conf 0.34), P27@15.7Å(now 10.4,conf 0.34), D28@13.8Å(now 8.3,conf 0.34)
  - L7↔I56: targets 5.2/5.2Å but partners are 23.6Å apart → too_far_apart by 13.2Å
  - K36↔H55: targets 9.0/4.9Å but partners are 23.2Å apart → too_far_apart by 9.3Å
  - H55↔L7: targets 4.9/5.2Å but partners are 22.6Å apart → too_far_apart by 12.6Å
- **E23** — severity 106.46, 29 conflict(s); suspect input ~`K54` (group: push_out)
  - pull-in (wants closer): K54@4.0Å(now 18.8,conf 0.45), K5@4.3Å(now 22.6,conf 0.41), H55@4.7Å(now 14.8,conf 0.37)
  - push-out (wants farther): E16@12.2Å(now 9.2,conf 0.52), T17@11.2Å(now 7.3,conf 0.49)
  - K54↔K5: targets 4.0/4.3Å but partners are 34.1Å apart → too_far_apart by 25.7Å
  - K5↔H55: targets 4.3/4.7Å but partners are 29.5Å apart → too_far_apart by 20.4Å
  - P27↔K54: targets 7.0/4.0Å but partners are 26.4Å apart → too_far_apart by 15.4Å
- **V70** — severity 100.05, 40 conflict(s); suspect input ~`L35` (group: push_out)
  - pull-in (wants closer): Q63@11.8Å(now 15.1,conf 0.49), G65@10.8Å(now 14.6,conf 0.49), M66@8.1Å(now 11.0,conf 0.49), L35@4.0Å(now 14.7,conf 0.45), L64@10.6Å(now 14.3,conf 0.40), L7@4.5Å(now 12.0,conf 0.39), W33@5.1Å(now 9.8,conf 0.27), K34@5.1Å(now 15.0,conf 0.27)
  - push-out (wants farther): A75@15.0Å(now 12.4,conf 0.49), A77@13.2Å(now 10.7,conf 0.49), N76@15.6Å(now 12.8,conf 0.40)
  - G65↔L35: targets 10.8/4.0Å but partners are 27.8Å apart → too_far_apart by 13.0Å
  - M66↔L35: targets 8.1/4.0Å but partners are 24.9Å apart → too_far_apart by 12.8Å
  - T67↔L35: targets 8.5/4.0Å but partners are 23.7Å apart → too_far_apart by 11.2Å
- **I22** — severity 94.11, 45 conflict(s); suspect input ~`P6` (group: push_out)
  - pull-in (wants closer): H55@4.3Å(now 13.7,conf 0.41), P6@4.7Å(now 16.0,conf 0.38), S79@4.7Å(now 12.0,conf 0.38), L7@5.0Å(now 13.0,conf 0.27), F72@5.6Å(now 8.9,conf 0.23)
  - push-out (wants farther): G15@11.8Å(now 8.1,conf 0.34), E16@11.8Å(now 8.8,conf 0.26)
  - H55↔P6: targets 4.3/4.7Å but partners are 24.3Å apart → too_far_apart by 15.3Å
  - E26↔H55: targets 6.6/4.3Å but partners are 20.2Å apart → too_far_apart by 9.2Å
  - H55↔L7: targets 4.3/5.0Å but partners are 22.6Å apart → too_far_apart by 13.3Å
- **E21** — severity 78.99, 27 conflict(s); suspect input ~`I56` (group: push_out)
  - pull-in (wants closer): I56@4.0Å(now 15.4,conf 0.45), L57@4.3Å(now 12.7,conf 0.41), L7@4.8Å(now 11.0,conf 0.36), W33@4.9Å(now 8.7,conf 0.35)
  - push-out (wants farther): L24@9.1Å(now 6.5,conf 0.82), V14@12.4Å(now 7.4,conf 0.34)
  - I56↔L7: targets 4.0/4.8Å but partners are 23.6Å apart → too_far_apart by 14.8Å
  - P27↔I56: targets 9.3/4.0Å but partners are 24.9Å apart → too_far_apart by 11.5Å
  - L57↔L7: targets 4.3/4.8Å but partners are 21.8Å apart → too_far_apart by 12.6Å
- **H55** — severity 77.30, 36 conflict(s); suspect input ~`L24` (group: pull_in)
  - pull-in (wants closer): I22@4.3Å(now 13.7,conf 0.41), E23@4.7Å(now 14.8,conf 0.37), L24@4.8Å(now 17.9,conf 0.36), G31@4.9Å(now 14.2,conf 0.35), W33@4.9Å(now 14.1,conf 0.35)
  - push-out (wants farther): C62@21.2Å(now 9.6,conf 0.66), I48@10.1Å(now 7.6,conf 0.52), I58@9.0Å(now 4.9,conf 0.52), H60@13.0Å(now 3.8,conf 0.43), L59@10.8Å(now 4.7,conf 0.34), N61@15.5Å(now 7.5,conf 0.34)
  - C62↔I49: targets 21.2/7.4Å but partners are 4.9Å apart → too_close_together by 9.0Å
  - C62↔E50: targets 21.2/4.0Å but partners are 8.3Å apart → too_close_together by 9.0Å
  - D51↔L24: targets 4.7/4.8Å but partners are 19.9Å apart → too_far_apart by 10.4Å

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=39 · 3-10(G)=9 · coil(C)=3

```
CEHGHHEEGEGECHEGHEEEEEGHHEEEHEHHHEHEHHHEEEEGEHEHEHEHHHGHHHHEHHGHHEEGEHEEEHECHEEEHHHEHEE
```

## Backbone H-bond Network

- total=142 · helix(i→i+4)=15 · sheet=127
  - S25 ↔ V29  (helix)
  - V29 ↔ W33  (helix)
  - G31 ↔ L35  (helix)
  - W33 ↔ G37  (helix)
  - L35 ↔ P39  (helix)
  - C46 ↔ E50  (helix)
  - I48 ↔ G52  (helix)
  - G52 ↔ I56  (helix)
  - K53 ↔ L57  (helix)
  - L57 ↔ N61  (helix)
  - I58 ↔ C62  (helix)
  - N61 ↔ G65  (helix)
  - V70 ↔ A74  (helix)
  - A77 ↔ A81  (helix)
  - A81 ↔ V85  (helix)
  - E2 ↔ L7  (sheet)
  - E2 ↔ F20  (sheet)
  - L7 ↔ V12  (sheet)
  - L7 ↔ A18  (sheet)
  - L7 ↔ H19  (sheet)
  - … +122 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=459 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=309 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.7576 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=34 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
