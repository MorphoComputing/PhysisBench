# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked\1JRJ\seeds\seed_4\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.861 A
- tm_score_ca_ordered: 0.13385307450255546
- heavy_atom_rmsd: 7.787 A
- sidechain_heavy_atom_rmsd: 8.684 A
- **all-atom quality (honest):** heavy 7.787 A, sidechain 8.684 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 126
- bin_accuracy: 0.222

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E2-T4 → 104 conflicts (57%); E14-A17 → 35 conflicts (19%)
- explained: 139/182 conflicts by 2 root cause(s)
- metrics: hubs=28 (frac 0.757), conflicts/hub=6.5, max_incompat=15.89Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E2-T4 + E14-A17 — explain ~139/182 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E2** — severity 120.96, 31 conflict(s); suspect input ~`T6` (group: pull_in)
  - pull-in (wants closer): S10@17.1Å(now 19.9,conf 0.62), T6@11.3Å(now 15.4,conf 0.62), S7@12.5Å(now 16.5,conf 0.62)
  - push-out (wants farther): W24@37.5Å(now 32.7,conf 0.97), G33@47.3Å(now 38.6,conf 0.93), S32@47.0Å(now 33.3,conf 0.89), P35@41.8Å(now 36.4,conf 0.87), G28@43.8Å(now 37.7,conf 0.81), E14@23.2Å(now 17.0,conf 0.79)
  - S32↔T6: targets 47.0/11.3Å but partners are 19.8Å apart → too_close_together by 15.9Å
  - S32↔S7: targets 47.0/12.5Å but partners are 20.3Å apart → too_close_together by 14.3Å
  - S32↔D8: targets 47.0/14.2Å but partners are 19.8Å apart → too_close_together by 13.1Å
- **W24** — severity 44.38, 18 conflict(s); suspect input ~`E16` (group: push_out)
  - push-out (wants farther): T4@32.5Å(now 29.6,conf 0.98), E2@37.5Å(now 32.7,conf 0.97), S7@27.4Å(now 23.1,conf 0.94), F5@27.8Å(now 24.2,conf 0.91), G3@33.3Å(now 28.1,conf 0.85), D8@24.3Å(now 21.1,conf 0.76), S31@10.2Å(now 7.4,conf 0.62)
  - G3↔E16: targets 33.3/12.7Å but partners are 14.5Å apart → too_close_together by 6.2Å
  - E2↔E16: targets 37.5/12.7Å but partners are 19.1Å apart → too_close_together by 5.8Å
  - G3↔F21: targets 33.3/5.1Å but partners are 23.2Å apart → too_close_together by 5.1Å
- **T4** — severity 41.86, 13 conflict(s); suspect input ~`E16` (group: push_out)
  - push-out (wants farther): W24@32.5Å(now 29.6,conf 0.98), N27@37.4Å(now 29.7,conf 0.96), F21@27.5Å(now 24.9,conf 0.96), P30@37.6Å(now 25.4,conf 0.95), P37@27.8Å(now 23.7,conf 0.92), L20@26.4Å(now 21.5,conf 0.80), E16@19.4Å(now 16.5,conf 0.64), E14@17.5Å(now 11.6,conf 0.62)
  - P30↔P37: targets 37.6/27.8Å but partners are 3.4Å apart → too_close_together by 6.5Å
  - F21↔P30: targets 27.5/37.6Å but partners are 4.9Å apart → too_close_together by 5.3Å
  - P30↔E16: targets 37.6/19.4Å but partners are 10.9Å apart → too_close_together by 7.3Å
- **P35** — severity 34.17, 13 conflict(s); suspect input ~`A17` (group: push_out)
  - push-out (wants farther): G3@37.5Å(now 31.2,conf 0.98), E2@41.8Å(now 36.4,conf 0.87), L9@26.4Å(now 23.0,conf 0.79)
  - G3↔A17: targets 37.5/13.9Å but partners are 16.1Å apart → too_close_together by 7.5Å
  - E2↔A17: targets 41.8/13.9Å but partners are 21.5Å apart → too_close_together by 6.5Å
  - G3↔P30: targets 37.5/6.8Å but partners are 24.5Å apart → too_close_together by 6.1Å
- **E14** — severity 32.07, 11 conflict(s); suspect input ~`A17` (group: push_out)
  - push-out (wants farther): E2@23.2Å(now 17.0,conf 0.79), S32@23.1Å(now 16.6,conf 0.78), P30@20.9Å(now 13.9,conf 0.66), T4@17.5Å(now 11.6,conf 0.62), S7@11.9Å(now 5.9,conf 0.62)
  - P30↔A17: targets 20.9/5.4Å but partners are 8.5Å apart → too_close_together by 7.0Å
  - P30↔V18: targets 20.9/6.8Å but partners are 7.2Å apart → too_close_together by 6.9Å
  - S32↔A17: targets 23.1/5.4Å but partners are 11.8Å apart → too_close_together by 5.9Å
- **G28** — severity 31.06, 6 conflict(s); suspect input ~`E14` (group: push_out)
  - push-out (wants farther): G1@47.5Å(now 34.2,conf 0.98), S10@27.7Å(now 25.0,conf 0.93), E2@43.8Å(now 37.7,conf 0.81)
  - G1↔E14: targets 47.5/21.7Å but partners are 12.6Å apart → too_close_together by 13.2Å
  - G1↔I22: targets 47.5/10.2Å but partners are 25.2Å apart → too_close_together by 12.2Å
  - G1↔S10: targets 47.5/27.7Å but partners are 14.8Å apart → too_close_together by 4.9Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=11 · 3-10(G)=6 · coil(C)=0

```
EEGEGHGHEHHHEHEHGHGHHHGHHHHEHEHEHHHEE
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=11 · sheet=9
  - T6 ↔ S10  (helix)
  - D8 ↔ Q12  (helix)
  - S10 ↔ E14  (helix)
  - Q12 ↔ E16  (helix)
  - E16 ↔ L20  (helix)
  - L20 ↔ W24  (helix)
  - I22 ↔ K26  (helix)
  - L25 ↔ G29  (helix)
  - N27 ↔ S31  (helix)
  - G29 ↔ G33  (helix)
  - S31 ↔ P35  (helix)
  - G1 ↔ E15  (sheet)
  - T4 ↔ L9  (sheet)
  - T4 ↔ E15  (sheet)
  - L9 ↔ E15  (sheet)
  - G28 ↔ P36  (sheet)
  - G28 ↔ P37  (sheet)
  - P30 ↔ P36  (sheet)
  - P30 ↔ P37  (sheet)
  - S32 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=139 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=50 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.5432 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
