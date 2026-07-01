# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm3\1GCN\seeds\seed_4\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.641 A
- tm_score_ca_ordered: 0.13250124553863335
- heavy_atom_rmsd: 5.679 A
- sidechain_heavy_atom_rmsd: 6.747 A
- **all-atom quality (honest):** heavy 5.679 A, sidechain 6.747 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 321
- bin_accuracy: 0.430

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 21% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** D14-N27 → 960 conflicts (97%)
- explained: 960/991 conflicts by 1 root cause(s)
- metrics: hubs=27 (frac 1.0), conflicts/hub=36.7, max_incompat=12.33Å, chain_span=0.963
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): D14-N27 — explain ~960/991 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 151.34, 87 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): V22@33.0Å(now 38.1,conf 0.52), D20@30.1Å(now 34.2,conf 0.49), A18@27.3Å(now 31.1,conf 0.45), S15@22.7Å(now 27.2,conf 0.38), L13@21.5Å(now 24.3,conf 0.36), D8@12.3Å(now 16.9,conf 0.27)
  - push-out (wants farther): L25@47.5Å(now 41.5,conf 0.55), W24@43.9Å(now 41.0,conf 0.55), Q19@35.7Å(now 32.8,conf 0.54), R17@35.2Å(now 30.5,conf 0.54), R16@31.8Å(now 27.9,conf 0.51)
  - L25↔V22: targets 47.5/33.0Å but partners are 4.8Å apart → too_close_together by 9.7Å
  - L25↔D20: targets 47.5/30.1Å but partners are 7.4Å apart → too_close_together by 10.0Å
  - W24↔V22: targets 43.9/33.0Å but partners are 3.0Å apart → too_close_together by 7.9Å
- **L25** — severity 103.65, 67 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): F5@28.4Å(now 32.2,conf 0.46), D8@20.6Å(now 25.4,conf 0.34), R17@8.8Å(now 11.3,conf 0.32), A18@9.1Å(now 11.7,conf 0.31), S10@17.8Å(now 23.4,conf 0.30), Y12@16.2Å(now 19.7,conf 0.28)
  - push-out (wants farther): S1@47.5Å(now 41.5,conf 0.55), Q2@40.6Å(now 37.9,conf 0.55), G3@39.2Å(now 35.7,conf 0.55), R16@19.8Å(now 14.6,conf 0.33), V22@8.4Å(now 4.8,conf 0.33), D20@10.5Å(now 7.4,conf 0.28)
  - S1↔F5: targets 47.5/28.4Å but partners are 10.7Å apart → too_close_together by 8.3Å
  - S1↔D8: targets 47.5/20.6Å but partners are 16.9Å apart → too_close_together by 10.0Å
  - S1↔S10: targets 47.5/17.8Å but partners are 19.5Å apart → too_close_together by 10.2Å
- **Q2** — severity 101.59, 66 conflict(s); suspect input ~`Q19` (group: pull_in)
  - pull-in (wants closer): M26@36.2Å(now 40.0,conf 0.55), Q19@26.1Å(now 29.1,conf 0.43)
  - push-out (wants farther): N27@46.1Å(now 40.5,conf 0.55), L25@40.6Å(now 37.9,conf 0.55), Q23@39.7Å(now 36.7,conf 0.55), R17@34.1Å(now 26.9,conf 0.53), A18@32.1Å(now 27.6,conf 0.51), D8@15.7Å(now 13.2,conf 0.28)
  - N27↔M26: targets 46.1/36.2Å but partners are 3.3Å apart → too_close_together by 6.6Å
  - N27↔Q19: targets 46.1/26.1Å but partners are 11.7Å apart → too_close_together by 8.3Å
  - N27↔V22: targets 46.1/32.2Å but partners are 8.0Å apart → too_close_together by 5.8Å
- **N27** — severity 82.41, 58 conflict(s); suspect input ~`Y12` (group: push_out)
  - pull-in (wants closer): S7@26.7Å(now 30.5,conf 0.43), D20@8.4Å(now 11.1,conf 0.33), A18@8.7Å(now 14.5,conf 0.32), Y12@16.6Å(now 21.8,conf 0.28), R16@13.5Å(now 17.4,conf 0.26)
  - push-out (wants farther): Q2@46.1Å(now 40.5,conf 0.55)
  - Q2↔T4: targets 46.1/33.5Å but partners are 5.4Å apart → too_close_together by 7.1Å
  - Q2↔S7: targets 46.1/26.7Å but partners are 11.7Å apart → too_close_together by 7.7Å
  - Q2↔A18: targets 46.1/8.7Å but partners are 27.6Å apart → too_close_together by 9.7Å
- **R17** — severity 66.90, 44 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): L25@8.8Å(now 11.3,conf 0.32), F5@14.3Å(now 21.8,conf 0.27)
  - push-out (wants farther): S1@35.2Å(now 30.5,conf 0.54), Q2@34.1Å(now 26.9,conf 0.53), M26@18.0Å(now 13.4,conf 0.30), V22@13.4Å(now 7.8,conf 0.26)
  - Q2↔F5: targets 34.1/14.3Å but partners are 7.5Å apart → too_close_together by 12.3Å
  - Q2↔G3: targets 34.1/22.6Å but partners are 3.6Å apart → too_close_together by 7.9Å
  - S1↔F5: targets 35.2/14.3Å but partners are 10.7Å apart → too_close_together by 10.1Å
- **W24** — severity 61.50, 52 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@22.1Å(now 27.5,conf 0.37), Y9@21.9Å(now 24.8,conf 0.36), L13@14.4Å(now 17.3,conf 0.27)
  - push-out (wants farther): S1@43.9Å(now 41.0,conf 0.55), F5@36.6Å(now 32.3,conf 0.55), S10@26.9Å(now 23.6,conf 0.44), D20@10.0Å(now 7.3,conf 0.29), Q19@16.2Å(now 8.8,conf 0.28)
  - F5↔S7: targets 36.6/22.1Å but partners are 5.0Å apart → too_close_together by 9.5Å
  - F5↔T6: targets 36.6/26.8Å but partners are 3.8Å apart → too_close_together by 5.9Å
  - S1↔S7: targets 43.9/22.1Å but partners are 15.1Å apart → too_close_together by 6.7Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=10 · 3-10(G)=0 · coil(C)=0

```
EEHEHHEHHHEEHEHHHHHHHEHHHEE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=10 · sheet=4
  - F5 ↔ Y9  (helix)
  - T6 ↔ S10  (helix)
  - Y9 ↔ L13  (helix)
  - L13 ↔ R17  (helix)
  - S15 ↔ Q19  (helix)
  - R16 ↔ D20  (helix)
  - R17 ↔ F21  (helix)
  - Q19 ↔ Q23  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - Q2 ↔ S7  (sheet)
  - S7 ↔ Y12  (sheet)
  - S7 ↔ D14  (sheet)
  - V22 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=66 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5258 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
