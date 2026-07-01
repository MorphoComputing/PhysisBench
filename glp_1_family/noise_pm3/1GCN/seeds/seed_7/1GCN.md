# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm3\1GCN\seeds\seed_7\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.545 A
- tm_score_ca_ordered: 0.18238295662963877
- heavy_atom_rmsd: 5.523 A
- sidechain_heavy_atom_rmsd: 6.760 A
- **all-atom quality (honest):** heavy 5.523 A, sidechain 6.760 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 321
- bin_accuracy: 0.436

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 21% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** S1-D8 → 752 conflicts (81%); D14-D20 → 138 conflicts (15%)
- explained: 890/924 conflicts by 2 root cause(s)
- metrics: hubs=27 (frac 1.0), conflicts/hub=34.2, max_incompat=11.61Å, chain_span=0.963
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): S1-D8 + D14-D20 — explain ~890/924 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 139.13, 84 conflict(s); suspect input ~`S15` (group: push_out)
  - pull-in (wants closer): V22@33.0Å(now 38.0,conf 0.52), D20@30.1Å(now 33.7,conf 0.49), A18@27.3Å(now 31.0,conf 0.45), S15@22.7Å(now 27.8,conf 0.38), L13@21.5Å(now 24.0,conf 0.36), Y12@20.2Å(now 23.1,conf 0.34), D8@12.3Å(now 18.2,conf 0.27)
  - push-out (wants farther): L25@47.5Å(now 42.0,conf 0.55), Q19@35.7Å(now 32.2,conf 0.54), R17@35.2Å(now 30.9,conf 0.54), R16@31.8Å(now 28.0,conf 0.51)
  - L25↔V22: targets 47.5/33.0Å but partners are 6.2Å apart → too_close_together by 8.3Å
  - W24↔V22: targets 43.9/33.0Å but partners are 3.5Å apart → too_close_together by 7.4Å
  - L25↔A18: targets 47.5/27.3Å but partners are 11.6Å apart → too_close_together by 8.5Å
- **L25** — severity 90.63, 61 conflict(s); suspect input ~`D8` (group: push_out)
  - pull-in (wants closer): F5@28.4Å(now 32.2,conf 0.46), D8@20.6Å(now 24.9,conf 0.34), R17@8.8Å(now 11.5,conf 0.32), A18@9.1Å(now 11.6,conf 0.31), Q19@9.2Å(now 11.9,conf 0.30), S10@17.8Å(now 22.9,conf 0.30), Y12@16.2Å(now 19.6,conf 0.28)
  - push-out (wants farther): S1@47.5Å(now 42.0,conf 0.55), G3@39.2Å(now 36.1,conf 0.55), R16@19.8Å(now 14.9,conf 0.33)
  - S1↔F5: targets 47.5/28.4Å but partners are 11.9Å apart → too_close_together by 7.1Å
  - S1↔D8: targets 47.5/20.6Å but partners are 18.2Å apart → too_close_together by 8.7Å
  - S1↔S10: targets 47.5/17.8Å but partners are 20.8Å apart → too_close_together by 8.9Å
- **Q2** — severity 87.89, 56 conflict(s); suspect input ~`R16` (group: pull_in)
  - pull-in (wants closer): M26@36.2Å(now 40.2,conf 0.55), Q19@26.1Å(now 28.6,conf 0.43), K11@15.1Å(now 17.6,conf 0.27)
  - push-out (wants farther): N27@46.1Å(now 40.4,conf 0.55), Q23@39.7Å(now 36.7,conf 0.55), R17@34.1Å(now 27.3,conf 0.53), A18@32.1Å(now 27.4,conf 0.51)
  - N27↔M26: targets 46.1/36.2Å but partners are 3.5Å apart → too_close_together by 6.4Å
  - N27↔Q19: targets 46.1/26.1Å but partners are 12.1Å apart → too_close_together by 7.9Å
  - R17↔R16: targets 34.1/22.1Å but partners are 4.0Å apart → too_close_together by 8.1Å
- **N27** — severity 79.52, 60 conflict(s); suspect input ~`A18` (group: push_out)
  - pull-in (wants closer): S7@26.7Å(now 29.2,conf 0.43), K11@21.2Å(now 23.7,conf 0.35), D20@8.4Å(now 11.2,conf 0.33), A18@8.7Å(now 13.1,conf 0.32), Y12@16.6Å(now 22.6,conf 0.28), R16@13.5Å(now 17.0,conf 0.26)
  - push-out (wants farther): Q2@46.1Å(now 40.4,conf 0.55)
  - Q2↔T4: targets 46.1/33.5Å but partners are 6.5Å apart → too_close_together by 6.1Å
  - Q2↔A18: targets 46.1/8.7Å but partners are 27.4Å apart → too_close_together by 10.0Å
  - Q2↔S7: targets 46.1/26.7Å but partners are 12.3Å apart → too_close_together by 7.1Å
- **R17** — severity 62.75, 43 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): L25@8.8Å(now 11.5,conf 0.32), F5@14.3Å(now 21.9,conf 0.27)
  - push-out (wants farther): S1@35.2Å(now 30.9,conf 0.54), Q2@34.1Å(now 27.3,conf 0.53), M26@18.0Å(now 13.3,conf 0.30), V22@13.4Å(now 7.5,conf 0.26)
  - Q2↔G3: targets 34.1/22.6Å but partners are 3.5Å apart → too_close_together by 8.1Å
  - Q2↔L13: targets 34.1/6.8Å but partners are 20.5Å apart → too_close_together by 6.9Å
  - Q2↔F5: targets 34.1/14.3Å but partners are 9.5Å apart → too_close_together by 10.3Å
- **W24** — severity 56.42, 49 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): T6@26.8Å(now 29.4,conf 0.44), S7@22.1Å(now 27.4,conf 0.37), Y9@21.9Å(now 24.8,conf 0.36), L13@14.4Å(now 17.5,conf 0.27)
  - push-out (wants farther): F5@36.6Å(now 32.5,conf 0.55), D8@27.8Å(now 25.2,conf 0.45), S10@26.9Å(now 23.1,conf 0.44), Q19@16.2Å(now 11.7,conf 0.28)
  - F5↔S7: targets 36.6/22.1Å but partners are 5.7Å apart → too_close_together by 8.9Å
  - F5↔T6: targets 36.6/26.8Å but partners are 3.5Å apart → too_close_together by 6.3Å
  - F5↔Y9: targets 36.6/21.9Å but partners are 8.3Å apart → too_close_together by 6.3Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=9 · 3-10(G)=3 · coil(C)=0

```
EEEGGGHHHHHEHHEHHEHEEHHHHHE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=6 · sheet=5
  - S7 ↔ K11  (helix)
  - Y9 ↔ L13  (helix)
  - S10 ↔ D14  (helix)
  - L13 ↔ R17  (helix)
  - Q19 ↔ Q23  (helix)
  - V22 ↔ M26  (helix)
  - Y12 ↔ A18  (sheet)
  - S15 ↔ D20  (sheet)
  - S15 ↔ F21  (sheet)
  - D20 ↔ N27  (sheet)
  - F21 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=62 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5275 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
