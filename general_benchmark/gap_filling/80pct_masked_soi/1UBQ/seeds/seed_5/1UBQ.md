# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1UBQ\seeds\seed_5\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 2.904 A
- tm_score_ca_ordered: 0.6324390289898953
- heavy_atom_rmsd: 4.071 A
- sidechain_heavy_atom_rmsd: 4.753 A
- **all-atom quality (honest):** heavy 4.071 A, sidechain 4.753 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 797
- bin_accuracy: 0.557

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.904299220764691
- ga_delta_rmsd: 4.328592800336697  ga_fitness_mode: energy
- pre_local_rmsd: 2.9125927248015757  localized_anchor_rmsd: 2.9042315307143833

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L70-G74 → 76 conflicts (61%); L66 → 7 conflicts (6%)
- explained: 83/124 conflicts by 2 root cause(s)
- metrics: hubs=40 (frac 0.541), conflicts/hub=3.1, max_incompat=6.83Å, chain_span=0.986
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L70-G74 + L66 — explain ~83/124 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G74** — severity 47.68, 19 conflict(s); suspect input ~`I12` (group: push_out)
  - push-out (wants farther): I22@23.5Å(now 19.7,conf 0.76), K32@23.3Å(now 20.7,conf 0.76), V25@23.6Å(now 19.2,conf 0.76), L66@24.3Å(now 19.9,conf 0.72), N24@24.6Å(now 20.2,conf 0.70), I12@25.6Å(now 18.8,conf 0.70), Q30@19.5Å(now 16.1,conf 0.57), I35@15.5Å(now 12.6,conf 0.55), R41@15.8Å(now 12.1,conf 0.55)
  - L70↔I12: targets 9.0/25.6Å but partners are 9.8Å apart → too_close_together by 6.8Å
  - V69↔I12: targets 11.0/25.6Å but partners are 8.0Å apart → too_close_together by 6.7Å
  - L68↔I12: targets 15.0/25.6Å but partners are 5.0Å apart → too_close_together by 5.6Å
- **R73** — severity 34.21, 13 conflict(s); suspect input ~`T13` (group: push_out)
  - push-out (wants farther): V16@27.4Å(now 24.1,conf 0.97), I2@27.4Å(now 23.1,conf 0.93), T13@26.2Å(now 20.6,conf 0.73), F3@25.1Å(now 21.2,conf 0.69), K32@20.9Å(now 17.9,conf 0.59), V25@20.5Å(now 17.4,conf 0.59), I29@18.4Å(now 13.4,conf 0.55), Q30@16.5Å(now 12.9,conf 0.55)
  - L70↔T13: targets 8.9/26.2Å but partners are 12.1Å apart → too_close_together by 5.2Å
  - V69↔I2: targets 11.0/27.4Å but partners are 12.5Å apart → too_close_together by 3.8Å
  - V69↔T13: targets 11.0/26.2Å but partners are 10.3Å apart → too_close_together by 4.8Å
- **K32** — severity 12.08, 7 conflict(s); suspect input ~`R71` (group: push_out)
  - push-out (wants farther): G74@23.3Å(now 20.7,conf 0.76), R73@20.9Å(now 17.9,conf 0.59), R71@18.3Å(now 14.7,conf 0.55), L68@13.9Å(now 9.9,conf 0.55)
  - I29↔R71: targets 5.0/18.3Å but partners are 9.3Å apart → too_close_together by 4.0Å
  - I29↔G74: targets 5.0/23.3Å but partners are 15.4Å apart → too_close_together by 2.9Å
  - I29↔L68: targets 5.0/13.9Å but partners are 5.4Å apart → too_close_together by 3.5Å
- **I12** — severity 11.39, 6 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@25.6Å(now 18.8,conf 0.70), L70@14.5Å(now 9.8,conf 0.55)
  - T6↔G74: targets 9.0/25.6Å but partners are 12.1Å apart → too_close_together by 4.5Å
  - G74↔V4: targets 25.6/5.2Å but partners are 16.0Å apart → too_close_together by 4.5Å
  - K5↔G74: targets 7.0/25.6Å but partners are 15.8Å apart → too_close_together by 2.9Å
- **L66** — severity 8.31, 6 conflict(s); suspect input ~`V4` (group: pull_in)
  - pull-in (wants closer): N59@11.0Å(now 14.5,conf 0.99), L7@11.5Å(now 14.2,conf 0.55), G46@9.7Å(now 13.6,conf 0.55)
  - push-out (wants farther): R71@17.0Å(now 14.4,conf 0.99), G74@24.3Å(now 19.9,conf 0.72), G34@17.4Å(now 13.9,conf 0.55), I35@15.4Å(now 12.7,conf 0.55), T13@10.3Å(now 5.0,conf 0.55)
  - G74↔V4: targets 24.3/4.9Å but partners are 16.0Å apart → too_close_together by 3.4Å
  - V69↔G74: targets 10.6/24.3Å but partners are 11.3Å apart → too_close_together by 2.4Å
  - G74↔Q40: targets 24.3/11.6Å but partners are 10.2Å apart → too_close_together by 2.5Å
- **Q30** — severity 7.67, 6 conflict(s); suspect input ~`L72` (group: push_out)
  - push-out (wants farther): G74@19.5Å(now 16.1,conf 0.57), R73@16.5Å(now 12.9,conf 0.55), L72@14.5Å(now 11.0,conf 0.55), R71@14.2Å(now 10.1,conf 0.55), L70@12.2Å(now 8.1,conf 0.55)
  - I35↔R71: targets 4.8/14.2Å but partners are 6.9Å apart → too_close_together by 2.6Å
  - I35↔L72: targets 4.8/14.5Å but partners are 7.2Å apart → too_close_together by 2.6Å
  - G34↔L72: targets 5.0/14.5Å but partners are 7.2Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=32 · 3-10(G)=10 · coil(C)=12

```
EGCEEEEHCEEEEEEEEHGEEHHHHHHEHEEHEHCEGCGEEGCCHHCECEEHEEHHHEHCEEGGEGHCEGGHCC
```

## Backbone H-bond Network

- total=70 · helix(i→i+4)=5 · sheet=65
  - P18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - V25 ↔ I29  (helix)
  - G52 ↔ S56  (helix)
  - L55 ↔ N59  (helix)
  - Q1 ↔ T11  (sheet)
  - Q1 ↔ I12  (sheet)
  - Q1 ↔ T13  (sheet)
  - Q1 ↔ L14  (sheet)
  - Q1 ↔ E15  (sheet)
  - Q1 ↔ V16  (sheet)
  - Q1 ↔ E17  (sheet)
  - V4 ↔ K10  (sheet)
  - V4 ↔ T11  (sheet)
  - V4 ↔ I12  (sheet)
  - V4 ↔ T13  (sheet)
  - V4 ↔ L14  (sheet)
  - K5 ↔ K10  (sheet)
  - K5 ↔ T11  (sheet)
  - K5 ↔ I12  (sheet)
  - … +50 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=278 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=143 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0667 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
