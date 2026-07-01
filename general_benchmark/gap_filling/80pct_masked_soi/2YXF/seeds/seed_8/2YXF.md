# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2YXF\seeds\seed_8\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 4.030 A
- tm_score_ca_ordered: 0.5661175828670995
- heavy_atom_rmsd: 5.439 A
- sidechain_heavy_atom_rmsd: 6.369 A
- **all-atom quality (honest):** heavy 5.439 A, sidechain 6.369 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 31
- distogram_pairs: 1256
- bin_accuracy: 0.600

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=57
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.030056238824764
- ga_delta_rmsd: 7.317895536447391  ga_fitness_mode: energy
- pre_local_rmsd: 4.0300670796641995  localized_anchor_rmsd: 4.0300670796641995

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R12-L23 → 154 conflicts (64%); K75-Y78 → 16 conflicts (7%); Q89 → 16 conflicts (7%)
- explained: 186/242 conflicts by 3 root cause(s)
- metrics: hubs=58 (frac 0.598), conflicts/hub=4.2, max_incompat=10.22Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R12-L23 + K75-Y78 + Q89 — explain ~186/242 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N17** — severity 41.89, 16 conflict(s); suspect input ~`Y78` (group: push_out)
  - push-out (wants farther): D76@22.7Å(now 15.2,conf 0.70), Y78@21.7Å(now 14.3,conf 0.62), T71@13.9Å(now 8.6,conf 0.55)
  - N21↔Y78: targets 9.0/21.7Å but partners are 5.9Å apart → too_close_together by 6.8Å
  - N21↔D76: targets 9.0/22.7Å but partners are 8.0Å apart → too_close_together by 5.7Å
  - D76↔H13: targets 22.7/8.4Å but partners are 9.1Å apart → too_close_together by 5.2Å
- **A15** — severity 40.22, 15 conflict(s); suspect input ~`K75` (group: push_out)
  - push-out (wants farther): V82@27.5Å(now 25.0,conf 0.99), K75@25.6Å(now 15.4,conf 0.70), E74@22.4Å(now 12.1,conf 0.66), K19@8.9Å(now 3.8,conf 0.55), T71@16.4Å(now 10.1,conf 0.55)
  - G18↔K75: targets 5.0/25.6Å but partners are 10.7Å apart → too_close_together by 9.9Å
  - G18↔E74: targets 5.0/22.4Å but partners are 7.1Å apart → too_close_together by 10.2Å
  - N21↔K75: targets 10.6/25.6Å but partners are 9.9Å apart → too_close_together by 5.2Å
- **D76** — severity 32.00, 11 conflict(s); suspect input ~`N17` (group: pull_in)
  - pull-in (wants closer): W60@27.5Å(now 31.7,conf 1.00)
  - push-out (wants farther): N17@22.7Å(now 15.2,conf 0.70), P14@21.5Å(now 13.2,conf 0.61), R12@17.2Å(now 9.0,conf 0.55), N24@15.8Å(now 12.2,conf 0.55)
  - P72↔N17: targets 7.0/22.7Å but partners are 7.5Å apart → too_close_together by 8.1Å
  - P72↔P14: targets 7.0/21.5Å but partners are 6.3Å apart → too_close_together by 8.2Å
  - T73↔N17: targets 6.6/22.7Å but partners are 10.4Å apart → too_close_together by 5.7Å
- **P14** — severity 28.03, 15 conflict(s); suspect input ~`S11` (group: pull_in)
  - pull-in (wants closer): P32@27.5Å(now 30.7,conf 1.00)
  - push-out (wants farther): N83@27.5Å(now 23.9,conf 0.99), V82@24.9Å(now 21.4,conf 0.70), D76@21.5Å(now 13.2,conf 0.61), K94@21.5Å(now 15.3,conf 0.61), A79@20.2Å(now 14.6,conf 0.58), D96@18.7Å(now 11.7,conf 0.56)
  - N21↔D76: targets 7.4/21.5Å but partners are 8.0Å apart → too_close_together by 6.1Å
  - Y10↔K94: targets 13.0/21.5Å but partners are 3.7Å apart → too_close_together by 4.8Å
  - D76↔G18: targets 21.5/5.5Å but partners are 11.8Å apart → too_close_together by 4.2Å
- **K19** — severity 28.02, 13 conflict(s); suspect input ~`E77` (group: pull_in)
  - pull-in (wants closer): P32@27.5Å(now 33.0,conf 1.00)
  - push-out (wants farther): I7@25.7Å(now 22.2,conf 0.70), S52@21.6Å(now 19.1,conf 0.61), E77@19.8Å(now 12.0,conf 0.58), C25@19.7Å(now 16.5,conf 0.57), D96@19.2Å(now 13.8,conf 0.56), A15@8.9Å(now 3.8,conf 0.55), F70@10.7Å(now 3.4,conf 0.55), E69@10.6Å(now 7.1,conf 0.55), Y67@16.2Å(now 13.2,conf 0.55), T71@9.8Å(now 6.3,conf 0.55)
  - H13↔E77: targets 5.1/19.8Å but partners are 7.1Å apart → too_close_together by 7.6Å
  - H13↔D96: targets 5.1/19.2Å but partners are 7.6Å apart → too_close_together by 6.4Å
  - R12↔E77: targets 7.0/19.8Å but partners are 6.7Å apart → too_close_together by 6.1Å
- **G43** — severity 20.67, 7 conflict(s); suspect input ~`Y78` (group: pull_in)
  - pull-in (wants closer): D59@27.5Å(now 34.4,conf 1.00), S57@27.5Å(now 32.3,conf 1.00), E69@17.4Å(now 22.0,conf 0.55), F70@15.1Å(now 22.1,conf 0.55), Y78@7.6Å(now 12.7,conf 0.55)
  - H13↔Y78: targets 23.0/7.6Å but partners are 8.5Å apart → too_close_together by 6.9Å
  - P14↔Y78: targets 26.3/7.6Å but partners are 11.8Å apart → too_close_together by 6.9Å
  - A15↔F70: targets 27.5/15.1Å but partners are 6.3Å apart → too_close_together by 6.2Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=38 · 3-10(G)=27 · coil(C)=13

```
CEHEGGHHEEHHHEHHHGGGGGGEGGEEGECCCHEGEECGEHHEEEGCEGCEECEGEEHCEEECEEEEEGHHEHEHGGGGEEEEGHCCEGGGGCGHE
```

## Backbone H-bond Network

- total=62 · helix(i→i+4)=5 · sheet=57
  - R3 ↔ I7  (helix)
  - Q8 ↔ R12  (helix)
  - R12 ↔ E16  (helix)
  - H13 ↔ N17  (helix)
  - P72 ↔ D76  (helix)
  - V9 ↔ N24  (sheet)
  - V9 ↔ V27  (sheet)
  - Y10 ↔ N24  (sheet)
  - P14 ↔ N24  (sheet)
  - N24 ↔ V37  (sheet)
  - N24 ↔ D38  (sheet)
  - N24 ↔ K41  (sheet)
  - V27 ↔ I35  (sheet)
  - V27 ↔ V37  (sheet)
  - V27 ↔ D38  (sheet)
  - S28 ↔ I35  (sheet)
  - S28 ↔ V37  (sheet)
  - F30 ↔ I35  (sheet)
  - V37 ↔ R45  (sheet)
  - V37 ↔ I46  (sheet)
  - … +42 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=54 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=467 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=335 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4743 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=31 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
