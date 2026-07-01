# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1FKF\seeds\seed_0\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 10.500 A
- tm_score_ca_ordered: 0.22304325876248954
- heavy_atom_rmsd: 11.183 A
- sidechain_heavy_atom_rmsd: 11.852 A
- **all-atom quality (honest):** heavy 11.183 A, sidechain 11.852 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 71
- distogram_pairs: 1089
- bin_accuracy: 0.308

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.499906682975006
- ga_delta_rmsd: 1.1484668115507226  ga_fitness_mode: energy
- pre_local_rmsd: 10.50626159668928  localized_anchor_rmsd: 10.499911591207866

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q64-R70 → 535 conflicts (34%); E30 → 131 conflicts (8%); I75-S76 → 95 conflicts (6%)
- explained: 761/1566 conflicts by 3 root cause(s)
- metrics: hubs=100 (frac 0.952), conflicts/hub=15.7, max_incompat=17.18Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q64-R70 + E30 + I75-S76 — explain ~761/1566 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V67** — severity 229.60, 67 conflict(s); suspect input ~`L102` (group: pull_in)
  - pull-in (wants closer): G9@5.2Å(now 16.7,conf 0.57), E4@15.0Å(now 19.5,conf 0.55)
  - push-out (wants farther): E60@15.0Å(now 3.4,conf 1.00), G88@27.5Å(now 12.7,conf 1.00), P91@27.5Å(now 10.6,conf 1.00), H93@27.5Å(now 10.0,conf 1.00), G85@27.5Å(now 7.6,conf 1.00), D78@27.1Å(now 5.2,conf 0.88), S76@23.6Å(now 5.3,conf 0.76), A63@10.0Å(now 6.2,conf 0.72), T74@19.2Å(now 10.1,conf 0.56), F98@16.7Å(now 9.5,conf 0.55), G61@13.1Å(now 7.4,conf 0.55), A71@11.2Å(now 8.6,conf 0.55), L73@15.4Å(now 10.3,conf 0.55), D99@14.6Å(now 11.7,conf 0.55), K72@14.6Å(now 11.2,conf 0.55), Q64@10.2Å(now 5.3,conf 0.55)
  - G88↔R70: targets 27.5/9.0Å but partners are 5.4Å apart → too_close_together by 13.1Å
  - G85↔R70: targets 27.5/9.0Å but partners are 7.9Å apart → too_close_together by 10.6Å
  - G85↔L102: targets 27.5/5.5Å but partners are 8.6Å apart → too_close_together by 13.4Å
- **P91** — severity 183.97, 35 conflict(s); suspect input ~`G85` (group: pull_in)
  - pull-in (wants closer): G32@14.3Å(now 21.6,conf 0.55), D36@14.3Å(now 20.3,conf 0.55)
  - push-out (wants farther): L105@27.5Å(now 11.8,conf 1.00), K16@27.5Å(now 24.7,conf 1.00), V67@27.5Å(now 10.6,conf 1.00), V100@21.2Å(now 17.4,conf 0.60)
  - V67↔G85: targets 27.5/3.2Å but partners are 7.6Å apart → too_close_together by 16.6Å
  - L105↔G85: targets 27.5/3.2Å but partners are 10.6Å apart → too_close_together by 13.7Å
  - V67↔L96: targets 27.5/10.9Å but partners are 4.0Å apart → too_close_together by 12.6Å
- **E30** — severity 168.56, 55 conflict(s); suspect input ~`T74` (group: pull_in)
  - pull-in (wants closer): V97@6.2Å(now 18.2,conf 0.55), G57@15.0Å(now 19.2,conf 0.55), L73@11.2Å(now 18.1,conf 0.55), G82@14.8Å(now 22.6,conf 0.55), W58@16.3Å(now 20.2,conf 0.55), T74@8.4Å(now 18.2,conf 0.55), Y81@14.4Å(now 17.2,conf 0.55), P77@11.6Å(now 18.6,conf 0.55), A94@8.1Å(now 21.2,conf 0.55), G85@14.2Å(now 20.2,conf 0.55), I75@9.9Å(now 16.1,conf 0.55)
  - push-out (wants farther): H24@19.0Å(now 12.7,conf 1.00), K34@9.0Å(now 6.3,conf 1.00), S37@15.0Å(now 12.4,conf 1.00), F35@11.0Å(now 8.4,conf 0.99), K51@27.4Å(now 21.7,conf 0.94), P15@26.9Å(now 10.1,conf 0.82), M48@26.6Å(now 22.1,conf 0.78), F47@23.6Å(now 18.9,conf 0.76), C21@24.4Å(now 11.8,conf 0.71), V23@20.8Å(now 15.6,conf 0.59), E4@14.4Å(now 5.8,conf 0.55)
  - M48↔T74: targets 26.6/8.4Å but partners are 4.3Å apart → too_close_together by 13.8Å
  - K51↔I75: targets 27.4/9.9Å but partners are 6.2Å apart → too_close_together by 11.3Å
  - F47↔T74: targets 23.6/8.4Å but partners are 4.5Å apart → too_close_together by 10.7Å
- **H93** — severity 161.99, 27 conflict(s); suspect input ~`L102` (group: pull_in)
  - pull-in (wants closer): G32@16.0Å(now 24.4,conf 0.55)
  - push-out (wants farther): G9@27.5Å(now 22.0,conf 1.00), V67@27.5Å(now 10.0,conf 1.00), L103@27.5Å(now 11.8,conf 1.00), L102@27.2Å(now 12.3,conf 0.90)
  - L96↔L103: targets 9.0/27.5Å but partners are 4.0Å apart → too_close_together by 14.5Å
  - L96↔V67: targets 9.0/27.5Å but partners are 4.0Å apart → too_close_together by 14.5Å
  - L96↔L102: targets 9.0/27.2Å but partners are 4.9Å apart → too_close_together by 13.3Å
- **P92** — severity 133.90, 30 conflict(s); suspect input ~`E101` (group: pull_in)
  - pull-in (wants closer): H86@7.0Å(now 10.6,conf 0.99), F35@14.6Å(now 18.4,conf 0.55), K33@15.4Å(now 19.2,conf 0.55), L29@11.7Å(now 16.5,conf 0.55)
  - push-out (wants farther): T13@27.5Å(now 24.2,conf 1.00), L105@27.5Å(now 9.4,conf 1.00), D99@20.9Å(now 18.2,conf 0.91), E101@27.0Å(now 15.3,conf 0.85), V100@22.6Å(now 18.8,conf 0.69)
  - L105↔G85: targets 27.5/5.0Å but partners are 10.6Å apart → too_close_together by 11.9Å
  - G85↔E101: targets 5.0/27.0Å but partners are 10.0Å apart → too_close_together by 12.0Å
  - H86↔E101: targets 7.0/27.0Å but partners are 8.7Å apart → too_close_together by 11.3Å
- **S76** — severity 133.57, 44 conflict(s); suspect input ~`Y81` (group: pull_in)
  - pull-in (wants closer): Q2@9.0Å(now 13.6,conf 0.55), G32@15.2Å(now 20.0,conf 0.55)
  - push-out (wants farther): Q69@21.0Å(now 11.3,conf 0.99), A71@16.9Å(now 10.3,conf 0.91), R70@19.4Å(now 13.6,conf 0.79), V67@23.6Å(now 5.3,conf 0.76), S66@21.9Å(now 7.2,conf 0.63), Y79@5.6Å(now 2.2,conf 0.56), M65@18.4Å(now 9.3,conf 0.55), E59@13.2Å(now 8.6,conf 0.55)
  - A80↔V67: targets 5.3/23.6Å but partners are 3.8Å apart → too_close_together by 14.5Å
  - V67↔Y79: targets 23.6/5.6Å but partners are 3.8Å apart → too_close_together by 14.2Å
  - V67↔Y81: targets 23.6/7.8Å but partners are 5.9Å apart → too_close_together by 9.9Å

## Secondary Structure (DSSP-like)

- helix(H)=48 · strand(E)=32 · 3-10(G)=18 · coil(C)=7

```
CEHHEHHHHHHCEGGHCEGEEGHEEEECHEGGGGHEEHEHEEEEECEHHEHGHHHHHGGHHHHGHHHHHGHHEGCEHHEHHEHEHHEHEGEGGEHEGHHHEHHHC
```

## Backbone H-bond Network

- total=99 · helix(i→i+4)=21 · sheet=78
  - V3 ↔ S7  (helix)
  - E4 ↔ P8  (helix)
  - I6 ↔ D10  (helix)
  - S7 ↔ G11  (helix)
  - L49 ↔ E53  (helix)
  - K51 ↔ I55  (helix)
  - E53 ↔ G57  (helix)
  - R56 ↔ E60  (helix)
  - G57 ↔ G61  (helix)
  - G61 ↔ M65  (helix)
  - V62 ↔ S66  (helix)
  - A63 ↔ V67  (helix)
  - M65 ↔ Q69  (helix)
  - V67 ↔ A71  (helix)
  - G68 ↔ K72  (helix)
  - P77 ↔ Y81  (helix)
  - Y81 ↔ G85  (helix)
  - T95 ↔ D99  (helix)
  - F98 ↔ L102  (helix)
  - D99 ↔ L103  (helix)
  - … +79 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=43 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=766 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=561 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=7.3829 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=71 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
