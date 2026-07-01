# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm3\3IOL\seeds\seed_8\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.130 A
- tm_score_ca_ordered: 0.12236755981287822
- heavy_atom_rmsd: 5.376 A
- sidechain_heavy_atom_rmsd: 6.939 A
- **all-atom quality (honest):** heavy 5.376 A, sidechain 6.939 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 231
- bin_accuracy: 0.342

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 13% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T1-Q13 → 446 conflicts (99%)
- explained: 446/449 conflicts by 1 root cause(s)
- metrics: hubs=24 (frac 1.0), conflicts/hub=18.7, max_incompat=9.55Å, chain_span=0.958
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T1-Q13 — explain ~446/449 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T1** — severity 57.41, 45 conflict(s); suspect input ~`F18` (group: pull_in)
  - pull-in (wants closer): F18@20.3Å(now 25.0,conf 0.34), A15@18.9Å(now 21.7,conf 0.32), S7@6.0Å(now 8.6,conf 0.45)
  - push-out (wants farther): K24@35.4Å(now 31.4,conf 0.54), L22@33.8Å(now 29.6,conf 0.53), A14@22.8Å(now 19.6,conf 0.38), S4@8.7Å(now 4.2,conf 0.32), E11@19.1Å(now 14.6,conf 0.32)
  - K24↔F18: targets 35.4/20.3Å but partners are 6.6Å apart → too_close_together by 8.5Å
  - L22↔F18: targets 33.8/20.3Å but partners are 5.6Å apart → too_close_together by 7.9Å
  - K24↔S7: targets 35.4/6.0Å but partners are 23.7Å apart → too_close_together by 5.7Å
- **T3** — severity 52.51, 42 conflict(s); suspect input ~`Q13` (group: pull_in)
  - pull-in (wants closer): K24@26.6Å(now 30.6,conf 0.43), V23@24.7Å(now 28.9,conf 0.41), Q13@13.0Å(now 16.0,conf 0.26)
  - push-out (wants farther): L22@34.1Å(now 29.1,conf 0.53), F18@29.3Å(now 24.1,conf 0.47), A20@27.5Å(now 24.2,conf 0.45), S8@11.4Å(now 8.7,conf 0.27)
  - F18↔S7: targets 29.3/5.8Å but partners are 17.1Å apart → too_close_together by 6.4Å
  - L22↔S7: targets 34.1/5.8Å but partners are 22.2Å apart → too_close_together by 6.2Å
  - F18↔Q13: targets 29.3/13.0Å but partners are 8.2Å apart → too_close_together by 8.1Å
- **L22** — severity 50.13, 37 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): V6@18.4Å(now 22.6,conf 0.31), S7@17.6Å(now 22.2,conf 0.30), S8@17.8Å(now 20.7,conf 0.30)
  - push-out (wants farther): T3@34.1Å(now 29.1,conf 0.53), T1@33.8Å(now 29.6,conf 0.53), L10@22.6Å(now 19.1,conf 0.37)
  - T3↔S7: targets 34.1/17.6Å but partners are 7.0Å apart → too_close_together by 9.6Å
  - T3↔V6: targets 34.1/18.4Å but partners are 7.7Å apart → too_close_together by 8.1Å
  - T3↔D5: targets 34.1/24.7Å but partners are 3.6Å apart → too_close_together by 5.8Å
- **D5** — severity 32.61, 26 conflict(s); suspect input ~`A20` (group: push_out)
  - pull-in (wants closer): A20@17.7Å(now 21.4,conf 0.30), I19@18.1Å(now 21.1,conf 0.30), E17@16.3Å(now 19.5,conf 0.28)
  - push-out (wants farther): V23@30.1Å(now 26.2,conf 0.49), A15@21.4Å(now 17.1,conf 0.35)
  - V23↔Y9: targets 30.1/5.6Å but partners are 18.8Å apart → too_close_together by 5.7Å
  - V23↔A20: targets 30.1/17.7Å but partners are 5.0Å apart → too_close_together by 7.4Å
  - Y9↔A15: targets 5.6/21.4Å but partners are 9.8Å apart → too_close_together by 6.0Å
- **F18** — severity 31.51, 27 conflict(s); suspect input ~`G12` (group: pull_in)
  - pull-in (wants closer): T1@20.3Å(now 25.0,conf 0.34), G12@8.4Å(now 11.8,conf 0.33)
  - push-out (wants farther): T3@29.3Å(now 24.1,conf 0.47), S7@21.0Å(now 17.1,conf 0.35), V23@9.5Å(now 6.4,conf 0.30)
  - T3↔G12: targets 29.3/8.4Å but partners are 12.7Å apart → too_close_together by 8.2Å
  - S7↔G12: targets 21.0/8.4Å but partners are 5.8Å apart → too_close_together by 6.8Å
  - T3↔T1: targets 29.3/20.3Å but partners are 3.3Å apart → too_close_together by 5.7Å
- **K24** — severity 30.01, 25 conflict(s); suspect input ~`S8` (group: pull_in)
  - pull-in (wants closer): T3@26.6Å(now 30.6,conf 0.43), S8@19.6Å(now 22.6,conf 0.33), S7@21.1Å(now 23.7,conf 0.35), L10@17.0Å(now 20.2,conf 0.29)
  - push-out (wants farther): T1@35.4Å(now 31.4,conf 0.54), S4@31.5Å(now 27.7,conf 0.51), W21@8.1Å(now 3.5,conf 0.34), I19@12.3Å(now 7.9,conf 0.27)
  - T1↔T3: targets 35.4/26.6Å but partners are 3.3Å apart → too_close_together by 5.5Å
  - S8↔S4: targets 19.6/31.5Å but partners are 5.2Å apart → too_close_together by 6.8Å
  - T1↔S8: targets 35.4/19.6Å but partners are 9.1Å apart → too_close_together by 6.7Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=5 · 3-10(G)=2 · coil(C)=0

```
EHHEGHHHHHGHEHEHHHHHHHHE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=10 · sheet=1
  - F2 ↔ V6  (helix)
  - T3 ↔ S7  (helix)
  - V6 ↔ L10  (helix)
  - S8 ↔ G12  (helix)
  - L10 ↔ A14  (helix)
  - G12 ↔ K16  (helix)
  - A14 ↔ F18  (helix)
  - K16 ↔ A20  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)
  - A15 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=69 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=2 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6525 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
