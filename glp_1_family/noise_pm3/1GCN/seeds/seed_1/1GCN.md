# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm3\1GCN\seeds\seed_1\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.771 A
- tm_score_ca_ordered: 0.11172411177032478
- heavy_atom_rmsd: 5.534 A
- sidechain_heavy_atom_rmsd: 6.650 A
- **all-atom quality (honest):** heavy 5.534 A, sidechain 6.650 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 321
- bin_accuracy: 0.458

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 21% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** S1-D8 → 821 conflicts (84%); V22-N27 → 129 conflicts (13%)
- explained: 950/972 conflicts by 2 root cause(s)
- metrics: hubs=27 (frac 1.0), conflicts/hub=36.0, max_incompat=13.25Å, chain_span=0.963
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): S1-D8 + V22-N27 — explain ~950/972 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 139.50, 88 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): V22@33.0Å(now 37.5,conf 0.52), D20@30.1Å(now 34.0,conf 0.49), A18@27.3Å(now 31.1,conf 0.45), S15@22.7Å(now 27.4,conf 0.38), L13@21.5Å(now 24.5,conf 0.36), D8@12.3Å(now 16.5,conf 0.27)
  - push-out (wants farther): L25@47.5Å(now 41.4,conf 0.55), W24@43.9Å(now 41.1,conf 0.55), Q19@35.7Å(now 32.8,conf 0.54), R17@35.2Å(now 30.7,conf 0.54), R16@31.8Å(now 28.2,conf 0.51), F5@12.8Å(now 9.9,conf 0.27)
  - L25↔A18: targets 47.5/27.3Å but partners are 10.4Å apart → too_close_together by 9.8Å
  - L25↔S15: targets 47.5/22.7Å but partners are 14.7Å apart → too_close_together by 10.1Å
  - R17↔S15: targets 35.2/22.7Å but partners are 3.4Å apart → too_close_together by 9.1Å
- **L25** — severity 100.58, 65 conflict(s); suspect input ~`D8` (group: push_out)
  - pull-in (wants closer): F5@28.4Å(now 32.0,conf 0.46), D8@20.6Å(now 25.0,conf 0.34), K11@18.9Å(now 21.6,conf 0.32), R17@8.8Å(now 11.3,conf 0.32), S10@17.8Å(now 23.8,conf 0.30), Y12@16.2Å(now 19.4,conf 0.28)
  - push-out (wants farther): S1@47.5Å(now 41.4,conf 0.55), G3@39.2Å(now 35.5,conf 0.55), R16@19.8Å(now 13.7,conf 0.33)
  - S1↔F5: targets 47.5/28.4Å but partners are 9.9Å apart → too_close_together by 9.2Å
  - S1↔D8: targets 47.5/20.6Å but partners are 16.5Å apart → too_close_together by 10.4Å
  - S1↔S10: targets 47.5/17.8Å but partners are 19.1Å apart → too_close_together by 10.6Å
- **Q2** — severity 92.23, 58 conflict(s); suspect input ~`Q19` (group: pull_in)
  - pull-in (wants closer): M26@36.2Å(now 40.3,conf 0.55), Q19@26.1Å(now 29.5,conf 0.43), R16@22.1Å(now 24.9,conf 0.37)
  - push-out (wants farther): N27@46.1Å(now 40.1,conf 0.55), Q23@39.7Å(now 37.1,conf 0.55), R17@34.1Å(now 27.6,conf 0.53), A18@32.1Å(now 27.9,conf 0.51)
  - N27↔M26: targets 46.1/36.2Å but partners are 3.2Å apart → too_close_together by 6.7Å
  - N27↔Q19: targets 46.1/26.1Å but partners are 12.4Å apart → too_close_together by 7.6Å
  - R17↔S15: targets 34.1/22.5Å but partners are 3.4Å apart → too_close_together by 8.2Å
- **N27** — severity 83.96, 61 conflict(s); suspect input ~`A18` (group: push_out)
  - pull-in (wants closer): K11@21.2Å(now 24.1,conf 0.35), D20@8.4Å(now 13.9,conf 0.33), A18@8.7Å(now 12.6,conf 0.32), Y12@16.6Å(now 21.9,conf 0.28), R16@13.5Å(now 16.2,conf 0.26)
  - push-out (wants farther): Q2@46.1Å(now 40.1,conf 0.55)
  - Q2↔S7: targets 46.1/26.7Å but partners are 11.8Å apart → too_close_together by 7.6Å
  - Q2↔A18: targets 46.1/8.7Å but partners are 27.9Å apart → too_close_together by 9.5Å
  - Q2↔K11: targets 46.1/21.2Å but partners are 16.8Å apart → too_close_together by 8.1Å
- **W24** — severity 69.90, 57 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@22.1Å(now 27.3,conf 0.37), Y9@21.9Å(now 24.7,conf 0.36)
  - push-out (wants farther): S1@43.9Å(now 41.1,conf 0.55), F5@36.6Å(now 31.9,conf 0.55), D8@27.8Å(now 25.0,conf 0.45), S10@26.9Å(now 23.0,conf 0.44), Q19@16.2Å(now 8.8,conf 0.28)
  - F5↔S7: targets 36.6/22.1Å but partners are 5.3Å apart → too_close_together by 9.2Å
  - F5↔T6: targets 36.6/26.8Å but partners are 4.1Å apart → too_close_together by 5.6Å
  - S1↔S7: targets 43.9/22.1Å but partners are 15.2Å apart → too_close_together by 6.6Å
- **R17** — severity 66.06, 46 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): L25@8.8Å(now 11.3,conf 0.32), F5@14.3Å(now 21.7,conf 0.27)
  - push-out (wants farther): S1@35.2Å(now 30.7,conf 0.54), Q2@34.1Å(now 27.6,conf 0.53), M26@18.0Å(now 13.9,conf 0.30), V22@13.4Å(now 8.6,conf 0.26)
  - Q2↔F5: targets 34.1/14.3Å but partners are 6.5Å apart → too_close_together by 13.2Å
  - S1↔F5: targets 35.2/14.3Å but partners are 9.9Å apart → too_close_together by 11.0Å
  - Q2↔G3: targets 34.1/22.6Å but partners are 4.7Å apart → too_close_together by 6.9Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=12 · 3-10(G)=1 · coil(C)=2

```
EECHEHHEEHEGCEHHHHEEHHEHEHE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=4 · sheet=8
  - T6 ↔ S10  (helix)
  - R17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - V22 ↔ M26  (helix)
  - F5 ↔ K11  (sheet)
  - D8 ↔ D14  (sheet)
  - Y9 ↔ D14  (sheet)
  - D14 ↔ Q19  (sheet)
  - D14 ↔ D20  (sheet)
  - Q19 ↔ L25  (sheet)
  - Q19 ↔ N27  (sheet)
  - D20 ↔ L25  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=57 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5334 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
