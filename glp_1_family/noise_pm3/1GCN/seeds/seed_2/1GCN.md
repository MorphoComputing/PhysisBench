# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm3\1GCN\seeds\seed_2\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.602 A
- tm_score_ca_ordered: 0.13499492724349998
- heavy_atom_rmsd: 5.605 A
- sidechain_heavy_atom_rmsd: 6.901 A
- **all-atom quality (honest):** heavy 5.605 A, sidechain 6.901 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 300
- bin_accuracy: 0.380

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 21% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** D14-N27 → 915 conflicts (93%); S1-K11 → 65 conflicts (7%)
- explained: 980/980 conflicts by 2 root cause(s)
- metrics: hubs=27 (frac 1.0), conflicts/hub=36.3, max_incompat=11.09Å, chain_span=0.963
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): D14-N27 + S1-K11 — explain ~980/980 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 145.16, 89 conflict(s); suspect input ~`S15` (group: push_out)
  - pull-in (wants closer): A18@27.3Å(now 31.0,conf 0.45), S15@22.7Å(now 27.3,conf 0.38), V22@33.0Å(now 37.0,conf 0.52), D20@30.1Å(now 33.4,conf 0.49), L13@21.5Å(now 24.4,conf 0.36), Y12@20.2Å(now 23.3,conf 0.34), D8@12.3Å(now 17.6,conf 0.27)
  - push-out (wants farther): L25@47.5Å(now 41.6,conf 0.55), Q19@35.7Å(now 32.6,conf 0.54), R16@31.8Å(now 29.2,conf 0.51), R17@35.2Å(now 30.9,conf 0.54)
  - A18↔L25: targets 27.3/47.5Å but partners are 10.8Å apart → too_close_together by 9.3Å
  - L25↔D20: targets 47.5/30.1Å but partners are 9.7Å apart → too_close_together by 7.7Å
  - L25↔S15: targets 47.5/22.7Å but partners are 14.9Å apart → too_close_together by 9.9Å
- **Q2** — severity 104.82, 64 conflict(s); suspect input ~`R16` (group: pull_in)
  - pull-in (wants closer): M26@36.2Å(now 40.5,conf 0.55), Q19@26.1Å(now 29.9,conf 0.43), R16@22.1Å(now 26.6,conf 0.37), K11@15.1Å(now 17.8,conf 0.27)
  - push-out (wants farther): Q23@39.7Å(now 37.1,conf 0.55), N27@46.1Å(now 41.6,conf 0.55), R17@34.1Å(now 28.2,conf 0.53), A18@32.1Å(now 28.6,conf 0.51)
  - N27↔Q19: targets 46.1/26.1Å but partners are 11.9Å apart → too_close_together by 8.1Å
  - N27↔M26: targets 46.1/36.2Å but partners are 4.0Å apart → too_close_together by 5.9Å
  - R17↔R16: targets 34.1/22.1Å but partners are 3.4Å apart → too_close_together by 8.7Å
- **L25** — severity 89.16, 57 conflict(s); suspect input ~`D8` (group: push_out)
  - pull-in (wants closer): F5@28.4Å(now 31.6,conf 0.46), D8@20.6Å(now 24.6,conf 0.34), S10@17.8Å(now 23.3,conf 0.30), K11@18.9Å(now 21.6,conf 0.32), Y12@16.2Å(now 19.2,conf 0.28)
  - push-out (wants farther): S1@47.5Å(now 41.6,conf 0.55), G3@39.2Å(now 36.5,conf 0.55), R16@19.8Å(now 12.9,conf 0.33)
  - F5↔S1: targets 28.4/47.5Å but partners are 10.8Å apart → too_close_together by 8.2Å
  - S1↔T6: targets 47.5/28.2Å but partners are 12.3Å apart → too_close_together by 7.0Å
  - S1↔D8: targets 47.5/20.6Å but partners are 17.6Å apart → too_close_together by 9.3Å
- **N27** — severity 74.75, 57 conflict(s); suspect input ~`A18` (group: push_out)
  - pull-in (wants closer): K11@21.2Å(now 24.0,conf 0.35), Y12@16.6Å(now 21.5,conf 0.28), D20@8.4Å(now 12.1,conf 0.33), A18@8.7Å(now 13.3,conf 0.32)
  - push-out (wants farther): Q2@46.1Å(now 41.6,conf 0.55), D14@21.8Å(now 19.3,conf 0.36)
  - Q2↔A18: targets 46.1/8.7Å but partners are 28.6Å apart → too_close_together by 8.8Å
  - Q2↔S7: targets 46.1/26.7Å but partners are 12.9Å apart → too_close_together by 6.4Å
  - Q2↔K11: targets 46.1/21.2Å but partners are 17.8Å apart → too_close_together by 7.1Å
- **F5** — severity 68.31, 47 conflict(s); suspect input ~`R17` (group: pull_in)
  - pull-in (wants closer): L25@28.4Å(now 31.6,conf 0.46), R17@14.3Å(now 21.0,conf 0.27), D8@5.8Å(now 8.7,conf 0.47)
  - push-out (wants farther): W24@36.6Å(now 31.9,conf 0.55), V22@31.2Å(now 27.6,conf 0.50), D20@27.9Å(now 23.9,conf 0.45), K11@13.9Å(now 11.2,conf 0.27), D14@18.9Å(now 14.9,conf 0.32)
  - W24↔R17: targets 36.6/14.3Å but partners are 11.2Å apart → too_close_together by 11.1Å
  - W24↔D8: targets 36.6/5.8Å but partners are 24.5Å apart → too_close_together by 6.3Å
  - D20↔D8: targets 27.9/5.8Å but partners are 16.0Å apart → too_close_together by 6.2Å
- **R17** — severity 65.95, 46 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): G3@22.6Å(now 25.8,conf 0.37), F5@14.3Å(now 21.0,conf 0.27)
  - push-out (wants farther): Q2@34.1Å(now 28.2,conf 0.53), S1@35.2Å(now 30.9,conf 0.54), S7@18.7Å(now 15.7,conf 0.31), V22@13.4Å(now 7.4,conf 0.26), M26@18.0Å(now 12.5,conf 0.30)
  - Q2↔F5: targets 34.1/14.3Å but partners are 9.1Å apart → too_close_together by 10.7Å
  - Q2↔G3: targets 34.1/22.6Å but partners are 4.0Å apart → too_close_together by 7.5Å
  - S1↔G3: targets 35.2/22.6Å but partners are 5.2Å apart → too_close_together by 7.4Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=9 · 3-10(G)=2 · coil(C)=0

```
EEEHEHHHHHHHEEHEHHEGHHGHHHE
```

## Backbone H-bond Network

- total=10 · helix(i→i+4)=7 · sheet=3
  - T4 ↔ D8  (helix)
  - T6 ↔ S10  (helix)
  - D8 ↔ Y12  (helix)
  - R17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - F21 ↔ L25  (helix)
  - V22 ↔ M26  (helix)
  - L13 ↔ Q19  (sheet)
  - D14 ↔ Q19  (sheet)
  - Q19 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=56 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5652 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
