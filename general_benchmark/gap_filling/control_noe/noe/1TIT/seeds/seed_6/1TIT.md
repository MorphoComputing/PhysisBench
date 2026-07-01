# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1TIT\seeds\seed_6\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 11.413 A
- tm_score_ca_ordered: 0.14703762707501547
- heavy_atom_rmsd: 12.235 A
- sidechain_heavy_atom_rmsd: 12.903 A
- **all-atom quality (honest):** heavy 12.235 A, sidechain 12.903 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 118
- distogram_pairs: 118
- bin_accuracy: 0.229

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F20-I22 → 27 conflicts (34%); W33 → 14 conflicts (18%); V70-F72 → 7 conflicts (9%)
- explained: 48/80 conflicts by 3 root cause(s)
- metrics: hubs=26 (frac 0.299), conflicts/hub=3.1, max_incompat=8.91Å, chain_span=0.966
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F20-I22 + W33 + V70-F72 — explain ~48/80 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L7** — severity 16.23, 13 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): E21@4.8Å(now 10.7,conf 0.36), I22@5.0Å(now 8.7,conf 0.27), W33@5.2Å(now 8.9,conf 0.26)
  - A80↔E21: targets 4.7/4.8Å but partners are 16.9Å apart → too_far_apart by 7.3Å
  - S79↔E21: targets 4.7/4.8Å but partners are 15.8Å apart → too_far_apart by 6.3Å
  - V70↔E21: targets 4.5/4.8Å but partners are 14.0Å apart → too_far_apart by 4.7Å
- **F72** — severity 12.12, 7 conflict(s); suspect input ~`L24` (group: pull_in)
  - pull-in (wants closer): W33@3.8Å(now 8.8,conf 0.47), A80@4.3Å(now 10.5,conf 0.41), K34@4.5Å(now 9.3,conf 0.39), L24@5.1Å(now 9.9,conf 0.27)
  - W33↔A80: targets 3.8/4.3Å but partners are 14.2Å apart → too_far_apart by 6.1Å
  - W33↔S79: targets 3.8/4.3Å but partners are 13.8Å apart → too_far_apart by 5.6Å
  - A80↔L24: targets 4.3/5.1Å but partners are 16.7Å apart → too_far_apart by 7.3Å
- **V10** — severity 8.93, 6 conflict(s); suspect input ~`H19` (group: pull_in)
  - pull-in (wants closer): L83@4.3Å(now 9.9,conf 0.41), N82@4.3Å(now 9.3,conf 0.41), K84@4.3Å(now 7.4,conf 0.41), H19@5.1Å(now 10.2,conf 0.27), F20@5.5Å(now 8.9,conf 0.24)
  - L83↔H19: targets 4.3/5.1Å but partners are 17.7Å apart → too_far_apart by 8.3Å
  - N82↔H19: targets 4.3/5.1Å but partners are 17.0Å apart → too_far_apart by 7.6Å
  - K84↔H19: targets 4.3/5.1Å but partners are 16.6Å apart → too_far_apart by 7.2Å
- **L83** — severity 8.10, 4 conflict(s); suspect input ~`F20` (group: pull_in)
  - pull-in (wants closer): V10@4.3Å(now 9.9,conf 0.41), G68@4.3Å(now 7.4,conf 0.41), F20@5.4Å(now 13.9,conf 0.24)
  - V10↔G68: targets 4.3/4.3Å but partners are 16.8Å apart → too_far_apart by 8.1Å
  - G68↔F20: targets 4.3/5.4Å but partners are 18.6Å apart → too_far_apart by 8.9Å
  - V10↔E69: targets 4.3/4.4Å but partners are 11.9Å apart → too_far_apart by 3.2Å
- **Q73** — severity 6.64, 4 conflict(s); suspect input ~`W33` (group: pull_in)
  - pull-in (wants closer): K78@4.0Å(now 6.7,conf 0.45), Q32@4.2Å(now 7.7,conf 0.43), W33@4.7Å(now 10.2,conf 0.38)
  - K78↔W33: targets 4.0/4.7Å but partners are 13.6Å apart → too_far_apart by 5.0Å
  - S79↔W33: targets 4.5/4.7Å but partners are 13.8Å apart → too_far_apart by 4.6Å
  - K78↔Q32: targets 4.0/4.2Å but partners are 12.1Å apart → too_far_apart by 3.9Å
- **W33** — severity 6.10, 6 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): F72@3.8Å(now 8.8,conf 0.47), Q73@4.7Å(now 10.2,conf 0.38), E21@4.9Å(now 7.9,conf 0.35), H55@4.9Å(now 8.8,conf 0.35), V70@5.1Å(now 9.4,conf 0.27), L7@5.2Å(now 8.9,conf 0.26), I48@5.2Å(now 7.9,conf 0.26), I56@5.2Å(now 10.9,conf 0.26), L57@5.2Å(now 10.6,conf 0.26)
  - Q73↔E21: targets 4.7/4.9Å but partners are 14.5Å apart → too_far_apart by 5.0Å
  - E21↔V70: targets 4.9/5.1Å but partners are 14.0Å apart → too_far_apart by 4.1Å
  - Q73↔I48: targets 4.7/5.2Å but partners are 13.9Å apart → too_far_apart by 4.1Å

## Secondary Structure (DSSP-like)

- helix(H)=60 · strand(E)=17 · 3-10(G)=9 · coil(C)=1

```
CEHHGEHHHHEGHHEHEEHHGHEHGEHHHHHHEHHHHHHHHHHHHHHHHGHHHHGGHHHEHHEEHHHHEGHHHHHEHEEGHHHHHHE
```

## Backbone H-bond Network

- total=76 · helix(i→i+4)=32 · sheet=44
  - V3 ↔ L7  (helix)
  - E4 ↔ Y8  (helix)
  - V10 ↔ V14  (helix)
  - E16 ↔ F20  (helix)
  - F20 ↔ L24  (helix)
  - L24 ↔ D28  (helix)
  - P27 ↔ G31  (helix)
  - D28 ↔ Q32  (helix)
  - H30 ↔ K34  (helix)
  - G31 ↔ L35  (helix)
  - K34 ↔ Q38  (helix)
  - L35 ↔ P39  (helix)
  - G37 ↔ T41  (helix)
  - Q38 ↔ A42  (helix)
  - P39 ↔ S43  (helix)
  - L40 ↔ P44  (helix)
  - T41 ↔ D45  (helix)
  - S43 ↔ E47  (helix)
  - P44 ↔ I48  (helix)
  - E47 ↔ D51  (helix)
  - … +56 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=42 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1203 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=955 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.9554 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=118 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
