# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm3\1JRJ\seeds\seed_9\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.259 A
- tm_score_ca_ordered: 0.24114069404501823
- heavy_atom_rmsd: 5.821 A
- sidechain_heavy_atom_rmsd: 7.218 A
- **all-atom quality (honest):** heavy 5.821 A, sidechain 7.218 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 599
- bin_accuracy: 0.386

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 15% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** G1-W24 → 2343 conflicts (99%)
- explained: 2343/2366 conflicts by 1 root cause(s)
- metrics: hubs=37 (frac 1.0), conflicts/hub=63.9, max_incompat=12.09Å, chain_span=0.973
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): G1-W24 — explain ~2343/2366 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T4** — severity 203.33, 150 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): E23@27.1Å(now 30.6,conf 0.44), L9@6.6Å(now 12.4,conf 0.41), V18@20.7Å(now 24.4,conf 0.34), K11@9.4Å(now 15.4,conf 0.30), E16@17.2Å(now 20.0,conf 0.29), M13@13.7Å(now 16.5,conf 0.27)
  - push-out (wants farther): G33@43.0Å(now 40.2,conf 0.55), P30@43.0Å(now 38.8,conf 0.55), N27@39.6Å(now 36.4,conf 0.55), P35@37.3Å(now 34.2,conf 0.55), P36@37.2Å(now 32.0,conf 0.55), W24@34.9Å(now 31.2,conf 0.54), P37@31.0Å(now 28.1,conf 0.50), F21@30.7Å(now 28.0,conf 0.49)
  - P36↔L9: targets 37.2/6.6Å but partners are 20.5Å apart → too_close_together by 10.1Å
  - P30↔L9: targets 43.0/6.6Å but partners are 27.5Å apart → too_close_together by 8.9Å
  - P37↔L9: targets 31.0/6.6Å but partners are 16.4Å apart → too_close_together by 8.1Å
- **G1** — severity 168.88, 122 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): E15@23.0Å(now 26.6,conf 0.38), M13@19.2Å(now 24.5,conf 0.32)
  - push-out (wants farther): G33@51.1Å(now 47.1,conf 0.56), S32@48.3Å(now 45.0,conf 0.55), G28@47.6Å(now 44.6,conf 0.55), N27@47.4Å(now 44.0,conf 0.55), G29@44.9Å(now 42.1,conf 0.55), P36@44.0Å(now 38.6,conf 0.55), E23@42.1Å(now 38.2,conf 0.55), V18@37.0Å(now 32.4,conf 0.55), A17@33.7Å(now 29.6,conf 0.53), D8@22.3Å(now 16.5,conf 0.37)
  - N27↔W24: targets 47.4/36.2Å but partners are 5.8Å apart → too_close_together by 5.4Å
  - G28↔W24: targets 47.6/36.2Å but partners are 6.1Å apart → too_close_together by 5.3Å
  - E23↔M13: targets 42.1/19.2Å but partners are 14.1Å apart → too_close_together by 8.8Å
- **P30** — severity 167.38, 105 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): S10@22.9Å(now 28.2,conf 0.38), K11@21.7Å(now 24.8,conf 0.36), F21@7.6Å(now 10.9,conf 0.36), A17@13.3Å(now 17.1,conf 0.26)
  - push-out (wants farther): E2@49.2Å(now 43.3,conf 0.55), T4@43.0Å(now 38.8,conf 0.55), S7@39.7Å(now 33.3,conf 0.55), T6@36.5Å(now 33.2,conf 0.55), D8@32.4Å(now 29.8,conf 0.52), N27@7.7Å(now 4.7,conf 0.35), G33@10.3Å(now 3.8,conf 0.28), E23@14.2Å(now 11.2,conf 0.27)
  - S7↔S10: targets 39.7/22.9Å but partners are 6.2Å apart → too_close_together by 10.6Å
  - S7↔F21: targets 39.7/7.6Å but partners are 22.7Å apart → too_close_together by 9.4Å
  - E2↔F21: targets 49.2/7.6Å but partners are 32.6Å apart → too_close_together by 8.9Å
- **E2** — severity 164.69, 105 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): A34@36.5Å(now 39.8,conf 0.55), R19@25.3Å(now 29.6,conf 0.41), E16@20.8Å(now 24.8,conf 0.35), M13@17.6Å(now 21.6,conf 0.30)
  - push-out (wants farther): P30@49.2Å(now 43.3,conf 0.55), N27@45.4Å(now 41.4,conf 0.55), W24@40.2Å(now 35.9,conf 0.55), E23@38.0Å(now 35.0,conf 0.55), I22@36.9Å(now 34.3,conf 0.55), V18@36.0Å(now 30.0,conf 0.54), P37@35.4Å(now 32.4,conf 0.54), A17@30.5Å(now 27.4,conf 0.49), F5@13.5Å(now 9.2,conf 0.26)
  - P30↔F21: targets 49.2/31.1Å but partners are 10.9Å apart → too_close_together by 7.1Å
  - P30↔E16: targets 49.2/20.8Å but partners are 18.9Å apart → too_close_together by 9.5Å
  - P30↔R19: targets 49.2/25.3Å but partners are 16.5Å apart → too_close_together by 7.3Å
- **S7** — severity 164.33, 109 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): G28@26.5Å(now 31.7,conf 0.43), E23@22.3Å(now 25.6,conf 0.37), F21@19.9Å(now 22.7,conf 0.33), P37@16.3Å(now 22.6,conf 0.28)
  - push-out (wants farther): S31@40.8Å(now 35.2,conf 0.55), P30@39.7Å(now 33.3,conf 0.55), S32@35.9Å(now 33.0,conf 0.54), N27@35.6Å(now 30.9,conf 0.54), P35@32.5Å(now 29.0,conf 0.52), W24@28.8Å(now 25.9,conf 0.47), R19@24.6Å(now 19.1,conf 0.40), E15@17.4Å(now 14.1,conf 0.30), K11@12.8Å(now 9.8,conf 0.27), G3@12.9Å(now 8.3,conf 0.26)
  - P30↔G28: targets 39.7/26.5Å but partners are 5.2Å apart → too_close_together by 8.0Å
  - P30↔P37: targets 39.7/16.3Å but partners are 11.3Å apart → too_close_together by 12.1Å
  - S31↔P37: targets 40.8/16.3Å but partners are 13.0Å apart → too_close_together by 11.4Å
- **G3** — severity 153.60, 107 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): K26@32.5Å(now 35.1,conf 0.52), P35@31.4Å(now 34.9,conf 0.50), P36@29.4Å(now 33.1,conf 0.48), E23@27.7Å(now 32.5,conf 0.45), V18@22.7Å(now 26.8,conf 0.38), R19@19.3Å(now 26.8,conf 0.32), E15@18.2Å(now 21.0,conf 0.31)
  - push-out (wants farther): G33@45.1Å(now 41.5,conf 0.55), S32@44.4Å(now 39.4,conf 0.55), G28@41.7Å(now 38.9,conf 0.55), P37@35.5Å(now 29.3,conf 0.54), I22@35.3Å(now 31.4,conf 0.54), M13@24.6Å(now 18.9,conf 0.40), S7@12.9Å(now 8.3,conf 0.26)
  - I22↔R19: targets 35.3/19.3Å but partners are 5.3Å apart → too_close_together by 10.8Å
  - G33↔P36: targets 45.1/29.4Å but partners are 8.6Å apart → too_close_together by 7.0Å
  - S32↔P36: targets 44.4/29.4Å but partners are 8.1Å apart → too_close_together by 7.0Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=12 · 3-10(G)=7 · coil(C)=3

```
EECHGHHCHEEEGHEEGCHEHHHEHHEGGHHHGGHEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=5 · sheet=14
  - R19 ↔ E23  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - K26 ↔ P30  (helix)
  - S31 ↔ P35  (helix)
  - S10 ↔ E15  (sheet)
  - S10 ↔ E16  (sheet)
  - K11 ↔ E16  (sheet)
  - K11 ↔ L20  (sheet)
  - Q12 ↔ L20  (sheet)
  - E15 ↔ L20  (sheet)
  - E16 ↔ W24  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - W24 ↔ P36  (sheet)
  - W24 ↔ P37  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=21 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=98 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5559 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
