# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4INS\seeds\seed_0\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 8.436 A
- tm_score_ca_ordered: 0.29731325223638505
- heavy_atom_rmsd: 9.575 A
- sidechain_heavy_atom_rmsd: 10.499 A
- **all-atom quality (honest):** heavy 9.575 A, sidechain 10.499 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 25
- distogram_pairs: 1197
- bin_accuracy: 0.340

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.436343705911916
- ga_delta_rmsd: 0.6092333584290337  ga_fitness_mode: energy
- pre_local_rmsd: 8.436366494088931  localized_anchor_rmsd: 8.436366494088931

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T45-K47 → 269 conflicts (30%); L71-C72 → 68 conflicts (8%); V20 → 55 conflicts (6%)
- explained: 392/901 conflicts by 3 root cause(s)
- metrics: hubs=90 (frac 0.957), conflicts/hub=10.0, max_incompat=12.74Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T45-K47 + L71-C72 + V20 — explain ~392/901 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L71** — severity 132.07, 50 conflict(s); suspect input ~`E78` (group: pull_in)
  - pull-in (wants closer): E78@9.4Å(now 12.3,conf 0.79), L82@12.8Å(now 15.8,conf 0.55), N68@9.4Å(now 12.6,conf 0.55), A79@7.8Å(now 11.7,conf 0.55), C57@8.0Å(now 13.6,conf 0.55)
  - push-out (wants farther): V20@27.5Å(now 23.9,conf 1.00), Q4@27.5Å(now 24.6,conf 0.99), K47@26.8Å(now 14.5,conf 0.82), N17@25.4Å(now 21.7,conf 0.70), Y65@13.0Å(now 7.6,conf 0.67), T45@21.3Å(now 15.5,conf 0.60), N64@14.5Å(now 9.1,conf 0.58), C84@15.2Å(now 11.7,conf 0.55)
  - K47↔H75: targets 26.8/5.8Å but partners are 10.5Å apart → too_close_together by 10.5Å
  - K47↔E78: targets 26.8/9.4Å but partners are 8.8Å apart → too_close_together by 8.6Å
  - K47↔L76: targets 26.8/4.9Å but partners are 10.9Å apart → too_close_together by 11.0Å
- **C57** — severity 122.39, 34 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): E86@21.4Å(now 24.4,conf 0.60), G85@18.4Å(now 22.1,conf 0.55), T92@16.1Å(now 21.6,conf 0.55), L71@8.0Å(now 13.6,conf 0.55), L80@12.0Å(now 19.6,conf 0.55)
  - push-out (wants farther): K47@27.4Å(now 12.7,conf 0.97), P46@24.3Å(now 12.0,conf 0.72), Q51@8.2Å(now 4.0,conf 0.69), E50@9.4Å(now 5.2,conf 0.55)
  - K47↔L62: targets 27.4/7.1Å but partners are 7.9Å apart → too_close_together by 12.4Å
  - Q61↔K47: targets 9.0/27.4Å but partners are 9.8Å apart → too_close_together by 8.6Å
  - K47↔N68: targets 27.4/5.3Å but partners are 9.4Å apart → too_close_together by 12.7Å
- **K47** — severity 111.28, 31 conflict(s); suspect input ~`E50` (group: pull_in)
  - pull-in (wants closer): R40@14.0Å(now 18.9,conf 0.69), C6@12.3Å(now 16.1,conf 0.55)
  - push-out (wants farther): S55@27.5Å(now 14.6,conf 1.00), I56@27.5Å(now 12.3,conf 1.00), H70@27.5Å(now 13.9,conf 1.00), C53@21.0Å(now 15.1,conf 0.99), C57@27.4Å(now 12.7,conf 0.97), T54@23.5Å(now 16.0,conf 0.94), L71@26.8Å(now 14.5,conf 0.82), C52@17.4Å(now 13.3,conf 0.79), G38@22.8Å(now 18.6,conf 0.71), L62@20.5Å(now 7.9,conf 0.59), G41@19.8Å(now 15.8,conf 0.57), N64@19.6Å(now 8.8,conf 0.57), E31@18.3Å(now 12.9,conf 0.55), A32@18.2Å(now 14.7,conf 0.55)
  - C57↔E50: targets 27.4/13.1Å but partners are 5.2Å apart → too_close_together by 9.1Å
  - S55↔E50: targets 27.5/13.1Å but partners are 6.8Å apart → too_close_together by 7.6Å
  - H70↔E50: targets 27.5/13.1Å but partners are 7.7Å apart → too_close_together by 6.7Å
- **I56** — severity 86.13, 28 conflict(s); suspect input ~`Q69` (group: pull_in)
  - pull-in (wants closer): C53@5.4Å(now 9.7,conf 0.79), Q69@5.1Å(now 10.8,conf 0.57), F89@19.1Å(now 22.0,conf 0.56), F90@18.9Å(now 23.1,conf 0.56), K94@18.0Å(now 22.1,conf 0.55), P93@15.5Å(now 21.9,conf 0.55), G73@13.5Å(now 19.4,conf 0.55)
  - push-out (wants farther): K47@27.5Å(now 12.3,conf 1.00), V2@27.5Å(now 19.9,conf 1.00), E50@12.8Å(now 8.2,conf 0.84), H28@23.8Å(now 16.0,conf 0.75), Y44@22.7Å(now 18.5,conf 0.70), Q51@9.1Å(now 5.4,conf 0.67), F43@22.4Å(now 16.3,conf 0.67), V49@16.1Å(now 11.3,conf 0.67), V30@21.4Å(now 18.1,conf 0.60), E31@21.1Å(now 17.0,conf 0.60), G41@19.9Å(now 17.3,conf 0.58)
  - K47↔L59: targets 27.5/9.4Å but partners are 6.3Å apart → too_close_together by 11.7Å
  - K47↔Q69: targets 27.5/5.1Å but partners are 11.8Å apart → too_close_together by 10.6Å
  - K47↔L62: targets 27.5/11.0Å but partners are 7.9Å apart → too_close_together by 8.6Å
- **S55** — severity 77.53, 21 conflict(s); suspect input ~`E50` (group: pull_in)
  - pull-in (wants closer): G88@23.2Å(now 26.4,conf 0.75), Q69@8.5Å(now 11.5,conf 0.55)
  - push-out (wants farther): I1@27.5Å(now 23.8,conf 1.00), K47@27.5Å(now 14.6,conf 1.00), G26@27.3Å(now 17.2,conf 0.93), I48@20.6Å(now 9.6,conf 0.84), F42@21.5Å(now 18.3,conf 0.61), Q51@9.2Å(now 3.8,conf 0.49)
  - I48↔C52: targets 20.6/6.9Å but partners are 4.6Å apart → too_close_together by 9.1Å
  - K47↔S58: targets 27.5/9.4Å but partners are 8.8Å apart → too_close_together by 9.2Å
  - K47↔L59: targets 27.5/12.6Å but partners are 6.3Å apart → too_close_together by 8.6Å
- **H70** — severity 77.28, 23 conflict(s); suspect input ~`T45` (group: push_out)
  - push-out (wants farther): K47@27.5Å(now 13.9,conf 1.00), L24@27.0Å(now 24.2,conf 0.84), Y65@14.6Å(now 7.3,conf 0.79), T45@24.5Å(now 16.7,conf 0.71), S27@19.1Å(now 14.4,conf 0.56), N64@16.5Å(now 7.6,conf 0.55), E63@15.5Å(now 9.7,conf 0.55), L62@11.9Å(now 6.5,conf 0.55)
  - K47↔L76: targets 27.5/7.4Å but partners are 10.9Å apart → too_close_together by 9.1Å
  - K47↔H75: targets 27.5/8.8Å but partners are 10.5Å apart → too_close_together by 8.2Å
  - V67↔K47: targets 11.0/27.5Å but partners are 10.1Å apart → too_close_together by 6.4Å

## Secondary Structure (DSSP-like)

- helix(H)=49 · strand(E)=28 · 3-10(G)=7 · coil(C)=10

```
CHHHHEHHGGHHHHEEHHCCEEHGGCEEHHHHHHEHEEHHEHGHEEHHHEHHEHEEHECHEHHHHHHEEEHHEGGHEHHHHHHHHCCCCCEEEE
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=17 · sheet=57
  - E3 ↔ T7  (helix)
  - Q4 ↔ S8  (helix)
  - S8 ↔ L12  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - V36 ↔ R40  (helix)
  - R40 ↔ Y44  (helix)
  - K47 ↔ Q51  (helix)
  - Y60 ↔ N64  (helix)
  - E63 ↔ V67  (helix)
  - V67 ↔ L71  (helix)
  - C72 ↔ L76  (helix)
  - A79 ↔ V83  (helix)
  - Y81 ↔ G85  (helix)
  - C6 ↔ L15  (sheet)
  - C6 ↔ Q22  (sheet)
  - L15 ↔ N21  (sheet)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=50 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=506 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=303 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.5609 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=25 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
