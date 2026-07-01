# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm3\1JRJ\seeds\seed_8\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.468 A
- tm_score_ca_ordered: 0.3588996329202187
- heavy_atom_rmsd: 5.121 A
- sidechain_heavy_atom_rmsd: 6.190 A
- **all-atom quality (honest):** heavy 5.121 A, sidechain 6.190 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 595
- bin_accuracy: 0.398

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 15% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** G1-G33 → 2212 conflicts (100%)
- explained: 2212/2214 conflicts by 1 root cause(s)
- metrics: hubs=37 (frac 1.0), conflicts/hub=59.8, max_incompat=11.96Å, chain_span=0.973
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): G1-G33 — explain ~2212/2214 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T4** — severity 182.50, 133 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): E23@27.1Å(now 30.6,conf 0.44), V18@20.7Å(now 24.1,conf 0.34), E16@17.2Å(now 20.1,conf 0.29), S10@10.0Å(now 12.7,conf 0.29), L9@6.6Å(now 12.3,conf 0.41), K11@9.4Å(now 14.3,conf 0.30)
  - push-out (wants farther): P36@37.2Å(now 32.1,conf 0.55), W24@34.9Å(now 31.1,conf 0.54), N27@39.6Å(now 36.4,conf 0.55), F21@30.7Å(now 28.0,conf 0.49), P30@43.0Å(now 38.1,conf 0.55), P37@31.0Å(now 28.2,conf 0.50), E14@20.2Å(now 17.5,conf 0.34)
  - P36↔L9: targets 37.2/6.6Å but partners are 20.6Å apart → too_close_together by 9.9Å
  - P30↔L9: targets 43.0/6.6Å but partners are 27.5Å apart → too_close_together by 8.8Å
  - P37↔L9: targets 31.0/6.6Å but partners are 16.8Å apart → too_close_together by 7.7Å
- **E2** — severity 166.46, 107 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): A34@36.5Å(now 40.6,conf 0.55), R19@25.3Å(now 29.8,conf 0.41), E16@20.8Å(now 25.2,conf 0.35), M13@17.6Å(now 21.6,conf 0.30), S7@9.7Å(now 12.5,conf 0.29)
  - push-out (wants farther): N27@45.4Å(now 41.7,conf 0.55), W24@40.2Å(now 35.6,conf 0.55), A17@30.5Å(now 27.7,conf 0.49), P37@35.4Å(now 32.5,conf 0.54), P30@49.2Å(now 42.8,conf 0.55), V18@36.0Å(now 30.2,conf 0.54), F5@13.5Å(now 9.2,conf 0.26), T6@15.2Å(now 12.3,conf 0.27)
  - A34↔P30: targets 36.5/49.2Å but partners are 5.2Å apart → too_close_together by 7.5Å
  - F21↔P30: targets 31.1/49.2Å but partners are 10.1Å apart → too_close_together by 7.9Å
  - P30↔E16: targets 49.2/20.8Å but partners are 18.0Å apart → too_close_together by 10.4Å
- **S7** — severity 161.24, 107 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): G28@26.5Å(now 31.6,conf 0.43), P37@16.3Å(now 23.1,conf 0.28), E23@22.3Å(now 25.6,conf 0.37), F21@19.9Å(now 22.9,conf 0.33), E2@9.7Å(now 12.5,conf 0.29)
  - push-out (wants farther): N27@35.6Å(now 31.0,conf 0.54), P30@39.7Å(now 32.9,conf 0.55), W24@28.8Å(now 26.2,conf 0.47), S31@40.8Å(now 35.0,conf 0.55), P35@32.5Å(now 29.9,conf 0.52), R19@24.6Å(now 18.6,conf 0.40), K11@12.8Å(now 8.7,conf 0.27), E15@17.4Å(now 13.6,conf 0.30), G3@12.9Å(now 8.5,conf 0.26)
  - P30↔G28: targets 39.7/26.5Å but partners are 3.9Å apart → too_close_together by 9.3Å
  - P30↔L25: targets 39.7/25.4Å but partners are 6.1Å apart → too_close_together by 8.2Å
  - P30↔P37: targets 39.7/16.3Å but partners are 11.4Å apart → too_close_together by 12.0Å
- **P30** — severity 157.59, 98 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): S10@22.9Å(now 27.9,conf 0.38), K11@21.7Å(now 25.5,conf 0.36), A17@13.3Å(now 16.9,conf 0.26)
  - push-out (wants farther): S7@39.7Å(now 32.9,conf 0.55), T6@36.5Å(now 33.3,conf 0.55), T4@43.0Å(now 38.1,conf 0.55), D8@32.4Å(now 29.7,conf 0.52), E2@49.2Å(now 42.8,conf 0.55), G33@10.3Å(now 4.5,conf 0.28), N27@7.7Å(now 5.0,conf 0.35), E23@14.2Å(now 9.2,conf 0.27)
  - S7↔S10: targets 39.7/22.9Å but partners are 7.5Å apart → too_close_together by 9.4Å
  - S7↔K11: targets 39.7/21.7Å but partners are 8.7Å apart → too_close_together by 9.3Å
  - S7↔F21: targets 39.7/7.6Å but partners are 22.9Å apart → too_close_together by 9.2Å
- **G1** — severity 151.19, 114 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): E15@23.0Å(now 27.1,conf 0.38), W24@36.2Å(now 38.9,conf 0.55), M13@19.2Å(now 25.0,conf 0.32), S10@17.4Å(now 21.7,conf 0.29), F5@9.7Å(now 12.4,conf 0.30)
  - push-out (wants farther): V18@37.0Å(now 33.4,conf 0.55), G33@51.1Å(now 48.3,conf 0.56), E23@42.1Å(now 39.0,conf 0.55), A17@33.7Å(now 30.8,conf 0.53), P36@44.0Å(now 39.6,conf 0.55), D8@22.3Å(now 18.3,conf 0.37)
  - V18↔M13: targets 37.0/19.2Å but partners are 9.0Å apart → too_close_together by 8.8Å
  - E15↔E23: targets 23.0/42.1Å but partners are 12.1Å apart → too_close_together by 7.0Å
  - E23↔M13: targets 42.1/19.2Å but partners are 14.8Å apart → too_close_together by 8.1Å
- **G3** — severity 132.82, 94 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): E23@27.7Å(now 32.6,conf 0.45), P35@31.4Å(now 35.5,conf 0.50), K26@32.5Å(now 35.2,conf 0.52), R19@19.3Å(now 26.3,conf 0.32), P36@29.4Å(now 33.2,conf 0.48), V18@22.7Å(now 26.3,conf 0.38)
  - push-out (wants farther): G33@45.1Å(now 41.9,conf 0.55), S32@44.4Å(now 39.9,conf 0.55), I22@35.3Å(now 31.5,conf 0.54), G28@41.7Å(now 38.8,conf 0.55), P37@35.5Å(now 29.2,conf 0.54), M13@24.6Å(now 18.1,conf 0.40), S7@12.9Å(now 8.5,conf 0.26)
  - I22↔R19: targets 35.3/19.3Å but partners are 5.4Å apart → too_close_together by 10.7Å
  - S32↔P36: targets 44.4/29.4Å but partners are 8.1Å apart → too_close_together by 7.0Å
  - E23↔G28: targets 27.7/41.7Å but partners are 7.0Å apart → too_close_together by 7.0Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=11 · 3-10(G)=2 · coil(C)=5

```
EECHCHHCHCEECHHEHHHHHHEHHHGEHHHEHEGEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=5 · sheet=11
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - I22 ↔ K26  (helix)
  - K26 ↔ P30  (helix)
  - G29 ↔ G33  (helix)
  - K11 ↔ E16  (sheet)
  - E16 ↔ E23  (sheet)
  - E23 ↔ G28  (sheet)
  - E23 ↔ S32  (sheet)
  - E23 ↔ A34  (sheet)
  - E23 ↔ P36  (sheet)
  - E23 ↔ P37  (sheet)
  - G28 ↔ A34  (sheet)
  - G28 ↔ P36  (sheet)
  - G28 ↔ P37  (sheet)
  - S32 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=20 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=94 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5442 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
