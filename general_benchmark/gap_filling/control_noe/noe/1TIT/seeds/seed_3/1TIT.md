# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1TIT\seeds\seed_3\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 12.081 A
- tm_score_ca_ordered: 0.133428125182065
- heavy_atom_rmsd: 12.955 A
- sidechain_heavy_atom_rmsd: 13.846 A
- **all-atom quality (honest):** heavy 12.955 A, sidechain 13.846 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 96
- distogram_pairs: 118
- bin_accuracy: 0.229

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** W33-K34 → 42 conflicts (44%); V70-Q73 → 16 conflicts (17%); H55 → 8 conflicts (8%)
- explained: 66/96 conflicts by 3 root cause(s)
- metrics: hubs=29 (frac 0.333), conflicts/hub=3.3, max_incompat=10.52Å, chain_span=0.966
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): W33-K34 + V70-Q73 + H55 — explain ~66/96 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K34** — severity 20.44, 9 conflict(s); suspect input ~`Q38` (group: pull_in)
  - pull-in (wants closer): S71@4.3Å(now 14.3,conf 0.41), F72@4.5Å(now 10.9,conf 0.39), V70@5.1Å(now 10.3,conf 0.27)
  - L40↔S71: targets 4.2/4.3Å but partners are 19.1Å apart → too_far_apart by 10.5Å
  - S71↔Q38: targets 4.3/4.8Å but partners are 18.4Å apart → too_far_apart by 9.3Å
  - L40↔F72: targets 4.2/4.5Å but partners are 15.9Å apart → too_far_apart by 7.2Å
- **W33** — severity 11.20, 10 conflict(s); suspect input ~`I48` (group: pull_in)
  - pull-in (wants closer): F72@3.8Å(now 8.1,conf 0.47), Q73@4.7Å(now 8.6,conf 0.38), E21@4.9Å(now 9.4,conf 0.35), H55@4.9Å(now 10.8,conf 0.35), L7@5.2Å(now 9.6,conf 0.26), I48@5.2Å(now 11.9,conf 0.26), I56@5.2Å(now 11.6,conf 0.26), L57@5.2Å(now 8.1,conf 0.26)
  - Q73↔I48: targets 4.7/5.2Å but partners are 17.4Å apart → too_far_apart by 7.5Å
  - Q73↔E21: targets 4.7/4.9Å but partners are 14.9Å apart → too_far_apart by 5.4Å
  - Q73↔H55: targets 4.7/4.9Å but partners are 14.2Å apart → too_far_apart by 4.7Å
- **V70** — severity 10.94, 8 conflict(s); suspect input ~`N82` (group: pull_in)
  - pull-in (wants closer): L35@4.0Å(now 9.8,conf 0.45), N82@4.2Å(now 7.4,conf 0.43), K34@5.1Å(now 10.3,conf 0.27)
  - L35↔N82: targets 4.0/4.2Å but partners are 16.9Å apart → too_far_apart by 8.7Å
  - L35↔A81: targets 4.0/4.1Å but partners are 12.4Å apart → too_far_apart by 4.3Å
  - N82↔K34: targets 4.2/5.1Å but partners are 16.1Å apart → too_far_apart by 6.8Å
- **H55** — severity 10.19, 10 conflict(s); suspect input ~`W33` (group: pull_in)
  - pull-in (wants closer): E23@4.7Å(now 9.2,conf 0.37), L24@4.8Å(now 8.2,conf 0.36), G31@4.9Å(now 7.8,conf 0.35), W33@4.9Å(now 10.8,conf 0.35), F72@5.8Å(now 10.7,conf 0.23)
  - E50↔W33: targets 4.0/4.9Å but partners are 14.2Å apart → too_far_apart by 5.3Å
  - D51↔W33: targets 4.7/4.9Å but partners are 14.1Å apart → too_far_apart by 4.5Å
  - E50↔E23: targets 4.0/4.7Å but partners are 12.3Å apart → too_far_apart by 3.7Å
- **L7** — severity 9.69, 9 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): S79@4.7Å(now 9.3,conf 0.38), A80@4.7Å(now 8.2,conf 0.37), E21@4.8Å(now 7.5,conf 0.36), I22@5.0Å(now 8.5,conf 0.27), W33@5.2Å(now 9.6,conf 0.26)
  - S79↔E21: targets 4.7/4.8Å but partners are 14.3Å apart → too_far_apart by 4.8Å
  - A80↔E21: targets 4.7/4.8Å but partners are 14.2Å apart → too_far_apart by 4.7Å
  - E21↔S71: targets 4.8/4.9Å but partners are 14.0Å apart → too_far_apart by 4.3Å
- **F72** — severity 9.69, 8 conflict(s); suspect input ~`K34` (group: pull_in)
  - pull-in (wants closer): W33@3.8Å(now 8.1,conf 0.47), S79@4.3Å(now 7.2,conf 0.41), K34@4.5Å(now 10.9,conf 0.39), L24@5.1Å(now 11.2,conf 0.27), G31@5.1Å(now 8.1,conf 0.27), I22@5.6Å(now 9.9,conf 0.23), H55@5.8Å(now 10.7,conf 0.23)
  - W33↔A80: targets 3.8/4.3Å but partners are 12.7Å apart → too_far_apart by 4.6Å
  - A80↔K34: targets 4.3/4.5Å but partners are 13.4Å apart → too_far_apart by 4.6Å
  - W33↔S79: targets 3.8/4.3Å but partners are 12.1Å apart → too_far_apart by 3.9Å

## Secondary Structure (DSSP-like)

- helix(H)=59 · strand(E)=19 · 3-10(G)=8 · coil(C)=1

```
CEHHHEHEHHGHHHHHEHEHHHHHEHHHHEHHGHHEHHHEGGGHEGHHHEHHHHHHHHEEGHEEHHHHEHHHHHEHHHHGHHHHHEE
```

## Backbone H-bond Network

- total=82 · helix(i→i+4)=37 · sheet=45
  - V3 ↔ L7  (helix)
  - K5 ↔ G9  (helix)
  - G9 ↔ F13  (helix)
  - V10 ↔ V14  (helix)
  - V12 ↔ E16  (helix)
  - V14 ↔ A18  (helix)
  - E16 ↔ F20  (helix)
  - A18 ↔ I22  (helix)
  - F20 ↔ L24  (helix)
  - I22 ↔ E26  (helix)
  - E23 ↔ P27  (helix)
  - L24 ↔ D28  (helix)
  - P27 ↔ G31  (helix)
  - D28 ↔ Q32  (helix)
  - G31 ↔ L35  (helix)
  - K34 ↔ Q38  (helix)
  - L35 ↔ P39  (helix)
  - P44 ↔ I48  (helix)
  - E47 ↔ D51  (helix)
  - I48 ↔ G52  (helix)
  - … +62 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=31 · exposed=27 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1206 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=925 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.1993 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=96 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
