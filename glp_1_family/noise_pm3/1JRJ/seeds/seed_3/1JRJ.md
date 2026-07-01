# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm3\1JRJ\seeds\seed_3\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.890 A
- tm_score_ca_ordered: 0.2800693143800314
- heavy_atom_rmsd: 4.999 A
- sidechain_heavy_atom_rmsd: 6.059 A
- **all-atom quality (honest):** heavy 4.999 A, sidechain 6.059 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 595
- bin_accuracy: 0.412

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 15% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** G1-G33 → 2294 conflicts (100%)
- explained: 2294/2295 conflicts by 1 root cause(s)
- metrics: hubs=37 (frac 1.0), conflicts/hub=62.0, max_incompat=12.57Å, chain_span=0.973
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): G1-G33 — explain ~2294/2295 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T4** — severity 176.02, 131 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): A34@34.1Å(now 36.8,conf 0.53), E23@27.1Å(now 31.7,conf 0.44), L9@6.6Å(now 11.6,conf 0.41), V18@20.7Å(now 25.0,conf 0.34), A17@20.6Å(now 23.1,conf 0.34), K11@9.4Å(now 13.3,conf 0.30), E16@17.2Å(now 20.4,conf 0.29), M13@13.7Å(now 16.9,conf 0.27)
  - push-out (wants farther): P30@43.0Å(now 37.9,conf 0.55), N27@39.6Å(now 36.1,conf 0.55), P36@37.2Å(now 32.5,conf 0.55), W24@34.9Å(now 31.9,conf 0.54), P37@31.0Å(now 28.5,conf 0.50), F21@30.7Å(now 28.1,conf 0.49)
  - P36↔L9: targets 37.2/6.6Å but partners are 21.2Å apart → too_close_together by 9.4Å
  - P30↔L9: targets 43.0/6.6Å but partners are 27.3Å apart → too_close_together by 9.1Å
  - P37↔L9: targets 31.0/6.6Å but partners are 17.2Å apart → too_close_together by 7.2Å
- **P30** — severity 166.53, 105 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): S10@22.9Å(now 26.8,conf 0.38), K11@21.7Å(now 25.3,conf 0.36), F21@7.6Å(now 10.9,conf 0.36), V18@14.3Å(now 16.9,conf 0.27), A17@13.3Å(now 17.4,conf 0.26)
  - push-out (wants farther): E2@49.2Å(now 42.2,conf 0.55), T4@43.0Å(now 37.9,conf 0.55), G3@41.5Å(now 38.6,conf 0.55), S7@39.7Å(now 32.7,conf 0.55), T6@36.5Å(now 32.6,conf 0.55), D8@32.4Å(now 29.8,conf 0.52), A34@7.5Å(now 4.4,conf 0.36), G33@10.3Å(now 5.0,conf 0.28), E23@14.2Å(now 10.3,conf 0.27)
  - E2↔S10: targets 49.2/22.9Å but partners are 16.0Å apart → too_close_together by 10.3Å
  - S7↔K11: targets 39.7/21.7Å but partners are 7.5Å apart → too_close_together by 10.4Å
  - S7↔S10: targets 39.7/22.9Å but partners are 7.2Å apart → too_close_together by 9.7Å
- **S7** — severity 158.30, 113 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): G28@26.5Å(now 31.8,conf 0.43), L25@25.4Å(now 27.9,conf 0.41), E23@22.3Å(now 25.9,conf 0.37), F21@19.9Å(now 22.4,conf 0.33), E2@9.7Å(now 13.6,conf 0.29), E14@10.3Å(now 13.4,conf 0.28), P37@16.3Å(now 23.4,conf 0.28), A17@14.7Å(now 17.4,conf 0.27)
  - push-out (wants farther): S31@40.8Å(now 35.2,conf 0.55), P30@39.7Å(now 32.7,conf 0.55), N27@35.6Å(now 30.6,conf 0.54), R19@24.6Å(now 18.4,conf 0.40), E15@17.4Å(now 13.4,conf 0.30), K11@12.8Å(now 7.5,conf 0.27), G3@12.9Å(now 8.9,conf 0.26)
  - P30↔G28: targets 39.7/26.5Å but partners are 4.6Å apart → too_close_together by 8.6Å
  - P30↔P37: targets 39.7/16.3Å but partners are 10.8Å apart → too_close_together by 12.6Å
  - P30↔L25: targets 39.7/25.4Å but partners are 6.3Å apart → too_close_together by 8.0Å
- **E2** — severity 150.33, 101 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): A34@36.5Å(now 40.6,conf 0.55), R19@25.3Å(now 30.5,conf 0.41), E16@20.8Å(now 25.2,conf 0.35), M13@17.6Å(now 22.4,conf 0.30), S7@9.7Å(now 13.6,conf 0.29)
  - push-out (wants farther): P30@49.2Å(now 42.2,conf 0.55), N27@45.4Å(now 41.6,conf 0.55), W24@40.2Å(now 37.1,conf 0.55), V18@36.0Å(now 30.9,conf 0.54), P37@35.4Å(now 32.4,conf 0.54), S10@19.7Å(now 16.0,conf 0.33), T6@15.2Å(now 12.1,conf 0.27), F5@13.5Å(now 11.0,conf 0.26)
  - P30↔A34: targets 49.2/36.5Å but partners are 4.4Å apart → too_close_together by 8.2Å
  - P30↔S32: targets 49.2/41.0Å but partners are 1.3Å apart → too_close_together by 6.9Å
  - P30↔G29: targets 49.2/38.8Å but partners are 3.8Å apart → too_close_together by 6.5Å
- **G1** — severity 132.73, 96 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): W24@36.2Å(now 40.0,conf 0.55), E15@23.0Å(now 28.1,conf 0.38), M13@19.2Å(now 25.8,conf 0.32), F5@9.7Å(now 13.8,conf 0.30)
  - push-out (wants farther): G28@47.6Å(now 44.9,conf 0.55), N27@47.4Å(now 44.3,conf 0.55), G29@44.9Å(now 42.3,conf 0.55), P36@44.0Å(now 39.8,conf 0.55), K26@43.1Å(now 40.4,conf 0.55), V18@37.0Å(now 34.1,conf 0.55), D8@22.3Å(now 18.8,conf 0.37)
  - N27↔W24: targets 47.4/36.2Å but partners are 5.2Å apart → too_close_together by 6.0Å
  - V18↔M13: targets 37.0/19.2Å but partners are 8.7Å apart → too_close_together by 9.1Å
  - V18↔E15: targets 37.0/23.0Å but partners are 6.3Å apart → too_close_together by 7.7Å
- **G3** — severity 128.98, 98 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): P35@31.4Å(now 35.8,conf 0.50), P36@29.4Å(now 33.2,conf 0.48), E23@27.7Å(now 33.4,conf 0.45), V18@22.7Å(now 26.9,conf 0.38), R19@19.3Å(now 26.2,conf 0.32), E15@18.2Å(now 20.9,conf 0.31)
  - push-out (wants farther): G33@45.1Å(now 42.1,conf 0.55), S32@44.4Å(now 39.5,conf 0.55), G28@41.7Å(now 38.2,conf 0.55), P30@41.5Å(now 38.6,conf 0.55), P37@35.5Å(now 29.1,conf 0.54), I22@35.3Å(now 31.6,conf 0.54), M13@24.6Å(now 18.6,conf 0.40), S10@16.2Å(now 11.9,conf 0.28), S7@12.9Å(now 8.9,conf 0.26)
  - I22↔R19: targets 35.3/19.3Å but partners are 5.7Å apart → too_close_together by 10.4Å
  - S32↔P36: targets 44.4/29.4Å but partners are 8.1Å apart → too_close_together by 7.0Å
  - G33↔P36: targets 45.1/29.4Å but partners are 9.3Å apart → too_close_together by 6.4Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=14 · 3-10(G)=4 · coil(C)=0

```
EEEGHHGEHHEGEHHHEGHEHHHEHHHEHHHEHEHEE
```

## Backbone H-bond Network

- total=28 · helix(i→i+4)=10 · sheet=18
  - F5 ↔ L9  (helix)
  - T6 ↔ S10  (helix)
  - S10 ↔ E14  (helix)
  - E15 ↔ R19  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - L25 ↔ G29  (helix)
  - K26 ↔ P30  (helix)
  - G29 ↔ G33  (helix)
  - S31 ↔ P35  (helix)
  - G3 ↔ D8  (sheet)
  - D8 ↔ M13  (sheet)
  - K11 ↔ A17  (sheet)
  - K11 ↔ L20  (sheet)
  - M13 ↔ L20  (sheet)
  - A17 ↔ W24  (sheet)
  - A17 ↔ P36  (sheet)
  - A17 ↔ P37  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - … +8 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=97 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=8 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5467 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
