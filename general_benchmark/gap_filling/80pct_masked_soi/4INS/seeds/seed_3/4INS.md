# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4INS\seeds\seed_3\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 6.981 A
- tm_score_ca_ordered: 0.32288009903085113
- heavy_atom_rmsd: 8.252 A
- sidechain_heavy_atom_rmsd: 9.387 A
- **all-atom quality (honest):** heavy 8.252 A, sidechain 9.387 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 48
- distogram_pairs: 1198
- bin_accuracy: 0.359

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.98100608307752
- ga_delta_rmsd: 0.48526727630635147  ga_fitness_mode: energy
- pre_local_rmsd: 7.005926035506194  localized_anchor_rmsd: 6.981047899499818

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F43-K47 → 405 conflicts (35%); S74-H75 → 97 conflicts (8%); I56-C57 → 69 conflicts (6%)
- explained: 571/1162 conflicts by 3 root cause(s)
- metrics: hubs=90 (frac 0.957), conflicts/hub=12.9, max_incompat=17.85Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F43-K47 + S74-H75 + I56-C57 — explain ~571/1162 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L71** — severity 184.75, 53 conflict(s); suspect input ~`K47` (group: pull_in)
  - pull-in (wants closer): H75@5.1Å(now 7.8,conf 0.91), C57@8.0Å(now 10.9,conf 0.55)
  - push-out (wants farther): Q4@27.5Å(now 23.9,conf 0.99), Y65@13.0Å(now 8.9,conf 0.99), Y13@27.4Å(now 22.4,conf 0.95), N64@15.0Å(now 12.1,conf 0.94), Q14@27.4Å(now 22.4,conf 0.93), K47@26.8Å(now 10.6,conf 0.82), C66@11.4Å(now 7.3,conf 0.79), N17@25.4Å(now 22.6,conf 0.70), T45@21.3Å(now 6.0,conf 0.60), Y91@12.9Å(now 9.7,conf 0.55), C84@15.2Å(now 11.6,conf 0.55), N68@9.4Å(now 6.0,conf 0.55), L35@16.3Å(now 13.7,conf 0.55)
  - H75↔K47: targets 5.1/26.8Å but partners are 3.9Å apart → too_close_together by 17.9Å
  - K47↔L76: targets 26.8/4.9Å but partners are 8.3Å apart → too_close_together by 13.7Å
  - S74↔K47: targets 7.0/26.8Å but partners are 10.6Å apart → too_close_together by 9.2Å
- **H70** — severity 172.26, 47 conflict(s); suspect input ~`T45` (group: pull_in)
  - pull-in (wants closer): H75@7.4Å(now 11.2,conf 0.79)
  - push-out (wants farther): K47@27.5Å(now 13.8,conf 1.00), L24@27.0Å(now 23.1,conf 0.84), Y65@14.0Å(now 11.0,conf 0.72), T45@24.5Å(now 8.9,conf 0.71), V67@11.6Å(now 8.7,conf 0.69), G88@21.3Å(now 16.2,conf 0.60), S27@19.1Å(now 16.4,conf 0.56), F90@18.7Å(now 14.7,conf 0.56), G38@18.6Å(now 14.1,conf 0.55), Y34@17.7Å(now 12.9,conf 0.55), N64@16.5Å(now 13.2,conf 0.55), E63@15.5Å(now 10.6,conf 0.55), L62@11.9Å(now 7.4,conf 0.55)
  - K47↔H75: targets 27.5/7.4Å but partners are 3.9Å apart → too_close_together by 16.2Å
  - K47↔V77: targets 27.5/11.0Å but partners are 5.2Å apart → too_close_together by 11.3Å
  - K47↔L76: targets 27.5/7.1Å but partners are 8.3Å apart → too_close_together by 12.1Å
- **V67** — severity 143.02, 44 conflict(s); suspect input ~`F42` (group: pull_in)
  - pull-in (wants closer): Y60@3.2Å(now 8.6,conf 0.94)
  - push-out (wants farther): R40@27.5Å(now 21.1,conf 0.99), C25@27.4Å(now 23.5,conf 0.94), L35@27.3Å(now 22.5,conf 0.92), T45@27.2Å(now 15.1,conf 0.89), G38@27.1Å(now 20.7,conf 0.86), F42@26.6Å(now 18.3,conf 0.78), H28@23.7Å(now 19.8,conf 0.75), H70@11.6Å(now 8.7,conf 0.69), E63@9.0Å(now 5.8,conf 0.67), E50@17.7Å(now 14.1,conf 0.55)
  - T45↔L71: targets 27.2/11.3Å but partners are 6.0Å apart → too_close_together by 9.9Å
  - L62↔T45: targets 7.0/27.2Å but partners are 11.7Å apart → too_close_together by 8.4Å
  - T45↔C72: targets 27.2/15.2Å but partners are 4.2Å apart → too_close_together by 7.9Å
- **K47** — severity 142.15, 35 conflict(s); suspect input ~`F43` (group: push_out)
  - push-out (wants farther): S55@27.5Å(now 15.6,conf 1.00), I56@27.5Å(now 14.7,conf 1.00), H70@27.5Å(now 13.8,conf 1.00), C57@27.4Å(now 12.8,conf 0.97), T54@23.5Å(now 15.6,conf 0.94), L71@26.8Å(now 10.6,conf 0.82), C52@18.0Å(now 13.3,conf 0.72), G38@22.8Å(now 14.5,conf 0.71), C53@20.6Å(now 13.8,conf 0.67), V36@20.9Å(now 13.9,conf 0.59), L62@20.5Å(now 9.5,conf 0.59), G41@19.8Å(now 11.8,conf 0.57), N64@19.6Å(now 9.1,conf 0.57), E31@18.3Å(now 6.8,conf 0.55), A32@18.2Å(now 7.7,conf 0.55), L24@15.3Å(now 10.9,conf 0.55), F42@16.2Å(now 11.4,conf 0.55), L29@14.1Å(now 8.7,conf 0.55)
  - S55↔E50: targets 27.5/13.1Å but partners are 4.1Å apart → too_close_together by 10.3Å
  - L71↔F43: targets 26.8/8.5Å but partners are 7.2Å apart → too_close_together by 11.1Å
  - Y44↔L71: targets 9.1/26.8Å but partners are 8.7Å apart → too_close_together by 9.1Å
- **C57** — severity 141.24, 38 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): N68@5.3Å(now 8.2,conf 0.56), L71@8.0Å(now 10.9,conf 0.55), L80@12.0Å(now 16.0,conf 0.55)
  - push-out (wants farther): Q51@9.0Å(now 3.3,conf 0.99), K47@27.4Å(now 12.8,conf 0.97), C37@22.9Å(now 20.0,conf 0.72), P46@24.3Å(now 13.7,conf 0.72), V36@24.9Å(now 21.1,conf 0.69), V30@20.1Å(now 16.8,conf 0.58), C66@14.9Å(now 12.1,conf 0.55), E50@9.4Å(now 6.6,conf 0.55)
  - K47↔L62: targets 27.4/7.1Å but partners are 9.5Å apart → too_close_together by 10.9Å
  - K47↔Q61: targets 27.4/7.1Å but partners are 9.4Å apart → too_close_together by 10.9Å
  - K47↔E63: targets 27.4/11.1Å but partners are 8.3Å apart → too_close_together by 8.0Å
- **I56** — severity 137.40, 47 conflict(s); suspect input ~`Q69` (group: pull_in)
  - pull-in (wants closer): Q69@5.1Å(now 9.6,conf 0.57), F90@18.9Å(now 22.4,conf 0.56), C84@18.4Å(now 21.0,conf 0.55)
  - push-out (wants farther): K47@27.5Å(now 14.7,conf 1.00), V2@27.5Å(now 19.4,conf 1.00), V49@16.9Å(now 11.0,conf 0.94), H28@23.8Å(now 19.4,conf 0.75), V36@25.5Å(now 22.6,conf 0.70), Y44@22.7Å(now 19.2,conf 0.70), F43@22.4Å(now 13.0,conf 0.67), R40@22.0Å(now 17.0,conf 0.64), F42@21.6Å(now 17.9,conf 0.61), V30@21.4Å(now 18.3,conf 0.60), E31@21.1Å(now 15.0,conf 0.60), E50@13.6Å(now 6.6,conf 0.59), Q51@9.5Å(now 3.3,conf 0.58), G41@19.9Å(now 13.2,conf 0.58), E39@19.7Å(now 11.4,conf 0.57)
  - K47↔L62: targets 27.5/11.0Å but partners are 9.5Å apart → too_close_together by 7.0Å
  - K47↔L59: targets 27.5/10.6Å but partners are 8.7Å apart → too_close_together by 8.3Å
  - K47↔C53: targets 27.5/6.9Å but partners are 13.8Å apart → too_close_together by 6.8Å

## Secondary Structure (DSSP-like)

- helix(H)=60 · strand(E)=27 · 3-10(G)=6 · coil(C)=1

```
CHHEHHHEEEEHHHHHHEHHEGHEEEHEHHEEHHHHEEHHHHHHHEHEHHHHEHEGEGHHEHHHEGHHHHHHHHHHHHHEHHHHHEEGHGEHHE
```

## Backbone H-bond Network

- total=95 · helix(i→i+4)=31 · sheet=64
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - L29 ↔ L33  (helix)
  - L35 ↔ E39  (helix)
  - V36 ↔ R40  (helix)
  - E39 ↔ F43  (helix)
  - R40 ↔ Y44  (helix)
  - G41 ↔ T45  (helix)
  - F43 ↔ K47  (helix)
  - T45 ↔ V49  (helix)
  - K47 ↔ Q51  (helix)
  - L59 ↔ E63  (helix)
  - Y60 ↔ N64  (helix)
  - E63 ↔ V67  (helix)
  - N64 ↔ N68  (helix)
  - N68 ↔ C72  (helix)
  - … +75 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=594 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=378 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.9691 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=48 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
