# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm3\3IOL\seeds\seed_7\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.602 A
- tm_score_ca_ordered: 0.08336115934921727
- heavy_atom_rmsd: 5.258 A
- sidechain_heavy_atom_rmsd: 6.318 A
- **all-atom quality (honest):** heavy 5.258 A, sidechain 6.318 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 245
- bin_accuracy: 0.412

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 13% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T1-Q13 → 435 conflicts (96%)
- explained: 435/451 conflicts by 1 root cause(s)
- metrics: hubs=24 (frac 1.0), conflicts/hub=18.8, max_incompat=9.64Å, chain_span=0.958
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T1-Q13 — explain ~435/451 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T1** — severity 53.00, 42 conflict(s); suspect input ~`Y9` (group: pull_in)
  - pull-in (wants closer): A20@23.4Å(now 26.1,conf 0.39), F18@20.3Å(now 26.3,conf 0.34), A15@18.9Å(now 22.3,conf 0.32), Y9@10.0Å(now 13.1,conf 0.29)
  - push-out (wants farther): K24@35.4Å(now 32.1,conf 0.54), L22@33.8Å(now 29.8,conf 0.53), A14@22.8Å(now 20.2,conf 0.38), S4@8.7Å(now 4.0,conf 0.32), E11@19.1Å(now 14.3,conf 0.32), V6@10.7Å(now 7.9,conf 0.28)
  - L22↔S7: targets 33.8/6.0Å but partners are 22.2Å apart → too_close_together by 5.6Å
  - L22↔A20: targets 33.8/23.4Å but partners are 4.5Å apart → too_close_together by 5.9Å
  - K24↔S7: targets 35.4/6.0Å but partners are 24.5Å apart → too_close_together by 4.9Å
- **T3** — severity 49.17, 36 conflict(s); suspect input ~`Q13` (group: pull_in)
  - pull-in (wants closer): K24@26.6Å(now 30.7,conf 0.43), V23@24.7Å(now 28.0,conf 0.41), Q13@13.0Å(now 16.7,conf 0.26)
  - push-out (wants farther): L22@34.1Å(now 28.5,conf 0.53), F18@29.3Å(now 25.3,conf 0.47), A20@27.5Å(now 25.0,conf 0.45)
  - L22↔S7: targets 34.1/5.8Å but partners are 22.2Å apart → too_close_together by 6.2Å
  - F18↔S7: targets 29.3/5.8Å but partners are 18.4Å apart → too_close_together by 5.2Å
  - L22↔V23: targets 34.1/24.7Å but partners are 4.1Å apart → too_close_together by 5.4Å
- **L22** — severity 44.39, 36 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): V6@18.4Å(now 23.8,conf 0.31), S8@17.8Å(now 20.4,conf 0.30), S7@17.6Å(now 22.2,conf 0.30)
  - push-out (wants farther): T3@34.1Å(now 28.5,conf 0.53), T1@33.8Å(now 29.8,conf 0.53), L10@22.6Å(now 17.9,conf 0.37), K16@12.6Å(now 9.0,conf 0.27)
  - T3↔S7: targets 34.1/17.6Å but partners are 7.0Å apart → too_close_together by 9.6Å
  - T3↔V6: targets 34.1/18.4Å but partners are 7.6Å apart → too_close_together by 8.2Å
  - T1↔S7: targets 33.8/17.6Å but partners are 7.9Å apart → too_close_together by 8.4Å
- **D5** — severity 29.58, 26 conflict(s); suspect input ~`A20` (group: push_out)
  - pull-in (wants closer): I19@18.1Å(now 21.4,conf 0.30), A20@17.7Å(now 21.8,conf 0.30), E17@16.3Å(now 19.4,conf 0.28)
  - push-out (wants farther): V23@30.1Å(now 26.1,conf 0.49), A15@21.4Å(now 17.1,conf 0.35)
  - G12↔A15: targets 7.5/21.4Å but partners are 7.5Å apart → too_close_together by 6.3Å
  - Y9↔A15: targets 5.6/21.4Å but partners are 9.7Å apart → too_close_together by 6.0Å
  - V23↔Y9: targets 30.1/5.6Å but partners are 20.0Å apart → too_close_together by 4.5Å
- **L10** — severity 29.27, 29 conflict(s); suspect input ~`T1` (group: push_out)
  - pull-in (wants closer): K16@6.0Å(now 9.1,conf 0.45), E17@8.1Å(now 11.9,conf 0.34), K24@17.0Å(now 20.3,conf 0.29)
  - push-out (wants farther): L22@22.6Å(now 17.9,conf 0.37)
  - K16↔L22: targets 6.0/22.6Å but partners are 9.0Å apart → too_close_together by 7.6Å
  - L22↔E17: targets 22.6/8.1Å but partners are 8.6Å apart → too_close_together by 5.8Å
  - E17↔T3: targets 8.1/9.8Å but partners are 23.5Å apart → too_far_apart by 5.5Å
- **K24** — severity 26.44, 23 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): T3@26.6Å(now 30.7,conf 0.43), S7@21.1Å(now 24.5,conf 0.35), S8@19.6Å(now 22.8,conf 0.33), L10@17.0Å(now 20.3,conf 0.29)
  - push-out (wants farther): T1@35.4Å(now 32.1,conf 0.54), S4@31.5Å(now 28.7,conf 0.51), W21@8.1Å(now 5.6,conf 0.34), I19@12.3Å(now 8.0,conf 0.27)
  - T1↔T3: targets 35.4/26.6Å but partners are 1.9Å apart → too_close_together by 6.9Å
  - T1↔S7: targets 35.4/21.1Å but partners are 7.9Å apart → too_close_together by 6.4Å
  - S4↔S7: targets 31.5/21.1Å but partners are 4.6Å apart → too_close_together by 5.8Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=8 · 3-10(G)=1 · coil(C)=1

```
EHHEHHEHHHHEHHCHGEHEHEHE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=6 · sheet=5
  - F2 ↔ V6  (helix)
  - D5 ↔ Y9  (helix)
  - V6 ↔ L10  (helix)
  - Y9 ↔ Q13  (helix)
  - L10 ↔ A14  (helix)
  - I19 ↔ V23  (helix)
  - T1 ↔ S7  (sheet)
  - S4 ↔ G12  (sheet)
  - S7 ↔ G12  (sheet)
  - G12 ↔ F18  (sheet)
  - F18 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=68 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6099 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
