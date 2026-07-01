# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm3\1GCN\seeds\seed_9\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.222 A
- tm_score_ca_ordered: 0.3159792413034398
- heavy_atom_rmsd: 4.417 A
- sidechain_heavy_atom_rmsd: 5.620 A
- **all-atom quality (honest):** heavy 4.417 A, sidechain 5.620 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 321
- bin_accuracy: 0.436

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 21% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** S1-D8 → 753 conflicts (82%); Y12-Q19 → 135 conflicts (15%)
- explained: 888/916 conflicts by 2 root cause(s)
- metrics: hubs=27 (frac 1.0), conflicts/hub=33.9, max_incompat=13.71Å, chain_span=0.963
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): S1-D8 + Y12-Q19 — explain ~888/916 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 141.99, 79 conflict(s); suspect input ~`S15` (group: push_out)
  - pull-in (wants closer): V22@33.0Å(now 37.9,conf 0.52), D20@30.1Å(now 34.9,conf 0.49), A18@27.3Å(now 32.2,conf 0.45), S15@22.7Å(now 27.7,conf 0.38), L13@21.5Å(now 24.9,conf 0.36), Y12@20.2Å(now 22.8,conf 0.34), D8@12.3Å(now 16.3,conf 0.27)
  - push-out (wants farther): L25@47.5Å(now 41.9,conf 0.55), Q19@35.7Å(now 33.1,conf 0.54), R17@35.2Å(now 31.4,conf 0.54), F5@12.8Å(now 8.9,conf 0.27)
  - L25↔V22: targets 47.5/33.0Å but partners are 5.1Å apart → too_close_together by 9.4Å
  - L25↔A18: targets 47.5/27.3Å but partners are 9.7Å apart → too_close_together by 10.4Å
  - L25↔D20: targets 47.5/30.1Å but partners are 9.7Å apart → too_close_together by 7.7Å
- **Q2** — severity 92.67, 56 conflict(s); suspect input ~`R16` (group: push_out)
  - pull-in (wants closer): M26@36.2Å(now 40.9,conf 0.55), V22@32.2Å(now 35.0,conf 0.51), D20@28.8Å(now 31.9,conf 0.47), Q19@26.1Å(now 30.2,conf 0.43), R16@22.1Å(now 26.3,conf 0.37), K11@15.1Å(now 18.0,conf 0.27)
  - push-out (wants farther): N27@46.1Å(now 41.0,conf 0.55), R17@34.1Å(now 28.2,conf 0.53), A18@32.1Å(now 29.2,conf 0.51)
  - N27↔D20: targets 46.1/28.8Å but partners are 9.2Å apart → too_close_together by 8.1Å
  - N27↔Q19: targets 46.1/26.1Å but partners are 11.4Å apart → too_close_together by 8.6Å
  - N27↔F21: targets 46.1/31.4Å but partners are 8.1Å apart → too_close_together by 6.5Å
- **L25** — severity 88.15, 53 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): F5@28.4Å(now 32.9,conf 0.46), D8@20.6Å(now 25.8,conf 0.34), S10@17.8Å(now 23.2,conf 0.30), Y12@16.2Å(now 19.2,conf 0.28)
  - push-out (wants farther): S1@47.5Å(now 41.9,conf 0.55), G3@39.2Å(now 36.3,conf 0.55), R16@19.8Å(now 14.2,conf 0.33), V22@8.4Å(now 5.1,conf 0.33)
  - S1↔F5: targets 47.5/28.4Å but partners are 8.9Å apart → too_close_together by 10.1Å
  - S1↔D8: targets 47.5/20.6Å but partners are 16.3Å apart → too_close_together by 10.6Å
  - S1↔S10: targets 47.5/17.8Å but partners are 18.7Å apart → too_close_together by 11.0Å
- **R17** — severity 73.92, 49 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): G3@22.6Å(now 25.6,conf 0.37), T6@17.3Å(now 19.9,conf 0.29), F5@14.3Å(now 22.6,conf 0.27)
  - push-out (wants farther): S1@35.2Å(now 31.4,conf 0.54), Q2@34.1Å(now 28.2,conf 0.53), M26@18.0Å(now 12.7,conf 0.30), V22@13.4Å(now 8.2,conf 0.26)
  - Q2↔F5: targets 34.1/14.3Å but partners are 6.1Å apart → too_close_together by 13.7Å
  - S1↔F5: targets 35.2/14.3Å but partners are 8.9Å apart → too_close_together by 11.9Å
  - Q2↔G3: targets 34.1/22.6Å but partners are 3.8Å apart → too_close_together by 7.8Å
- **N27** — severity 70.31, 48 conflict(s); suspect input ~`Y12` (group: push_out)
  - pull-in (wants closer): T4@33.5Å(now 36.5,conf 0.53), S7@26.7Å(now 30.1,conf 0.43), A18@8.7Å(now 13.3,conf 0.32), Y12@16.6Å(now 21.4,conf 0.28)
  - push-out (wants farther): Q2@46.1Å(now 41.0,conf 0.55), D14@21.8Å(now 19.0,conf 0.36), F21@11.0Å(now 8.1,conf 0.28)
  - Q2↔T4: targets 46.1/33.5Å but partners are 5.6Å apart → too_close_together by 7.0Å
  - Q2↔S7: targets 46.1/26.7Å but partners are 11.6Å apart → too_close_together by 7.8Å
  - Q2↔Y12: targets 46.1/16.6Å but partners are 19.8Å apart → too_close_together by 9.7Å
- **D14** — severity 61.58, 51 conflict(s); suspect input ~`T6` (group: pull_in)
  - pull-in (wants closer): D20@6.9Å(now 10.5,conf 0.39), S7@7.0Å(now 11.4,conf 0.39), T6@8.4Å(now 14.1,conf 0.33), G3@16.2Å(now 20.1,conf 0.28)
  - push-out (wants farther): N27@21.8Å(now 19.0,conf 0.36), V22@15.5Å(now 12.9,conf 0.27), F21@14.7Å(now 11.1,conf 0.27), Q19@12.6Å(now 8.7,conf 0.27), D8@12.9Å(now 10.3,conf 0.26)
  - D20↔S7: targets 6.9/7.0Å but partners are 21.2Å apart → too_far_apart by 7.3Å
  - D20↔T6: targets 6.9/8.4Å but partners are 23.9Å apart → too_far_apart by 8.6Å
  - D20↔N27: targets 6.9/21.8Å but partners are 9.2Å apart → too_close_together by 5.7Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=10 · 3-10(G)=0 · coil(C)=0

```
EEHHHHEHHEHHHHHHEHEHEHEHHEE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=9 · sheet=6
  - T4 ↔ D8  (helix)
  - F5 ↔ Y9  (helix)
  - D8 ↔ Y12  (helix)
  - Y9 ↔ L13  (helix)
  - Y12 ↔ R16  (helix)
  - D14 ↔ A18  (helix)
  - R16 ↔ D20  (helix)
  - A18 ↔ V22  (helix)
  - D20 ↔ W24  (helix)
  - Q2 ↔ S7  (sheet)
  - R17 ↔ Q23  (sheet)
  - Q19 ↔ M26  (sheet)
  - Q19 ↔ N27  (sheet)
  - F21 ↔ M26  (sheet)
  - F21 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=65 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5193 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
