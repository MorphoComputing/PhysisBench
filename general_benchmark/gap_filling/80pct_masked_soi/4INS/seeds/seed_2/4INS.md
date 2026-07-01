# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4INS\seeds\seed_2\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 5.019 A
- tm_score_ca_ordered: 0.5111519078854937
- heavy_atom_rmsd: 6.102 A
- sidechain_heavy_atom_rmsd: 6.973 A
- **all-atom quality (honest):** heavy 6.102 A, sidechain 6.973 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 1197
- bin_accuracy: 0.454

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.019123607102214
- ga_delta_rmsd: -0.14579078397114653  ga_fitness_mode: energy
- pre_local_rmsd: 5.022049356561963  localized_anchor_rmsd: 5.019119501386803

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P46-K47 → 143 conflicts (26%); H70-L71 → 61 conflicts (11%); C66 → 40 conflicts (7%)
- explained: 244/552 conflicts by 3 root cause(s)
- metrics: hubs=79 (frac 0.84), conflicts/hub=7.0, max_incompat=10.15Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P46-K47 + H70-L71 + C66 — explain ~244/552 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V67** — severity 66.79, 26 conflict(s); suspect input ~`Q61` (group: pull_in)
  - pull-in (wants closer): Q61@5.6Å(now 11.1,conf 0.69)
  - push-out (wants farther): R40@27.5Å(now 24.6,conf 0.99), H70@10.9Å(now 7.0,conf 0.91), S74@16.9Å(now 13.8,conf 0.91), T45@27.2Å(now 21.7,conf 0.89), G38@27.1Å(now 23.1,conf 0.86), N64@8.8Å(now 2.7,conf 0.82), G73@16.6Å(now 13.8,conf 0.79), F42@26.6Å(now 21.6,conf 0.78), L71@11.6Å(now 8.9,conf 0.69), L80@15.0Å(now 11.6,conf 0.55)
  - G38↔Q61: targets 27.1/5.6Å but partners are 14.1Å apart → too_close_together by 7.4Å
  - R40↔Q61: targets 27.5/5.6Å but partners are 15.2Å apart → too_close_together by 6.7Å
  - F42↔Q61: targets 26.6/5.6Å but partners are 14.4Å apart → too_close_together by 6.5Å
- **K47** — severity 64.11, 27 conflict(s); suspect input ~`C52` (group: pull_in)
  - pull-in (wants closer): I9@16.7Å(now 20.5,conf 0.55), L24@15.3Å(now 23.0,conf 0.55), C6@12.3Å(now 21.2,conf 0.55), L29@14.1Å(now 17.9,conf 0.55)
  - push-out (wants farther): S55@27.5Å(now 21.8,conf 1.00), I56@27.5Å(now 22.7,conf 1.00), H70@27.5Å(now 15.1,conf 1.00), C57@27.4Å(now 21.2,conf 0.97), L71@26.8Å(now 15.0,conf 0.82), G38@22.8Å(now 14.4,conf 0.71), F43@8.5Å(now 5.1,conf 0.69), V36@20.9Å(now 16.1,conf 0.59), L62@20.5Å(now 12.9,conf 0.59), G41@19.8Å(now 9.1,conf 0.57), N64@19.6Å(now 17.1,conf 0.57), F42@16.2Å(now 7.5,conf 0.55)
  - H70↔E50: targets 27.5/13.1Å but partners are 10.2Å apart → too_close_together by 4.2Å
  - Y44↔L71: targets 9.0/26.8Å but partners are 13.3Å apart → too_close_together by 4.5Å
  - S55↔E50: targets 27.5/13.1Å but partners are 10.6Å apart → too_close_together by 3.8Å
- **C66** — severity 51.75, 25 conflict(s); suspect input ~`L59` (group: push_out)
  - pull-in (wants closer): L59@3.4Å(now 6.6,conf 0.82), Y60@4.8Å(now 10.6,conf 0.82), Q69@9.2Å(now 11.7,conf 0.82), Q61@5.4Å(now 10.5,conf 0.79)
  - push-out (wants farther): G73@15.0Å(now 8.2,conf 0.99), L71@12.0Å(now 9.0,conf 0.59)
  - H70↔L59: targets 11.1/3.4Å but partners are 3.4Å apart → too_close_together by 4.3Å
  - G73↔L59: targets 15.0/3.4Å but partners are 7.5Å apart → too_close_together by 4.1Å
  - G73↔L62: targets 15.0/4.0Å but partners are 6.3Å apart → too_close_together by 4.6Å
- **L71** — severity 51.11, 18 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): N64@15.1Å(now 6.6,conf 0.91), Y65@13.2Å(now 6.3,conf 0.82), K47@26.8Å(now 15.0,conf 0.82), V67@11.6Å(now 8.9,conf 0.69), T45@21.3Å(now 17.6,conf 0.60), C66@12.0Å(now 9.0,conf 0.59), G85@17.3Å(now 14.3,conf 0.55), C84@15.2Å(now 11.4,conf 0.55)
  - H75↔K47: targets 5.0/26.8Å but partners are 11.8Å apart → too_close_together by 10.0Å
  - K47↔S74: targets 26.8/7.4Å but partners are 9.2Å apart → too_close_together by 10.2Å
  - K47↔Y91: targets 26.8/12.9Å but partners are 4.5Å apart → too_close_together by 9.4Å
- **H70** — severity 50.87, 17 conflict(s); suspect input ~`G73` (group: pull_in)
  - pull-in (wants closer): C10@27.5Å(now 30.6,conf 1.00)
  - push-out (wants farther): K47@27.5Å(now 15.1,conf 1.00), V67@10.9Å(now 7.0,conf 0.91), Y65@14.6Å(now 5.8,conf 0.79), T45@24.5Å(now 18.6,conf 0.71), G88@21.3Å(now 18.6,conf 0.60), G85@20.2Å(now 16.0,conf 0.58), F90@18.7Å(now 15.8,conf 0.56), N64@16.5Å(now 5.6,conf 0.55), E63@15.5Å(now 5.5,conf 0.55), L62@11.9Å(now 3.1,conf 0.55), Y60@13.9Å(now 3.5,conf 0.55)
  - K47↔G73: targets 27.5/11.0Å but partners are 9.6Å apart → too_close_together by 6.9Å
  - K47↔H75: targets 27.5/9.0Å but partners are 11.8Å apart → too_close_together by 6.7Å
  - K47↔C66: targets 27.5/11.1Å but partners are 10.0Å apart → too_close_together by 6.4Å
- **G41** — severity 43.46, 17 conflict(s); suspect input ~`V20` (group: pull_in)
  - pull-in (wants closer): Y91@5.2Å(now 8.0,conf 0.56), C19@5.8Å(now 8.5,conf 0.55)
  - push-out (wants farther): V20@22.0Å(now 16.2,conf 0.63), N21@21.5Å(now 17.4,conf 0.61), K47@19.8Å(now 9.1,conf 0.57), G73@11.1Å(now 7.1,conf 0.55), I48@11.1Å(now 8.1,conf 0.55), C72@13.6Å(now 10.6,conf 0.55)
  - K47↔Y91: targets 19.8/5.2Å but partners are 4.5Å apart → too_close_together by 10.1Å
  - C37↔V20: targets 5.2/22.0Å but partners are 10.0Å apart → too_close_together by 6.8Å
  - V20↔C19: targets 22.0/5.8Å but partners are 8.4Å apart → too_close_together by 7.8Å

## Secondary Structure (DSSP-like)

- helix(H)=58 · strand(E)=21 · 3-10(G)=12 · coil(C)=3

```
CCHHEEHGHHEHHHHHHEHHEGHEHEHHHHHGHHHHHHGEHGHHHHHEGECHGHEGGHHEHEHHGHHHHEEHEHEHHHHHHHHHEHEGGHHEHE
```

## Backbone H-bond Network

- total=56 · helix(i→i+4)=25 · sheet=31
  - E3 ↔ T7  (helix)
  - I9 ↔ Y13  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - Y34 ↔ G38  (helix)
  - G41 ↔ T45  (helix)
  - F43 ↔ K47  (helix)
  - T54 ↔ S58  (helix)
  - L59 ↔ E63  (helix)
  - E63 ↔ V67  (helix)
  - N64 ↔ N68  (helix)
  - N68 ↔ C72  (helix)
  - C72 ↔ L76  (helix)
  - S74 ↔ E78  (helix)
  - L76 ↔ L80  (helix)
  - … +36 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=39 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=411 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=211 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.2995 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
