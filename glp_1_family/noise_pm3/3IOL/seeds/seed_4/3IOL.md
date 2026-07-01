# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm3\3IOL\seeds\seed_4\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.643 A
- tm_score_ca_ordered: 0.11737625923719441
- heavy_atom_rmsd: 5.657 A
- sidechain_heavy_atom_rmsd: 7.086 A
- **all-atom quality (honest):** heavy 5.657 A, sidechain 7.086 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 245
- bin_accuracy: 0.359

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 13% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T1-Q13 → 438 conflicts (92%); K16-K24 → 38 conflicts (8%)
- explained: 476/477 conflicts by 2 root cause(s)
- metrics: hubs=24 (frac 1.0), conflicts/hub=19.9, max_incompat=8.71Å, chain_span=0.958
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T1-Q13 + K16-K24 — explain ~476/477 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T3** — severity 56.70, 41 conflict(s); suspect input ~`Q13` (group: push_out)
  - pull-in (wants closer): K24@26.6Å(now 31.3,conf 0.43), V23@24.7Å(now 28.7,conf 0.41), E17@21.4Å(now 24.0,conf 0.36), K16@18.3Å(now 20.8,conf 0.31), Q13@13.0Å(now 16.7,conf 0.26)
  - push-out (wants farther): L22@34.1Å(now 29.7,conf 0.53), F18@29.3Å(now 25.2,conf 0.47), A20@27.5Å(now 24.9,conf 0.45)
  - L22↔S7: targets 34.1/5.8Å but partners are 22.2Å apart → too_close_together by 6.2Å
  - F18↔S7: targets 29.3/5.8Å but partners are 17.4Å apart → too_close_together by 6.2Å
  - L22↔K24: targets 34.1/26.6Å but partners are 2.2Å apart → too_close_together by 5.3Å
- **T1** — severity 56.36, 47 conflict(s); suspect input ~`F18` (group: push_out)
  - pull-in (wants closer): V23@27.4Å(now 30.2,conf 0.45), S7@6.0Å(now 8.8,conf 0.45), A20@23.4Å(now 26.0,conf 0.39), F18@20.3Å(now 25.9,conf 0.34), A15@18.9Å(now 22.1,conf 0.32), Y9@10.0Å(now 13.6,conf 0.29)
  - push-out (wants farther): K24@35.4Å(now 32.6,conf 0.54), L22@33.8Å(now 30.8,conf 0.53), A14@22.8Å(now 19.7,conf 0.38), E11@19.1Å(now 14.2,conf 0.32), V6@10.7Å(now 7.9,conf 0.28)
  - L22↔S7: targets 33.8/6.0Å but partners are 22.2Å apart → too_close_together by 5.6Å
  - K24↔S7: targets 35.4/6.0Å but partners are 23.9Å apart → too_close_together by 5.5Å
  - L22↔F18: targets 33.8/20.3Å but partners are 6.4Å apart → too_close_together by 7.1Å
- **L22** — severity 41.14, 32 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): V6@18.4Å(now 23.3,conf 0.31), S8@17.8Å(now 21.3,conf 0.30), S7@17.6Å(now 22.2,conf 0.30), Q13@11.2Å(now 13.8,conf 0.27)
  - push-out (wants farther): T3@34.1Å(now 29.7,conf 0.53), T1@33.8Å(now 30.8,conf 0.53), L10@22.6Å(now 18.7,conf 0.37), E17@10.9Å(now 6.3,conf 0.28), K16@12.6Å(now 9.4,conf 0.27)
  - T3↔S7: targets 34.1/17.6Å but partners are 7.9Å apart → too_close_together by 8.7Å
  - T3↔S4: targets 34.1/24.2Å but partners are 3.8Å apart → too_close_together by 6.1Å
  - T3↔V6: targets 34.1/18.4Å but partners are 8.0Å apart → too_close_together by 7.7Å
- **L10** — severity 35.94, 34 conflict(s); suspect input ~`T3` (group: push_out)
  - pull-in (wants closer): K16@6.0Å(now 9.5,conf 0.45), A15@7.7Å(now 10.5,conf 0.35), E17@8.1Å(now 12.8,conf 0.34), K24@17.0Å(now 20.5,conf 0.29)
  - push-out (wants farther): L22@22.6Å(now 18.7,conf 0.37)
  - L22↔E17: targets 22.6/8.1Å but partners are 6.3Å apart → too_close_together by 8.2Å
  - K16↔L22: targets 6.0/22.6Å but partners are 9.4Å apart → too_close_together by 7.2Å
  - E17↔T3: targets 8.1/9.8Å but partners are 24.0Å apart → too_far_apart by 6.0Å
- **D5** — severity 34.97, 30 conflict(s); suspect input ~`E17` (group: push_out)
  - pull-in (wants closer): Y9@5.6Å(now 9.2,conf 0.48), I19@18.1Å(now 21.6,conf 0.30), A20@17.7Å(now 21.2,conf 0.30), E17@16.3Å(now 20.3,conf 0.28)
  - push-out (wants farther): V23@30.1Å(now 25.5,conf 0.49), A15@21.4Å(now 17.5,conf 0.35)
  - V23↔Y9: targets 30.1/5.6Å but partners are 19.8Å apart → too_close_together by 4.7Å
  - V23↔G12: targets 30.1/7.5Å but partners are 16.9Å apart → too_close_together by 5.7Å
  - V23↔E17: targets 30.1/16.3Å but partners are 7.3Å apart → too_close_together by 6.5Å
- **F18** — severity 28.38, 25 conflict(s); suspect input ~`G12` (group: pull_in)
  - pull-in (wants closer): T1@20.3Å(now 25.9,conf 0.34), G12@8.4Å(now 12.0,conf 0.33)
  - push-out (wants farther): T3@29.3Å(now 25.2,conf 0.47), S7@21.0Å(now 17.4,conf 0.35)
  - T3↔G12: targets 29.3/8.4Å but partners are 13.4Å apart → too_close_together by 7.5Å
  - S7↔G12: targets 21.0/8.4Å but partners are 5.6Å apart → too_close_together by 7.0Å
  - T3↔T1: targets 29.3/20.3Å but partners are 3.2Å apart → too_close_together by 5.8Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=6 · 3-10(G)=3 · coil(C)=0

```
EHGHEHGGHHHHEHHHHHHEHEHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=8 · sheet=1
  - F2 ↔ V6  (helix)
  - V6 ↔ L10  (helix)
  - L10 ↔ A14  (helix)
  - E11 ↔ A15  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - E17 ↔ W21  (helix)
  - I19 ↔ V23  (helix)
  - Q13 ↔ A20  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=64 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=3 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6142 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
