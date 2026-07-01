# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\5WOW\seeds\seed_2\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.453 A
- tm_score_ca_ordered: 0.18483744525719717
- heavy_atom_rmsd: 7.209 A
- sidechain_heavy_atom_rmsd: 7.589 A
- **all-atom quality (honest):** heavy 7.209 A, sidechain 7.589 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 175
- bin_accuracy: 0.389

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G29 → 12 conflicts (43%); C22 → 8 conflicts (29%)
- explained: 20/28 conflicts by 2 root cause(s)
- metrics: hubs=9 (frac 0.243), conflicts/hub=3.1, max_incompat=5.46Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G29 + C22 — explain ~20/28 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C22** — severity 11.60, 10 conflict(s); suspect input ~`D13` (group: push_out)
  - pull-in (wants closer): D13@4.1Å(now 7.4,conf 0.43), G29@4.5Å(now 8.3,conf 0.39), R12@5.4Å(now 9.2,conf 0.24)
  - push-out (wants farther): P17@8.4Å(now 5.6,conf 0.59)
  - D13↔G29: targets 4.1/4.5Å but partners are 14.1Å apart → too_far_apart by 5.5Å
  - N25↔D13: targets 8.5/4.1Å but partners are 17.3Å apart → too_far_apart by 4.7Å
  - N25↔R12: targets 8.5/5.4Å but partners are 19.3Å apart → too_far_apart by 5.4Å
- **Y30** — severity 5.81, 4 conflict(s); suspect input ~`R23` (group: pull_in)
  - pull-in (wants closer): C3@3.8Å(now 10.2,conf 0.58)
  - push-out (wants farther): Y27@8.9Å(now 6.1,conf 0.84), V34@11.6Å(now 8.9,conf 0.52), D36@13.4Å(now 8.5,conf 0.34), Y37@15.4Å(now 5.5,conf 0.26)
  - C3↔R23: targets 3.8/7.2Å but partners are 14.7Å apart → too_far_apart by 3.7Å
  - C3↔G24: targets 3.8/10.2Å but partners are 17.3Å apart → too_far_apart by 3.2Å
  - N25↔C3: targets 12.6/3.8Å but partners are 18.8Å apart → too_far_apart by 2.4Å
- **C20** — severity 2.66, 4 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): N25@11.8Å(now 15.1,conf 0.40), G29@4.9Å(now 8.3,conf 0.36)
  - S14↔G29: targets 9.0/4.9Å but partners are 16.3Å apart → too_far_apart by 2.4Å
  - D15↔G29: targets 7.1/4.9Å but partners are 13.9Å apart → too_far_apart by 1.9Å
  - D13↔G29: targets 7.6/4.9Å but partners are 14.1Å apart → too_far_apart by 1.6Å
- **I21** — severity 2.00, 3 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): G29@5.8Å(now 8.4,conf 0.22)
  - D13↔G29: targets 4.3/5.8Å but partners are 14.1Å apart → too_far_apart by 4.0Å
  - S14↔G29: targets 7.6/5.8Å but partners are 16.3Å apart → too_far_apart by 2.9Å
  - D15↔G29: targets 6.0/5.8Å but partners are 13.9Å apart → too_far_apart by 2.1Å
- **Y37** — severity 1.62, 2 conflict(s); suspect input ~`V34` (group: push_out)
  - push-out (wants farther): D33@11.1Å(now 7.8,conf 0.67), G1@20.9Å(now 10.0,conf 0.49), Y32@12.1Å(now 5.7,conf 0.40), Y30@15.4Å(now 5.5,conf 0.26)
  - G1↔V34: targets 20.9/5.7Å but partners are 11.0Å apart → too_close_together by 4.1Å
  - Y32↔V34: targets 12.1/5.7Å but partners are 3.4Å apart → too_close_together by 3.0Å
- **G29** — severity 1.52, 2 conflict(s); suspect input ~`R23` (group: push_out)
  - pull-in (wants closer): C22@4.5Å(now 8.3,conf 0.39), R23@4.8Å(now 8.4,conf 0.36), C20@4.9Å(now 8.3,conf 0.36), I21@5.8Å(now 8.4,conf 0.22)
  - push-out (wants farther): D36@14.0Å(now 10.7,conf 0.34)
  - G26↔R23: targets 8.8/4.8Å but partners are 1.5Å apart → too_close_together by 2.5Å
  - G24↔R23: targets 9.6/4.8Å but partners are 3.1Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=20 · 3-10(G)=2 · coil(C)=1

```
EHHHEEEEEHEHEHEHHGEHCEEEGEEHHEEEHEHHE
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=4 · sheet=70
  - C10 ↔ S14  (helix)
  - R12 ↔ C16  (helix)
  - C16 ↔ C20  (helix)
  - G29 ↔ D33  (helix)
  - G1 ↔ I6  (sheet)
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ R11  (sheet)
  - G1 ↔ D13  (sheet)
  - G1 ↔ D15  (sheet)
  - G1 ↔ A19  (sheet)
  - K5 ↔ A19  (sheet)
  - I6 ↔ R11  (sheet)
  - I6 ↔ D13  (sheet)
  - I6 ↔ D15  (sheet)
  - I6 ↔ A19  (sheet)
  - I6 ↔ C22  (sheet)
  - L7 ↔ D13  (sheet)
  - L7 ↔ D15  (sheet)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=160 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=86 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.6626 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
