# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm3\1GCN\seeds\seed_3\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.174 A
- tm_score_ca_ordered: 0.19461920355790774
- heavy_atom_rmsd: 5.530 A
- sidechain_heavy_atom_rmsd: 6.949 A
- **all-atom quality (honest):** heavy 5.530 A, sidechain 6.949 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 300
- bin_accuracy: 0.377

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 21% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** S1-N27 → 978 conflicts (100%)
- explained: 978/978 conflicts by 1 root cause(s)
- metrics: hubs=27 (frac 1.0), conflicts/hub=36.2, max_incompat=11.14Å, chain_span=0.963
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): S1-N27 — explain ~978/978 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 136.67, 80 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): V22@33.0Å(now 37.5,conf 0.52), D20@30.1Å(now 33.3,conf 0.49), A18@27.3Å(now 30.9,conf 0.45), S15@22.7Å(now 27.3,conf 0.38), D8@12.3Å(now 17.0,conf 0.27)
  - push-out (wants farther): L25@47.5Å(now 41.2,conf 0.55), Q19@35.7Å(now 32.4,conf 0.54), R17@35.2Å(now 30.7,conf 0.54), R16@31.8Å(now 28.6,conf 0.51)
  - L25↔D20: targets 47.5/30.1Å but partners are 8.2Å apart → too_close_together by 9.1Å
  - L25↔A18: targets 47.5/27.3Å but partners are 10.9Å apart → too_close_together by 9.3Å
  - L25↔S15: targets 47.5/22.7Å but partners are 15.1Å apart → too_close_together by 9.7Å
- **Q2** — severity 106.28, 65 conflict(s); suspect input ~`Q19` (group: pull_in)
  - pull-in (wants closer): M26@36.2Å(now 40.5,conf 0.55), Q19@26.1Å(now 29.7,conf 0.43), R16@22.1Å(now 25.6,conf 0.37), K11@15.1Å(now 17.9,conf 0.27)
  - push-out (wants farther): N27@46.1Å(now 40.5,conf 0.55), Q23@39.7Å(now 37.2,conf 0.55), R17@34.1Å(now 27.9,conf 0.53), A18@32.1Å(now 28.5,conf 0.51)
  - N27↔D20: targets 46.1/28.8Å but partners are 10.1Å apart → too_close_together by 7.2Å
  - N27↔M26: targets 46.1/36.2Å but partners are 3.8Å apart → too_close_together by 6.0Å
  - N27↔Q19: targets 46.1/26.1Å but partners are 12.3Å apart → too_close_together by 7.7Å
- **L25** — severity 104.14, 67 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): F5@28.4Å(now 31.8,conf 0.46), D8@20.6Å(now 24.6,conf 0.34), R17@8.8Å(now 12.0,conf 0.32), S10@17.8Å(now 22.6,conf 0.30), Y12@16.2Å(now 19.6,conf 0.28)
  - push-out (wants farther): S1@47.5Å(now 41.2,conf 0.55), G3@39.2Å(now 35.9,conf 0.55), S7@28.5Å(now 25.7,conf 0.46), R16@19.8Å(now 14.1,conf 0.33)
  - S1↔F5: targets 47.5/28.4Å but partners are 10.5Å apart → too_close_together by 8.6Å
  - S1↔D8: targets 47.5/20.6Å but partners are 17.0Å apart → too_close_together by 9.9Å
  - S1↔T6: targets 47.5/28.2Å but partners are 11.9Å apart → too_close_together by 7.3Å
- **N27** — severity 75.54, 52 conflict(s); suspect input ~`A18` (group: pull_in)
  - pull-in (wants closer): A18@8.7Å(now 12.7,conf 0.32), Y12@16.6Å(now 21.5,conf 0.28), R16@13.5Å(now 16.0,conf 0.26)
  - push-out (wants farther): Q2@46.1Å(now 40.5,conf 0.55), S10@27.2Å(now 24.4,conf 0.44), D14@21.8Å(now 18.7,conf 0.36)
  - Q2↔T4: targets 46.1/33.5Å but partners are 5.8Å apart → too_close_together by 6.7Å
  - Q2↔A18: targets 46.1/8.7Å but partners are 28.5Å apart → too_close_together by 8.9Å
  - Q2↔Y12: targets 46.1/16.6Å but partners are 19.5Å apart → too_close_together by 10.0Å
- **W24** — severity 70.13, 52 conflict(s); suspect input ~`L13` (group: push_out)
  - pull-in (wants closer): F21@5.6Å(now 9.2,conf 0.48), T6@26.8Å(now 29.7,conf 0.44), S7@22.1Å(now 26.0,conf 0.37), Y9@21.9Å(now 24.6,conf 0.36), L13@14.4Å(now 19.1,conf 0.27)
  - push-out (wants farther): F5@36.6Å(now 32.3,conf 0.55), D8@27.8Å(now 25.3,conf 0.45), S10@26.9Å(now 23.3,conf 0.44), Q19@16.2Å(now 11.0,conf 0.28)
  - F5↔F21: targets 36.6/5.6Å but partners are 25.0Å apart → too_close_together by 6.0Å
  - F5↔T6: targets 36.6/26.8Å but partners are 3.6Å apart → too_close_together by 6.2Å
  - F5↔S7: targets 36.6/22.1Å but partners are 7.6Å apart → too_close_together by 6.9Å
- **R17** — severity 68.99, 49 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): L25@8.8Å(now 12.0,conf 0.32), F5@14.3Å(now 20.8,conf 0.27)
  - push-out (wants farther): S1@35.2Å(now 30.7,conf 0.54), Q2@34.1Å(now 27.9,conf 0.53), S7@18.7Å(now 15.7,conf 0.31), M26@18.0Å(now 12.9,conf 0.30), V22@13.4Å(now 6.9,conf 0.26)
  - Q2↔F5: targets 34.1/14.3Å but partners are 8.7Å apart → too_close_together by 11.1Å
  - Q2↔G3: targets 34.1/22.6Å but partners are 4.1Å apart → too_close_together by 7.4Å
  - S1↔F5: targets 35.2/14.3Å but partners are 10.5Å apart → too_close_together by 10.4Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=9 · 3-10(G)=1 · coil(C)=0

```
EEHHHEHHHEHEHHHHEHHHEGEHHHE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=10 · sheet=5
  - G3 ↔ S7  (helix)
  - T4 ↔ D8  (helix)
  - F5 ↔ Y9  (helix)
  - S7 ↔ K11  (helix)
  - Y9 ↔ L13  (helix)
  - K11 ↔ S15  (helix)
  - D14 ↔ A18  (helix)
  - S15 ↔ Q19  (helix)
  - R16 ↔ D20  (helix)
  - D20 ↔ W24  (helix)
  - S1 ↔ T6  (sheet)
  - T6 ↔ Y12  (sheet)
  - Y12 ↔ R17  (sheet)
  - R17 ↔ Q23  (sheet)
  - F21 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=64 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5644 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
