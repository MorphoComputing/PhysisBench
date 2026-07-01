# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm3\3IOL\seeds\seed_2\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.549 A
- tm_score_ca_ordered: 0.07007592138379723
- heavy_atom_rmsd: 5.825 A
- sidechain_heavy_atom_rmsd: 7.380 A
- **all-atom quality (honest):** heavy 5.825 A, sidechain 7.380 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 231
- bin_accuracy: 0.372

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 13% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T1-Q13 → 438 conflicts (99%)
- explained: 438/441 conflicts by 1 root cause(s)
- metrics: hubs=24 (frac 1.0), conflicts/hub=18.4, max_incompat=9.42Å, chain_span=0.958
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T1-Q13 — explain ~438/441 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T3** — severity 56.25, 43 conflict(s); suspect input ~`Q13` (group: pull_in)
  - pull-in (wants closer): K24@26.6Å(now 30.7,conf 0.43), V23@24.7Å(now 28.7,conf 0.41), Q13@13.0Å(now 16.1,conf 0.26)
  - push-out (wants farther): L22@34.1Å(now 29.0,conf 0.53), F18@29.3Å(now 24.2,conf 0.47), A20@27.5Å(now 24.5,conf 0.45)
  - F18↔S7: targets 29.3/5.8Å but partners are 17.1Å apart → too_close_together by 6.4Å
  - L22↔S7: targets 34.1/5.8Å but partners are 22.1Å apart → too_close_together by 6.3Å
  - K24↔L22: targets 26.6/34.1Å but partners are 2.6Å apart → too_close_together by 5.0Å
- **T1** — severity 55.02, 41 conflict(s); suspect input ~`Y9` (group: pull_in)
  - pull-in (wants closer): F18@20.3Å(now 24.9,conf 0.34), A15@18.9Å(now 21.7,conf 0.32), Y9@10.0Å(now 13.9,conf 0.29)
  - push-out (wants farther): K24@35.4Å(now 31.4,conf 0.54), L22@33.8Å(now 29.9,conf 0.53), A14@22.8Å(now 19.9,conf 0.38), E11@19.1Å(now 14.7,conf 0.32)
  - K24↔S7: targets 35.4/6.0Å but partners are 23.6Å apart → too_close_together by 5.7Å
  - L22↔S7: targets 33.8/6.0Å but partners are 22.1Å apart → too_close_together by 5.7Å
  - K24↔F18: targets 35.4/20.3Å but partners are 8.5Å apart → too_close_together by 6.6Å
- **L22** — severity 46.50, 36 conflict(s); suspect input ~`V6` (group: pull_in)
  - pull-in (wants closer): V6@18.4Å(now 22.9,conf 0.31), S7@17.6Å(now 22.1,conf 0.30), S8@17.8Å(now 21.1,conf 0.30)
  - push-out (wants farther): T3@34.1Å(now 29.0,conf 0.53), T1@33.8Å(now 29.9,conf 0.53), L10@22.6Å(now 18.4,conf 0.37), E17@10.9Å(now 7.1,conf 0.28)
  - T3↔S7: targets 34.1/17.6Å but partners are 7.2Å apart → too_close_together by 9.4Å
  - T3↔V6: targets 34.1/18.4Å but partners are 6.9Å apart → too_close_together by 8.9Å
  - T1↔S7: targets 33.8/17.6Å but partners are 8.4Å apart → too_close_together by 7.8Å
- **D5** — severity 39.95, 32 conflict(s); suspect input ~`A20` (group: push_out)
  - pull-in (wants closer): A20@17.7Å(now 21.3,conf 0.30), I19@18.1Å(now 21.0,conf 0.30), Y9@5.6Å(now 8.7,conf 0.48), E17@16.3Å(now 19.2,conf 0.28)
  - push-out (wants farther): V23@30.1Å(now 25.9,conf 0.49), A15@21.4Å(now 17.1,conf 0.35)
  - Y9↔A15: targets 5.6/21.4Å but partners are 8.9Å apart → too_close_together by 6.8Å
  - V23↔Y9: targets 30.1/5.6Å but partners are 19.5Å apart → too_close_together by 5.0Å
  - V23↔G12: targets 30.1/7.5Å but partners are 16.1Å apart → too_close_together by 6.4Å
- **F18** — severity 30.53, 27 conflict(s); suspect input ~`G12` (group: pull_in)
  - pull-in (wants closer): T1@20.3Å(now 24.9,conf 0.34), G12@8.4Å(now 12.1,conf 0.33)
  - push-out (wants farther): T3@29.3Å(now 24.2,conf 0.47), S7@21.0Å(now 17.1,conf 0.35)
  - T3↔G12: targets 29.3/8.4Å but partners are 12.9Å apart → too_close_together by 8.0Å
  - S7↔G12: targets 21.0/8.4Å but partners are 6.0Å apart → too_close_together by 6.5Å
  - T3↔T1: targets 29.3/20.3Å but partners are 3.0Å apart → too_close_together by 6.0Å
- **L10** — severity 28.25, 31 conflict(s); suspect input ~`F2` (group: push_out)
  - pull-in (wants closer): K24@17.0Å(now 19.9,conf 0.29), E17@8.1Å(now 11.6,conf 0.34), K16@6.0Å(now 9.3,conf 0.45)
  - push-out (wants farther): L22@22.6Å(now 18.4,conf 0.37)
  - L22↔E17: targets 22.6/8.1Å but partners are 7.1Å apart → too_close_together by 7.3Å
  - L22↔K16: targets 22.6/6.0Å but partners are 10.6Å apart → too_close_together by 6.0Å
  - L22↔A15: targets 22.6/7.7Å but partners are 10.4Å apart → too_close_together by 4.5Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=6 · 3-10(G)=1 · coil(C)=0

```
EHHEHHEHGHHHEHEHHHHHHHHE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=9 · sheet=3
  - F2 ↔ V6  (helix)
  - V6 ↔ L10  (helix)
  - L10 ↔ A14  (helix)
  - G12 ↔ K16  (helix)
  - A14 ↔ F18  (helix)
  - K16 ↔ A20  (helix)
  - E17 ↔ W21  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)
  - T1 ↔ S7  (sheet)
  - S7 ↔ Q13  (sheet)
  - A15 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=63 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6499 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
