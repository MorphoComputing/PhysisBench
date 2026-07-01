# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2YXF\seeds\seed_3\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 8.701 A
- tm_score_ca_ordered: 0.3311542408533592
- heavy_atom_rmsd: 9.820 A
- sidechain_heavy_atom_rmsd: 10.644 A
- **all-atom quality (honest):** heavy 9.820 A, sidechain 10.644 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 1251
- bin_accuracy: 0.645

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=10.146398332686726 -> 9.156964855713298 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.700877773751955
- ga_delta_rmsd: 0.47959954920016656  ga_fitness_mode: energy
- pre_local_rmsd: 8.710995491077266  localized_anchor_rmsd: 8.700882162688249

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D96 → 17 conflicts (20%); K19 → 15 conflicts (18%); H84 → 9 conflicts (11%)
- explained: 41/85 conflicts by 3 root cause(s)
- metrics: hubs=32 (frac 0.33), conflicts/hub=2.7, max_incompat=6.02Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D96 + K19 + H84 — explain ~41/85 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H84** — severity 18.78, 9 conflict(s); suspect input ~`P32` (group: push_out)
  - pull-in (wants closer): E16@27.5Å(now 32.2,conf 1.00), Q89@9.0Å(now 11.5,conf 0.99), H51@19.6Å(now 22.7,conf 0.57), P32@8.4Å(now 12.6,conf 0.55)
  - push-out (wants farther): Q8@15.3Å(now 11.7,conf 0.55)
  - Q89↔P32: targets 9.0/8.4Å but partners are 23.4Å apart → too_far_apart by 6.0Å
  - S88↔P32: targets 9.2/8.4Å but partners are 22.6Å apart → too_far_apart by 5.1Å
  - L87↔P32: targets 5.3/8.4Å but partners are 18.7Å apart → too_far_apart by 5.1Å
- **I46** — severity 14.49, 7 conflict(s); suspect input ~`D96` (group: push_out)
  - push-out (wants farther): D96@17.5Å(now 11.1,conf 0.55), W95@14.0Å(now 8.5,conf 0.55)
  - K41↔D96: targets 6.9/17.5Å but partners are 5.1Å apart → too_close_together by 5.5Å
  - L40↔W95: targets 5.5/14.0Å but partners are 3.9Å apart → too_close_together by 4.6Å
  - L40↔D96: targets 5.5/17.5Å but partners are 7.6Å apart → too_close_together by 4.4Å
- **K19** — severity 11.80, 9 conflict(s); suspect input ~`I7` (group: pull_in)
  - pull-in (wants closer): P32@27.5Å(now 31.0,conf 1.00)
  - push-out (wants farther): I7@25.7Å(now 23.0,conf 0.70), S52@21.6Å(now 16.8,conf 0.61), P14@6.5Å(now 3.9,conf 0.58), C25@19.7Å(now 16.8,conf 0.57), V49@18.5Å(now 14.8,conf 0.55), A15@8.9Å(now 3.8,conf 0.55), Y67@16.2Å(now 12.6,conf 0.55)
  - N24↔I7: targets 13.0/25.7Å but partners are 10.0Å apart → too_close_together by 2.7Å
  - R12↔I7: targets 7.0/25.7Å but partners are 16.3Å apart → too_close_together by 2.4Å
  - N24↔C25: targets 13.0/19.7Å but partners are 4.0Å apart → too_close_together by 2.7Å
- **I7** — severity 7.14, 5 conflict(s); suspect input ~`I1` (group: push_out)
  - push-out (wants farther): E16@27.0Å(now 24.5,conf 0.85), K19@25.7Å(now 23.0,conf 0.70), I1@18.9Å(now 15.7,conf 0.56)
  - R3↔I1: targets 9.1/18.9Å but partners are 6.1Å apart → too_close_together by 3.6Å
  - K19↔N24: targets 25.7/10.2Å but partners are 13.1Å apart → too_close_together by 2.4Å
  - K19↔R12: targets 25.7/16.1Å but partners are 7.2Å apart → too_close_together by 2.4Å
- **V49** — severity 6.31, 5 conflict(s); suspect input ~`K19` (group: pull_in)
  - pull-in (wants closer): P90@19.0Å(now 22.4,conf 0.56)
  - push-out (wants farther): A15@20.2Å(now 16.3,conf 0.58), D96@19.2Å(now 15.5,conf 0.56), K19@18.5Å(now 14.8,conf 0.55)
  - T68↔K19: targets 5.1/18.5Å but partners are 10.6Å apart → too_close_together by 2.8Å
  - A15↔T68: targets 20.2/5.1Å but partners are 12.8Å apart → too_close_together by 2.3Å
  - K19↔E69: targets 18.5/8.0Å but partners are 8.3Å apart → too_close_together by 2.2Å
- **P14** — severity 5.89, 4 conflict(s); suspect input ~`N17` (group: push_out)
  - pull-in (wants closer): S88@27.5Å(now 31.5,conf 1.00), T86@27.5Å(now 30.7,conf 1.00)
  - push-out (wants farther): S57@25.6Å(now 22.4,conf 0.70), K19@6.5Å(now 3.9,conf 0.58), S20@8.8Å(now 5.8,conf 0.52)
  - S88↔N17: targets 27.5/6.9Å but partners are 36.9Å apart → too_far_apart by 2.5Å
  - T86↔N17: targets 27.5/6.9Å but partners are 36.1Å apart → too_far_apart by 1.8Å
  - S88↔G18: targets 27.5/5.5Å but partners are 34.9Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=46 · 3-10(G)=21 · coil(C)=8

```
CEHEEGGGEEECHEEHEHHHHHHEGEGEGHEHHHHHCEGCEHGGECHGHHEHGGECEEHEEEEEGEEEEGCEEEGEEEECEGGEHEEGGEEGGEEEE
```

## Backbone H-bond Network

- total=64 · helix(i→i+4)=3 · sheet=61
  - K19 ↔ L23  (helix)
  - F30 ↔ D34  (helix)
  - P32 ↔ E36  (helix)
  - V9 ↔ N24  (sheet)
  - V9 ↔ Y26  (sheet)
  - Y10 ↔ N24  (sheet)
  - Y10 ↔ Y26  (sheet)
  - S11 ↔ N24  (sheet)
  - S11 ↔ Y26  (sheet)
  - P14 ↔ N24  (sheet)
  - N24 ↔ D38  (sheet)
  - Y26 ↔ D38  (sheet)
  - S28 ↔ D38  (sheet)
  - D38 ↔ R45  (sheet)
  - H51 ↔ L64  (sheet)
  - H51 ↔ Y66  (sheet)
  - H51 ↔ Y67  (sheet)
  - H51 ↔ T68  (sheet)
  - H51 ↔ E69  (sheet)
  - S55 ↔ W60  (sheet)
  - … +44 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=49 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=389 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=249 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5334 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
