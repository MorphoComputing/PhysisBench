# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm3\1JRJ\seeds\seed_2\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.265 A
- tm_score_ca_ordered: 0.3231605370225565
- heavy_atom_rmsd: 4.595 A
- sidechain_heavy_atom_rmsd: 5.609 A
- **all-atom quality (honest):** heavy 4.595 A, sidechain 5.609 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 595
- bin_accuracy: 0.437

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 15% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** G1-G33 → 2150 conflicts (100%)
- explained: 2150/2150 conflicts by 1 root cause(s)
- metrics: hubs=37 (frac 1.0), conflicts/hub=58.1, max_incompat=12.42Å, chain_span=0.973
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): G1-G33 — explain ~2150/2150 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P30** — severity 165.27, 100 conflict(s); suspect input ~`F21` (group: pull_in)
  - pull-in (wants closer): S10@22.9Å(now 25.7,conf 0.38), A17@13.3Å(now 16.6,conf 0.26), F21@7.6Å(now 11.6,conf 0.36)
  - push-out (wants farther): S7@39.7Å(now 32.0,conf 0.55), T6@36.5Å(now 31.8,conf 0.55), T4@43.0Å(now 36.9,conf 0.55), D8@32.4Å(now 28.4,conf 0.52), E2@49.2Å(now 42.4,conf 0.55), G33@10.3Å(now 6.3,conf 0.28)
  - S7↔F21: targets 39.7/7.6Å but partners are 22.4Å apart → too_close_together by 9.7Å
  - S10↔E2: targets 22.9/49.2Å but partners are 17.8Å apart → too_close_together by 8.5Å
  - S10↔T4: targets 22.9/43.0Å but partners are 11.7Å apart → too_close_together by 8.4Å
- **T4** — severity 149.73, 104 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): E23@27.1Å(now 31.6,conf 0.44), L9@6.6Å(now 11.7,conf 0.41), K11@9.4Å(now 13.6,conf 0.30)
  - push-out (wants farther): P36@37.2Å(now 32.1,conf 0.55), W24@34.9Å(now 31.7,conf 0.54), N27@39.6Å(now 36.1,conf 0.55), F21@30.7Å(now 27.9,conf 0.49), P30@43.0Å(now 36.9,conf 0.55), P37@31.0Å(now 28.0,conf 0.50), E14@20.2Å(now 17.3,conf 0.34), D8@11.6Å(now 8.9,conf 0.27)
  - P30↔L9: targets 43.0/6.6Å but partners are 26.0Å apart → too_close_together by 10.4Å
  - P36↔L9: targets 37.2/6.6Å but partners are 20.8Å apart → too_close_together by 9.8Å
  - P37↔L9: targets 31.0/6.6Å but partners are 16.7Å apart → too_close_together by 7.8Å
- **E2** — severity 146.91, 92 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): A34@36.5Å(now 41.0,conf 0.55), R19@25.3Å(now 30.1,conf 0.41), E16@20.8Å(now 25.5,conf 0.35), M13@17.6Å(now 21.6,conf 0.30)
  - push-out (wants farther): N27@45.4Å(now 42.0,conf 0.55), W24@40.2Å(now 37.0,conf 0.55), A17@30.5Å(now 27.2,conf 0.49), P37@35.4Å(now 32.6,conf 0.54), P30@49.2Å(now 42.4,conf 0.55), V18@36.0Å(now 29.3,conf 0.54), F5@13.5Å(now 9.1,conf 0.26), T6@15.2Å(now 11.0,conf 0.27)
  - G29↔P30: targets 38.8/49.2Å but partners are 3.3Å apart → too_close_together by 7.1Å
  - V18↔E16: targets 36.0/20.8Å but partners are 4.0Å apart → too_close_together by 11.2Å
  - P30↔E16: targets 49.2/20.8Å but partners are 18.3Å apart → too_close_together by 10.1Å
- **S7** — severity 141.18, 93 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): G28@26.5Å(now 31.8,conf 0.43), P37@16.3Å(now 23.0,conf 0.28), E23@22.3Å(now 26.0,conf 0.37)
  - push-out (wants farther): N27@35.6Å(now 30.9,conf 0.54), P30@39.7Å(now 32.0,conf 0.55), W24@28.8Å(now 26.2,conf 0.47), S31@40.8Å(now 35.0,conf 0.55), S32@35.9Å(now 33.3,conf 0.54), R19@24.6Å(now 18.9,conf 0.40), K11@12.8Å(now 9.4,conf 0.27), E15@17.4Å(now 12.8,conf 0.30), G3@12.9Å(now 7.3,conf 0.26)
  - P30↔P37: targets 39.7/16.3Å but partners are 10.9Å apart → too_close_together by 12.4Å
  - P30↔G28: targets 39.7/26.5Å but partners are 5.4Å apart → too_close_together by 7.7Å
  - S31↔P37: targets 40.8/16.3Å but partners are 13.3Å apart → too_close_together by 11.1Å
- **G1** — severity 135.53, 97 conflict(s); suspect input ~`M13` (group: push_out)
  - pull-in (wants closer): L25@39.3Å(now 41.9,conf 0.55), P35@40.2Å(now 42.8,conf 0.55), E15@23.0Å(now 27.4,conf 0.38), W24@36.2Å(now 40.4,conf 0.55), M13@19.2Å(now 24.9,conf 0.32), S10@17.4Å(now 20.1,conf 0.29), F5@9.7Å(now 12.5,conf 0.30)
  - push-out (wants farther): V18@37.0Å(now 32.4,conf 0.55), A17@33.7Å(now 30.6,conf 0.53), P36@44.0Å(now 40.0,conf 0.55), D8@22.3Å(now 17.4,conf 0.37)
  - V18↔M13: targets 37.0/19.2Å but partners are 7.9Å apart → too_close_together by 9.9Å
  - V18↔E15: targets 37.0/23.0Å but partners are 6.1Å apart → too_close_together by 7.9Å
  - W24↔N27: targets 36.2/47.4Å but partners are 6.2Å apart → too_close_together by 5.0Å
- **G3** — severity 115.53, 91 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): E23@27.7Å(now 32.8,conf 0.45), P35@31.4Å(now 36.3,conf 0.50), R19@19.3Å(now 25.8,conf 0.32), P36@29.4Å(now 33.5,conf 0.48)
  - push-out (wants farther): G33@45.1Å(now 42.4,conf 0.55), S32@44.4Å(now 40.2,conf 0.55), I22@35.3Å(now 31.0,conf 0.54), G28@41.7Å(now 39.0,conf 0.55), P37@35.5Å(now 29.6,conf 0.54), M13@24.6Å(now 17.4,conf 0.40), S7@12.9Å(now 7.3,conf 0.26)
  - S32↔P36: targets 44.4/29.4Å but partners are 7.6Å apart → too_close_together by 7.5Å
  - I22↔R19: targets 35.3/19.3Å but partners are 5.5Å apart → too_close_together by 10.5Å
  - G33↔P36: targets 45.1/29.4Å but partners are 9.1Å apart → too_close_together by 6.6Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=11 · 3-10(G)=6 · coil(C)=4

```
CEGHHHHEHEEECHHHHHHGGHHEEHECHEGGGCHEE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=6 · sheet=9
  - F5 ↔ L9  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ P30  (sheet)
  - W24 ↔ P36  (sheet)
  - W24 ↔ P37  (sheet)
  - L25 ↔ P30  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - N27 ↔ P36  (sheet)
  - P30 ↔ P36  (sheet)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=21 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=91 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=6 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5366 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
