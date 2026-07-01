# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2YXF\seeds\seed_0\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 8.533 A
- tm_score_ca_ordered: 0.25207965322132897
- heavy_atom_rmsd: 10.035 A
- sidechain_heavy_atom_rmsd: 11.187 A
- **all-atom quality (honest):** heavy 10.035 A, sidechain 11.187 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 43
- distogram_pairs: 1253
- bin_accuracy: 0.509

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.532783740772762
- ga_delta_rmsd: 0.48473243568254887  ga_fitness_mode: energy
- pre_local_rmsd: 8.53276533663561  localized_anchor_rmsd: 8.53276533663561

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y10-F22 → 318 conflicts (49%); S57-T71 → 176 conflicts (27%); P32-K48 → 95 conflicts (15%)
- explained: 589/651 conflicts by 3 root cause(s)
- metrics: hubs=82 (frac 0.845), conflicts/hub=7.9, max_incompat=11.89Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y10-F22 + S57-T71 + P32-K48 — explain ~589/651 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G18** — severity 98.38, 25 conflict(s); suspect input ~`E44` (group: push_out)
  - pull-in (wants closer): Q89@27.5Å(now 35.8,conf 1.00), S57@27.5Å(now 34.9,conf 1.00), F62@27.5Å(now 30.4,conf 1.00), N21@7.0Å(now 10.1,conf 0.99)
  - push-out (wants farther): E36@27.5Å(now 16.5,conf 1.00), E44@27.0Å(now 18.9,conf 0.84), A15@6.6Å(now 2.1,conf 0.79)
  - N21↔E44: targets 7.0/27.0Å but partners are 10.1Å apart → too_close_together by 9.8Å
  - F22↔E44: targets 9.1/27.0Å but partners are 9.3Å apart → too_close_together by 8.6Å
  - E36↔H13: targets 27.5/6.6Å but partners are 12.0Å apart → too_close_together by 9.0Å
- **P14** — severity 66.56, 30 conflict(s); suspect input ~`K19` (group: push_out)
  - pull-in (wants closer): S88@27.5Å(now 33.4,conf 1.00), Q89@27.5Å(now 32.2,conf 1.00), T86@27.5Å(now 31.4,conf 1.00), F62@24.1Å(now 26.8,conf 0.73), S57@25.6Å(now 30.9,conf 0.70)
  - push-out (wants farther): S33@27.5Å(now 21.6,conf 0.99), N42@23.7Å(now 18.7,conf 0.75), G43@26.3Å(now 20.0,conf 0.74), D38@21.4Å(now 13.9,conf 0.61), K41@21.0Å(now 17.7,conf 0.60)
  - Y10↔G43: targets 12.9/26.3Å but partners are 7.5Å apart → too_close_together by 5.9Å
  - S88↔N17: targets 27.5/7.0Å but partners are 38.8Å apart → too_far_apart by 4.3Å
  - N17↔S57: targets 7.0/25.6Å but partners are 37.8Å apart → too_far_apart by 5.2Å
- **N21** — severity 58.78, 27 conflict(s); suspect input ~`P72` (group: push_out)
  - pull-in (wants closer): T86@27.5Å(now 31.4,conf 1.00), L87@27.5Å(now 30.1,conf 1.00), G18@7.0Å(now 10.1,conf 0.99), S57@27.5Å(now 32.0,conf 0.98), E69@5.6Å(now 9.1,conf 0.56), P72@8.4Å(now 13.2,conf 0.55)
  - push-out (wants farther): D34@27.5Å(now 24.7,conf 0.99), E36@23.0Å(now 15.6,conf 0.73), E44@19.2Å(now 10.1,conf 0.56), E47@17.3Å(now 5.5,conf 0.55), L39@14.4Å(now 10.5,conf 0.55)
  - E44↔F70: targets 19.2/5.8Å but partners are 5.5Å apart → too_close_together by 7.9Å
  - E69↔E47: targets 5.6/17.3Å but partners are 3.8Å apart → too_close_together by 7.9Å
  - F70↔E47: targets 5.8/17.3Å but partners are 3.9Å apart → too_close_together by 7.6Å
- **S88** — severity 58.03, 11 conflict(s); suspect input ~`S57` (group: pull_in)
  - pull-in (wants closer): P14@27.5Å(now 33.4,conf 1.00)
  - push-out (wants farther): D59@23.5Å(now 10.0,conf 0.76), K58@24.7Å(now 13.0,conf 0.70), S57@25.4Å(now 14.0,conf 0.69)
  - D59↔V85: targets 23.5/8.0Å but partners are 3.6Å apart → too_close_together by 11.9Å
  - V85↔K58: targets 8.0/24.7Å but partners are 6.0Å apart → too_close_together by 10.7Å
  - V85↔S57: targets 8.0/25.4Å but partners are 7.3Å apart → too_close_together by 10.1Å
- **K19** — severity 49.03, 20 conflict(s); suspect input ~`D38` (group: push_out)
  - pull-in (wants closer): W60@27.5Å(now 36.8,conf 1.00), P32@27.5Å(now 31.1,conf 1.00), S61@27.5Å(now 34.1,conf 1.00), E77@19.8Å(now 23.7,conf 0.58), F70@10.7Å(now 14.3,conf 0.55), E69@10.6Å(now 16.2,conf 0.55), T71@9.8Å(now 16.0,conf 0.55)
  - push-out (wants farther): D38@23.3Å(now 17.0,conf 0.76), E16@8.1Å(now 4.2,conf 0.67), N42@22.4Å(now 18.8,conf 0.66), V49@18.5Å(now 15.2,conf 0.55), A15@8.9Å(now 5.6,conf 0.55)
  - R12↔D38: targets 7.0/23.3Å but partners are 9.4Å apart → too_close_together by 6.9Å
  - D38↔H13: targets 23.3/4.1Å but partners are 11.7Å apart → too_close_together by 7.6Å
  - N24↔D38: targets 13.4/23.3Å but partners are 3.5Å apart → too_close_together by 6.4Å
- **E44** — severity 46.37, 23 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): T86@22.9Å(now 25.5,conf 0.73), K91@14.6Å(now 17.3,conf 0.55)
  - push-out (wants farther): R3@27.3Å(now 23.2,conf 0.92), G18@27.0Å(now 18.9,conf 0.84), H31@26.9Å(now 24.4,conf 0.83), V27@19.3Å(now 16.0,conf 0.56), N21@19.2Å(now 10.1,conf 0.56), S11@18.4Å(now 7.8,conf 0.55), P72@14.4Å(now 5.2,conf 0.55)
  - K48↔G18: targets 11.0/27.0Å but partners are 11.4Å apart → too_close_together by 4.5Å
  - E47↔G18: targets 9.0/27.0Å but partners are 13.7Å apart → too_close_together by 4.3Å
  - D38↔R3: targets 9.0/27.3Å but partners are 14.6Å apart → too_close_together by 3.8Å

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=33 · 3-10(G)=24 · coil(C)=6

```
CEHHHEHGEEEGEHEEGGEECCHEEHHHHHHGHHHEHHGGEHGEGHEGHGEEGEEEGHHCGGGCHHEGEEGEGHHEGHGCEEEGHGHHEHEGHEHHE
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=10 · sheet=40
  - R3 ↔ I7  (helix)
  - L23 ↔ V27  (helix)
  - Y26 ↔ F30  (helix)
  - V27 ↔ H31  (helix)
  - G29 ↔ S33  (helix)
  - F30 ↔ D34  (helix)
  - D34 ↔ D38  (helix)
  - D38 ↔ N42  (helix)
  - N42 ↔ I46  (helix)
  - E74 ↔ Y78  (helix)
  - K6 ↔ N24  (sheet)
  - K6 ↔ C25  (sheet)
  - V9 ↔ N24  (sheet)
  - V9 ↔ C25  (sheet)
  - Y10 ↔ N24  (sheet)
  - Y10 ↔ C25  (sheet)
  - S11 ↔ K19  (sheet)
  - S11 ↔ S20  (sheet)
  - S11 ↔ N24  (sheet)
  - S11 ↔ C25  (sheet)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=553 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=405 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.595 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=43 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
