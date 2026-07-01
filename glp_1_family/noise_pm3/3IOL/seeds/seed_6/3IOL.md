# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm3\3IOL\seeds\seed_6\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.462 A
- tm_score_ca_ordered: 0.056931000770493644
- heavy_atom_rmsd: 5.318 A
- sidechain_heavy_atom_rmsd: 6.495 A
- **all-atom quality (honest):** heavy 5.318 A, sidechain 6.495 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 245
- bin_accuracy: 0.351

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 13% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T1-Q13 → 450 conflicts (98%)
- explained: 450/460 conflicts by 1 root cause(s)
- metrics: hubs=24 (frac 1.0), conflicts/hub=19.2, max_incompat=8.8Å, chain_span=0.958
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T1-Q13 — explain ~450/460 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L22** — severity 50.35, 38 conflict(s); suspect input ~`V6` (group: pull_in)
  - pull-in (wants closer): V6@18.4Å(now 22.9,conf 0.31), S8@17.8Å(now 21.1,conf 0.30), S7@17.6Å(now 22.6,conf 0.30)
  - push-out (wants farther): T3@34.1Å(now 29.6,conf 0.53), T1@33.8Å(now 30.0,conf 0.53), L10@22.6Å(now 19.0,conf 0.37)
  - T3↔V6: targets 34.1/18.4Å but partners are 7.1Å apart → too_close_together by 8.6Å
  - T3↔S7: targets 34.1/17.6Å but partners are 7.8Å apart → too_close_together by 8.8Å
  - T1↔V6: targets 33.8/18.4Å but partners are 7.7Å apart → too_close_together by 7.7Å
- **T3** — severity 49.39, 39 conflict(s); suspect input ~`Q13` (group: pull_in)
  - pull-in (wants closer): K24@26.6Å(now 31.0,conf 0.43), V23@24.7Å(now 29.2,conf 0.41), Q13@13.0Å(now 16.7,conf 0.26)
  - push-out (wants farther): L22@34.1Å(now 29.6,conf 0.53), F18@29.3Å(now 24.5,conf 0.47), A20@27.5Å(now 24.8,conf 0.45), S8@11.4Å(now 8.6,conf 0.27)
  - F18↔S7: targets 29.3/5.8Å but partners are 16.9Å apart → too_close_together by 6.7Å
  - L22↔S7: targets 34.1/5.8Å but partners are 22.6Å apart → too_close_together by 5.8Å
  - L22↔K24: targets 34.1/26.6Å but partners are 2.0Å apart → too_close_together by 5.5Å
- **T1** — severity 48.71, 40 conflict(s); suspect input ~`F18` (group: pull_in)
  - pull-in (wants closer): F18@20.3Å(now 24.9,conf 0.34), A15@18.9Å(now 21.5,conf 0.32)
  - push-out (wants farther): K24@35.4Å(now 31.4,conf 0.54), L22@33.8Å(now 30.0,conf 0.53), A14@22.8Å(now 20.0,conf 0.38), S4@8.7Å(now 4.4,conf 0.32), E11@19.1Å(now 14.5,conf 0.32), V6@10.7Å(now 7.7,conf 0.28)
  - K24↔S7: targets 35.4/6.0Å but partners are 23.9Å apart → too_close_together by 5.5Å
  - K24↔F18: targets 35.4/20.3Å but partners are 8.3Å apart → too_close_together by 6.8Å
  - L22↔S7: targets 33.8/6.0Å but partners are 22.6Å apart → too_close_together by 5.1Å
- **K24** — severity 34.47, 29 conflict(s); suspect input ~`S8` (group: pull_in)
  - pull-in (wants closer): T3@26.6Å(now 31.0,conf 0.43), S7@21.1Å(now 23.9,conf 0.35), S8@19.6Å(now 22.6,conf 0.33), L10@17.0Å(now 20.3,conf 0.29)
  - push-out (wants farther): T1@35.4Å(now 31.4,conf 0.54), S4@31.5Å(now 27.7,conf 0.51), W21@8.1Å(now 3.8,conf 0.34), I19@12.3Å(now 8.0,conf 0.27)
  - T1↔T3: targets 35.4/26.6Å but partners are 0.7Å apart → too_close_together by 8.1Å
  - T1↔S8: targets 35.4/19.6Å but partners are 9.1Å apart → too_close_together by 6.7Å
  - T1↔S7: targets 35.4/21.1Å but partners are 8.2Å apart → too_close_together by 6.0Å
- **F18** — severity 30.61, 27 conflict(s); suspect input ~`G12` (group: pull_in)
  - pull-in (wants closer): T1@20.3Å(now 24.9,conf 0.34), G12@8.4Å(now 12.3,conf 0.33)
  - push-out (wants farther): T3@29.3Å(now 24.5,conf 0.47), S7@21.0Å(now 16.9,conf 0.35)
  - T3↔T1: targets 29.3/20.3Å but partners are 0.7Å apart → too_close_together by 8.3Å
  - T3↔G12: targets 29.3/8.4Å but partners are 13.7Å apart → too_close_together by 7.2Å
  - S7↔G12: targets 21.0/8.4Å but partners are 6.6Å apart → too_close_together by 6.0Å
- **D5** — severity 29.92, 26 conflict(s); suspect input ~`A20` (group: push_out)
  - pull-in (wants closer): I19@18.1Å(now 20.6,conf 0.30), A20@17.7Å(now 21.4,conf 0.30), E17@16.3Å(now 19.1,conf 0.28)
  - push-out (wants farther): V23@30.1Å(now 26.0,conf 0.49), A15@21.4Å(now 17.1,conf 0.35)
  - V23↔Y9: targets 30.1/5.6Å but partners are 19.1Å apart → too_close_together by 5.4Å
  - G12↔A15: targets 7.5/21.4Å but partners are 7.7Å apart → too_close_together by 6.1Å
  - V23↔A20: targets 30.1/17.7Å but partners are 5.6Å apart → too_close_together by 6.8Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=5 · 3-10(G)=3 · coil(C)=0

```
EHHHHHHHHEEHGHHHGEHGHHHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=8 · sheet=1
  - F2 ↔ V6  (helix)
  - T3 ↔ S7  (helix)
  - S4 ↔ S8  (helix)
  - D5 ↔ Y9  (helix)
  - S8 ↔ G12  (helix)
  - G12 ↔ K16  (helix)
  - A15 ↔ I19  (helix)
  - I19 ↔ V23  (helix)
  - F18 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=65 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6321 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
