# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm3\3IOL\seeds\seed_1\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.310 A
- tm_score_ca_ordered: 0.09727266635972727
- heavy_atom_rmsd: 4.871 A
- sidechain_heavy_atom_rmsd: 5.799 A
- **all-atom quality (honest):** heavy 4.871 A, sidechain 5.799 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 245
- bin_accuracy: 0.355

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 13% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T1-Q13 → 457 conflicts (99%)
- explained: 457/463 conflicts by 1 root cause(s)
- metrics: hubs=24 (frac 1.0), conflicts/hub=19.3, max_incompat=9.12Å, chain_span=0.958
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T1-Q13 — explain ~457/463 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L22** — severity 51.60, 40 conflict(s); suspect input ~`V6` (group: push_out)
  - pull-in (wants closer): V6@18.4Å(now 22.6,conf 0.31), S8@17.8Å(now 21.2,conf 0.30), S7@17.6Å(now 22.5,conf 0.30), E11@15.9Å(now 19.0,conf 0.28), A14@11.2Å(now 14.1,conf 0.27), Q13@11.2Å(now 14.6,conf 0.27)
  - push-out (wants farther): T3@34.1Å(now 29.1,conf 0.53), T1@33.8Å(now 30.3,conf 0.53), L10@22.6Å(now 18.7,conf 0.37), K16@12.6Å(now 10.1,conf 0.27)
  - T3↔V6: targets 34.1/18.4Å but partners are 6.9Å apart → too_close_together by 8.9Å
  - T3↔S7: targets 34.1/17.6Å but partners are 7.5Å apart → too_close_together by 9.1Å
  - T3↔S8: targets 34.1/17.8Å but partners are 8.0Å apart → too_close_together by 8.3Å
- **T3** — severity 46.97, 36 conflict(s); suspect input ~`Q13` (group: pull_in)
  - pull-in (wants closer): K24@26.6Å(now 30.9,conf 0.43), V23@24.7Å(now 28.8,conf 0.41), Q13@13.0Å(now 15.6,conf 0.26)
  - push-out (wants farther): L22@34.1Å(now 29.1,conf 0.53), F18@29.3Å(now 24.6,conf 0.47), A20@27.5Å(now 24.5,conf 0.45), S8@11.4Å(now 8.0,conf 0.27)
  - L22↔S7: targets 34.1/5.8Å but partners are 22.5Å apart → too_close_together by 5.9Å
  - F18↔S7: targets 29.3/5.8Å but partners are 17.7Å apart → too_close_together by 5.9Å
  - L22↔V23: targets 34.1/24.7Å but partners are 3.8Å apart → too_close_together by 5.6Å
- **T1** — severity 44.90, 37 conflict(s); suspect input ~`F18` (group: pull_in)
  - pull-in (wants closer): V23@27.4Å(now 30.1,conf 0.45), F18@20.3Å(now 25.6,conf 0.34), A15@18.9Å(now 21.6,conf 0.32)
  - push-out (wants farther): K24@35.4Å(now 32.1,conf 0.54), L22@33.8Å(now 30.3,conf 0.53), A14@22.8Å(now 19.2,conf 0.38), S4@8.7Å(now 5.2,conf 0.32), E11@19.1Å(now 14.1,conf 0.32), V6@10.7Å(now 7.9,conf 0.28)
  - K24↔S7: targets 35.4/6.0Å but partners are 23.9Å apart → too_close_together by 5.5Å
  - L22↔S7: targets 33.8/6.0Å but partners are 22.5Å apart → too_close_together by 5.3Å
  - L22↔F18: targets 33.8/20.3Å but partners are 6.8Å apart → too_close_together by 6.7Å
- **F18** — severity 36.89, 33 conflict(s); suspect input ~`G12` (group: pull_in)
  - pull-in (wants closer): T1@20.3Å(now 25.6,conf 0.34), G12@8.4Å(now 12.1,conf 0.33), S8@14.1Å(now 17.1,conf 0.27)
  - push-out (wants farther): T3@29.3Å(now 24.6,conf 0.47), W21@6.7Å(now 4.0,conf 0.40), S7@21.0Å(now 17.7,conf 0.35)
  - T3↔T1: targets 29.3/20.3Å but partners are 1.4Å apart → too_close_together by 7.6Å
  - T3↔G12: targets 29.3/8.4Å but partners are 13.2Å apart → too_close_together by 7.7Å
  - S7↔G12: targets 21.0/8.4Å but partners are 6.5Å apart → too_close_together by 6.1Å
- **K24** — severity 31.66, 28 conflict(s); suspect input ~`S8` (group: push_out)
  - pull-in (wants closer): T3@26.6Å(now 30.9,conf 0.43), S7@21.1Å(now 23.9,conf 0.35), S8@19.6Å(now 22.9,conf 0.33), L10@17.0Å(now 20.7,conf 0.29)
  - push-out (wants farther): T1@35.4Å(now 32.1,conf 0.54), S4@31.5Å(now 28.4,conf 0.51)
  - T1↔T3: targets 35.4/26.6Å but partners are 1.4Å apart → too_close_together by 7.4Å
  - T1↔S8: targets 35.4/19.6Å but partners are 9.3Å apart → too_close_together by 6.5Å
  - T1↔S7: targets 35.4/21.1Å but partners are 8.5Å apart → too_close_together by 5.8Å
- **D5** — severity 26.75, 25 conflict(s); suspect input ~`A20` (group: push_out)
  - pull-in (wants closer): I19@18.1Å(now 21.7,conf 0.30), A20@17.7Å(now 21.3,conf 0.30), E17@16.3Å(now 18.9,conf 0.28)
  - push-out (wants farther): V23@30.1Å(now 26.4,conf 0.49), A15@21.4Å(now 16.7,conf 0.35)
  - V23↔Y9: targets 30.1/5.6Å but partners are 18.8Å apart → too_close_together by 5.7Å
  - G12↔A15: targets 7.5/21.4Å but partners are 7.6Å apart → too_close_together by 6.2Å
  - Y9↔A15: targets 5.6/21.4Å but partners are 10.6Å apart → too_close_together by 5.1Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=5 · 3-10(G)=1 · coil(C)=1

```
CHHHHHHHHHEEHEHHHHHHHEGE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=9 · sheet=0
  - F2 ↔ V6  (helix)
  - T3 ↔ S7  (helix)
  - S4 ↔ S8  (helix)
  - D5 ↔ Y9  (helix)
  - Y9 ↔ Q13  (helix)
  - Q13 ↔ E17  (helix)
  - A15 ↔ I19  (helix)
  - K16 ↔ A20  (helix)
  - E17 ↔ W21  (helix)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=62 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6312 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
