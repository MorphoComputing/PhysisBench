# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1TIT\seeds\seed_7\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 11.965 A
- tm_score_ca_ordered: 0.1405187946665769
- heavy_atom_rmsd: 13.052 A
- sidechain_heavy_atom_rmsd: 14.075 A
- **all-atom quality (honest):** heavy 13.052 A, sidechain 14.075 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 107
- distogram_pairs: 118
- bin_accuracy: 0.212

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S79-A81 → 32 conflicts (38%); W33 → 11 conflicts (13%); V10 → 9 conflicts (11%)
- explained: 52/85 conflicts by 3 root cause(s)
- metrics: hubs=26 (frac 0.299), conflicts/hub=3.3, max_incompat=6.81Å, chain_span=0.92
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S79-A81 + W33 + V10 — explain ~52/85 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L7** — severity 8.86, 7 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): V70@4.5Å(now 11.3,conf 0.39), S79@4.7Å(now 12.1,conf 0.38), F20@4.7Å(now 8.9,conf 0.37), A80@4.7Å(now 7.4,conf 0.37), E21@4.8Å(now 7.5,conf 0.36), A81@4.8Å(now 13.9,conf 0.36), S71@4.9Å(now 11.6,conf 0.35), I22@5.0Å(now 8.7,conf 0.27)
  - S79↔E21: targets 4.7/4.8Å but partners are 15.6Å apart → too_far_apart by 6.2Å
  - S79↔F20: targets 4.7/4.7Å but partners are 13.9Å apart → too_far_apart by 4.6Å
  - E21↔A81: targets 4.8/4.8Å but partners are 14.0Å apart → too_far_apart by 4.4Å
- **W33** — severity 8.61, 10 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): F72@3.8Å(now 9.1,conf 0.47), Q73@4.7Å(now 8.9,conf 0.38), E21@4.9Å(now 8.5,conf 0.35), F20@5.0Å(now 8.4,conf 0.27), V70@5.1Å(now 9.5,conf 0.27), I22@5.2Å(now 8.8,conf 0.26)
  - F72↔E21: targets 3.8/4.9Å but partners are 13.1Å apart → too_far_apart by 4.4Å
  - Q73↔E21: targets 4.7/4.9Å but partners are 13.2Å apart → too_far_apart by 3.7Å
  - Q73↔I56: targets 4.7/5.2Å but partners are 13.6Å apart → too_far_apart by 3.7Å
- **F20** — severity 7.80, 9 conflict(s); suspect input ~`V10` (group: pull_in)
  - pull-in (wants closer): L7@4.7Å(now 8.9,conf 0.37), A81@4.7Å(now 11.1,conf 0.37), W33@5.0Å(now 8.4,conf 0.27), L83@5.4Å(now 10.2,conf 0.24), V10@5.5Å(now 8.5,conf 0.24)
  - L7↔A81: targets 4.7/4.7Å but partners are 13.9Å apart → too_far_apart by 4.5Å
  - L57↔A81: targets 4.3/4.7Å but partners are 12.8Å apart → too_far_apart by 3.8Å
  - A81↔Y8: targets 4.7/5.0Å but partners are 12.9Å apart → too_far_apart by 3.1Å
- **L24** — severity 5.49, 5 conflict(s); suspect input ~`H55` (group: pull_in)
  - pull-in (wants closer): V3@3.9Å(now 7.9,conf 0.47), E4@4.0Å(now 8.1,conf 0.45), K5@5.2Å(now 8.2,conf 0.26)
  - V3↔H55: targets 3.9/4.8Å but partners are 12.9Å apart → too_far_apart by 4.2Å
  - E4↔H55: targets 4.0/4.8Å but partners are 12.1Å apart → too_far_apart by 3.2Å
  - F72↔K5: targets 5.1/5.2Å but partners are 14.4Å apart → too_far_apart by 4.1Å
- **I22** — severity 5.04, 4 conflict(s); suspect input ~`P6` (group: pull_in)
  - pull-in (wants closer): S79@4.7Å(now 14.0,conf 0.38), L7@5.0Å(now 8.7,conf 0.27), W33@5.2Å(now 8.8,conf 0.26), F72@5.6Å(now 11.4,conf 0.23)
  - P6↔S79: targets 4.7/4.7Å but partners are 14.4Å apart → too_far_apart by 5.2Å
  - H55↔S79: targets 4.3/4.7Å but partners are 13.7Å apart → too_far_apart by 4.7Å
  - P6↔F72: targets 4.7/5.6Å but partners are 13.1Å apart → too_far_apart by 2.9Å
- **A81** — severity 4.66, 5 conflict(s); suspect input ~`Y8` (group: pull_in)
  - pull-in (wants closer): Y8@4.5Å(now 12.9,conf 0.39), F20@4.7Å(now 11.1,conf 0.37), L7@4.8Å(now 13.9,conf 0.36)
  - S71↔Y8: targets 4.3/4.5Å but partners are 13.0Å apart → too_far_apart by 4.1Å
  - S71↔L7: targets 4.3/4.8Å but partners are 11.6Å apart → too_far_apart by 2.5Å
  - V70↔L7: targets 4.1/4.8Å but partners are 11.3Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=59 · strand(E)=20 · 3-10(G)=7 · coil(C)=1

```
CHHHEHHHEHEHEHHHHHEHHHEEHHGHHHHHEHHEHEHHHHHEGHHHHHEHEHEHGEHHEHEGHGHGHHHHHHHGHEHHHHEHHHE
```

## Backbone H-bond Network

- total=88 · helix(i→i+4)=30 · sheet=58
  - E2 ↔ P6  (helix)
  - V3 ↔ L7  (helix)
  - E4 ↔ Y8  (helix)
  - Y8 ↔ V12  (helix)
  - V12 ↔ E16  (helix)
  - V14 ↔ A18  (helix)
  - E16 ↔ F20  (helix)
  - T17 ↔ E21  (helix)
  - E21 ↔ S25  (helix)
  - E26 ↔ H30  (helix)
  - D28 ↔ Q32  (helix)
  - H30 ↔ K34  (helix)
  - G31 ↔ L35  (helix)
  - L35 ↔ P39  (helix)
  - G37 ↔ T41  (helix)
  - P39 ↔ S43  (helix)
  - A42 ↔ C46  (helix)
  - C46 ↔ E50  (helix)
  - I48 ↔ G52  (helix)
  - G52 ↔ I56  (helix)
  - … +68 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=34 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1216 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=993 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.0848 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=107 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
