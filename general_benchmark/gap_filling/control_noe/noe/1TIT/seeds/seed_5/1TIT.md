# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1TIT\seeds\seed_5\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 11.560 A
- tm_score_ca_ordered: 0.14161347051625564
- heavy_atom_rmsd: 12.283 A
- sidechain_heavy_atom_rmsd: 12.953 A
- **all-atom quality (honest):** heavy 12.283 A, sidechain 12.953 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 60
- distogram_pairs: 118
- bin_accuracy: 0.305

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V70-Q73 → 41 conflicts (43%); S79-A80 → 11 conflicts (12%); H55 → 6 conflicts (6%)
- explained: 58/95 conflicts by 3 root cause(s)
- metrics: hubs=28 (frac 0.322), conflicts/hub=3.4, max_incompat=14.46Å, chain_span=0.966
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V70-Q73 + S79-A80 + H55 — explain ~58/95 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K34** — severity 22.94, 9 conflict(s); suspect input ~`Q38` (group: pull_in)
  - pull-in (wants closer): S71@4.3Å(now 11.2,conf 0.41), F72@4.5Å(now 13.5,conf 0.39), V70@5.1Å(now 10.3,conf 0.27)
  - L40↔F72: targets 4.2/4.5Å but partners are 19.1Å apart → too_far_apart by 10.4Å
  - L40↔S71: targets 4.2/4.3Å but partners are 16.9Å apart → too_far_apart by 8.4Å
  - F72↔Q38: targets 4.5/4.8Å but partners are 18.6Å apart → too_far_apart by 9.3Å
- **V70** — severity 20.30, 9 conflict(s); suspect input ~`N82` (group: pull_in)
  - pull-in (wants closer): L35@4.0Å(now 11.8,conf 0.45), A81@4.1Å(now 7.3,conf 0.43), N82@4.2Å(now 8.6,conf 0.43), L7@4.5Å(now 7.5,conf 0.39), K34@5.1Å(now 10.3,conf 0.27), L83@5.2Å(now 8.0,conf 0.26)
  - L35↔N82: targets 4.0/4.2Å but partners are 19.9Å apart → too_far_apart by 11.8Å
  - L35↔A81: targets 4.0/4.1Å but partners are 17.7Å apart → too_far_apart by 9.5Å
  - L35↔L83: targets 4.0/5.2Å but partners are 18.8Å apart → too_far_apart by 9.6Å
- **W33** — severity 14.73, 11 conflict(s); suspect input ~`I48` (group: pull_in)
  - pull-in (wants closer): F72@3.8Å(now 8.6,conf 0.47), Q73@4.7Å(now 11.6,conf 0.38), I48@5.2Å(now 8.0,conf 0.26)
  - Q73↔I48: targets 4.7/5.2Å but partners are 18.3Å apart → too_far_apart by 8.4Å
  - Q73↔E21: targets 4.7/4.9Å but partners are 15.0Å apart → too_far_apart by 5.4Å
  - Q73↔L57: targets 4.7/5.2Å but partners are 16.9Å apart → too_far_apart by 7.1Å
- **F72** — severity 13.85, 7 conflict(s); suspect input ~`K34` (group: pull_in)
  - pull-in (wants closer): W33@3.8Å(now 8.6,conf 0.47), A80@4.3Å(now 7.0,conf 0.41), K34@4.5Å(now 13.5,conf 0.39), H55@5.8Å(now 10.4,conf 0.23)
  - S79↔K34: targets 4.3/4.5Å but partners are 18.9Å apart → too_far_apart by 10.1Å
  - A80↔K34: targets 4.3/4.5Å but partners are 18.0Å apart → too_far_apart by 9.2Å
  - W33↔S79: targets 3.8/4.3Å but partners are 13.8Å apart → too_far_apart by 5.6Å
- **E69** — severity 10.64, 2 conflict(s); suspect input ~`K36` (group: pull_in)
  - pull-in (wants closer): N82@3.8Å(now 11.6,conf 0.47), L83@4.4Å(now 10.7,conf 0.41), K36@4.5Å(now 13.7,conf 0.39)
  - N82↔K36: targets 3.8/4.5Å but partners are 22.8Å apart → too_far_apart by 14.5Å
  - L83↔K36: targets 4.4/4.5Å but partners are 21.4Å apart → too_far_apart by 12.6Å
- **H55** — severity 9.95, 7 conflict(s); suspect input ~`L24` (group: pull_in)
  - pull-in (wants closer): E50@4.0Å(now 6.6,conf 0.45), L24@4.8Å(now 9.0,conf 0.36), F72@5.8Å(now 10.4,conf 0.23)
  - E50↔L24: targets 4.0/4.8Å but partners are 15.0Å apart → too_far_apart by 6.2Å
  - E50↔F72: targets 4.0/5.8Å but partners are 16.9Å apart → too_far_apart by 7.2Å
  - E50↔I22: targets 4.0/4.3Å but partners are 11.9Å apart → too_far_apart by 3.6Å

## Secondary Structure (DSSP-like)

- helix(H)=47 · strand(E)=21 · 3-10(G)=15 · coil(C)=4

```
CEHGHEHEHEHGHHHGCGGHGGEEHEGHHHGHHEHEHHHEHHHHEEHCHEGHHEHHGGHEHEHHHGHHCGEEEHGHHHEHHHHHHHE
```

## Backbone H-bond Network

- total=72 · helix(i→i+4)=23 · sheet=49
  - V3 ↔ L7  (helix)
  - K5 ↔ G9  (helix)
  - L7 ↔ E11  (helix)
  - G9 ↔ F13  (helix)
  - E11 ↔ G15  (helix)
  - S25 ↔ V29  (helix)
  - D28 ↔ Q32  (helix)
  - V29 ↔ W33  (helix)
  - W33 ↔ G37  (helix)
  - L35 ↔ P39  (helix)
  - G37 ↔ T41  (helix)
  - Q38 ↔ A42  (helix)
  - P39 ↔ S43  (helix)
  - S43 ↔ E47  (helix)
  - I49 ↔ K53  (helix)
  - G52 ↔ I56  (helix)
  - H55 ↔ L59  (helix)
  - L59 ↔ Q63  (helix)
  - N61 ↔ G65  (helix)
  - L64 ↔ G68  (helix)
  - … +52 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=47 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=886 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=629 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.8951 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=60 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
