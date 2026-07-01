# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm3\1GCN\seeds\seed_8\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.209 A
- tm_score_ca_ordered: 0.1777086241872654
- heavy_atom_rmsd: 5.292 A
- sidechain_heavy_atom_rmsd: 6.606 A
- **all-atom quality (honest):** heavy 5.292 A, sidechain 6.606 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 300
- bin_accuracy: 0.420

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 21% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** S1-D8 → 760 conflicts (81%); D14-Q19 → 140 conflicts (15%)
- explained: 900/934 conflicts by 2 root cause(s)
- metrics: hubs=27 (frac 1.0), conflicts/hub=34.6, max_incompat=11.48Å, chain_span=0.963
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): S1-D8 + D14-Q19 — explain ~900/934 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 150.50, 88 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): A18@27.3Å(now 31.5,conf 0.45), S15@22.7Å(now 27.4,conf 0.38), V22@33.0Å(now 38.0,conf 0.52), D20@30.1Å(now 34.2,conf 0.49), L13@21.5Å(now 24.0,conf 0.36), D8@12.3Å(now 16.0,conf 0.27)
  - push-out (wants farther): L25@47.5Å(now 41.3,conf 0.55), W24@43.9Å(now 41.1,conf 0.55), Q19@35.7Å(now 32.7,conf 0.54), R16@31.8Å(now 28.4,conf 0.51), R17@35.2Å(now 30.8,conf 0.54)
  - L25↔V22: targets 47.5/33.0Å but partners are 5.5Å apart → too_close_together by 9.1Å
  - A18↔L25: targets 27.3/47.5Å but partners are 9.9Å apart → too_close_together by 10.3Å
  - W24↔V22: targets 43.9/33.0Å but partners are 3.1Å apart → too_close_together by 7.8Å
- **Q2** — severity 96.47, 59 conflict(s); suspect input ~`Q19` (group: pull_in)
  - pull-in (wants closer): M26@36.2Å(now 40.5,conf 0.55), Q19@26.1Å(now 29.3,conf 0.43), R16@22.1Å(now 24.9,conf 0.37), V22@32.2Å(now 34.8,conf 0.51)
  - push-out (wants farther): Q23@39.7Å(now 37.1,conf 0.55), N27@46.1Å(now 40.6,conf 0.55), R17@34.1Å(now 27.4,conf 0.53), A18@32.1Å(now 28.4,conf 0.51), D8@15.7Å(now 13.2,conf 0.28)
  - N27↔V22: targets 46.1/32.2Å but partners are 6.1Å apart → too_close_together by 7.7Å
  - N27↔D20: targets 46.1/28.8Å but partners are 9.8Å apart → too_close_together by 7.5Å
  - N27↔M26: targets 46.1/36.2Å but partners are 3.5Å apart → too_close_together by 6.3Å
- **L25** — severity 93.22, 58 conflict(s); suspect input ~`S10` (group: push_out)
  - pull-in (wants closer): F5@28.4Å(now 31.7,conf 0.46), D8@20.6Å(now 25.3,conf 0.34), S10@17.8Å(now 23.0,conf 0.30), K11@18.9Å(now 21.5,conf 0.32), Y12@16.2Å(now 19.6,conf 0.28), R17@8.8Å(now 11.8,conf 0.32)
  - push-out (wants farther): S1@47.5Å(now 41.3,conf 0.55), G3@39.2Å(now 35.9,conf 0.55), V22@8.4Å(now 5.5,conf 0.33), R16@19.8Å(now 15.2,conf 0.33)
  - S1↔D8: targets 47.5/20.6Å but partners are 16.0Å apart → too_close_together by 10.9Å
  - F5↔S1: targets 28.4/47.5Å but partners are 11.0Å apart → too_close_together by 8.0Å
  - S1↔S10: targets 47.5/17.8Å but partners are 18.4Å apart → too_close_together by 11.3Å
- **N27** — severity 77.55, 53 conflict(s); suspect input ~`A18` (group: push_out)
  - pull-in (wants closer): T4@33.5Å(now 36.0,conf 0.53), S7@26.7Å(now 30.0,conf 0.43), Y12@16.6Å(now 22.0,conf 0.28), R16@13.5Å(now 16.0,conf 0.26), A18@8.7Å(now 13.6,conf 0.32)
  - push-out (wants farther): Q2@46.1Å(now 40.6,conf 0.55), D14@21.8Å(now 19.1,conf 0.36), W24@6.4Å(now 3.4,conf 0.42), V22@9.2Å(now 6.1,conf 0.31)
  - T4↔Q2: targets 33.5/46.1Å but partners are 5.1Å apart → too_close_together by 7.4Å
  - Q2↔S7: targets 46.1/26.7Å but partners are 12.2Å apart → too_close_together by 7.2Å
  - Q2↔A18: targets 46.1/8.7Å but partners are 28.4Å apart → too_close_together by 9.0Å
- **W24** — severity 68.06, 58 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@22.1Å(now 27.1,conf 0.37), Y9@21.9Å(now 24.6,conf 0.36), L13@14.4Å(now 17.2,conf 0.27)
  - push-out (wants farther): S1@43.9Å(now 41.1,conf 0.55), F5@36.6Å(now 31.9,conf 0.55), D8@27.8Å(now 25.3,conf 0.45), S10@26.9Å(now 22.9,conf 0.44), N27@6.4Å(now 3.4,conf 0.42), D20@10.0Å(now 7.5,conf 0.29), Q19@16.2Å(now 9.8,conf 0.28)
  - F5↔S7: targets 36.6/22.1Å but partners are 5.0Å apart → too_close_together by 9.5Å
  - F5↔T6: targets 36.6/26.8Å but partners are 3.8Å apart → too_close_together by 6.0Å
  - S1↔S7: targets 43.9/22.1Å but partners are 15.0Å apart → too_close_together by 6.8Å
- **R17** — severity 67.58, 45 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): F5@14.3Å(now 21.5,conf 0.27), L25@8.8Å(now 11.8,conf 0.32)
  - push-out (wants farther): Q2@34.1Å(now 27.4,conf 0.53), S1@35.2Å(now 30.8,conf 0.54), V22@13.4Å(now 7.7,conf 0.26), M26@18.0Å(now 13.5,conf 0.30)
  - Q2↔F5: targets 34.1/14.3Å but partners are 8.5Å apart → too_close_together by 11.3Å
  - Q2↔G3: targets 34.1/22.6Å but partners are 3.8Å apart → too_close_together by 7.7Å
  - Q2↔L13: targets 34.1/6.8Å but partners are 20.8Å apart → too_close_together by 6.6Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=10 · 3-10(G)=1 · coil(C)=0

```
EEHEHEHHHHHHEGHHEHHEHEHHHEE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=6 · sheet=5
  - F5 ↔ Y9  (helix)
  - K11 ↔ S15  (helix)
  - Y12 ↔ R16  (helix)
  - S15 ↔ Q19  (helix)
  - Q19 ↔ Q23  (helix)
  - F21 ↔ L25  (helix)
  - L13 ↔ D20  (sheet)
  - R17 ↔ V22  (sheet)
  - D20 ↔ M26  (sheet)
  - D20 ↔ N27  (sheet)
  - V22 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=65 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.535 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
