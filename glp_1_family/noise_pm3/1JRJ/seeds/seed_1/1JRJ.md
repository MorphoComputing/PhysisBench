# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm3\1JRJ\seeds\seed_1\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.421 A
- tm_score_ca_ordered: 0.36472190201705934
- heavy_atom_rmsd: 4.676 A
- sidechain_heavy_atom_rmsd: 5.654 A
- **all-atom quality (honest):** heavy 4.676 A, sidechain 5.654 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 599
- bin_accuracy: 0.404

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 15% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** G1-G33 → 2177 conflicts (100%)
- explained: 2177/2179 conflicts by 1 root cause(s)
- metrics: hubs=37 (frac 1.0), conflicts/hub=58.9, max_incompat=12.35Å, chain_span=0.973
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): G1-G33 — explain ~2177/2179 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T4** — severity 172.28, 119 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): E23@27.1Å(now 31.1,conf 0.44), L9@6.6Å(now 12.1,conf 0.41), K11@9.4Å(now 14.3,conf 0.30), E16@17.2Å(now 20.2,conf 0.29)
  - push-out (wants farther): P30@43.0Å(now 38.1,conf 0.55), N27@39.6Å(now 36.1,conf 0.55), P35@37.3Å(now 34.5,conf 0.55), P36@37.2Å(now 32.0,conf 0.55), W24@34.9Å(now 31.3,conf 0.54), P37@31.0Å(now 28.3,conf 0.50), F21@30.7Å(now 28.0,conf 0.49), E14@20.2Å(now 17.5,conf 0.34)
  - P36↔L9: targets 37.2/6.6Å but partners are 20.5Å apart → too_close_together by 10.1Å
  - P30↔L9: targets 43.0/6.6Å but partners are 27.4Å apart → too_close_together by 9.0Å
  - P37↔L9: targets 31.0/6.6Å but partners are 16.8Å apart → too_close_together by 7.6Å
- **P30** — severity 168.44, 104 conflict(s); suspect input ~`F21` (group: pull_in)
  - pull-in (wants closer): S10@22.9Å(now 27.5,conf 0.38), K11@21.7Å(now 25.3,conf 0.36), F21@7.6Å(now 10.2,conf 0.36), A17@13.3Å(now 16.8,conf 0.26)
  - push-out (wants farther): E2@49.2Å(now 43.1,conf 0.55), T4@43.0Å(now 38.1,conf 0.55), S7@39.7Å(now 32.8,conf 0.55), T6@36.5Å(now 33.0,conf 0.55), D8@32.4Å(now 29.3,conf 0.52), G33@10.3Å(now 4.9,conf 0.28), E23@14.2Å(now 9.3,conf 0.27)
  - S7↔S10: targets 39.7/22.9Å but partners are 7.2Å apart → too_close_together by 9.7Å
  - S7↔F21: targets 39.7/7.6Å but partners are 22.6Å apart → too_close_together by 9.4Å
  - S7↔K11: targets 39.7/21.7Å but partners are 8.8Å apart → too_close_together by 9.2Å
- **E2** — severity 167.22, 105 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): S32@41.0Å(now 43.6,conf 0.55), A34@36.5Å(now 40.9,conf 0.55), R19@25.3Å(now 30.1,conf 0.41), E16@20.8Å(now 25.0,conf 0.35), M13@17.6Å(now 21.5,conf 0.30), S7@9.7Å(now 12.5,conf 0.29)
  - push-out (wants farther): P30@49.2Å(now 43.1,conf 0.55), N27@45.4Å(now 41.8,conf 0.55), W24@40.2Å(now 36.2,conf 0.55), V18@36.0Å(now 28.7,conf 0.54), A17@30.5Å(now 26.6,conf 0.49), T6@15.2Å(now 12.2,conf 0.27), F5@13.5Å(now 9.2,conf 0.26)
  - P30↔A34: targets 49.2/36.5Å but partners are 5.4Å apart → too_close_together by 7.2Å
  - P30↔F21: targets 49.2/31.1Å but partners are 10.2Å apart → too_close_together by 7.8Å
  - V18↔E16: targets 36.0/20.8Å but partners are 5.0Å apart → too_close_together by 10.2Å
- **S7** — severity 161.36, 106 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): G28@26.5Å(now 31.7,conf 0.43), E23@22.3Å(now 25.9,conf 0.37), F21@19.9Å(now 22.6,conf 0.33), E2@9.7Å(now 12.5,conf 0.29), P37@16.3Å(now 23.0,conf 0.28)
  - push-out (wants farther): S31@40.8Å(now 35.4,conf 0.55), P30@39.7Å(now 32.8,conf 0.55), N27@35.6Å(now 30.6,conf 0.54), P35@32.5Å(now 29.6,conf 0.52), W24@28.8Å(now 26.0,conf 0.47), R19@24.6Å(now 18.9,conf 0.40), E15@17.4Å(now 13.5,conf 0.30), K11@12.8Å(now 8.8,conf 0.27), G3@12.9Å(now 8.3,conf 0.26)
  - P30↔G28: targets 39.7/26.5Å but partners are 3.4Å apart → too_close_together by 9.7Å
  - P30↔P37: targets 39.7/16.3Å but partners are 11.0Å apart → too_close_together by 12.3Å
  - S31↔G28: targets 40.8/26.5Å but partners are 6.5Å apart → too_close_together by 7.8Å
- **G1** — severity 141.64, 103 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): W24@36.2Å(now 39.2,conf 0.55), E15@23.0Å(now 26.6,conf 0.38), M13@19.2Å(now 24.2,conf 0.32), S10@17.4Å(now 21.4,conf 0.29)
  - push-out (wants farther): N27@47.4Å(now 44.8,conf 0.55), P36@44.0Å(now 39.9,conf 0.55), E23@42.1Å(now 39.1,conf 0.55), V18@37.0Å(now 31.5,conf 0.55), A17@33.7Å(now 29.8,conf 0.53), D8@22.3Å(now 18.6,conf 0.37)
  - V18↔M13: targets 37.0/19.2Å but partners are 7.4Å apart → too_close_together by 10.4Å
  - V18↔E15: targets 37.0/23.0Å but partners are 5.3Å apart → too_close_together by 8.7Å
  - G28↔W24: targets 47.6/36.2Å but partners are 6.6Å apart → too_close_together by 4.8Å
- **G3** — severity 127.81, 94 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): P35@31.4Å(now 35.1,conf 0.50), P36@29.4Å(now 32.9,conf 0.48), E23@27.7Å(now 32.4,conf 0.45), R19@19.3Å(now 25.9,conf 0.32)
  - push-out (wants farther): G33@45.1Å(now 41.8,conf 0.55), S32@44.4Å(now 39.9,conf 0.55), G28@41.7Å(now 38.5,conf 0.55), P37@35.5Å(now 29.4,conf 0.54), I22@35.3Å(now 31.0,conf 0.54), M13@24.6Å(now 17.4,conf 0.40), S7@12.9Å(now 8.3,conf 0.26)
  - S32↔P36: targets 44.4/29.4Å but partners are 7.7Å apart → too_close_together by 7.3Å
  - I22↔R19: targets 35.3/19.3Å but partners are 5.5Å apart → too_close_together by 10.6Å
  - G33↔P36: targets 45.1/29.4Å but partners are 9.1Å apart → too_close_together by 6.5Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=17 · 3-10(G)=1 · coil(C)=0

```
EEEHHHHEHEEEEEHHHEHHHHGHEHEEHHHEHEHEE
```

## Backbone H-bond Network

- total=28 · helix(i→i+4)=7 · sheet=21
  - F5 ↔ L9  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - I22 ↔ K26  (helix)
  - K26 ↔ P30  (helix)
  - G29 ↔ G33  (helix)
  - S31 ↔ P35  (helix)
  - G3 ↔ D8  (sheet)
  - D8 ↔ M13  (sheet)
  - D8 ↔ E14  (sheet)
  - K11 ↔ V18  (sheet)
  - Q12 ↔ V18  (sheet)
  - M13 ↔ V18  (sheet)
  - V18 ↔ L25  (sheet)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)
  - L25 ↔ S32  (sheet)
  - L25 ↔ A34  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - … +8 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=98 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=14 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5439 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
