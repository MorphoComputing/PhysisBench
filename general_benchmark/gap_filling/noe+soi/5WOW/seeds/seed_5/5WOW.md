# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\5WOW\seeds\seed_5\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 8.800 A
- tm_score_ca_ordered: 0.0732114695849289
- heavy_atom_rmsd: 9.343 A
- sidechain_heavy_atom_rmsd: 9.681 A
- **all-atom quality (honest):** heavy 9.343 A, sidechain 9.681 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 17
- distogram_pairs: 176
- bin_accuracy: 0.455

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R12-D13 → 12 conflicts (41%); V34 → 8 conflicts (28%); Y27-C28 → 4 conflicts (14%)
- explained: 24/29 conflicts by 3 root cause(s)
- metrics: hubs=10 (frac 0.27), conflicts/hub=2.9, max_incompat=8.29Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R12-D13 + V34 + Y27-C28 — explain ~24/29 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C22** — severity 6.03, 8 conflict(s); suspect input ~`R12` (group: pull_in)
  - pull-in (wants closer): D13@4.1Å(now 9.0,conf 0.43), R12@5.4Å(now 10.4,conf 0.24)
  - C28↔D13: targets 3.1/4.1Å but partners are 9.9Å apart → too_far_apart by 2.7Å
  - C28↔R12: targets 3.1/5.4Å but partners are 12.3Å apart → too_far_apart by 3.9Å
  - N25↔D13: targets 8.8/4.1Å but partners are 15.2Å apart → too_far_apart by 2.2Å
- **C28** — severity 4.91, 4 conflict(s); suspect input ~`P35` (group: push_out)
  - push-out (wants farther): N25@9.0Å(now 6.3,conf 0.99), Y32@12.7Å(now 8.8,conf 0.82), P35@18.9Å(now 13.5,conf 0.49)
  - I21↔P35: targets 5.5/18.9Å but partners are 10.0Å apart → too_close_together by 3.4Å
  - Y32↔I21: targets 12.7/5.5Å but partners are 5.3Å apart → too_close_together by 1.9Å
  - C22↔P35: targets 3.1/18.9Å but partners are 13.2Å apart → too_close_together by 2.6Å
- **Y27** — severity 3.48, 3 conflict(s); suspect input ~`C10` (group: push_out)
  - push-out (wants farther): V34@17.7Å(now 14.0,conf 0.67)
  - V34↔C10: targets 17.7/4.2Å but partners are 10.4Å apart → too_close_together by 3.1Å
  - V34↔R9: targets 17.7/4.1Å but partners are 11.0Å apart → too_close_together by 2.5Å
  - C20↔V34: targets 8.6/17.7Å but partners are 7.4Å apart → too_close_together by 1.6Å
- **C16** — severity 3.02, 2 conflict(s); suspect input ~`D13` (group: pull_in)
  - pull-in (wants closer): R23@7.1Å(now 10.0,conf 0.67)
  - push-out (wants farther): R9@8.0Å(now 3.6,conf 0.59), C10@7.5Å(now 3.3,conf 0.58), R11@6.8Å(now 3.4,conf 0.52), I21@7.0Å(now 3.5,conf 0.40)
  - R23↔D13: targets 7.1/3.8Å but partners are 13.7Å apart → too_far_apart by 2.8Å
  - R12↔R23: targets 6.2/7.1Å but partners are 15.4Å apart → too_far_apart by 2.1Å
- **G29** — severity 2.90, 3 conflict(s); suspect input ~`C20` (group: pull_in)
  - pull-in (wants closer): R23@4.8Å(now 7.6,conf 0.36)
  - push-out (wants farther): Y32@11.0Å(now 7.2,conf 0.99), P35@17.8Å(now 14.7,conf 0.67)
  - P35↔C20: targets 17.8/4.9Å but partners are 7.7Å apart → too_close_together by 5.2Å
  - Y32↔C20: targets 11.0/4.9Å but partners are 4.3Å apart → too_close_together by 1.8Å
  - P35↔I21: targets 17.8/5.8Å but partners are 10.0Å apart → too_close_together by 1.9Å
- **Y37** — severity 2.29, 4 conflict(s); suspect input ~`V34` (group: push_out)
  - push-out (wants farther): Y32@16.1Å(now 10.8,conf 0.66), D33@13.4Å(now 8.8,conf 0.59), G1@21.3Å(now 14.8,conf 0.49), P31@18.4Å(now 11.4,conf 0.49), Y30@18.7Å(now 13.0,conf 0.34)
  - G1↔V34: targets 21.3/5.7Å but partners are 11.8Å apart → too_close_together by 3.8Å
  - D33↔V34: targets 13.4/5.7Å but partners are 4.5Å apart → too_close_together by 3.1Å
  - Y32↔V34: targets 16.1/5.7Å but partners are 8.8Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=19 · 3-10(G)=3 · coil(C)=2

```
EHEHEHEEEEECGHGEEHHEEEECHHHHHGHEEEEHE
```

## Backbone H-bond Network

- total=83 · helix(i→i+4)=4 · sheet=79
  - V2 ↔ I6  (helix)
  - S14 ↔ G18  (helix)
  - N25 ↔ G29  (helix)
  - Y27 ↔ P31  (helix)
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R11  (sheet)
  - G1 ↔ C16  (sheet)
  - G1 ↔ P17  (sheet)
  - G1 ↔ C20  (sheet)
  - G1 ↔ I21  (sheet)
  - C3 ↔ Q8  (sheet)
  - C3 ↔ R9  (sheet)
  - C3 ↔ C10  (sheet)
  - C3 ↔ R11  (sheet)
  - C3 ↔ C16  (sheet)
  - C3 ↔ P17  (sheet)
  - C3 ↔ C20  (sheet)
  - C3 ↔ I21  (sheet)
  - C3 ↔ C22  (sheet)
  - … +63 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=224 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=153 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.5568 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=17 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
