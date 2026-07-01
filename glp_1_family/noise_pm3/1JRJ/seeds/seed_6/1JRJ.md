# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm3\1JRJ\seeds\seed_6\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.895 A
- tm_score_ca_ordered: 0.2551692151307243
- heavy_atom_rmsd: 5.190 A
- sidechain_heavy_atom_rmsd: 6.141 A
- **all-atom quality (honest):** heavy 5.190 A, sidechain 6.141 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 599
- bin_accuracy: 0.412

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 15% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** G1-G33 → 2275 conflicts (100%)
- explained: 2275/2275 conflicts by 1 root cause(s)
- metrics: hubs=37 (frac 1.0), conflicts/hub=61.5, max_incompat=12.76Å, chain_span=0.973
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): G1-G33 — explain ~2275/2275 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T4** — severity 182.53, 132 conflict(s); suspect input ~`L9` (group: push_out)
  - pull-in (wants closer): A34@34.1Å(now 37.0,conf 0.53), E23@27.1Å(now 30.6,conf 0.44), L9@6.6Å(now 11.0,conf 0.41), L20@23.1Å(now 26.1,conf 0.38), V18@20.7Å(now 25.4,conf 0.34), A17@20.6Å(now 23.8,conf 0.34), K11@9.4Å(now 14.8,conf 0.30), E16@17.2Å(now 21.7,conf 0.29), M13@13.7Å(now 17.0,conf 0.27)
  - push-out (wants farther): P30@43.0Å(now 38.7,conf 0.55), P36@37.2Å(now 32.7,conf 0.55), W24@34.9Å(now 31.7,conf 0.54)
  - P36↔L9: targets 37.2/6.6Å but partners are 21.8Å apart → too_close_together by 8.8Å
  - P30↔L9: targets 43.0/6.6Å but partners are 27.8Å apart → too_close_together by 8.6Å
  - W24↔L9: targets 34.9/6.6Å but partners are 20.8Å apart → too_close_together by 7.5Å
- **S7** — severity 180.18, 125 conflict(s); suspect input ~`P37` (group: push_out)
  - pull-in (wants closer): G28@26.5Å(now 31.6,conf 0.43), L25@25.4Å(now 28.1,conf 0.41), F21@19.9Å(now 22.9,conf 0.33), L20@17.9Å(now 20.8,conf 0.30), E2@9.7Å(now 13.1,conf 0.29), V18@16.7Å(now 19.9,conf 0.29), E14@10.3Å(now 14.5,conf 0.28), P37@16.3Å(now 24.0,conf 0.28), A17@14.7Å(now 18.9,conf 0.27), E16@14.5Å(now 17.2,conf 0.27)
  - push-out (wants farther): S31@40.8Å(now 35.7,conf 0.55), P30@39.7Å(now 33.1,conf 0.55), N27@35.6Å(now 31.4,conf 0.54), R19@24.6Å(now 18.9,conf 0.40), E15@17.4Å(now 14.1,conf 0.30), K11@12.8Å(now 8.9,conf 0.27), G3@12.9Å(now 9.9,conf 0.26)
  - P30↔G28: targets 39.7/26.5Å but partners are 4.2Å apart → too_close_together by 8.9Å
  - P30↔P37: targets 39.7/16.3Å but partners are 10.6Å apart → too_close_together by 12.8Å
  - P30↔L25: targets 39.7/25.4Å but partners are 5.9Å apart → too_close_together by 8.5Å
- **E2** — severity 160.00, 103 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): A34@36.5Å(now 41.0,conf 0.55), R19@25.3Å(now 30.2,conf 0.41), E16@20.8Å(now 26.7,conf 0.35), M13@17.6Å(now 22.3,conf 0.30), S7@9.7Å(now 13.1,conf 0.29)
  - push-out (wants farther): P30@49.2Å(now 43.5,conf 0.55), N27@45.4Å(now 42.4,conf 0.55), W24@40.2Å(now 36.4,conf 0.55), V18@36.0Å(now 31.1,conf 0.54), T6@15.2Å(now 10.9,conf 0.27), F5@13.5Å(now 9.1,conf 0.26)
  - P30↔F21: targets 49.2/31.1Å but partners are 10.3Å apart → too_close_together by 7.7Å
  - P30↔R19: targets 49.2/25.3Å but partners are 14.6Å apart → too_close_together by 9.3Å
  - P30↔A34: targets 49.2/36.5Å but partners are 6.2Å apart → too_close_together by 6.5Å
- **P30** — severity 146.18, 97 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): S10@22.9Å(now 28.0,conf 0.38), K11@21.7Å(now 25.2,conf 0.36), F21@7.6Å(now 10.3,conf 0.36), A17@13.3Å(now 16.2,conf 0.26)
  - push-out (wants farther): E2@49.2Å(now 43.5,conf 0.55), T4@43.0Å(now 38.7,conf 0.55), S7@39.7Å(now 33.1,conf 0.55), T6@36.5Å(now 33.5,conf 0.55), D8@32.4Å(now 29.9,conf 0.52), N27@7.7Å(now 4.5,conf 0.35), R19@17.2Å(now 14.6,conf 0.29), G33@10.3Å(now 4.0,conf 0.28), E23@14.2Å(now 8.9,conf 0.27)
  - S7↔S10: targets 39.7/22.9Å but partners are 5.8Å apart → too_close_together by 11.0Å
  - S7↔K11: targets 39.7/21.7Å but partners are 8.9Å apart → too_close_together by 9.1Å
  - T4↔S10: targets 43.0/22.9Å but partners are 11.4Å apart → too_close_together by 8.7Å
- **G3** — severity 135.94, 96 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): K26@32.5Å(now 35.5,conf 0.52), P35@31.4Å(now 35.3,conf 0.50), P36@29.4Å(now 33.1,conf 0.48), E23@27.7Å(now 31.9,conf 0.45), V18@22.7Å(now 27.0,conf 0.38), R19@19.3Å(now 26.3,conf 0.32)
  - push-out (wants farther): G33@45.1Å(now 42.2,conf 0.55), S32@44.4Å(now 39.9,conf 0.55), G28@41.7Å(now 38.9,conf 0.55), P37@35.5Å(now 29.5,conf 0.54), I22@35.3Å(now 31.4,conf 0.54), M13@24.6Å(now 18.1,conf 0.40), S7@12.9Å(now 9.9,conf 0.26)
  - I22↔R19: targets 35.3/19.3Å but partners are 5.2Å apart → too_close_together by 10.8Å
  - S32↔E23: targets 44.4/27.7Å but partners are 9.3Å apart → too_close_together by 7.4Å
  - G28↔E23: targets 41.7/27.7Å but partners are 7.2Å apart → too_close_together by 6.8Å
- **G1** — severity 120.89, 88 conflict(s); suspect input ~`M13` (group: push_out)
  - pull-in (wants closer): S31@45.8Å(now 48.4,conf 0.55), W24@36.2Å(now 39.5,conf 0.55), E15@23.0Å(now 26.9,conf 0.38), M13@19.2Å(now 24.6,conf 0.32), S10@17.4Å(now 20.2,conf 0.29)
  - push-out (wants farther): P36@44.0Å(now 39.9,conf 0.55), E23@42.1Å(now 38.8,conf 0.55), V18@37.0Å(now 33.6,conf 0.55), D8@22.3Å(now 18.0,conf 0.37)
  - V18↔M13: targets 37.0/19.2Å but partners are 9.1Å apart → too_close_together by 8.6Å
  - G33↔W24: targets 51.1/36.2Å but partners are 9.9Å apart → too_close_together by 5.0Å
  - V18↔E15: targets 37.0/23.0Å but partners are 6.9Å apart → too_close_together by 7.1Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=12 · 3-10(G)=6 · coil(C)=2

```
EECHHCHEGEHEEHHHEHGHHHHHEHEEGGHHGGHEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=8 · sheet=11
  - S7 ↔ K11  (helix)
  - K11 ↔ E15  (helix)
  - E14 ↔ V18  (helix)
  - E16 ↔ L20  (helix)
  - V18 ↔ I22  (helix)
  - L20 ↔ W24  (helix)
  - I22 ↔ K26  (helix)
  - S31 ↔ P35  (helix)
  - D8 ↔ M13  (sheet)
  - Q12 ↔ A17  (sheet)
  - A17 ↔ L25  (sheet)
  - A17 ↔ P36  (sheet)
  - A17 ↔ P37  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)
  - G28 ↔ P36  (sheet)
  - G28 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=23 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=16 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5399 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
