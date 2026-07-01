# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1TIT\seeds\seed_6\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 11.423 A
- tm_score_ca_ordered: 0.13639573846021943
- heavy_atom_rmsd: 12.300 A
- sidechain_heavy_atom_rmsd: 13.241 A
- **all-atom quality (honest):** heavy 12.300 A, sidechain 13.241 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 44
- distogram_pairs: 512
- bin_accuracy: 0.311

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V70-F72 → 200 conflicts (28%); F20-L24 → 110 conflicts (16%); V10 → 49 conflicts (7%)
- explained: 359/710 conflicts by 3 root cause(s)
- metrics: hubs=64 (frac 0.736), conflicts/hub=11.1, max_incompat=17.14Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V70-F72 + F20-L24 + V10 — explain ~359/710 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W33** — severity 112.80, 58 conflict(s); suspect input ~`Q73` (group: pull_in)
  - pull-in (wants closer): F72@3.8Å(now 9.2,conf 0.47), Q73@4.7Å(now 13.6,conf 0.38), E21@4.9Å(now 9.4,conf 0.35), H55@4.9Å(now 8.6,conf 0.35), V70@5.1Å(now 12.4,conf 0.27), I22@5.2Å(now 8.2,conf 0.26)
  - Q73↔E21: targets 4.7/4.9Å but partners are 22.0Å apart → too_far_apart by 12.4Å
  - Q73↔H55: targets 4.7/4.9Å but partners are 21.4Å apart → too_far_apart by 11.9Å
  - F72↔E21: targets 3.8/4.9Å but partners are 18.0Å apart → too_far_apart by 9.3Å
- **L7** — severity 99.84, 44 conflict(s); suspect input ~`S71` (group: push_out)
  - pull-in (wants closer): E4@9.1Å(now 13.9,conf 0.94), V70@4.5Å(now 14.5,conf 0.39), S79@4.7Å(now 9.6,conf 0.38), A80@4.7Å(now 12.6,conf 0.37), E21@4.8Å(now 7.8,conf 0.36), A81@4.8Å(now 9.6,conf 0.36), S71@4.9Å(now 16.3,conf 0.35)
  - push-out (wants farther): V10@8.6Å(now 5.7,conf 0.67), V3@12.0Å(now 4.4,conf 0.49), E2@13.6Å(now 7.6,conf 0.40), I1@14.0Å(now 8.1,conf 0.34), V14@15.7Å(now 9.6,conf 0.34)
  - E4↔S71: targets 9.1/4.9Å but partners are 30.0Å apart → too_far_apart by 16.0Å
  - E4↔V70: targets 9.1/4.5Å but partners are 27.8Å apart → too_far_apart by 14.2Å
  - E4↔A80: targets 9.1/4.7Å but partners are 26.4Å apart → too_far_apart by 12.6Å
- **V10** — severity 85.22, 36 conflict(s); suspect input ~`N82` (group: pull_in)
  - pull-in (wants closer): L83@4.3Å(now 9.9,conf 0.41), N82@4.3Å(now 14.8,conf 0.41), K84@4.3Å(now 14.5,conf 0.41), E16@8.8Å(now 12.4,conf 0.34), H19@5.1Å(now 8.3,conf 0.27)
  - push-out (wants farther): L7@8.6Å(now 5.7,conf 0.67), P6@10.7Å(now 4.1,conf 0.52), E4@16.6Å(now 12.5,conf 0.49), K5@14.3Å(now 11.1,conf 0.49), V14@9.8Å(now 5.9,conf 0.40), V3@18.5Å(now 4.2,conf 0.34)
  - N82↔E16: targets 4.3/8.8Å but partners are 27.1Å apart → too_far_apart by 13.9Å
  - K84↔E16: targets 4.3/8.8Å but partners are 26.6Å apart → too_far_apart by 13.5Å
  - G15↔N82: targets 9.6/4.3Å but partners are 24.7Å apart → too_far_apart by 10.8Å
- **F72** — severity 70.33, 44 conflict(s); suspect input ~`L24` (group: pull_in)
  - pull-in (wants closer): W33@3.8Å(now 9.2,conf 0.47), K34@4.5Å(now 9.2,conf 0.39), L24@5.1Å(now 23.5,conf 0.27), G31@5.1Å(now 14.4,conf 0.27), I22@5.6Å(now 17.4,conf 0.23), H55@5.8Å(now 16.7,conf 0.23)
  - G68↔L24: targets 10.2/5.1Å but partners are 29.2Å apart → too_far_apart by 13.9Å
  - E69↔L24: targets 9.6/5.1Å but partners are 28.4Å apart → too_far_apart by 13.7Å
  - A80↔L24: targets 4.3/5.1Å but partners are 22.9Å apart → too_far_apart by 13.5Å
- **F20** — severity 68.44, 43 conflict(s); suspect input ~`V70` (group: pull_in)
  - pull-in (wants closer): A81@4.7Å(now 13.0,conf 0.37), L83@5.4Å(now 13.4,conf 0.24), V70@5.5Å(now 17.3,conf 0.24)
  - E16↔A81: targets 10.7/4.7Å but partners are 23.7Å apart → too_far_apart by 8.3Å
  - E16↔V70: targets 10.7/5.5Å but partners are 27.9Å apart → too_far_apart by 11.7Å
  - P27↔V70: targets 12.0/5.5Å but partners are 29.0Å apart → too_far_apart by 11.4Å
- **I22** — severity 60.11, 32 conflict(s); suspect input ~`S79` (group: pull_in)
  - pull-in (wants closer): P27@7.2Å(now 10.2,conf 0.49), S79@4.7Å(now 15.1,conf 0.38), W33@5.2Å(now 8.2,conf 0.26), F72@5.6Å(now 17.4,conf 0.23)
  - P27↔S79: targets 7.2/4.7Å but partners are 24.2Å apart → too_far_apart by 12.4Å
  - S25↔S79: targets 9.2/4.7Å but partners are 24.7Å apart → too_far_apart by 10.9Å
  - D28↔S79: targets 7.3/4.7Å but partners are 21.6Å apart → too_far_apart by 9.6Å

## Secondary Structure (DSSP-like)

- helix(H)=43 · strand(E)=34 · 3-10(G)=5 · coil(C)=5

```
CEHHHHHEEGHHHHEHEEHHHEGEHHEHEECECEHHHHHHHHEHHGEHEEHHEHGEEECEEEEECEEHHHHHHEEEGEEHHHHHHHE
```

## Backbone H-bond Network

- total=123 · helix(i→i+4)=16 · sheet=107
  - V3 ↔ L7  (helix)
  - L7 ↔ E11  (helix)
  - V12 ↔ E16  (helix)
  - E16 ↔ F20  (helix)
  - E21 ↔ S25  (helix)
  - L35 ↔ P39  (helix)
  - K36 ↔ L40  (helix)
  - G37 ↔ T41  (helix)
  - Q38 ↔ A42  (helix)
  - L40 ↔ P44  (helix)
  - T41 ↔ D45  (helix)
  - P44 ↔ I48  (helix)
  - I48 ↔ G52  (helix)
  - G68 ↔ F72  (helix)
  - A80 ↔ K84  (helix)
  - N82 ↔ K86  (helix)
  - E2 ↔ Y8  (sheet)
  - E2 ↔ G9  (sheet)
  - E2 ↔ G15  (sheet)
  - E2 ↔ T17  (sheet)
  - … +103 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=34 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=570 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=417 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.5745 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=44 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
