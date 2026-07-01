# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1TIT\seeds\seed_8\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 12.677 A
- tm_score_ca_ordered: 0.1488365522519904
- heavy_atom_rmsd: 13.455 A
- sidechain_heavy_atom_rmsd: 14.136 A
- **all-atom quality (honest):** heavy 13.455 A, sidechain 14.136 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 81
- distogram_pairs: 118
- bin_accuracy: 0.169

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V70-Q73 → 44 conflicts (43%); F20-I22 → 25 conflicts (24%); H55-L57 → 9 conflicts (9%)
- explained: 78/103 conflicts by 3 root cause(s)
- metrics: hubs=27 (frac 0.31), conflicts/hub=3.8, max_incompat=12.01Å, chain_span=0.966
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V70-Q73 + F20-I22 + H55-L57 — explain ~78/103 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K34** — severity 21.83, 9 conflict(s); suspect input ~`Q38` (group: pull_in)
  - pull-in (wants closer): L40@4.2Å(now 7.3,conf 0.43), S71@4.3Å(now 13.9,conf 0.41), F72@4.5Å(now 8.8,conf 0.39), V70@5.1Å(now 8.0,conf 0.27)
  - L40↔S71: targets 4.2/4.3Å but partners are 20.0Å apart → too_far_apart by 11.5Å
  - S71↔Q38: targets 4.3/4.8Å but partners are 19.6Å apart → too_far_apart by 10.4Å
  - S71↔G37: targets 4.3/5.0Å but partners are 20.0Å apart → too_far_apart by 10.7Å
- **H55** — severity 19.33, 10 conflict(s); suspect input ~`E23` (group: pull_in)
  - pull-in (wants closer): I22@4.3Å(now 9.6,conf 0.41), E23@4.7Å(now 12.0,conf 0.37), L24@4.8Å(now 9.3,conf 0.36), G31@4.9Å(now 9.1,conf 0.35)
  - D51↔E23: targets 4.7/4.7Å but partners are 17.2Å apart → too_far_apart by 7.9Å
  - I22↔D51: targets 4.3/4.7Å but partners are 15.8Å apart → too_far_apart by 6.9Å
  - D51↔L24: targets 4.7/4.8Å but partners are 15.8Å apart → too_far_apart by 6.3Å
- **L7** — severity 15.82, 10 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): A80@4.7Å(now 10.4,conf 0.37), E21@4.8Å(now 8.4,conf 0.36), S71@4.9Å(now 8.4,conf 0.35), I22@5.0Å(now 8.2,conf 0.27)
  - A80↔E21: targets 4.7/4.8Å but partners are 18.2Å apart → too_far_apart by 8.7Å
  - E21↔S71: targets 4.8/4.9Å but partners are 16.7Å apart → too_far_apart by 7.0Å
  - A80↔I22: targets 4.7/5.0Å but partners are 16.8Å apart → too_far_apart by 7.1Å
- **W33** — severity 13.64, 13 conflict(s); suspect input ~`I22` (group: pull_in)
  - pull-in (wants closer): Q73@4.7Å(now 10.4,conf 0.38), E21@4.9Å(now 9.3,conf 0.35), I22@5.2Å(now 8.4,conf 0.26), I48@5.2Å(now 10.4,conf 0.26), L57@5.2Å(now 8.9,conf 0.26)
  - Q73↔E21: targets 4.7/4.9Å but partners are 17.0Å apart → too_far_apart by 7.5Å
  - I22↔I48: targets 5.2/5.2Å but partners are 16.9Å apart → too_far_apart by 6.5Å
  - E21↔I48: targets 4.9/5.2Å but partners are 15.7Å apart → too_far_apart by 5.5Å
- **V70** — severity 11.31, 9 conflict(s); suspect input ~`N82` (group: pull_in)
  - pull-in (wants closer): L35@4.0Å(now 8.4,conf 0.45), N82@4.2Å(now 8.3,conf 0.43), K34@5.1Å(now 8.0,conf 0.27)
  - L35↔N82: targets 4.0/4.2Å but partners are 16.5Å apart → too_far_apart by 8.3Å
  - N82↔K34: targets 4.2/5.1Å but partners are 16.2Å apart → too_far_apart by 6.9Å
  - L35↔A81: targets 4.0/4.1Å but partners are 12.3Å apart → too_far_apart by 4.1Å
- **F72** — severity 10.07, 8 conflict(s); suspect input ~`K34` (group: pull_in)
  - pull-in (wants closer): A80@4.3Å(now 6.8,conf 0.41), K34@4.5Å(now 8.8,conf 0.39), L24@5.1Å(now 8.3,conf 0.27), I22@5.6Å(now 10.0,conf 0.23)
  - A80↔K34: targets 4.3/4.5Å but partners are 14.7Å apart → too_far_apart by 5.9Å
  - A80↔I22: targets 4.3/5.6Å but partners are 16.8Å apart → too_far_apart by 6.9Å
  - A80↔L24: targets 4.3/5.1Å but partners are 14.9Å apart → too_far_apart by 5.5Å

## Secondary Structure (DSSP-like)

- helix(H)=63 · strand(E)=17 · 3-10(G)=6 · coil(C)=1

```
CEEEHEHGHHHHHHEHHHHHHHHHHHHHHHEHEEHEHHHHHHGHHGHHHGHHHEHGHHHEGHHHHHHHEHHHEEHHEEHHHHHHHHE
```

## Backbone H-bond Network

- total=65 · helix(i→i+4)=39 · sheet=26
  - K5 ↔ G9  (helix)
  - V10 ↔ V14  (helix)
  - V12 ↔ E16  (helix)
  - V14 ↔ A18  (helix)
  - E16 ↔ F20  (helix)
  - T17 ↔ E21  (helix)
  - A18 ↔ I22  (helix)
  - H19 ↔ E23  (helix)
  - F20 ↔ L24  (helix)
  - E21 ↔ S25  (helix)
  - I22 ↔ E26  (helix)
  - E23 ↔ P27  (helix)
  - L24 ↔ D28  (helix)
  - S25 ↔ V29  (helix)
  - D28 ↔ Q32  (helix)
  - L35 ↔ P39  (helix)
  - G37 ↔ T41  (helix)
  - Q38 ↔ A42  (helix)
  - P44 ↔ I48  (helix)
  - I48 ↔ G52  (helix)
  - … +45 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=38 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1018 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=749 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.8981 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=81 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
