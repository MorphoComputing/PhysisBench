# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm3\3IOL\seeds\seed_5\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.453 A
- tm_score_ca_ordered: 0.09266430740811499
- heavy_atom_rmsd: 5.444 A
- sidechain_heavy_atom_rmsd: 6.617 A
- **all-atom quality (honest):** heavy 5.444 A, sidechain 6.617 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 239
- bin_accuracy: 0.368

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 13% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T1-Q13 → 400 conflicts (98%)
- explained: 400/408 conflicts by 1 root cause(s)
- metrics: hubs=24 (frac 1.0), conflicts/hub=17.0, max_incompat=9.12Å, chain_span=0.958
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T1-Q13 — explain ~400/408 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T3** — severity 48.25, 35 conflict(s); suspect input ~`Q13` (group: pull_in)
  - pull-in (wants closer): K24@26.6Å(now 31.2,conf 0.43), V23@24.7Å(now 29.2,conf 0.41), Q13@13.0Å(now 16.1,conf 0.26)
  - push-out (wants farther): L22@34.1Å(now 29.0,conf 0.53), F18@29.3Å(now 24.3,conf 0.47), A20@27.5Å(now 24.7,conf 0.45)
  - L22↔S7: targets 34.1/5.8Å but partners are 21.6Å apart → too_close_together by 6.8Å
  - F18↔S7: targets 29.3/5.8Å but partners are 17.4Å apart → too_close_together by 6.2Å
  - L22↔V23: targets 34.1/24.7Å but partners are 3.6Å apart → too_close_together by 5.8Å
- **T1** — severity 48.03, 39 conflict(s); suspect input ~`Y9` (group: pull_in)
  - pull-in (wants closer): F18@20.3Å(now 25.3,conf 0.34), A15@18.9Å(now 21.6,conf 0.32)
  - push-out (wants farther): K24@35.4Å(now 31.4,conf 0.54), L22@33.8Å(now 29.0,conf 0.53), A14@22.8Å(now 19.5,conf 0.38), E11@19.1Å(now 14.2,conf 0.32)
  - L22↔S7: targets 33.8/6.0Å but partners are 21.6Å apart → too_close_together by 6.2Å
  - K24↔S7: targets 35.4/6.0Å but partners are 23.8Å apart → too_close_together by 5.6Å
  - S7↔E11: targets 6.0/19.1Å but partners are 6.0Å apart → too_close_together by 7.0Å
- **L22** — severity 46.92, 35 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): V6@18.4Å(now 23.2,conf 0.31), S7@17.6Å(now 21.6,conf 0.30)
  - push-out (wants farther): T3@34.1Å(now 29.0,conf 0.53), T1@33.8Å(now 29.0,conf 0.53), L10@22.6Å(now 18.9,conf 0.37)
  - T3↔V6: targets 34.1/18.4Å but partners are 6.8Å apart → too_close_together by 9.0Å
  - T3↔S7: targets 34.1/17.6Å but partners are 7.5Å apart → too_close_together by 9.1Å
  - T3↔D5: targets 34.1/24.7Å but partners are 3.3Å apart → too_close_together by 6.1Å
- **F18** — severity 30.53, 25 conflict(s); suspect input ~`G12` (group: pull_in)
  - pull-in (wants closer): T1@20.3Å(now 25.3,conf 0.34), G12@8.4Å(now 11.5,conf 0.33)
  - push-out (wants farther): T3@29.3Å(now 24.3,conf 0.47), S7@21.0Å(now 17.4,conf 0.35)
  - T3↔G12: targets 29.3/8.4Å but partners are 13.1Å apart → too_close_together by 7.8Å
  - S7↔G12: targets 21.0/8.4Å but partners are 6.6Å apart → too_close_together by 6.0Å
  - A15↔T3: targets 5.6/29.3Å but partners are 20.0Å apart → too_close_together by 3.7Å
- **K24** — severity 29.69, 27 conflict(s); suspect input ~`L10` (group: push_out)
  - pull-in (wants closer): T3@26.6Å(now 31.2,conf 0.43), S7@21.1Å(now 23.8,conf 0.35), S8@19.6Å(now 22.7,conf 0.33), L10@17.0Å(now 20.6,conf 0.29)
  - push-out (wants farther): T1@35.4Å(now 31.4,conf 0.54), S4@31.5Å(now 28.6,conf 0.51), W21@8.1Å(now 5.2,conf 0.34)
  - T1↔S7: targets 35.4/21.1Å but partners are 8.4Å apart → too_close_together by 5.9Å
  - S4↔L10: targets 31.5/17.0Å but partners are 8.2Å apart → too_close_together by 6.3Å
  - T1↔S8: targets 35.4/19.6Å but partners are 10.4Å apart → too_close_together by 5.4Å
- **D5** — severity 27.70, 23 conflict(s); suspect input ~`A15` (group: pull_in)
  - pull-in (wants closer): I19@18.1Å(now 21.1,conf 0.30), A20@17.7Å(now 21.5,conf 0.30), E17@16.3Å(now 19.4,conf 0.28)
  - push-out (wants farther): V23@30.1Å(now 25.9,conf 0.49), F2@6.9Å(now 4.3,conf 0.39), A15@21.4Å(now 16.9,conf 0.35)
  - V23↔Y9: targets 30.1/5.6Å but partners are 18.5Å apart → too_close_together by 6.0Å
  - G12↔A15: targets 7.5/21.4Å but partners are 7.0Å apart → too_close_together by 6.8Å
  - Y9↔A15: targets 5.6/21.4Å but partners are 10.1Å apart → too_close_together by 5.6Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=4 · 3-10(G)=1 · coil(C)=1

```
CHEHHHHHHHGHEHHHHHHHEHHE
```

## Backbone H-bond Network

- total=10 · helix(i→i+4)=9 · sheet=1
  - F2 ↔ V6  (helix)
  - S4 ↔ S8  (helix)
  - D5 ↔ Y9  (helix)
  - V6 ↔ L10  (helix)
  - S8 ↔ G12  (helix)
  - L10 ↔ A14  (helix)
  - G12 ↔ K16  (helix)
  - K16 ↔ A20  (helix)
  - I19 ↔ V23  (helix)
  - Q13 ↔ W21  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=59 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6461 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
