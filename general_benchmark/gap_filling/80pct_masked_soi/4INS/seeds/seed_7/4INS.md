# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4INS\seeds\seed_7\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 9.243 A
- tm_score_ca_ordered: 0.25785324581209257
- heavy_atom_rmsd: 10.519 A
- sidechain_heavy_atom_rmsd: 11.643 A
- **all-atom quality (honest):** heavy 10.519 A, sidechain 11.643 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 30
- distogram_pairs: 1197
- bin_accuracy: 0.353

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.242815606331034
- ga_delta_rmsd: -0.5025205639176438  ga_fitness_mode: energy
- pre_local_rmsd: 9.2706924582301  localized_anchor_rmsd: 9.24277233455738

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y44-K47 → 368 conflicts (31%); P93-K94 → 205 conflicts (17%); C66-V67 → 134 conflicts (11%)
- explained: 707/1196 conflicts by 3 root cause(s)
- metrics: hubs=91 (frac 0.968), conflicts/hub=13.1, max_incompat=12.83Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y44-K47 + P93-K94 + C66-V67 — explain ~707/1196 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K47** — severity 152.64, 40 conflict(s); suspect input ~`E50` (group: pull_in)
  - pull-in (wants closer): I9@16.7Å(now 22.4,conf 0.55), L24@15.3Å(now 19.1,conf 0.55), C6@12.3Å(now 20.1,conf 0.55)
  - push-out (wants farther): S55@27.5Å(now 17.2,conf 1.00), I56@27.5Å(now 18.4,conf 1.00), H70@27.5Å(now 12.5,conf 1.00), C57@27.4Å(now 15.8,conf 0.97), C53@20.6Å(now 14.9,conf 0.84), L71@26.8Å(now 13.7,conf 0.82), Q51@16.6Å(now 13.9,conf 0.79), C52@17.4Å(now 14.8,conf 0.79), G38@22.8Å(now 17.0,conf 0.71), Y44@10.2Å(now 6.6,conf 0.69), T54@23.0Å(now 16.6,conf 0.66), L62@20.5Å(now 12.1,conf 0.59), G41@19.8Å(now 11.8,conf 0.57), N64@19.6Å(now 14.7,conf 0.57), E31@18.3Å(now 15.7,conf 0.55), F42@16.2Å(now 11.4,conf 0.55)
  - I56↔E50: targets 27.5/13.0Å but partners are 3.2Å apart → too_close_together by 11.2Å
  - H70↔E50: targets 27.5/13.0Å but partners are 4.2Å apart → too_close_together by 10.3Å
  - S55↔E50: targets 27.5/13.0Å but partners are 4.8Å apart → too_close_together by 9.7Å
- **V67** — severity 117.61, 41 conflict(s); suspect input ~`Q61` (group: push_out)
  - push-out (wants farther): C19@27.5Å(now 24.4,conf 1.00), R40@27.5Å(now 19.2,conf 0.99), L71@11.0Å(now 8.2,conf 0.99), S74@17.0Å(now 14.4,conf 0.99), L35@27.3Å(now 22.8,conf 0.92), T45@27.2Å(now 16.4,conf 0.89), G38@27.1Å(now 19.4,conf 0.86), G73@16.8Å(now 11.9,conf 0.82), F42@26.6Å(now 18.4,conf 0.78), C72@14.0Å(now 8.8,conf 0.59), E50@17.7Å(now 9.0,conf 0.55), Q51@14.5Å(now 9.3,conf 0.55)
  - T45↔Q61: targets 27.2/6.5Å but partners are 12.5Å apart → too_close_together by 8.2Å
  - R40↔H70: targets 27.5/10.9Å but partners are 9.5Å apart → too_close_together by 7.1Å
  - H70↔G38: targets 10.9/27.1Å but partners are 9.9Å apart → too_close_together by 6.3Å
- **H70** — severity 102.83, 31 conflict(s); suspect input ~`T45` (group: push_out)
  - push-out (wants farther): C5@27.5Å(now 24.7,conf 1.00), K47@27.5Å(now 12.5,conf 1.00), L24@27.0Å(now 17.8,conf 0.84), Y65@13.4Å(now 10.9,conf 0.79), G73@10.6Å(now 6.6,conf 0.79), T45@24.5Å(now 12.0,conf 0.71), L29@22.1Å(now 15.5,conf 0.64), S27@19.1Å(now 13.8,conf 0.56), F90@18.7Å(now 15.1,conf 0.56), G38@18.6Å(now 9.9,conf 0.55), E31@18.0Å(now 11.7,conf 0.55), Y34@17.7Å(now 9.1,conf 0.55), N64@16.5Å(now 12.0,conf 0.55), E63@15.5Å(now 11.4,conf 0.55), L62@11.9Å(now 9.0,conf 0.55), Y60@13.9Å(now 11.3,conf 0.55)
  - C66↔K47: targets 11.0/27.5Å but partners are 7.4Å apart → too_close_together by 9.1Å
  - K47↔G73: targets 27.5/10.6Å but partners are 6.5Å apart → too_close_together by 10.4Å
  - K47↔V77: targets 27.5/11.1Å but partners are 8.4Å apart → too_close_together by 8.0Å
- **L71** — severity 93.95, 32 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): T7@27.5Å(now 24.9,conf 1.00), Q4@27.5Å(now 24.2,conf 0.99), V67@11.0Å(now 8.2,conf 0.99), Y65@12.9Å(now 7.3,conf 0.94), N64@14.7Å(now 6.0,conf 0.82), K47@26.8Å(now 13.7,conf 0.82), T45@21.3Å(now 14.5,conf 0.60), S27@15.6Å(now 11.1,conf 0.55)
  - K47↔S74: targets 26.8/8.0Å but partners are 8.8Å apart → too_close_together by 10.0Å
  - C66↔K47: targets 11.0/26.8Å but partners are 7.4Å apart → too_close_together by 8.4Å
  - K47↔L76: targets 26.8/4.9Å but partners are 10.2Å apart → too_close_together by 11.8Å
- **C57** — severity 90.71, 32 conflict(s); suspect input ~`N68` (group: push_out)
  - pull-in (wants closer): V20@27.5Å(now 31.1,conf 1.00), N21@27.5Å(now 30.8,conf 1.00), T7@27.5Å(now 32.2,conf 1.00), G85@18.4Å(now 21.1,conf 0.55), T92@16.1Å(now 20.5,conf 0.55), L80@12.0Å(now 16.6,conf 0.55)
  - push-out (wants farther): K47@27.4Å(now 15.8,conf 0.97), Q51@8.7Å(now 4.8,conf 0.82), P46@24.3Å(now 14.9,conf 0.72), L33@22.3Å(now 19.6,conf 0.66), E50@9.4Å(now 5.1,conf 0.55)
  - K47↔L62: targets 27.4/7.4Å but partners are 12.1Å apart → too_close_together by 7.9Å
  - K47↔N68: targets 27.4/5.3Å but partners are 11.5Å apart → too_close_together by 10.6Å
  - K47↔Q61: targets 27.4/6.4Å but partners are 11.1Å apart → too_close_together by 9.9Å
- **I56** — severity 90.31, 38 conflict(s); suspect input ~`Q69` (group: pull_in)
  - pull-in (wants closer): F90@18.9Å(now 21.4,conf 0.56), K94@18.0Å(now 22.4,conf 0.55), P93@15.5Å(now 20.3,conf 0.55)
  - push-out (wants farther): K47@27.5Å(now 18.4,conf 1.00), E50@12.6Å(now 3.2,conf 0.82), C52@6.8Å(now 3.7,conf 0.82), C37@23.2Å(now 19.3,conf 0.75), V36@25.5Å(now 20.2,conf 0.70), Y44@22.7Å(now 17.0,conf 0.70), V49@16.2Å(now 9.7,conf 0.67), F43@22.4Å(now 14.9,conf 0.67), R40@22.0Å(now 15.6,conf 0.64), F42@21.6Å(now 16.3,conf 0.61), E31@21.1Å(now 17.3,conf 0.60), Q61@11.0Å(now 8.5,conf 0.58), G41@19.9Å(now 12.8,conf 0.58), E39@19.7Å(now 12.4,conf 0.57)
  - K47↔C53: targets 27.5/7.0Å but partners are 14.9Å apart → too_close_together by 5.6Å
  - K47↔C52: targets 27.5/6.8Å but partners are 14.8Å apart → too_close_together by 5.9Å
  - K47↔L59: targets 27.5/10.6Å but partners are 11.4Å apart → too_close_together by 5.5Å

## Secondary Structure (DSSP-like)

- helix(H)=59 · strand(E)=20 · 3-10(G)=13 · coil(C)=2

```
CHHEHHHEEGEHGGHHHEHHEEHCHEGGHHHHHGGHHHGGHHHHHHHHHHHHHHEHHHHHEGHHEHHEHEHHEGHHHGHEHHHEEHEHHGHEHE
```

## Backbone H-bond Network

- total=66 · helix(i→i+4)=30 · sheet=36
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - L12 ↔ E16  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - C19 ↔ H23  (helix)
  - C25 ↔ L29  (helix)
  - L29 ↔ L33  (helix)
  - A32 ↔ V36  (helix)
  - L33 ↔ C37  (helix)
  - C37 ↔ G41  (helix)
  - G41 ↔ T45  (helix)
  - F42 ↔ P46  (helix)
  - F43 ↔ K47  (helix)
  - T45 ↔ V49  (helix)
  - P46 ↔ E50  (helix)
  - K47 ↔ Q51  (helix)
  - E50 ↔ T54  (helix)
  - T54 ↔ S58  (helix)
  - L59 ↔ E63  (helix)
  - … +46 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=45 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=541 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=321 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.8621 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=30 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
