# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm3\1JRJ\seeds\seed_5\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.557 A
- tm_score_ca_ordered: 0.24342841302207774
- heavy_atom_rmsd: 5.826 A
- sidechain_heavy_atom_rmsd: 6.867 A
- **all-atom quality (honest):** heavy 5.826 A, sidechain 6.867 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 595
- bin_accuracy: 0.422

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 15% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** G1-G33 → 2257 conflicts (100%)
- explained: 2257/2258 conflicts by 1 root cause(s)
- metrics: hubs=37 (frac 1.0), conflicts/hub=61.0, max_incompat=12.1Å, chain_span=0.973
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): G1-G33 — explain ~2257/2258 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T4** — severity 192.57, 134 conflict(s); suspect input ~`L9` (group: push_out)
  - pull-in (wants closer): A34@34.1Å(now 37.5,conf 0.53), E23@27.1Å(now 30.9,conf 0.44), L9@6.6Å(now 11.7,conf 0.41), L20@23.1Å(now 25.7,conf 0.38), V18@20.7Å(now 25.0,conf 0.34), A17@20.6Å(now 23.2,conf 0.34), K11@9.4Å(now 14.2,conf 0.30), E16@17.2Å(now 20.9,conf 0.29), M13@13.7Å(now 17.3,conf 0.27)
  - push-out (wants farther): P30@43.0Å(now 38.2,conf 0.55), N27@39.6Å(now 36.5,conf 0.55), P36@37.2Å(now 32.8,conf 0.55), W24@34.9Å(now 31.8,conf 0.54)
  - P36↔L9: targets 37.2/6.6Å but partners are 21.3Å apart → too_close_together by 9.3Å
  - P30↔L9: targets 43.0/6.6Å but partners are 27.3Å apart → too_close_together by 9.0Å
  - P30↔E23: targets 43.0/27.1Å but partners are 8.4Å apart → too_close_together by 7.4Å
- **S7** — severity 166.55, 110 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): G28@26.5Å(now 30.8,conf 0.43), V18@16.7Å(now 19.9,conf 0.29), E14@10.3Å(now 14.1,conf 0.28), P37@16.3Å(now 22.8,conf 0.28), A17@14.7Å(now 18.1,conf 0.27)
  - push-out (wants farther): S31@40.8Å(now 33.7,conf 0.55), P30@39.7Å(now 31.8,conf 0.55), S32@35.9Å(now 32.9,conf 0.54), N27@35.6Å(now 30.4,conf 0.54), W24@28.8Å(now 25.2,conf 0.47), R19@24.6Å(now 18.7,conf 0.40), E15@17.4Å(now 13.4,conf 0.30), K11@12.8Å(now 9.5,conf 0.27), G3@12.9Å(now 7.4,conf 0.26)
  - P30↔G28: targets 39.7/26.5Å but partners are 3.6Å apart → too_close_together by 9.6Å
  - S31↔G28: targets 40.8/26.5Å but partners are 5.7Å apart → too_close_together by 8.6Å
  - P30↔L25: targets 39.7/25.4Å but partners are 6.0Å apart → too_close_together by 8.3Å
- **P30** — severity 163.43, 108 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): S10@22.9Å(now 27.3,conf 0.38), K11@21.7Å(now 25.1,conf 0.36), A17@13.3Å(now 16.7,conf 0.26)
  - push-out (wants farther): E2@49.2Å(now 42.6,conf 0.55), T4@43.0Å(now 38.2,conf 0.55), G3@41.5Å(now 39.0,conf 0.55), S7@39.7Å(now 31.8,conf 0.55), T6@36.5Å(now 32.4,conf 0.55), D8@32.4Å(now 28.5,conf 0.52), E15@22.4Å(now 19.7,conf 0.37), G33@10.3Å(now 4.8,conf 0.28), E23@14.2Å(now 8.4,conf 0.27)
  - S7↔S10: targets 39.7/22.9Å but partners are 7.0Å apart → too_close_together by 9.8Å
  - S7↔F21: targets 39.7/7.6Å but partners are 22.1Å apart → too_close_together by 10.0Å
  - T4↔S10: targets 43.0/22.9Å but partners are 11.4Å apart → too_close_together by 8.7Å
- **E2** — severity 158.15, 99 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): A34@36.5Å(now 41.3,conf 0.55), R19@25.3Å(now 30.2,conf 0.41), E16@20.8Å(now 25.6,conf 0.35), M13@17.6Å(now 22.7,conf 0.30)
  - push-out (wants farther): P30@49.2Å(now 42.6,conf 0.55), N27@45.4Å(now 41.8,conf 0.55), W24@40.2Å(now 35.7,conf 0.55), V18@36.0Å(now 31.1,conf 0.54), P37@35.4Å(now 32.6,conf 0.54), T6@15.2Å(now 10.6,conf 0.27), F5@13.5Å(now 10.2,conf 0.26)
  - P30↔F21: targets 49.2/31.1Å but partners are 9.8Å apart → too_close_together by 8.2Å
  - P30↔A34: targets 49.2/36.5Å but partners are 5.3Å apart → too_close_together by 7.3Å
  - P30↔R19: targets 49.2/25.3Å but partners are 14.7Å apart → too_close_together by 9.1Å
- **G1** — severity 154.44, 113 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): P35@40.2Å(now 43.9,conf 0.55), W24@36.2Å(now 38.8,conf 0.55), E15@23.0Å(now 27.3,conf 0.38), M13@19.2Å(now 26.0,conf 0.32), F5@9.7Å(now 12.9,conf 0.30), S10@17.4Å(now 20.6,conf 0.29)
  - push-out (wants farther): G28@47.6Å(now 44.9,conf 0.55), N27@47.4Å(now 44.7,conf 0.55), P36@44.0Å(now 40.3,conf 0.55), E23@42.1Å(now 38.7,conf 0.55), V18@37.0Å(now 34.0,conf 0.55), D8@22.3Å(now 17.5,conf 0.37)
  - V18↔M13: targets 37.0/19.2Å but partners are 8.7Å apart → too_close_together by 9.1Å
  - P36↔M13: targets 44.0/19.2Å but partners are 16.1Å apart → too_close_together by 8.7Å
  - A17↔M13: targets 33.7/19.2Å but partners are 6.0Å apart → too_close_together by 8.4Å
- **G3** — severity 146.13, 101 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): P35@31.4Å(now 37.2,conf 0.50), P36@29.4Å(now 33.7,conf 0.48), E23@27.7Å(now 31.8,conf 0.45), V18@22.7Å(now 27.0,conf 0.38), R19@19.3Å(now 26.0,conf 0.32)
  - push-out (wants farther): G33@45.1Å(now 42.4,conf 0.55), S32@44.4Å(now 40.0,conf 0.55), G28@41.7Å(now 38.1,conf 0.55), P30@41.5Å(now 39.0,conf 0.55), P37@35.5Å(now 29.6,conf 0.54), I22@35.3Å(now 30.8,conf 0.54), M13@24.6Å(now 19.2,conf 0.40), S10@16.2Å(now 13.5,conf 0.28), S7@12.9Å(now 7.4,conf 0.26)
  - I22↔R19: targets 35.3/19.3Å but partners are 5.2Å apart → too_close_together by 10.9Å
  - G33↔P35: targets 45.1/31.4Å but partners are 6.8Å apart → too_close_together by 6.9Å
  - G28↔E23: targets 41.7/27.7Å but partners are 6.5Å apart → too_close_together by 7.6Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=16 · 3-10(G)=1 · coil(C)=0

```
EEEHEHHEHEHEEHEHEHEEHHHHHHHEHGHEHHHEE
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=7 · sheet=23
  - S7 ↔ K11  (helix)
  - E14 ↔ V18  (helix)
  - V18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - N27 ↔ S31  (helix)
  - G29 ↔ G33  (helix)
  - S31 ↔ P35  (helix)
  - G3 ↔ D8  (sheet)
  - F5 ↔ S10  (sheet)
  - F5 ↔ Q12  (sheet)
  - D8 ↔ M13  (sheet)
  - D8 ↔ E15  (sheet)
  - S10 ↔ E15  (sheet)
  - S10 ↔ A17  (sheet)
  - Q12 ↔ A17  (sheet)
  - Q12 ↔ R19  (sheet)
  - Q12 ↔ L20  (sheet)
  - M13 ↔ R19  (sheet)
  - M13 ↔ L20  (sheet)
  - E15 ↔ L20  (sheet)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=102 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5502 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
