# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm3\1GCN\seeds\seed_6\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.663 A
- tm_score_ca_ordered: 0.18580946696798897
- heavy_atom_rmsd: 5.919 A
- sidechain_heavy_atom_rmsd: 7.340 A
- **all-atom quality (honest):** heavy 5.919 A, sidechain 7.340 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 300
- bin_accuracy: 0.407

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 21% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** S1-D8 → 722 conflicts (76%); V22-N27 → 180 conflicts (19%); D14-Q19 → 49 conflicts (5%)
- explained: 951/955 conflicts by 3 root cause(s)
- metrics: hubs=27 (frac 1.0), conflicts/hub=35.4, max_incompat=13.82Å, chain_span=0.963
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): S1-D8 + V22-N27 + D14-Q19 — explain ~951/955 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 137.45, 87 conflict(s); suspect input ~`S15` (group: push_out)
  - pull-in (wants closer): V22@33.0Å(now 37.9,conf 0.52), D20@30.1Å(now 34.5,conf 0.49), A18@27.3Å(now 32.8,conf 0.45), S15@22.7Å(now 28.2,conf 0.38), L13@21.5Å(now 24.4,conf 0.36), Y12@20.2Å(now 22.9,conf 0.34), D8@12.3Å(now 15.7,conf 0.27)
  - push-out (wants farther): L25@47.5Å(now 42.0,conf 0.55), W24@43.9Å(now 41.1,conf 0.55), R17@35.2Å(now 31.4,conf 0.54), R16@31.8Å(now 29.1,conf 0.51), F5@12.8Å(now 9.0,conf 0.27)
  - L25↔A18: targets 47.5/27.3Å but partners are 10.1Å apart → too_close_together by 10.0Å
  - L25↔V22: targets 47.5/33.0Å but partners are 8.0Å apart → too_close_together by 6.5Å
  - L25↔D20: targets 47.5/30.1Å but partners are 10.3Å apart → too_close_together by 7.0Å
- **L25** — severity 99.16, 60 conflict(s); suspect input ~`D8` (group: push_out)
  - pull-in (wants closer): F5@28.4Å(now 33.1,conf 0.46), D8@20.6Å(now 26.4,conf 0.34), K11@18.9Å(now 21.7,conf 0.32), R17@8.8Å(now 12.0,conf 0.32), S10@17.8Å(now 24.0,conf 0.30), Y12@16.2Å(now 19.5,conf 0.28), D14@15.1Å(now 17.8,conf 0.27)
  - push-out (wants farther): S1@47.5Å(now 42.0,conf 0.55), G3@39.2Å(now 36.0,conf 0.55), R16@19.8Å(now 13.8,conf 0.33)
  - S1↔F5: targets 47.5/28.4Å but partners are 9.0Å apart → too_close_together by 10.1Å
  - S1↔D8: targets 47.5/20.6Å but partners are 15.7Å apart → too_close_together by 11.2Å
  - G3↔F5: targets 39.2/28.4Å but partners are 3.0Å apart → too_close_together by 7.8Å
- **Q2** — severity 92.71, 58 conflict(s); suspect input ~`R16` (group: pull_in)
  - pull-in (wants closer): M26@36.2Å(now 40.0,conf 0.55), Q19@26.1Å(now 29.7,conf 0.43), R16@22.1Å(now 25.6,conf 0.37)
  - push-out (wants farther): N27@46.1Å(now 40.0,conf 0.55), Q23@39.7Å(now 36.7,conf 0.55), R17@34.1Å(now 27.7,conf 0.53), A18@32.1Å(now 29.5,conf 0.51), D8@15.7Å(now 12.5,conf 0.28)
  - N27↔M26: targets 46.1/36.2Å but partners are 3.5Å apart → too_close_together by 6.3Å
  - R17↔R16: targets 34.1/22.1Å but partners are 3.0Å apart → too_close_together by 9.1Å
  - N27↔Q19: targets 46.1/26.1Å but partners are 12.4Å apart → too_close_together by 7.6Å
- **R17** — severity 75.89, 51 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): G3@22.6Å(now 25.4,conf 0.37), L25@8.8Å(now 12.0,conf 0.32), F5@14.3Å(now 22.4,conf 0.27)
  - push-out (wants farther): S1@35.2Å(now 31.4,conf 0.54), Q2@34.1Å(now 27.7,conf 0.53), M26@18.0Å(now 13.7,conf 0.30), V22@13.4Å(now 8.6,conf 0.26)
  - Q2↔F5: targets 34.1/14.3Å but partners are 6.0Å apart → too_close_together by 13.8Å
  - S1↔F5: targets 35.2/14.3Å but partners are 9.0Å apart → too_close_together by 11.8Å
  - Q2↔G3: targets 34.1/22.6Å but partners are 4.0Å apart → too_close_together by 7.5Å
- **N27** — severity 69.68, 52 conflict(s); suspect input ~`Y12` (group: push_out)
  - pull-in (wants closer): D20@8.4Å(now 12.2,conf 0.33), A18@8.7Å(now 12.6,conf 0.32), Y12@16.6Å(now 21.3,conf 0.28), R16@13.5Å(now 16.1,conf 0.26)
  - push-out (wants farther): Q2@46.1Å(now 40.0,conf 0.55)
  - Q2↔S7: targets 46.1/26.7Å but partners are 11.2Å apart → too_close_together by 8.2Å
  - Q2↔T4: targets 46.1/33.5Å but partners are 6.5Å apart → too_close_together by 6.1Å
  - Q2↔Y12: targets 46.1/16.6Å but partners are 19.8Å apart → too_close_together by 9.6Å
- **W24** — severity 63.73, 53 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@22.1Å(now 26.7,conf 0.37), Y9@21.9Å(now 25.3,conf 0.36), L13@14.4Å(now 17.7,conf 0.27), S15@12.9Å(now 15.5,conf 0.26)
  - push-out (wants farther): S1@43.9Å(now 41.1,conf 0.55), F5@36.6Å(now 32.3,conf 0.55), S10@26.9Å(now 23.9,conf 0.44), Q19@16.2Å(now 9.3,conf 0.28)
  - F5↔S7: targets 36.6/22.1Å but partners are 6.2Å apart → too_close_together by 8.3Å
  - S1↔S7: targets 43.9/22.1Å but partners are 14.6Å apart → too_close_together by 7.2Å
  - F5↔Y9: targets 36.6/21.9Å but partners are 8.2Å apart → too_close_together by 6.5Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=6 · 3-10(G)=3 · coil(C)=0

```
EEGHHHHEHHHHEGGHHHEHHHHHHHE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=10 · sheet=4
  - F5 ↔ Y9  (helix)
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - Y12 ↔ R16  (helix)
  - R16 ↔ D20  (helix)
  - R17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - V22 ↔ M26  (helix)
  - Q2 ↔ D8  (sheet)
  - D8 ↔ L13  (sheet)
  - L13 ↔ Q19  (sheet)
  - Q19 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=63 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5399 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
