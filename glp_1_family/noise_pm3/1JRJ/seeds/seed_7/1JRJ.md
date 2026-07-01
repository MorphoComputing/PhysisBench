# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm3\1JRJ\seeds\seed_7\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.318 A
- tm_score_ca_ordered: 0.4731400581844641
- heavy_atom_rmsd: 4.174 A
- sidechain_heavy_atom_rmsd: 5.153 A
- **all-atom quality (honest):** heavy 4.174 A, sidechain 5.153 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 599
- bin_accuracy: 0.429

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 15% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** G1-G33 → 2264 conflicts (100%)
- explained: 2264/2265 conflicts by 1 root cause(s)
- metrics: hubs=37 (frac 1.0), conflicts/hub=61.2, max_incompat=13.08Å, chain_span=0.973
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): G1-G33 — explain ~2264/2265 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T4** — severity 182.24, 134 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): A34@34.1Å(now 36.8,conf 0.53), E23@27.1Å(now 30.9,conf 0.44), L9@6.6Å(now 10.8,conf 0.41), V18@20.7Å(now 24.1,conf 0.34), K11@9.4Å(now 13.9,conf 0.30), E16@17.2Å(now 20.3,conf 0.29), M13@13.7Å(now 16.3,conf 0.27)
  - push-out (wants farther): P30@43.0Å(now 38.5,conf 0.55), N27@39.6Å(now 36.4,conf 0.55), P36@37.2Å(now 32.5,conf 0.55), W24@34.9Å(now 31.4,conf 0.54), F21@30.7Å(now 28.2,conf 0.49), D8@11.6Å(now 9.0,conf 0.27)
  - P36↔L9: targets 37.2/6.6Å but partners are 21.6Å apart → too_close_together by 8.9Å
  - P30↔L9: targets 43.0/6.6Å but partners are 27.8Å apart → too_close_together by 8.6Å
  - W24↔L9: targets 34.9/6.6Å but partners are 20.9Å apart → too_close_together by 7.4Å
- **P30** — severity 172.16, 112 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): L25@6.1Å(now 9.5,conf 0.44), W24@7.0Å(now 10.3,conf 0.39), S10@22.9Å(now 27.2,conf 0.38), K11@21.7Å(now 25.4,conf 0.36), F21@7.6Å(now 11.2,conf 0.36), A17@13.3Å(now 16.4,conf 0.26)
  - push-out (wants farther): E2@49.2Å(now 43.8,conf 0.55), T4@43.0Å(now 38.5,conf 0.55), S7@39.7Å(now 32.3,conf 0.55), T6@36.5Å(now 33.5,conf 0.55), D8@32.4Å(now 29.7,conf 0.52), G33@10.3Å(now 5.3,conf 0.28)
  - S7↔S10: targets 39.7/22.9Å but partners are 6.2Å apart → too_close_together by 10.6Å
  - S7↔L9: targets 39.7/25.6Å but partners are 5.5Å apart → too_close_together by 8.5Å
  - S7↔F21: targets 39.7/7.6Å but partners are 22.7Å apart → too_close_together by 9.3Å
- **S7** — severity 168.20, 113 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): G28@26.5Å(now 32.1,conf 0.43), L25@25.4Å(now 28.1,conf 0.41), E23@22.3Å(now 26.2,conf 0.37), I22@21.7Å(now 24.2,conf 0.36), F21@19.9Å(now 22.7,conf 0.33), P37@16.3Å(now 22.5,conf 0.28)
  - push-out (wants farther): S31@40.8Å(now 34.6,conf 0.55), P30@39.7Å(now 32.3,conf 0.55), S32@35.9Å(now 33.2,conf 0.54), N27@35.6Å(now 31.2,conf 0.54), P35@32.5Å(now 28.9,conf 0.52), W24@28.8Å(now 26.2,conf 0.47), R19@24.6Å(now 19.1,conf 0.40), E15@17.4Å(now 13.6,conf 0.30), K11@12.8Å(now 9.3,conf 0.27), G3@12.9Å(now 9.9,conf 0.26)
  - P30↔P37: targets 39.7/16.3Å but partners are 10.3Å apart → too_close_together by 13.1Å
  - S31↔P37: targets 40.8/16.3Å but partners are 12.8Å apart → too_close_together by 11.7Å
  - P30↔G28: targets 39.7/26.5Å but partners are 5.7Å apart → too_close_together by 7.5Å
- **E2** — severity 157.75, 98 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): S32@41.0Å(now 44.3,conf 0.55), G29@38.8Å(now 41.3,conf 0.55), A34@36.5Å(now 41.6,conf 0.55), R19@25.3Å(now 29.8,conf 0.41), E16@20.8Å(now 25.4,conf 0.35), M13@17.6Å(now 21.7,conf 0.30)
  - push-out (wants farther): P30@49.2Å(now 43.8,conf 0.55), N27@45.4Å(now 42.1,conf 0.55), W24@40.2Å(now 36.6,conf 0.55), V18@36.0Å(now 29.9,conf 0.54), A17@30.5Å(now 27.6,conf 0.49), T6@15.2Å(now 10.8,conf 0.27), F5@13.5Å(now 9.1,conf 0.26)
  - P30↔G29: targets 49.2/38.8Å but partners are 4.0Å apart → too_close_together by 6.4Å
  - P30↔E16: targets 49.2/20.8Å but partners are 18.5Å apart → too_close_together by 9.9Å
  - P30↔F21: targets 49.2/31.1Å but partners are 11.2Å apart → too_close_together by 6.8Å
- **G1** — severity 150.06, 107 conflict(s); suspect input ~`M13` (group: push_out)
  - pull-in (wants closer): S31@45.8Å(now 48.9,conf 0.55), P35@40.2Å(now 43.1,conf 0.55), L25@39.3Å(now 41.9,conf 0.55), W24@36.2Å(now 39.8,conf 0.55), E15@23.0Å(now 27.1,conf 0.38), M13@19.2Å(now 24.9,conf 0.32), F5@9.7Å(now 12.2,conf 0.30), S10@17.4Å(now 20.7,conf 0.29)
  - push-out (wants farther): P36@44.0Å(now 40.7,conf 0.55), E23@42.1Å(now 39.5,conf 0.55), V18@37.0Å(now 32.9,conf 0.55), A17@33.7Å(now 30.7,conf 0.53), D8@22.3Å(now 17.8,conf 0.37)
  - V18↔M13: targets 37.0/19.2Å but partners are 9.0Å apart → too_close_together by 8.7Å
  - P36↔M13: targets 44.0/19.2Å but partners are 16.3Å apart → too_close_together by 8.4Å
  - A17↔M13: targets 33.7/19.2Å but partners are 6.3Å apart → too_close_together by 8.1Å
- **G3** — severity 138.37, 98 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): P35@31.4Å(now 36.5,conf 0.50), P36@29.4Å(now 34.0,conf 0.48), E23@27.7Å(now 32.0,conf 0.45), V18@22.7Å(now 26.2,conf 0.38), R19@19.3Å(now 25.6,conf 0.32)
  - push-out (wants farther): G33@45.1Å(now 42.4,conf 0.55), S32@44.4Å(now 40.4,conf 0.55), G28@41.7Å(now 39.0,conf 0.55), P37@35.5Å(now 30.7,conf 0.54), I22@35.3Å(now 31.3,conf 0.54), M13@24.6Å(now 17.9,conf 0.40), S7@12.9Å(now 9.9,conf 0.26)
  - I22↔R19: targets 35.3/19.3Å but partners are 5.7Å apart → too_close_together by 10.4Å
  - S32↔P36: targets 44.4/29.4Å but partners are 8.1Å apart → too_close_together by 6.9Å
  - G33↔P36: targets 45.1/29.4Å but partners are 9.2Å apart → too_close_together by 6.5Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=10 · 3-10(G)=4 · coil(C)=0

```
EEHGHHHHHHEGHHHHEHHHHHGHEHEEHHHHHEGEE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=12 · sheet=11
  - G3 ↔ S7  (helix)
  - F5 ↔ L9  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - E16 ↔ L20  (helix)
  - V18 ↔ I22  (helix)
  - L20 ↔ W24  (helix)
  - I22 ↔ K26  (helix)
  - K26 ↔ P30  (helix)
  - G29 ↔ G33  (helix)
  - K11 ↔ A17  (sheet)
  - A17 ↔ P36  (sheet)
  - A17 ↔ P37  (sheet)
  - L25 ↔ A34  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P36  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=104 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5458 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
