# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm3\1JRJ\seeds\seed_4\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.446 A
- tm_score_ca_ordered: 0.3472798074446468
- heavy_atom_rmsd: 4.879 A
- sidechain_heavy_atom_rmsd: 5.882 A
- **all-atom quality (honest):** heavy 4.879 A, sidechain 5.882 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 599
- bin_accuracy: 0.397

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 15% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** G1-G33 → 2318 conflicts (100%)
- explained: 2318/2321 conflicts by 1 root cause(s)
- metrics: hubs=37 (frac 1.0), conflicts/hub=62.7, max_incompat=12.03Å, chain_span=0.973
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): G1-G33 — explain ~2318/2321 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G1** — severity 155.44, 122 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): S31@45.8Å(now 48.5,conf 0.55), W24@36.2Å(now 39.0,conf 0.55), E15@23.0Å(now 26.7,conf 0.38), M13@19.2Å(now 24.6,conf 0.32), F5@9.7Å(now 12.2,conf 0.30), S10@17.4Å(now 21.2,conf 0.29)
  - push-out (wants farther): G33@51.1Å(now 48.4,conf 0.56), G28@47.6Å(now 45.0,conf 0.55), N27@47.4Å(now 44.6,conf 0.55), P36@44.0Å(now 39.7,conf 0.55), E23@42.1Å(now 39.4,conf 0.55), V18@37.0Å(now 32.4,conf 0.55), R19@34.7Å(now 32.0,conf 0.54), A17@33.7Å(now 29.7,conf 0.53), D8@22.3Å(now 17.6,conf 0.37)
  - V18↔M13: targets 37.0/19.2Å but partners are 8.0Å apart → too_close_together by 9.8Å
  - V18↔E15: targets 37.0/23.0Å but partners are 6.1Å apart → too_close_together by 7.9Å
  - A17↔M13: targets 33.7/19.2Å but partners are 6.9Å apart → too_close_together by 7.6Å
- **P30** — severity 154.22, 94 conflict(s); suspect input ~`F21` (group: push_out)
  - pull-in (wants closer): L9@25.6Å(now 29.0,conf 0.42), Q12@23.5Å(now 26.1,conf 0.39), S10@22.9Å(now 29.1,conf 0.38), K11@21.7Å(now 26.4,conf 0.36), F21@7.6Å(now 11.2,conf 0.36), M13@21.3Å(now 24.0,conf 0.35), E14@19.3Å(now 22.1,conf 0.32), A17@13.3Å(now 17.6,conf 0.26)
  - push-out (wants farther): E2@49.2Å(now 44.1,conf 0.55), T4@43.0Å(now 39.6,conf 0.55), S7@39.7Å(now 34.0,conf 0.55), N27@7.7Å(now 4.2,conf 0.35), G33@10.3Å(now 4.2,conf 0.28), E23@14.2Å(now 9.2,conf 0.27)
  - S7↔S10: targets 39.7/22.9Å but partners are 8.0Å apart → too_close_together by 8.8Å
  - S7↔F21: targets 39.7/7.6Å but partners are 23.2Å apart → too_close_together by 8.9Å
  - E2↔F21: targets 49.2/7.6Å but partners are 33.0Å apart → too_close_together by 8.5Å
- **T4** — severity 150.88, 109 conflict(s); suspect input ~`L9` (group: push_out)
  - pull-in (wants closer): A34@34.1Å(now 37.1,conf 0.53), E23@27.1Å(now 31.9,conf 0.44), L9@6.6Å(now 12.4,conf 0.41), V18@20.7Å(now 24.0,conf 0.34), K11@9.4Å(now 15.3,conf 0.30), E16@17.2Å(now 20.7,conf 0.29), S10@10.0Å(now 12.9,conf 0.29)
  - push-out (wants farther): P30@43.0Å(now 39.6,conf 0.55), N27@39.6Å(now 36.9,conf 0.55), P36@37.2Å(now 32.8,conf 0.55), W24@34.9Å(now 32.1,conf 0.54), E14@20.2Å(now 17.6,conf 0.34)
  - P36↔L9: targets 37.2/6.6Å but partners are 21.4Å apart → too_close_together by 9.1Å
  - P30↔L9: targets 43.0/6.6Å but partners are 29.0Å apart → too_close_together by 7.4Å
  - P35↔L9: targets 37.3/6.6Å but partners are 23.4Å apart → too_close_together by 7.2Å
- **S7** — severity 147.00, 95 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): G28@26.5Å(now 31.5,conf 0.43), L25@25.4Å(now 28.2,conf 0.41), E23@22.3Å(now 26.4,conf 0.37), F21@19.9Å(now 23.2,conf 0.33), P37@16.3Å(now 23.5,conf 0.28)
  - push-out (wants farther): S31@40.8Å(now 36.3,conf 0.55), P30@39.7Å(now 34.0,conf 0.55), N27@35.6Å(now 31.2,conf 0.54), P35@32.5Å(now 29.6,conf 0.52), R19@24.6Å(now 18.6,conf 0.40), E15@17.4Å(now 13.0,conf 0.30), K11@12.8Å(now 9.8,conf 0.27), G3@12.9Å(now 8.0,conf 0.26)
  - P30↔G28: targets 39.7/26.5Å but partners are 4.4Å apart → too_close_together by 8.7Å
  - P30↔L25: targets 39.7/25.4Å but partners are 6.0Å apart → too_close_together by 8.3Å
  - P30↔P37: targets 39.7/16.3Å but partners are 11.3Å apart → too_close_together by 12.0Å
- **E2** — severity 144.42, 92 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): S32@41.0Å(now 43.9,conf 0.55), A34@36.5Å(now 41.4,conf 0.55), R19@25.3Å(now 28.8,conf 0.41), E16@20.8Å(now 25.1,conf 0.35), M13@17.6Å(now 21.5,conf 0.30)
  - push-out (wants farther): P30@49.2Å(now 44.1,conf 0.55), N27@45.4Å(now 41.8,conf 0.55), W24@40.2Å(now 36.1,conf 0.55), I22@36.9Å(now 34.2,conf 0.55), V18@36.0Å(now 29.4,conf 0.54), A17@30.5Å(now 26.8,conf 0.49), T6@15.2Å(now 12.1,conf 0.27), F5@13.5Å(now 9.2,conf 0.26)
  - P30↔A34: targets 49.2/36.5Å but partners are 5.5Å apart → too_close_together by 7.1Å
  - P30↔F21: targets 49.2/31.1Å but partners are 11.2Å apart → too_close_together by 6.8Å
  - V18↔E16: targets 36.0/20.8Å but partners are 5.8Å apart → too_close_together by 9.5Å
- **G3** — severity 138.75, 101 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): P35@31.4Å(now 35.1,conf 0.50), P36@29.4Å(now 33.2,conf 0.48), E23@27.7Å(now 32.7,conf 0.45), V18@22.7Å(now 25.4,conf 0.38), R19@19.3Å(now 25.1,conf 0.32)
  - push-out (wants farther): G33@45.1Å(now 41.8,conf 0.55), S32@44.4Å(now 40.1,conf 0.55), G28@41.7Å(now 38.2,conf 0.55), P37@35.5Å(now 29.7,conf 0.54), I22@35.3Å(now 30.5,conf 0.54), M13@24.6Å(now 17.6,conf 0.40), S7@12.9Å(now 8.0,conf 0.26)
  - S32↔P36: targets 44.4/29.4Å but partners are 7.6Å apart → too_close_together by 7.5Å
  - I22↔R19: targets 35.3/19.3Å but partners are 5.5Å apart → too_close_together by 10.5Å
  - G28↔E23: targets 41.7/27.7Å but partners are 6.7Å apart → too_close_together by 7.3Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=14 · 3-10(G)=0 · coil(C)=2

```
EECHHHHEHEEECHHHHHHEHHEHEHHHHHHEEEHEE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=10 · sheet=13
  - F5 ↔ L9  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - K26 ↔ P30  (helix)
  - N27 ↔ S31  (helix)
  - S31 ↔ P35  (helix)
  - L20 ↔ L25  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - E23 ↔ S32  (sheet)
  - E23 ↔ A34  (sheet)
  - E23 ↔ P36  (sheet)
  - E23 ↔ P37  (sheet)
  - L25 ↔ S32  (sheet)
  - L25 ↔ G33  (sheet)
  - L25 ↔ A34  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=102 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=21 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5351 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
