# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm3\1GCN\seeds\seed_5\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.839 A
- tm_score_ca_ordered: 0.12222761777544386
- heavy_atom_rmsd: 6.153 A
- sidechain_heavy_atom_rmsd: 7.451 A
- **all-atom quality (honest):** heavy 6.153 A, sidechain 7.451 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 300
- bin_accuracy: 0.397

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 21% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** S1-Y9 → 794 conflicts (85%); Y12-D20 → 101 conflicts (11%)
- explained: 895/931 conflicts by 2 root cause(s)
- metrics: hubs=27 (frac 1.0), conflicts/hub=34.5, max_incompat=11.28Å, chain_span=0.963
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): S1-Y9 + Y12-D20 — explain ~895/931 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 143.25, 86 conflict(s); suspect input ~`S15` (group: push_out)
  - pull-in (wants closer): V22@33.0Å(now 36.9,conf 0.52), D20@30.1Å(now 33.8,conf 0.49), A18@27.3Å(now 32.2,conf 0.45), S15@22.7Å(now 27.3,conf 0.38), L13@21.5Å(now 25.5,conf 0.36), Y12@20.2Å(now 23.0,conf 0.34), D8@12.3Å(now 16.4,conf 0.27)
  - push-out (wants farther): L25@47.5Å(now 41.5,conf 0.55), W24@43.9Å(now 41.1,conf 0.55), R17@35.2Å(now 31.7,conf 0.54), R16@31.8Å(now 28.8,conf 0.51)
  - L25↔A18: targets 47.5/27.3Å but partners are 9.9Å apart → too_close_together by 10.3Å
  - L25↔D20: targets 47.5/30.1Å but partners are 8.5Å apart → too_close_together by 8.8Å
  - L25↔S15: targets 47.5/22.7Å but partners are 15.1Å apart → too_close_together by 9.7Å
- **Q2** — severity 96.80, 65 conflict(s); suspect input ~`R16` (group: pull_in)
  - pull-in (wants closer): M26@36.2Å(now 40.0,conf 0.55), Q19@26.1Å(now 29.9,conf 0.43), R16@22.1Å(now 25.8,conf 0.37), K11@15.1Å(now 17.8,conf 0.27), Y9@11.9Å(now 14.4,conf 0.27)
  - push-out (wants farther): N27@46.1Å(now 40.7,conf 0.55), Q23@39.7Å(now 37.0,conf 0.55), R17@34.1Å(now 28.7,conf 0.53), A18@32.1Å(now 29.1,conf 0.51), D8@15.7Å(now 13.2,conf 0.28)
  - N27↔Q19: targets 46.1/26.1Å but partners are 11.3Å apart → too_close_together by 8.7Å
  - R17↔R16: targets 34.1/22.1Å but partners are 3.6Å apart → too_close_together by 8.5Å
  - N27↔D20: targets 46.1/28.8Å but partners are 10.8Å apart → too_close_together by 6.5Å
- **L25** — severity 90.06, 57 conflict(s); suspect input ~`D8` (group: push_out)
  - pull-in (wants closer): F5@28.4Å(now 32.0,conf 0.46), D8@20.6Å(now 25.4,conf 0.34), R17@8.8Å(now 11.4,conf 0.32), S10@17.8Å(now 23.1,conf 0.30), Y12@16.2Å(now 19.3,conf 0.28)
  - push-out (wants farther): S1@47.5Å(now 41.5,conf 0.55), G3@39.2Å(now 35.9,conf 0.55), R16@19.8Å(now 13.3,conf 0.33)
  - S1↔D8: targets 47.5/20.6Å but partners are 16.4Å apart → too_close_together by 10.5Å
  - S1↔F5: targets 47.5/28.4Å but partners are 11.6Å apart → too_close_together by 7.5Å
  - S1↔S10: targets 47.5/17.8Å but partners are 18.4Å apart → too_close_together by 11.3Å
- **R17** — severity 70.17, 51 conflict(s); suspect input ~`F5` (group: push_out)
  - pull-in (wants closer): D20@6.1Å(now 8.7,conf 0.44), G3@22.6Å(now 25.6,conf 0.37), Q23@8.3Å(now 11.8,conf 0.33), L25@8.8Å(now 11.4,conf 0.32), F5@14.3Å(now 21.7,conf 0.27)
  - push-out (wants farther): S1@35.2Å(now 31.7,conf 0.54), Q2@34.1Å(now 28.7,conf 0.53), M26@18.0Å(now 14.5,conf 0.30)
  - Q2↔F5: targets 34.1/14.3Å but partners are 9.1Å apart → too_close_together by 10.7Å
  - Q2↔G3: targets 34.1/22.6Å but partners are 4.6Å apart → too_close_together by 6.9Å
  - S1↔F5: targets 35.2/14.3Å but partners are 11.6Å apart → too_close_together by 9.2Å
- **N27** — severity 64.82, 45 conflict(s); suspect input ~`A18` (group: push_out)
  - pull-in (wants closer): S7@26.7Å(now 29.4,conf 0.43), A18@8.7Å(now 12.2,conf 0.32), Y12@16.6Å(now 21.7,conf 0.28)
  - push-out (wants farther): Q2@46.1Å(now 40.7,conf 0.55), D14@21.8Å(now 19.0,conf 0.36)
  - Q2↔T4: targets 46.1/33.5Å but partners are 5.9Å apart → too_close_together by 6.7Å
  - Q2↔S7: targets 46.1/26.7Å but partners are 11.9Å apart → too_close_together by 7.5Å
  - Q2↔A18: targets 46.1/8.7Å but partners are 29.1Å apart → too_close_together by 8.3Å
- **W24** — severity 58.01, 48 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): T6@26.8Å(now 29.8,conf 0.44), S7@22.1Å(now 27.3,conf 0.37), Y9@21.9Å(now 24.4,conf 0.36), L13@14.4Å(now 17.1,conf 0.27)
  - push-out (wants farther): S1@43.9Å(now 41.1,conf 0.55), F5@36.6Å(now 32.2,conf 0.55), S10@26.9Å(now 22.9,conf 0.44), Q19@16.2Å(now 11.0,conf 0.28)
  - F5↔T6: targets 36.6/26.8Å but partners are 3.7Å apart → too_close_together by 6.1Å
  - F5↔S7: targets 36.6/22.1Å but partners are 7.5Å apart → too_close_together by 7.0Å
  - S1↔S7: targets 43.9/22.1Å but partners are 15.2Å apart → too_close_together by 6.6Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=11 · 3-10(G)=2 · coil(C)=0

```
EEEHHEHEHHHGHEGEHEEHHHEHHHE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=6 · sheet=6
  - F5 ↔ Y9  (helix)
  - Y9 ↔ L13  (helix)
  - L13 ↔ R17  (helix)
  - R17 ↔ F21  (helix)
  - F21 ↔ L25  (helix)
  - V22 ↔ M26  (helix)
  - G3 ↔ D8  (sheet)
  - D8 ↔ D14  (sheet)
  - D14 ↔ Q19  (sheet)
  - A18 ↔ Q23  (sheet)
  - A18 ↔ N27  (sheet)
  - Q19 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=56 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.543 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
