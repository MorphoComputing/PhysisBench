# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm3\1GCN\seeds\seed_0\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.606 A
- tm_score_ca_ordered: 0.13887545076305996
- heavy_atom_rmsd: 5.492 A
- sidechain_heavy_atom_rmsd: 6.602 A
- **all-atom quality (honest):** heavy 5.492 A, sidechain 6.602 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 300
- bin_accuracy: 0.383

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 21% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** S1-D8 → 725 conflicts (80%); V22-N27 → 128 conflicts (14%); D14-A18 → 45 conflicts (5%)
- explained: 898/910 conflicts by 3 root cause(s)
- metrics: hubs=27 (frac 1.0), conflicts/hub=33.7, max_incompat=11.56Å, chain_span=0.963
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): S1-D8 + V22-N27 + D14-A18 — explain ~898/910 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 133.40, 80 conflict(s); suspect input ~`S15` (group: push_out)
  - pull-in (wants closer): A18@27.3Å(now 32.2,conf 0.45), S15@22.7Å(now 27.6,conf 0.38), V22@33.0Å(now 38.5,conf 0.52), D20@30.1Å(now 34.4,conf 0.49), L13@21.5Å(now 24.7,conf 0.36), D8@12.3Å(now 17.1,conf 0.27)
  - push-out (wants farther): L25@47.5Å(now 42.5,conf 0.55), Q19@35.7Å(now 33.1,conf 0.54), R16@31.8Å(now 28.6,conf 0.51), R17@35.2Å(now 31.3,conf 0.54)
  - L25↔V22: targets 47.5/33.0Å but partners are 5.2Å apart → too_close_together by 9.3Å
  - A18↔L25: targets 27.3/47.5Å but partners are 10.9Å apart → too_close_together by 9.3Å
  - L25↔D20: targets 47.5/30.1Å but partners are 9.6Å apart → too_close_together by 7.7Å
- **L25** — severity 89.08, 55 conflict(s); suspect input ~`D8` (group: push_out)
  - pull-in (wants closer): F5@28.4Å(now 33.1,conf 0.46), D8@20.6Å(now 26.1,conf 0.34), S10@17.8Å(now 24.2,conf 0.30), K11@18.9Å(now 22.1,conf 0.32), Y12@16.2Å(now 20.4,conf 0.28), D14@15.1Å(now 17.7,conf 0.27)
  - push-out (wants farther): S1@47.5Å(now 42.5,conf 0.55), G3@39.2Å(now 36.6,conf 0.55), V22@8.4Å(now 5.2,conf 0.33), R16@19.8Å(now 14.0,conf 0.33)
  - F5↔S1: targets 28.4/47.5Å but partners are 11.4Å apart → too_close_together by 7.6Å
  - S1↔D8: targets 47.5/20.6Å but partners are 17.1Å apart → too_close_together by 9.8Å
  - S1↔S10: targets 47.5/17.8Å but partners are 19.0Å apart → too_close_together by 10.8Å
- **N27** — severity 79.53, 61 conflict(s); suspect input ~`Y12` (group: push_out)
  - pull-in (wants closer): S7@26.7Å(now 29.5,conf 0.43), K11@21.2Å(now 24.4,conf 0.35), Y12@16.6Å(now 23.1,conf 0.28), R16@13.5Å(now 16.3,conf 0.26), D20@8.4Å(now 12.9,conf 0.33), A18@8.7Å(now 14.1,conf 0.32)
  - push-out (wants farther): Q2@46.1Å(now 41.3,conf 0.55)
  - Q2↔S7: targets 46.1/26.7Å but partners are 12.3Å apart → too_close_together by 7.1Å
  - Q2↔Y12: targets 46.1/16.6Å but partners are 19.2Å apart → too_close_together by 10.2Å
  - T4↔Q2: targets 33.5/46.1Å but partners are 7.2Å apart → too_close_together by 5.3Å
- **Q2** — severity 78.34, 48 conflict(s); suspect input ~`R16` (group: push_out)
  - pull-in (wants closer): M26@36.2Å(now 40.7,conf 0.55), Q19@26.1Å(now 29.9,conf 0.43), R16@22.1Å(now 25.2,conf 0.37), V22@32.2Å(now 35.2,conf 0.51)
  - push-out (wants farther): N27@46.1Å(now 41.3,conf 0.55), R17@34.1Å(now 27.9,conf 0.53), A18@32.1Å(now 28.9,conf 0.51)
  - N27↔M26: targets 46.1/36.2Å but partners are 3.6Å apart → too_close_together by 6.2Å
  - N27↔Q19: targets 46.1/26.1Å but partners are 12.2Å apart → too_close_together by 7.8Å
  - R17↔R16: targets 34.1/22.1Å but partners are 3.0Å apart → too_close_together by 9.0Å
- **R17** — severity 65.13, 42 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): G3@22.6Å(now 25.3,conf 0.37), F5@14.3Å(now 22.0,conf 0.27)
  - push-out (wants farther): Q2@34.1Å(now 27.9,conf 0.53), S1@35.2Å(now 31.3,conf 0.54), V22@13.4Å(now 8.1,conf 0.26), M26@18.0Å(now 13.0,conf 0.30)
  - Q2↔F5: targets 34.1/14.3Å but partners are 8.2Å apart → too_close_together by 11.6Å
  - Q2↔G3: targets 34.1/22.6Å but partners are 3.7Å apart → too_close_together by 7.8Å
  - F5↔L25: targets 14.3/8.8Å but partners are 33.1Å apart → too_far_apart by 10.0Å
- **D8** — severity 62.06, 50 conflict(s); suspect input ~`S1` (group: push_out)
  - pull-in (wants closer): L25@20.6Å(now 26.1,conf 0.34), M26@24.5Å(now 27.7,conf 0.40), V22@16.8Å(now 22.4,conf 0.29), A18@13.4Å(now 16.7,conf 0.26), S1@12.3Å(now 17.1,conf 0.27), S15@9.2Å(now 12.3,conf 0.31)
  - push-out (wants farther): W24@27.8Å(now 25.1,conf 0.45), D14@12.9Å(now 9.7,conf 0.26), R16@17.8Å(now 12.1,conf 0.30), L13@11.8Å(now 8.2,conf 0.27)
  - L25↔S1: targets 20.6/12.3Å but partners are 42.5Å apart → too_far_apart by 9.6Å
  - V22↔S1: targets 16.8/12.3Å but partners are 38.5Å apart → too_far_apart by 9.4Å
  - L25↔F5: targets 20.6/5.8Å but partners are 33.1Å apart → too_far_apart by 6.8Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=11 · 3-10(G)=1 · coil(C)=1

```
EECEHEHHEHHEHEHHEGHHEHHHEHE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=6 · sheet=7
  - S7 ↔ K11  (helix)
  - K11 ↔ S15  (helix)
  - S15 ↔ Q19  (helix)
  - R16 ↔ D20  (helix)
  - Q19 ↔ Q23  (helix)
  - D20 ↔ W24  (helix)
  - T4 ↔ Y9  (sheet)
  - T6 ↔ Y12  (sheet)
  - Y9 ↔ D14  (sheet)
  - Y12 ↔ R17  (sheet)
  - D14 ↔ F21  (sheet)
  - R17 ↔ L25  (sheet)
  - F21 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=60 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5408 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
