# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4INS\seeds\seed_9\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 7.685 A
- tm_score_ca_ordered: 0.28291737394244176
- heavy_atom_rmsd: 8.858 A
- sidechain_heavy_atom_rmsd: 9.916 A
- **all-atom quality (honest):** heavy 8.858 A, sidechain 9.916 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 45
- distogram_pairs: 1197
- bin_accuracy: 0.358

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.684657297030188
- ga_delta_rmsd: -0.015994930908922456  ga_fitness_mode: energy
- pre_local_rmsd: 7.687757834989852  localized_anchor_rmsd: 7.684641490967275

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N64-L76 → 461 conflicts (51%); Y18-C19 → 134 conflicts (15%); Y44-K47 → 72 conflicts (8%)
- explained: 667/905 conflicts by 3 root cause(s)
- metrics: hubs=90 (frac 0.957), conflicts/hub=10.1, max_incompat=10.42Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N64-L76 + Y18-C19 + Y44-K47 — explain ~667/905 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C19** — severity 163.95, 75 conflict(s); suspect input ~`G41` (group: push_out)
  - pull-in (wants closer): L15@5.3Å(now 8.2,conf 0.84), G41@5.8Å(now 11.5,conf 0.55), E39@9.1Å(now 12.3,conf 0.55), Y91@9.4Å(now 12.4,conf 0.55), K94@12.5Å(now 18.0,conf 0.55), T92@9.6Å(now 15.3,conf 0.55), P93@11.6Å(now 15.7,conf 0.55), Y65@15.8Å(now 18.9,conf 0.55), G88@14.3Å(now 18.3,conf 0.55)
  - push-out (wants farther): H23@12.7Å(now 3.7,conf 0.82), Q69@26.4Å(now 22.9,conf 0.76), S55@24.7Å(now 19.7,conf 0.70), S58@25.5Å(now 19.6,conf 0.70), G26@17.9Å(now 12.5,conf 0.55), L24@16.9Å(now 10.1,conf 0.55), S27@16.7Å(now 11.5,conf 0.55)
  - S58↔G41: targets 25.5/5.8Å but partners are 9.3Å apart → too_close_together by 10.4Å
  - S55↔G41: targets 24.7/5.8Å but partners are 10.1Å apart → too_close_together by 8.8Å
  - Q69↔G41: targets 26.4/5.8Å but partners are 14.0Å apart → too_close_together by 6.6Å
- **K47** — severity 77.59, 29 conflict(s); suspect input ~`E50` (group: pull_in)
  - pull-in (wants closer): Y44@9.1Å(now 13.5,conf 0.94), R40@15.7Å(now 18.7,conf 0.52), F43@10.0Å(now 12.7,conf 0.52)
  - push-out (wants farther): S55@27.5Å(now 20.3,conf 1.00), I56@27.5Å(now 23.9,conf 1.00), H70@27.5Å(now 16.4,conf 1.00), C57@27.4Å(now 21.8,conf 0.97), L71@26.8Å(now 19.6,conf 0.82), G38@22.8Å(now 17.3,conf 0.71), E16@18.4Å(now 14.2,conf 0.55), E31@18.3Å(now 13.6,conf 0.55), A32@18.2Å(now 11.8,conf 0.55), I9@16.7Å(now 10.4,conf 0.55), L15@15.8Å(now 10.5,conf 0.55)
  - S55↔E50: targets 27.5/13.1Å but partners are 7.5Å apart → too_close_together by 6.9Å
  - Y44↔L71: targets 9.1/26.8Å but partners are 11.8Å apart → too_close_together by 6.0Å
  - H70↔Y44: targets 27.5/9.1Å but partners are 13.3Å apart → too_close_together by 5.1Å
- **L71** — severity 63.55, 33 conflict(s); suspect input ~`L76` (group: pull_in)
  - pull-in (wants closer): L35@16.3Å(now 20.9,conf 0.55), C57@8.0Å(now 11.1,conf 0.55), E50@10.1Å(now 15.0,conf 0.55)
  - push-out (wants farther): I9@27.5Å(now 25.0,conf 1.00), Q4@27.5Å(now 22.6,conf 0.99), Y65@13.0Å(now 3.6,conf 0.94), N64@15.1Å(now 5.2,conf 0.91), K47@26.8Å(now 19.6,conf 0.82), C66@11.6Å(now 5.1,conf 0.69), V67@11.6Å(now 4.3,conf 0.69), T45@21.3Å(now 16.4,conf 0.60), G85@17.3Å(now 8.7,conf 0.55), L82@12.8Å(now 10.1,conf 0.55), C84@15.2Å(now 9.6,conf 0.55)
  - Q4↔S74: targets 27.5/8.6Å but partners are 13.6Å apart → too_close_together by 5.4Å
  - K47↔H75: targets 26.8/6.4Å but partners are 15.8Å apart → too_close_together by 4.6Å
  - L76↔G85: targets 4.9/17.3Å but partners are 7.0Å apart → too_close_together by 5.4Å
- **C66** — severity 63.02, 31 conflict(s); suspect input ~`G73` (group: push_out)
  - pull-in (wants closer): L59@3.3Å(now 9.3,conf 0.91), Q61@5.3Å(now 11.4,conf 0.82), L62@4.8Å(now 7.4,conf 0.82), Y60@4.5Å(now 10.2,conf 0.58), F42@12.3Å(now 15.9,conf 0.55)
  - push-out (wants farther): L71@11.6Å(now 5.1,conf 0.69), G73@16.2Å(now 6.8,conf 0.69), H28@18.1Å(now 14.3,conf 0.55), L82@10.5Å(now 6.3,conf 0.55)
  - L59↔C72: targets 3.3/14.7Å but partners are 5.6Å apart → too_close_together by 5.7Å
  - L59↔G73: targets 3.3/16.2Å but partners are 6.6Å apart → too_close_together by 6.2Å
  - Q61↔C72: targets 5.3/14.7Å but partners are 5.2Å apart → too_close_together by 4.2Å
- **H70** — severity 61.16, 28 conflict(s); suspect input ~`G88` (group: push_out)
  - push-out (wants farther): I9@27.5Å(now 23.2,conf 1.00), C5@27.5Å(now 23.8,conf 1.00), K47@27.5Å(now 16.4,conf 1.00), L24@27.0Å(now 22.2,conf 0.84), G73@10.8Å(now 8.0,conf 0.82), Y65@13.4Å(now 5.4,conf 0.79), T45@24.5Å(now 17.2,conf 0.71), G88@21.3Å(now 14.2,conf 0.60), G85@20.2Å(now 13.1,conf 0.58), S27@19.1Å(now 16.5,conf 0.56), F90@18.7Å(now 12.6,conf 0.56), N64@16.5Å(now 7.3,conf 0.55), E63@15.5Å(now 3.8,conf 0.55), L62@11.9Å(now 7.4,conf 0.55), Y60@13.9Å(now 5.8,conf 0.55)
  - V77↔G88: targets 11.1/21.3Å but partners are 3.5Å apart → too_close_together by 6.8Å
  - T45↔S74: targets 24.5/11.6Å but partners are 7.9Å apart → too_close_together by 5.0Å
  - L76↔G88: targets 8.4/21.3Å but partners are 7.5Å apart → too_close_together by 5.5Å
- **Y18** — severity 55.46, 24 conflict(s); suspect input ~`F43` (group: pull_in)
  - pull-in (wants closer): F43@5.9Å(now 10.5,conf 0.55), Y44@7.5Å(now 10.0,conf 0.55)
  - push-out (wants farther): S55@27.3Å(now 23.5,conf 0.93), S58@26.8Å(now 21.5,conf 0.81), L59@23.6Å(now 20.7,conf 0.76), T54@25.5Å(now 22.6,conf 0.70), L24@13.1Å(now 4.1,conf 0.67), C25@15.6Å(now 10.3,conf 0.59), N21@16.6Å(now 6.8,conf 0.55), S74@16.4Å(now 13.9,conf 0.55), C6@15.8Å(now 11.0,conf 0.55), I9@16.0Å(now 13.1,conf 0.55), Q22@9.7Å(now 5.4,conf 0.49), H23@12.8Å(now 3.6,conf 0.49)
  - S58↔F43: targets 26.8/5.9Å but partners are 11.0Å apart → too_close_together by 9.9Å
  - S55↔F43: targets 27.3/5.9Å but partners are 14.2Å apart → too_close_together by 7.2Å
  - S58↔Y44: targets 26.8/7.5Å but partners are 12.2Å apart → too_close_together by 7.0Å

## Secondary Structure (DSSP-like)

- helix(H)=58 · strand(E)=23 · 3-10(G)=7 · coil(C)=6

```
CHHEHHHHHHHGHHHHHEHHHHHHHGHHHHHHHHEHGEHHHHCEEEEEEEGEEHEHHHGHHHHHEHHHEHHHEHEHHHHHHEHCEHGGECEECC
```

## Backbone H-bond Network

- total=68 · helix(i→i+4)=33 · sheet=35
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - C6 ↔ C10  (helix)
  - T7 ↔ S11  (helix)
  - C10 ↔ Q14  (helix)
  - Y13 ↔ N17  (helix)
  - E16 ↔ V20  (helix)
  - N17 ↔ N21  (helix)
  - C19 ↔ H23  (helix)
  - N21 ↔ C25  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - V36 ↔ R40  (helix)
  - T54 ↔ S58  (helix)
  - I56 ↔ Y60  (helix)
  - S58 ↔ L62  (helix)
  - … +48 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=46 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=533 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=326 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.4712 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=45 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
