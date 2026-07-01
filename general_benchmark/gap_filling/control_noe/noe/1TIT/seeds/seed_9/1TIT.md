# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1TIT\seeds\seed_9\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 10.369 A
- tm_score_ca_ordered: 0.17202971511675702
- heavy_atom_rmsd: 11.333 A
- sidechain_heavy_atom_rmsd: 12.317 A
- **all-atom quality (honest):** heavy 11.333 A, sidechain 12.317 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 90
- distogram_pairs: 118
- bin_accuracy: 0.398

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** H55-L59 → 19 conflicts (45%); G31-K34 → 14 conflicts (33%); C46 → 3 conflicts (7%)
- explained: 36/42 conflicts by 3 root cause(s)
- metrics: hubs=18 (frac 0.207), conflicts/hub=2.3, max_incompat=6.83Å, chain_span=0.644
- **fix-first:** [LOW_CONFLICT] Root cause(s): H55-L59 + G31-K34 + C46 — explain ~36/42 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F20** — severity 8.74, 8 conflict(s); suspect input ~`A81` (group: pull_in)
  - pull-in (wants closer): I58@4.5Å(now 7.5,conf 0.39), L7@4.7Å(now 7.2,conf 0.37), A81@4.7Å(now 8.2,conf 0.37)
  - I58↔A81: targets 4.5/4.7Å but partners are 14.0Å apart → too_far_apart by 4.9Å
  - I58↔L7: targets 4.5/4.7Å but partners are 14.0Å apart → too_far_apart by 4.8Å
  - I58↔Y8: targets 4.5/5.0Å but partners are 14.5Å apart → too_far_apart by 5.0Å
- **K34** — severity 7.18, 5 conflict(s); suspect input ~`S71` (group: pull_in)
  - pull-in (wants closer): L40@4.2Å(now 7.6,conf 0.43), S71@4.3Å(now 10.5,conf 0.41), F72@4.5Å(now 7.2,conf 0.39), V70@5.1Å(now 8.5,conf 0.27)
  - L40↔S71: targets 4.2/4.3Å but partners are 15.4Å apart → too_far_apart by 6.8Å
  - S71↔Q38: targets 4.3/4.8Å but partners are 13.1Å apart → too_far_apart by 3.9Å
  - L40↔F72: targets 4.2/4.5Å but partners are 11.8Å apart → too_far_apart by 3.2Å
- **E23** — severity 3.65, 2 conflict(s); suspect input ~`K5` (group: pull_in)
  - pull-in (wants closer): K5@4.3Å(now 10.1,conf 0.41)
  - K54↔K5: targets 4.0/4.3Å but partners are 13.9Å apart → too_far_apart by 5.6Å
  - K5↔H55: targets 4.3/4.7Å but partners are 12.7Å apart → too_far_apart by 3.6Å
- **Q73** — severity 3.36, 3 conflict(s); suspect input ~`S79` (group: pull_in)
  - pull-in (wants closer): Q32@4.2Å(now 10.0,conf 0.43), W33@4.7Å(now 9.6,conf 0.38)
  - Q32↔S79: targets 4.2/4.5Å but partners are 12.1Å apart → too_far_apart by 3.5Å
  - K78↔Q32: targets 4.0/4.2Å but partners are 11.1Å apart → too_far_apart by 2.9Å
  - K78↔W33: targets 4.0/4.7Å but partners are 10.7Å apart → too_far_apart by 2.0Å
- **F72** — severity 3.18, 4 conflict(s); suspect input ~`G31` (group: pull_in)
  - pull-in (wants closer): W33@3.8Å(now 8.5,conf 0.47), K34@4.5Å(now 7.2,conf 0.39), G31@5.1Å(now 9.4,conf 0.27), H55@5.8Å(now 8.5,conf 0.23)
  - W33↔S79: targets 3.8/4.3Å but partners are 10.6Å apart → too_far_apart by 2.5Å
  - W33↔A80: targets 3.8/4.3Å but partners are 10.1Å apart → too_far_apart by 2.0Å
  - S79↔G31: targets 4.3/5.1Å but partners are 12.0Å apart → too_far_apart by 2.6Å
- **A74** — severity 2.94, 3 conflict(s); suspect input ~`K78` (group: pull_in)
  - pull-in (wants closer): G31@3.9Å(now 10.9,conf 0.47), Q32@4.7Å(now 8.8,conf 0.38)
  - G31↔K78: targets 3.9/4.5Å but partners are 11.9Å apart → too_far_apart by 3.5Å
  - G31↔A77: targets 3.9/4.7Å but partners are 10.9Å apart → too_far_apart by 2.3Å
  - K78↔Q32: targets 4.5/4.7Å but partners are 11.1Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=64 · strand(E)=14 · 3-10(G)=8 · coil(C)=1

```
CEHHHEHEHHHHHHHHEGEHEHHHHHEGHGHHHHHHHHGHHHHHHHHHHGGHHEGHHHHEHHHHHHHHHHHHEGHHEEHHHEHHHHE
```

## Backbone H-bond Network

- total=62 · helix(i→i+4)=40 · sheet=22
  - V3 ↔ L7  (helix)
  - K5 ↔ G9  (helix)
  - L7 ↔ E11  (helix)
  - G9 ↔ F13  (helix)
  - V10 ↔ V14  (helix)
  - E11 ↔ G15  (helix)
  - V12 ↔ E16  (helix)
  - E16 ↔ F20  (helix)
  - F20 ↔ L24  (helix)
  - I22 ↔ E26  (helix)
  - S25 ↔ V29  (helix)
  - V29 ↔ W33  (helix)
  - Q32 ↔ K36  (helix)
  - W33 ↔ G37  (helix)
  - K34 ↔ Q38  (helix)
  - K36 ↔ L40  (helix)
  - G37 ↔ T41  (helix)
  - Q38 ↔ A42  (helix)
  - L40 ↔ P44  (helix)
  - T41 ↔ D45  (helix)
  - … +42 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=27 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1237 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=950 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0084 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=90 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
