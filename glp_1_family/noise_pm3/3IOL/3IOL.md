# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm3\3IOL\seeds\seed_3\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.097 A
- tm_score_ca_ordered: 0.11563172517877023
- heavy_atom_rmsd: 5.562 A
- sidechain_heavy_atom_rmsd: 7.023 A
- **all-atom quality (honest):** heavy 5.562 A, sidechain 7.023 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 243
- bin_accuracy: 0.395

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 13% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T1-Q13 → 466 conflicts (98%)
- explained: 466/476 conflicts by 1 root cause(s)
- metrics: hubs=24 (frac 1.0), conflicts/hub=19.8, max_incompat=9.34Å, chain_span=0.958
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T1-Q13 — explain ~466/476 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T1** — severity 59.45, 48 conflict(s); suspect input ~`Y9` (group: pull_in)
  - pull-in (wants closer): S7@6.0Å(now 8.9,conf 0.45), F18@20.3Å(now 24.1,conf 0.34), Y9@10.0Å(now 12.8,conf 0.29)
  - push-out (wants farther): K24@35.4Å(now 30.9,conf 0.54), L22@33.8Å(now 29.3,conf 0.53), A14@22.8Å(now 19.9,conf 0.38), S4@8.7Å(now 4.6,conf 0.32), E11@19.1Å(now 15.3,conf 0.32)
  - K24↔S7: targets 35.4/6.0Å but partners are 23.6Å apart → too_close_together by 5.8Å
  - L22↔S7: targets 33.8/6.0Å but partners are 22.1Å apart → too_close_together by 5.7Å
  - L22↔F18: targets 33.8/20.3Å but partners are 6.0Å apart → too_close_together by 7.5Å
- **T3** — severity 52.69, 40 conflict(s); suspect input ~`Q13` (group: pull_in)
  - pull-in (wants closer): K24@26.6Å(now 30.0,conf 0.43), V23@24.7Å(now 28.4,conf 0.41), Q13@13.0Å(now 15.8,conf 0.26)
  - push-out (wants farther): L22@34.1Å(now 28.6,conf 0.53), F18@29.3Å(now 24.1,conf 0.47), A20@27.5Å(now 24.2,conf 0.45)
  - F18↔S7: targets 29.3/5.8Å but partners are 17.1Å apart → too_close_together by 6.5Å
  - L22↔S7: targets 34.1/5.8Å but partners are 22.1Å apart → too_close_together by 6.3Å
  - L22↔K24: targets 34.1/26.6Å but partners are 2.1Å apart → too_close_together by 5.4Å
- **L22** — severity 46.70, 37 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): V6@18.4Å(now 22.6,conf 0.31), S8@17.8Å(now 21.0,conf 0.30), S7@17.6Å(now 22.1,conf 0.30)
  - push-out (wants farther): T3@34.1Å(now 28.6,conf 0.53), T1@33.8Å(now 29.3,conf 0.53), L10@22.6Å(now 18.7,conf 0.37), E17@10.9Å(now 6.9,conf 0.28)
  - T3↔V6: targets 34.1/18.4Å but partners are 6.4Å apart → too_close_together by 9.3Å
  - T3↔S7: targets 34.1/17.6Å but partners are 7.3Å apart → too_close_together by 9.3Å
  - T1↔S7: targets 33.8/17.6Å but partners are 8.9Å apart → too_close_together by 7.4Å
- **D5** — severity 35.06, 30 conflict(s); suspect input ~`A15` (group: pull_in)
  - pull-in (wants closer): Y9@5.6Å(now 8.3,conf 0.48), A20@17.7Å(now 21.1,conf 0.30), E17@16.3Å(now 19.0,conf 0.28)
  - push-out (wants farther): V23@30.1Å(now 26.1,conf 0.49), A15@21.4Å(now 17.1,conf 0.35), K16@18.8Å(now 15.8,conf 0.32)
  - Y9↔A15: targets 5.6/21.4Å but partners are 9.1Å apart → too_close_together by 6.6Å
  - G12↔A15: targets 7.5/21.4Å but partners are 7.3Å apart → too_close_together by 6.5Å
  - V23↔Y9: targets 30.1/5.6Å but partners are 19.8Å apart → too_close_together by 4.7Å
- **K24** — severity 28.46, 25 conflict(s); suspect input ~`L10` (group: pull_in)
  - pull-in (wants closer): T3@26.6Å(now 30.0,conf 0.43), S7@21.1Å(now 23.6,conf 0.35), S8@19.6Å(now 22.8,conf 0.33), L10@17.0Å(now 20.2,conf 0.29)
  - push-out (wants farther): T1@35.4Å(now 30.9,conf 0.54), S4@31.5Å(now 27.5,conf 0.51), E17@11.8Å(now 8.4,conf 0.27), I19@12.3Å(now 6.9,conf 0.27)
  - T1↔S8: targets 35.4/19.6Å but partners are 9.3Å apart → too_close_together by 6.5Å
  - S4↔S7: targets 31.5/21.1Å but partners are 4.6Å apart → too_close_together by 5.8Å
  - T1↔S7: targets 35.4/21.1Å but partners are 8.9Å apart → too_close_together by 5.4Å
- **F18** — severity 26.59, 26 conflict(s); suspect input ~`G12` (group: pull_in)
  - pull-in (wants closer): T1@20.3Å(now 24.1,conf 0.34), G12@8.4Å(now 11.4,conf 0.33)
  - push-out (wants farther): T3@29.3Å(now 24.1,conf 0.47), S7@21.0Å(now 17.1,conf 0.35)
  - T3↔G12: targets 29.3/8.4Å but partners are 13.6Å apart → too_close_together by 7.3Å
  - S7↔G12: targets 21.0/8.4Å but partners are 6.4Å apart → too_close_together by 6.2Å
  - T3↔Q13: targets 29.3/8.2Å but partners are 15.8Å apart → too_close_together by 5.4Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=2 · 3-10(G)=5 · coil(C)=1

```
CEGHGHGHHHHHGHHHHHHHGHHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=9 · sheet=0
  - S4 ↔ S8  (helix)
  - V6 ↔ L10  (helix)
  - S8 ↔ G12  (helix)
  - L10 ↔ A14  (helix)
  - E11 ↔ A15  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=67 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.641 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`3IOL.ensemble.pdb`)
- RMSF mean=2.141Å max=3.309Å (per-residue in .per_residue.csv)
- most flexible residues: 19, 8, 9, 17, 6

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=50.0 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 4, 6, 8, 9, 10, 11, 14, 17, 18, 19, 22

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `3IOL.pae.csv`
- mean=0.595Å · max=1.84Å · AlphaFold-PAE analog (low block = rigid unit/domain)
