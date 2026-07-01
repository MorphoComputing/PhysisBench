# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1TIT\seeds\seed_4\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 10.888 A
- tm_score_ca_ordered: 0.1866032807905528
- heavy_atom_rmsd: 11.683 A
- sidechain_heavy_atom_rmsd: 12.441 A
- **all-atom quality (honest):** heavy 11.683 A, sidechain 12.441 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 79
- distogram_pairs: 118
- bin_accuracy: 0.305

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** H55-I58 → 36 conflicts (39%); W33-K34 → 22 conflicts (24%); V10 → 7 conflicts (8%)
- explained: 65/92 conflicts by 3 root cause(s)
- metrics: hubs=30 (frac 0.345), conflicts/hub=3.1, max_incompat=10.43Å, chain_span=0.943
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): H55-I58 + W33-K34 + V10 — explain ~65/92 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K34** — severity 21.26, 9 conflict(s); suspect input ~`G37` (group: pull_in)
  - pull-in (wants closer): L40@4.2Å(now 7.8,conf 0.43), S71@4.3Å(now 10.5,conf 0.41), F72@4.5Å(now 8.4,conf 0.39), G37@5.0Å(now 9.4,conf 0.27), V70@5.1Å(now 7.9,conf 0.27)
  - L40↔S71: targets 4.2/4.3Å but partners are 18.2Å apart → too_far_apart by 9.7Å
  - L40↔F72: targets 4.2/4.5Å but partners are 16.1Å apart → too_far_apart by 7.4Å
  - S71↔G37: targets 4.3/5.0Å but partners are 19.8Å apart → too_far_apart by 10.4Å
- **F20** — severity 12.53, 12 conflict(s); suspect input ~`A81` (group: pull_in)
  - pull-in (wants closer): L57@4.3Å(now 8.8,conf 0.41), I58@4.5Å(now 8.7,conf 0.39)
  - I58↔A81: targets 4.5/4.7Å but partners are 14.6Å apart → too_far_apart by 5.4Å
  - L57↔A81: targets 4.3/4.7Å but partners are 14.2Å apart → too_far_apart by 5.2Å
  - L57↔L7: targets 4.3/4.7Å but partners are 12.2Å apart → too_far_apart by 3.2Å
- **W33** — severity 9.90, 8 conflict(s); suspect input ~`H55` (group: pull_in)
  - pull-in (wants closer): F72@3.8Å(now 6.3,conf 0.47), Q73@4.7Å(now 8.2,conf 0.38)
  - Q73↔H55: targets 4.7/4.9Å but partners are 14.6Å apart → too_far_apart by 5.0Å
  - Q73↔I56: targets 4.7/5.2Å but partners are 15.7Å apart → too_far_apart by 5.8Å
  - F72↔H55: targets 3.8/4.9Å but partners are 12.3Å apart → too_far_apart by 3.6Å
- **V70** — severity 7.94, 6 conflict(s); suspect input ~`N82` (group: pull_in)
  - pull-in (wants closer): L35@4.0Å(now 10.1,conf 0.45), K34@5.1Å(now 7.9,conf 0.27)
  - L35↔N82: targets 4.0/4.2Å but partners are 13.9Å apart → too_far_apart by 5.7Å
  - L35↔A81: targets 4.0/4.1Å but partners are 13.0Å apart → too_far_apart by 4.9Å
  - L35↔L7: targets 4.0/4.5Å but partners are 11.7Å apart → too_far_apart by 3.1Å
- **F72** — severity 6.75, 5 conflict(s); suspect input ~`K34` (group: pull_in)
  - pull-in (wants closer): W33@3.8Å(now 6.3,conf 0.47), K34@4.5Å(now 8.4,conf 0.39), H55@5.8Å(now 12.3,conf 0.23)
  - A80↔K34: targets 4.3/4.5Å but partners are 13.2Å apart → too_far_apart by 4.4Å
  - A80↔H55: targets 4.3/5.8Å but partners are 17.3Å apart → too_far_apart by 7.2Å
  - W33↔A80: targets 3.8/4.3Å but partners are 11.4Å apart → too_far_apart by 3.2Å
- **E69** — severity 6.17, 2 conflict(s); suspect input ~`K36` (group: pull_in)
  - pull-in (wants closer): K36@4.5Å(now 12.8,conf 0.39)
  - N82↔K36: targets 3.8/4.5Å but partners are 17.2Å apart → too_far_apart by 8.9Å
  - L83↔K36: targets 4.4/4.5Å but partners are 15.6Å apart → too_far_apart by 6.8Å

## Secondary Structure (DSSP-like)

- helix(H)=56 · strand(E)=26 · 3-10(G)=4 · coil(C)=1

```
CEGEHEHEHHEHHHHHHEEHHHHHHHEHHHEHEHHEHHHHHHHHHHEHEEHEGEHHHGHEHEEHHHHHEEHHEEGHEEHHHHHHHHE
```

## Backbone H-bond Network

- total=103 · helix(i→i+4)=32 · sheet=71
  - K5 ↔ G9  (helix)
  - V10 ↔ V14  (helix)
  - V12 ↔ E16  (helix)
  - E16 ↔ F20  (helix)
  - F20 ↔ L24  (helix)
  - E21 ↔ S25  (helix)
  - I22 ↔ E26  (helix)
  - L24 ↔ D28  (helix)
  - S25 ↔ V29  (helix)
  - E26 ↔ H30  (helix)
  - D28 ↔ Q32  (helix)
  - H30 ↔ K34  (helix)
  - K34 ↔ Q38  (helix)
  - G37 ↔ T41  (helix)
  - Q38 ↔ A42  (helix)
  - P39 ↔ S43  (helix)
  - L40 ↔ P44  (helix)
  - A42 ↔ C46  (helix)
  - P44 ↔ I48  (helix)
  - D51 ↔ H55  (helix)
  - … +83 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=36 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1027 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=758 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.5353 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=79 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
