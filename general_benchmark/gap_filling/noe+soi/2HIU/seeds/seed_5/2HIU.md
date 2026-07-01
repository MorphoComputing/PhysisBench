# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2HIU\seeds\seed_5\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 6.421 A
- tm_score_ca_ordered: 0.19969012298357044
- heavy_atom_rmsd: 7.795 A
- sidechain_heavy_atom_rmsd: 8.874 A
- **all-atom quality (honest):** heavy 7.795 A, sidechain 8.874 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 32
- distogram_pairs: 221
- bin_accuracy: 0.335

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y18-Q22 → 18 conflicts (41%); Y44 → 13 conflicts (30%); K47 → 5 conflicts (11%)
- explained: 36/44 conflicts by 3 root cause(s)
- metrics: hubs=17 (frac 0.362), conflicts/hub=2.6, max_incompat=9.32Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y18-Q22 + Y44 + K47 — explain ~36/44 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K47** — severity 11.69, 3 conflict(s); suspect input ~`I1` (group: push_out)
  - push-out (wants farther): I1@24.2Å(now 10.4,conf 0.66)
  - Y44↔I1: targets 10.2/24.2Å but partners are 4.7Å apart → too_close_together by 9.3Å
  - F43↔I1: targets 12.8/24.2Å but partners are 6.6Å apart → too_close_together by 4.8Å
  - I1↔F42: targets 24.2/13.4Å but partners are 4.9Å apart → too_close_together by 5.8Å
- **Y44** — severity 7.38, 7 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 7.7,conf 0.41), S27@4.5Å(now 7.8,conf 0.39)
  - push-out (wants farther): C37@10.7Å(now 7.9,conf 0.82)
  - G41↔C25: targets 9.1/4.3Å but partners are 16.8Å apart → too_far_apart by 3.4Å
  - E39↔C25: targets 10.9/4.3Å but partners are 18.0Å apart → too_far_apart by 2.9Å
  - G38↔C25: targets 10.5/4.3Å but partners are 17.6Å apart → too_far_apart by 2.8Å
- **L24** — severity 4.84, 2 conflict(s); suspect input ~`Y18` (group: push_out)
  - push-out (wants farther): Y18@11.9Å(now 3.6,conf 0.67), N17@13.6Å(now 8.5,conf 0.34)
  - N21↔Y18: targets 5.1/11.9Å but partners are 1.3Å apart → too_close_together by 5.5Å
  - N21↔N17: targets 5.1/13.6Å but partners are 5.2Å apart → too_close_together by 3.4Å
- **C25** — severity 4.70, 4 conflict(s); suspect input ~`N21` (group: push_out)
  - pull-in (wants closer): C19@8.3Å(now 11.9,conf 0.49), Y44@4.3Å(now 7.7,conf 0.41), P46@4.5Å(now 9.1,conf 0.39), Q22@4.5Å(now 8.3,conf 0.39), T45@4.5Å(now 8.7,conf 0.39)
  - push-out (wants farther): Y18@11.4Å(now 5.5,conf 0.40)
  - Y18↔N21: targets 11.4/4.5Å but partners are 1.3Å apart → too_close_together by 5.6Å
  - Y18↔Q22: targets 11.4/4.5Å but partners are 4.1Å apart → too_close_together by 2.8Å
  - V30↔Y44: targets 9.7/4.3Å but partners are 3.5Å apart → too_close_together by 1.9Å
- **Q22** — severity 4.45, 4 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): C25@4.5Å(now 8.3,conf 0.39)
  - push-out (wants farther): Y18@12.2Å(now 4.1,conf 0.69), C19@9.6Å(now 4.2,conf 0.69), N17@12.9Å(now 8.3,conf 0.58), L15@12.1Å(now 4.7,conf 0.43), E16@11.7Å(now 6.3,conf 0.43)
  - G26↔N17: targets 6.9/12.9Å but partners are 3.4Å apart → too_close_together by 2.6Å
  - L15↔C25: targets 12.1/4.5Å but partners are 4.1Å apart → too_close_together by 3.5Å
  - Y18↔C25: targets 12.2/4.5Å but partners are 5.5Å apart → too_close_together by 2.2Å
- **V20** — severity 4.31, 5 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): C37@4.9Å(now 11.1,conf 0.36)
  - push-out (wants farther): E16@9.9Å(now 6.4,conf 0.49), L15@9.4Å(now 3.4,conf 0.34), Y13@12.0Å(now 6.5,conf 0.26), Q14@11.0Å(now 3.3,conf 0.26)
  - C25↔C37: targets 6.8/4.9Å but partners are 14.9Å apart → too_far_apart by 3.2Å
  - G26↔C37: targets 7.9/4.9Å but partners are 15.7Å apart → too_far_apart by 2.9Å
  - N17↔C37: targets 9.0/4.9Å but partners are 16.4Å apart → too_far_apart by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=12 · 3-10(G)=5 · coil(C)=2

```
CGECHHEEHHEHHEHHHEHHHHHHHHHEEEHHEHHHGHGGHHHGHEE
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=18 · sheet=20
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - I9 ↔ Y13  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - N17 ↔ N21  (helix)
  - C19 ↔ H23  (helix)
  - V20 ↔ L24  (helix)
  - N21 ↔ C25  (helix)
  - Q22 ↔ G26  (helix)
  - H23 ↔ S27  (helix)
  - S27 ↔ E31  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - Y34 ↔ G38  (helix)
  - G41 ↔ T45  (helix)
  - E3 ↔ Q14  (sheet)
  - E3 ↔ Y18  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=314 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=212 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.3019 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=32 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
