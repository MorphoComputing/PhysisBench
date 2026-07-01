# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm3\1JRJ\seeds\seed_0\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.624 A
- tm_score_ca_ordered: 0.3271306036931877
- heavy_atom_rmsd: 5.028 A
- sidechain_heavy_atom_rmsd: 6.031 A
- **all-atom quality (honest):** heavy 5.028 A, sidechain 6.031 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 595
- bin_accuracy: 0.398

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 15% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** G1-G33 → 2296 conflicts (100%)
- explained: 2296/2296 conflicts by 1 root cause(s)
- metrics: hubs=37 (frac 1.0), conflicts/hub=62.1, max_incompat=11.96Å, chain_span=0.973
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): G1-G33 — explain ~2296/2296 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S7** — severity 169.86, 112 conflict(s); suspect input ~`P37` (group: push_out)
  - pull-in (wants closer): G28@26.5Å(now 32.5,conf 0.43), L25@25.4Å(now 28.1,conf 0.41), P37@16.3Å(now 23.6,conf 0.28), E23@22.3Å(now 26.1,conf 0.37), F21@19.9Å(now 22.9,conf 0.33), V18@16.7Å(now 19.5,conf 0.29), A17@14.7Å(now 17.8,conf 0.27), E2@9.7Å(now 12.5,conf 0.29), E14@10.3Å(now 13.8,conf 0.28)
  - push-out (wants farther): N27@35.6Å(now 31.0,conf 0.54), P30@39.7Å(now 33.4,conf 0.55), S31@40.8Å(now 36.0,conf 0.55), R19@24.6Å(now 19.3,conf 0.40), K11@12.8Å(now 7.9,conf 0.27), E15@17.4Å(now 14.0,conf 0.30), G3@12.9Å(now 8.7,conf 0.26)
  - P30↔G28: targets 39.7/26.5Å but partners are 2.0Å apart → too_close_together by 11.2Å
  - G28↔S31: targets 26.5/40.8Å but partners are 5.6Å apart → too_close_together by 8.7Å
  - P30↔L25: targets 39.7/25.4Å but partners are 6.1Å apart → too_close_together by 8.3Å
- **T4** — severity 158.47, 113 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): A34@34.1Å(now 36.8,conf 0.53), E23@27.1Å(now 31.5,conf 0.44), V18@20.7Å(now 24.4,conf 0.34), E16@17.2Å(now 20.8,conf 0.29), L9@6.6Å(now 11.4,conf 0.41), K11@9.4Å(now 13.4,conf 0.30)
  - push-out (wants farther): P36@37.2Å(now 32.4,conf 0.55), N27@39.6Å(now 36.4,conf 0.55), F21@30.7Å(now 28.1,conf 0.49), P30@43.0Å(now 38.6,conf 0.55), P37@31.0Å(now 28.4,conf 0.50), D8@11.6Å(now 8.5,conf 0.27)
  - P36↔L9: targets 37.2/6.6Å but partners are 21.3Å apart → too_close_together by 9.3Å
  - P30↔L9: targets 43.0/6.6Å but partners are 27.9Å apart → too_close_together by 8.5Å
  - N27↔E23: targets 39.6/27.1Å but partners are 5.0Å apart → too_close_together by 7.4Å
- **P30** — severity 154.37, 96 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): S10@22.9Å(now 28.1,conf 0.38), K11@21.7Å(now 25.8,conf 0.36), E14@19.3Å(now 22.0,conf 0.32), A17@13.3Å(now 16.8,conf 0.26), F21@7.6Å(now 10.6,conf 0.36)
  - push-out (wants farther): S7@39.7Å(now 33.4,conf 0.55), T6@36.5Å(now 33.9,conf 0.55), T4@43.0Å(now 38.6,conf 0.55), E2@49.2Å(now 44.1,conf 0.55), G33@10.3Å(now 5.7,conf 0.28), N27@7.7Å(now 4.6,conf 0.35), E23@14.2Å(now 8.4,conf 0.27)
  - S7↔S10: targets 39.7/22.9Å but partners are 6.3Å apart → too_close_together by 10.5Å
  - S7↔K11: targets 39.7/21.7Å but partners are 7.9Å apart → too_close_together by 10.1Å
  - S10↔E2: targets 22.9/49.2Å but partners are 17.3Å apart → too_close_together by 9.0Å
- **E2** — severity 147.31, 100 conflict(s); suspect input ~`E16` (group: push_out)
  - pull-in (wants closer): A34@36.5Å(now 41.5,conf 0.55), F21@31.1Å(now 33.8,conf 0.50), S32@41.0Å(now 44.3,conf 0.55), R19@25.3Å(now 30.7,conf 0.41), E16@20.8Å(now 25.9,conf 0.35), M13@17.6Å(now 21.3,conf 0.30), S7@9.7Å(now 12.5,conf 0.29)
  - push-out (wants farther): N27@45.4Å(now 42.3,conf 0.55), P30@49.2Å(now 44.1,conf 0.55), V18@36.0Å(now 30.2,conf 0.54), F5@13.5Å(now 9.7,conf 0.26), T6@15.2Å(now 10.7,conf 0.27)
  - F21↔P30: targets 31.1/49.2Å but partners are 10.6Å apart → too_close_together by 7.4Å
  - G29↔P30: targets 38.8/49.2Å but partners are 3.9Å apart → too_close_together by 6.5Å
  - P30↔R19: targets 49.2/25.3Å but partners are 15.6Å apart → too_close_together by 8.3Å
- **G1** — severity 125.89, 96 conflict(s); suspect input ~`M13` (group: push_out)
  - pull-in (wants closer): L25@39.3Å(now 42.3,conf 0.55), P35@40.2Å(now 43.8,conf 0.55), E15@23.0Å(now 26.7,conf 0.38), W24@36.2Å(now 41.2,conf 0.55), M13@19.2Å(now 24.2,conf 0.32), S31@45.8Å(now 49.5,conf 0.55), S10@17.4Å(now 20.2,conf 0.29), F5@9.7Å(now 12.2,conf 0.30)
  - push-out (wants farther): V18@37.0Å(now 33.0,conf 0.55), A17@33.7Å(now 31.1,conf 0.53), P36@44.0Å(now 40.6,conf 0.55), D8@22.3Å(now 17.2,conf 0.37)
  - G28↔W24: targets 47.6/36.2Å but partners are 5.5Å apart → too_close_together by 6.0Å
  - W24↔N27: targets 36.2/47.4Å but partners are 5.9Å apart → too_close_together by 5.4Å
  - V18↔M13: targets 37.0/19.2Å but partners are 9.1Å apart → too_close_together by 8.7Å
- **E15** — severity 125.29, 94 conflict(s); suspect input ~`G28` (group: push_out)
  - pull-in (wants closer): G1@23.0Å(now 26.7,conf 0.38), G33@19.8Å(now 24.2,conf 0.33), S32@15.6Å(now 22.6,conf 0.28), G28@14.0Å(now 20.4,conf 0.27), G29@16.0Å(now 18.7,conf 0.28), E23@7.4Å(now 15.4,conf 0.37), I22@7.5Å(now 12.9,conf 0.36), W24@11.8Å(now 14.9,conf 0.27)
  - push-out (wants farther): Q12@9.2Å(now 5.5,conf 0.31), S7@17.4Å(now 14.0,conf 0.30), P36@21.5Å(now 15.2,conf 0.36), L25@22.0Å(now 17.2,conf 0.36), L9@13.5Å(now 9.4,conf 0.26)
  - E23↔L25: targets 7.4/22.0Å but partners are 2.9Å apart → too_close_together by 11.7Å
  - G1↔E23: targets 23.0/7.4Å but partners are 40.5Å apart → too_far_apart by 10.1Å
  - I22↔L25: targets 7.5/22.0Å but partners are 5.7Å apart → too_close_together by 8.8Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=13 · 3-10(G)=3 · coil(C)=4

```
EECHHHHEHHEECEHCEGGEHHHHEHEHHHGHECHEE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=6 · sheet=17
  - F5 ↔ L9  (helix)
  - T6 ↔ S10  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - K26 ↔ P30  (helix)
  - G28 ↔ S32  (helix)
  - D8 ↔ E14  (sheet)
  - K11 ↔ A17  (sheet)
  - Q12 ↔ A17  (sheet)
  - Q12 ↔ L20  (sheet)
  - E14 ↔ L20  (sheet)
  - A17 ↔ P36  (sheet)
  - A17 ↔ P37  (sheet)
  - L20 ↔ L25  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - L25 ↔ G33  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=100 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=12 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5282 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
