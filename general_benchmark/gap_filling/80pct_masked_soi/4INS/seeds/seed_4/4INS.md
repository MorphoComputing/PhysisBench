# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4INS\seeds\seed_4\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 7.506 A
- tm_score_ca_ordered: 0.3264022068703276
- heavy_atom_rmsd: 8.695 A
- sidechain_heavy_atom_rmsd: 9.774 A
- **all-atom quality (honest):** heavy 8.695 A, sidechain 9.774 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 34
- distogram_pairs: 1197
- bin_accuracy: 0.323

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.505912927115271
- ga_delta_rmsd: -0.10342493249862272  ga_fitness_mode: energy
- pre_local_rmsd: 7.505933807897279  localized_anchor_rmsd: 7.505933807897279

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G41-K47 → 572 conflicts (42%); C66-C72 → 308 conflicts (23%); S55-C57 → 80 conflicts (6%)
- explained: 960/1360 conflicts by 3 root cause(s)
- metrics: hubs=92 (frac 0.979), conflicts/hub=14.8, max_incompat=15.89Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G41-K47 + C66-C72 + S55-C57 — explain ~960/1360 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L71** — severity 218.96, 68 conflict(s); suspect input ~`H75` (group: pull_in)
  - pull-in (wants closer): S74@7.1Å(now 10.4,conf 0.91), H75@6.4Å(now 9.0,conf 0.69), C57@8.0Å(now 11.5,conf 0.55)
  - push-out (wants farther): T7@27.5Å(now 23.7,conf 1.00), V20@27.5Å(now 23.9,conf 1.00), I9@27.5Å(now 23.2,conf 1.00), Q4@27.5Å(now 24.6,conf 0.99), N64@15.0Å(now 3.3,conf 0.99), Y13@27.4Å(now 22.9,conf 0.95), Q14@27.4Å(now 23.4,conf 0.93), Y65@13.1Å(now 3.7,conf 0.91), V67@12.9Å(now 7.3,conf 0.91), K47@26.8Å(now 10.1,conf 0.82), C66@11.4Å(now 7.7,conf 0.79), N17@25.4Å(now 21.9,conf 0.70), T45@21.3Å(now 7.3,conf 0.60), N68@9.4Å(now 5.0,conf 0.55), L35@16.3Å(now 13.5,conf 0.55)
  - K47↔C66: targets 26.8/11.4Å but partners are 4.7Å apart → too_close_together by 10.7Å
  - K47↔L76: targets 26.8/4.9Å but partners are 7.7Å apart → too_close_together by 14.3Å
  - K47↔E78: targets 26.8/10.6Å but partners are 6.3Å apart → too_close_together by 9.9Å
- **V67** — severity 162.80, 49 conflict(s); suspect input ~`L62` (group: push_out)
  - push-out (wants farther): C19@27.5Å(now 23.8,conf 1.00), R40@27.5Å(now 18.8,conf 0.99), L35@27.3Å(now 20.3,conf 0.92), L71@12.9Å(now 7.3,conf 0.91), T45@27.2Å(now 12.4,conf 0.89), G38@27.1Å(now 19.5,conf 0.86), N64@8.7Å(now 6.0,conf 0.82), G73@16.8Å(now 13.7,conf 0.82), F42@26.6Å(now 17.4,conf 0.78), C72@15.1Å(now 11.4,conf 0.67), E50@17.7Å(now 13.2,conf 0.55), E63@7.8Å(now 5.2,conf 0.40)
  - T45↔L62: targets 27.2/7.1Å but partners are 9.8Å apart → too_close_together by 10.3Å
  - T45↔Y60: targets 27.2/3.8Å but partners are 13.2Å apart → too_close_together by 10.2Å
  - T45↔Q61: targets 27.2/6.6Å but partners are 11.7Å apart → too_close_together by 8.9Å
- **K47** — severity 161.46, 40 conflict(s); suspect input ~`F43` (group: pull_in)
  - pull-in (wants closer): R40@13.9Å(now 17.8,conf 0.82), F43@8.0Å(now 10.5,conf 0.67), C6@12.3Å(now 16.5,conf 0.55), L15@15.8Å(now 18.8,conf 0.55)
  - push-out (wants farther): S55@27.5Å(now 17.1,conf 1.00), I56@27.5Å(now 13.5,conf 1.00), H70@27.5Å(now 15.0,conf 1.00), C57@27.4Å(now 14.2,conf 0.97), T54@23.2Å(now 18.3,conf 0.91), C53@20.7Å(now 16.6,conf 0.82), L71@26.8Å(now 10.1,conf 0.82), C52@18.0Å(now 14.3,conf 0.72), G38@22.8Å(now 17.2,conf 0.71), V36@20.9Å(now 15.6,conf 0.59), L62@20.5Å(now 11.2,conf 0.59), G41@19.8Å(now 14.2,conf 0.57), N64@19.6Å(now 11.9,conf 0.57), E31@18.3Å(now 12.8,conf 0.55), A32@18.2Å(now 10.2,conf 0.55), F42@16.2Å(now 13.7,conf 0.55)
  - E50↔C57: targets 13.0/27.4Å but partners are 3.9Å apart → too_close_together by 10.6Å
  - I56↔E50: targets 27.5/13.0Å but partners are 5.0Å apart → too_close_together by 9.4Å
  - I56↔F43: targets 27.5/8.0Å but partners are 6.5Å apart → too_close_together by 13.0Å
- **H70** — severity 152.01, 44 conflict(s); suspect input ~`T45` (group: pull_in)
  - pull-in (wants closer): V77@11.1Å(now 13.8,conf 0.91), E78@12.8Å(now 15.3,conf 0.55), L82@15.6Å(now 18.8,conf 0.55)
  - push-out (wants farther): K47@27.5Å(now 15.0,conf 1.00), L24@27.0Å(now 23.8,conf 0.84), G73@10.7Å(now 7.6,conf 0.82), Y65@14.0Å(now 5.4,conf 0.72), T45@24.5Å(now 10.7,conf 0.71), F90@18.7Å(now 13.0,conf 0.56), G38@18.6Å(now 11.8,conf 0.55), Y34@17.7Å(now 11.1,conf 0.55), T92@17.2Å(now 8.0,conf 0.55), N64@16.5Å(now 5.9,conf 0.55), E63@15.5Å(now 9.3,conf 0.55), L62@11.9Å(now 7.4,conf 0.55)
  - K47↔C66: targets 27.5/11.1Å but partners are 4.7Å apart → too_close_together by 11.7Å
  - K47↔L76: targets 27.5/8.9Å but partners are 7.7Å apart → too_close_together by 10.9Å
  - K47↔V77: targets 27.5/11.1Å but partners are 6.0Å apart → too_close_together by 10.3Å
- **I56** — severity 135.77, 46 conflict(s); suspect input ~`Q69` (group: pull_in)
  - pull-in (wants closer): Q69@5.1Å(now 10.7,conf 0.57), G73@13.5Å(now 17.6,conf 0.55)
  - push-out (wants farther): K47@27.5Å(now 13.5,conf 1.00), V2@27.5Å(now 15.4,conf 1.00), C37@23.2Å(now 16.4,conf 0.75), H28@23.8Å(now 11.3,conf 0.75), V36@25.5Å(now 16.7,conf 0.70), Y44@22.7Å(now 9.2,conf 0.70), V49@15.9Å(now 7.9,conf 0.67), C52@8.2Å(now 4.9,conf 0.67), F43@22.4Å(now 6.5,conf 0.67), R40@22.0Å(now 13.1,conf 0.64), F42@21.6Å(now 11.1,conf 0.61), V30@21.4Å(now 12.3,conf 0.60), E31@21.1Å(now 10.6,conf 0.60), E50@13.4Å(now 5.0,conf 0.59), G41@19.9Å(now 10.0,conf 0.58), E39@19.7Å(now 11.1,conf 0.57)
  - K47↔L59: targets 27.5/9.8Å but partners are 7.4Å apart → too_close_together by 10.3Å
  - K47↔Q69: targets 27.5/5.1Å but partners are 12.4Å apart → too_close_together by 10.0Å
  - G41↔Q69: targets 19.9/5.1Å but partners are 4.8Å apart → too_close_together by 10.0Å
- **C72** — severity 129.01, 45 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): L76@5.2Å(now 8.6,conf 0.82), V77@7.3Å(now 13.3,conf 0.82), E78@9.4Å(now 15.1,conf 0.79), H75@6.0Å(now 9.8,conf 0.72), A79@9.0Å(now 13.8,conf 0.67), L80@11.3Å(now 13.9,conf 0.55)
  - push-out (wants farther): N68@12.8Å(now 6.3,conf 0.82), V2@22.8Å(now 18.7,conf 0.71), P46@22.7Å(now 12.2,conf 0.70), V67@15.1Å(now 11.4,conf 0.67), Q69@9.4Å(now 2.0,conf 0.67), N64@16.6Å(now 5.7,conf 0.55), Y65@15.0Å(now 7.3,conf 0.55), R40@15.5Å(now 7.9,conf 0.55), G41@13.6Å(now 4.0,conf 0.55)
  - L76↔P46: targets 5.2/22.7Å but partners are 7.5Å apart → too_close_together by 10.0Å
  - V77↔P46: targets 7.3/22.7Å but partners are 5.7Å apart → too_close_together by 9.7Å
  - H75↔P46: targets 6.0/22.7Å but partners are 7.8Å apart → too_close_together by 9.0Å

## Secondary Structure (DSSP-like)

- helix(H)=62 · strand(E)=20 · 3-10(G)=10 · coil(C)=2

```
CHEHHGHCEGEEHHGEHEHHEHHEHEHEHHHHHHHHHEHHHHHEHHHHGHHHHHEHHEHHEHHHEHHHHHHHHEHHGGHHHHHHEHGGHGHEGE
```

## Backbone H-bond Network

- total=51 · helix(i→i+4)=30 · sheet=21
  - Y13 ↔ N17  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L35 ↔ E39  (helix)
  - V36 ↔ R40  (helix)
  - E39 ↔ F43  (helix)
  - G41 ↔ T45  (helix)
  - F42 ↔ P46  (helix)
  - F43 ↔ K47  (helix)
  - P46 ↔ E50  (helix)
  - K47 ↔ Q51  (helix)
  - E50 ↔ T54  (helix)
  - C52 ↔ I56  (helix)
  - C53 ↔ C57  (helix)
  - … +31 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=50 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=528 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=327 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.1834 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=34 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
