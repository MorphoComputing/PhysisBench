# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm3\3IOL\seeds\seed_0\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.603 A
- tm_score_ca_ordered: 0.11075563733450643
- heavy_atom_rmsd: 5.423 A
- sidechain_heavy_atom_rmsd: 6.799 A
- **all-atom quality (honest):** heavy 5.423 A, sidechain 6.799 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 231
- bin_accuracy: 0.411

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 13% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T1-K24 → 445 conflicts (100%)
- explained: 445/445 conflicts by 1 root cause(s)
- metrics: hubs=24 (frac 1.0), conflicts/hub=18.5, max_incompat=9.65Å, chain_span=0.958
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T1-K24 — explain ~445/445 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T3** — severity 59.47, 45 conflict(s); suspect input ~`Q13` (group: pull_in)
  - pull-in (wants closer): K24@26.6Å(now 30.1,conf 0.43), V23@24.7Å(now 27.7,conf 0.41), L10@9.8Å(now 12.5,conf 0.29), Q13@13.0Å(now 15.6,conf 0.26)
  - push-out (wants farther): L22@34.1Å(now 27.7,conf 0.53), F18@29.3Å(now 23.9,conf 0.47), A20@27.5Å(now 23.9,conf 0.45)
  - L22↔S7: targets 34.1/5.8Å but partners are 21.5Å apart → too_close_together by 6.9Å
  - F18↔S7: targets 29.3/5.8Å but partners are 16.7Å apart → too_close_together by 6.8Å
  - L22↔V6: targets 34.1/6.6Å but partners are 21.7Å apart → too_close_together by 5.9Å
- **T1** — severity 56.33, 41 conflict(s); suspect input ~`Y9` (group: pull_in)
  - pull-in (wants closer): F18@20.3Å(now 24.8,conf 0.34), A15@18.9Å(now 21.5,conf 0.32)
  - push-out (wants farther): K24@35.4Å(now 31.8,conf 0.54), L22@33.8Å(now 29.8,conf 0.53), A14@22.8Å(now 19.1,conf 0.38), E11@19.1Å(now 14.2,conf 0.32)
  - L22↔S7: targets 33.8/6.0Å but partners are 21.5Å apart → too_close_together by 6.2Å
  - K24↔S7: targets 35.4/6.0Å but partners are 23.7Å apart → too_close_together by 5.7Å
  - L22↔A20: targets 33.8/23.4Å but partners are 4.1Å apart → too_close_together by 6.3Å
- **L22** — severity 48.49, 39 conflict(s); suspect input ~`V6` (group: pull_in)
  - pull-in (wants closer): V6@18.4Å(now 21.7,conf 0.31), S7@17.6Å(now 21.5,conf 0.30)
  - push-out (wants farther): T3@34.1Å(now 27.7,conf 0.53), T1@33.8Å(now 29.8,conf 0.53), L10@22.6Å(now 18.7,conf 0.37), E17@10.9Å(now 7.7,conf 0.28)
  - T3↔V6: targets 34.1/18.4Å but partners are 6.1Å apart → too_close_together by 9.7Å
  - T3↔S7: targets 34.1/17.6Å but partners are 7.6Å apart → too_close_together by 9.0Å
  - T1↔S7: targets 33.8/17.6Å but partners are 8.4Å apart → too_close_together by 7.8Å
- **D5** — severity 36.91, 29 conflict(s); suspect input ~`A20` (group: push_out)
  - pull-in (wants closer): A20@17.7Å(now 21.1,conf 0.30), I19@18.1Å(now 20.7,conf 0.30), G12@7.5Å(now 10.3,conf 0.36)
  - push-out (wants farther): V23@30.1Å(now 25.4,conf 0.49), A15@21.4Å(now 16.7,conf 0.35)
  - V23↔Y9: targets 30.1/5.6Å but partners are 19.6Å apart → too_close_together by 4.8Å
  - V23↔G12: targets 30.1/7.5Å but partners are 16.3Å apart → too_close_together by 6.3Å
  - Y9↔A15: targets 5.6/21.4Å but partners are 9.6Å apart → too_close_together by 6.1Å
- **K24** — severity 28.41, 27 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): T3@26.6Å(now 30.1,conf 0.43), S8@19.6Å(now 22.6,conf 0.33), S7@21.1Å(now 23.7,conf 0.35), L10@17.0Å(now 20.1,conf 0.29)
  - push-out (wants farther): T1@35.4Å(now 31.8,conf 0.54), S4@31.5Å(now 27.0,conf 0.51), W21@8.1Å(now 3.6,conf 0.34), I19@12.3Å(now 7.4,conf 0.27)
  - T1↔S7: targets 35.4/21.1Å but partners are 8.4Å apart → too_close_together by 5.9Å
  - S8↔S4: targets 19.6/31.5Å but partners are 6.2Å apart → too_close_together by 5.8Å
  - T1↔T3: targets 35.4/26.6Å but partners are 4.6Å apart → too_close_together by 4.2Å
- **F18** — severity 25.30, 22 conflict(s); suspect input ~`G12` (group: pull_in)
  - pull-in (wants closer): T1@20.3Å(now 24.8,conf 0.34)
  - push-out (wants farther): T3@29.3Å(now 23.9,conf 0.47), S7@21.0Å(now 16.7,conf 0.35), E11@14.7Å(now 11.4,conf 0.27)
  - T3↔G12: targets 29.3/8.4Å but partners are 13.4Å apart → too_close_together by 7.5Å
  - S7↔G12: targets 21.0/8.4Å but partners are 6.3Å apart → too_close_together by 6.3Å
  - T3↔Q13: targets 29.3/8.2Å but partners are 15.6Å apart → too_close_together by 5.6Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=4 · 3-10(G)=2 · coil(C)=0

```
EHEHHHHHHHHHEGHHHGHHHHHE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=11 · sheet=0
  - F2 ↔ V6  (helix)
  - S4 ↔ S8  (helix)
  - V6 ↔ L10  (helix)
  - S7 ↔ E11  (helix)
  - S8 ↔ G12  (helix)
  - E11 ↔ A15  (helix)
  - G12 ↔ K16  (helix)
  - A15 ↔ I19  (helix)
  - K16 ↔ A20  (helix)
  - E17 ↔ W21  (helix)
  - I19 ↔ V23  (helix)

## Solvent Accessibility (burial)

- buried=8 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=67 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.666 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
