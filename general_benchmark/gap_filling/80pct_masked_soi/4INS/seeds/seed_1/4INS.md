# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4INS\seeds\seed_1\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 9.983 A
- tm_score_ca_ordered: 0.24820327016449328
- heavy_atom_rmsd: 11.223 A
- sidechain_heavy_atom_rmsd: 12.211 A
- **all-atom quality (honest):** heavy 11.223 A, sidechain 12.211 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 45
- distogram_pairs: 1198
- bin_accuracy: 0.381

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.982796429882528
- ga_delta_rmsd: 0.2306380083408861  ga_fitness_mode: energy
- pre_local_rmsd: 9.98276383845643  localized_anchor_rmsd: 9.98276383845643

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P46-K47 → 181 conflicts (19%); H70-L71 → 107 conflicts (11%); C66 → 72 conflicts (8%)
- explained: 360/959 conflicts by 3 root cause(s)
- metrics: hubs=89 (frac 0.947), conflicts/hub=10.8, max_incompat=14.06Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P46-K47 + H70-L71 + C66 — explain ~360/959 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G38** — severity 91.71, 29 conflict(s); suspect input ~`K47` (group: pull_in)
  - pull-in (wants closer): C10@18.4Å(now 21.5,conf 0.55), Y18@11.3Å(now 14.0,conf 0.55), S74@9.4Å(now 13.2,conf 0.55)
  - push-out (wants farther): G41@5.1Å(now 2.3,conf 0.94), T45@16.9Å(now 7.9,conf 0.91), V67@27.1Å(now 24.2,conf 0.86), Y44@14.6Å(now 8.7,conf 0.79), K47@22.8Å(now 4.6,conf 0.71), F43@11.6Å(now 3.8,conf 0.69), F42@8.2Å(now 4.9,conf 0.55)
  - G41↔K47: targets 5.1/22.8Å but partners are 3.7Å apart → too_close_together by 14.1Å
  - L35↔K47: targets 5.4/22.8Å but partners are 6.1Å apart → too_close_together by 11.3Å
  - Y34↔K47: targets 5.1/22.8Å but partners are 6.7Å apart → too_close_together by 11.0Å
- **C66** — severity 69.19, 39 conflict(s); suspect input ~`V2` (group: pull_in)
  - pull-in (wants closer): L62@3.3Å(now 8.4,conf 0.82), Q61@4.6Å(now 9.3,conf 0.79), L59@3.8Å(now 8.4,conf 0.69), Y60@4.5Å(now 9.9,conf 0.58), F42@12.3Å(now 14.9,conf 0.55), V2@15.9Å(now 19.3,conf 0.55)
  - push-out (wants farther): L71@11.0Å(now 5.7,conf 0.99), H70@11.4Å(now 7.8,conf 0.79), G73@14.4Å(now 7.9,conf 0.69), C72@13.5Å(now 7.9,conf 0.58), H28@18.1Å(now 14.0,conf 0.55), L80@7.6Å(now 4.1,conf 0.55), L82@10.5Å(now 3.6,conf 0.55)
  - L71↔L62: targets 11.0/3.3Å but partners are 3.8Å apart → too_close_together by 3.9Å
  - Y60↔V2: targets 4.5/15.9Å but partners are 26.1Å apart → too_far_apart by 5.7Å
  - L62↔C72: targets 3.3/13.5Å but partners are 5.0Å apart → too_close_together by 5.2Å
- **K47** — severity 67.94, 25 conflict(s); suspect input ~`C52` (group: pull_in)
  - pull-in (wants closer): I9@16.7Å(now 23.3,conf 0.55), L24@15.3Å(now 19.3,conf 0.55), C6@12.3Å(now 21.8,conf 0.55)
  - push-out (wants farther): S55@27.5Å(now 20.6,conf 1.00), I56@27.5Å(now 21.7,conf 1.00), H70@27.5Å(now 21.2,conf 1.00), C57@27.4Å(now 21.2,conf 0.97), L71@26.8Å(now 15.6,conf 0.82), Y44@10.6Å(now 7.2,conf 0.79), G38@22.8Å(now 4.6,conf 0.71), V36@20.9Å(now 7.7,conf 0.59), G41@19.8Å(now 3.7,conf 0.57), E31@18.3Å(now 10.7,conf 0.55), A32@18.2Å(now 9.3,conf 0.55), F42@16.2Å(now 3.5,conf 0.55), R40@18.0Å(now 5.6,conf 0.49), F43@11.0Å(now 5.1,conf 0.44)
  - S55↔E50: targets 27.5/13.0Å but partners are 8.6Å apart → too_close_together by 5.9Å
  - E50↔C57: targets 13.0/27.4Å but partners are 10.1Å apart → too_close_together by 4.4Å
  - S55↔C52: targets 27.5/17.4Å but partners are 5.0Å apart → too_close_together by 5.0Å
- **C6** — severity 63.82, 31 conflict(s); suspect input ~`K47` (group: pull_in)
  - pull-in (wants closer): C25@4.7Å(now 7.3,conf 0.59), S27@10.8Å(now 15.4,conf 0.55), K47@12.3Å(now 21.8,conf 0.55), A32@12.3Å(now 14.9,conf 0.55), V30@11.7Å(now 14.3,conf 0.55), Y44@13.8Å(now 16.4,conf 0.55)
  - push-out (wants farther): T54@27.5Å(now 24.0,conf 1.00), L12@13.0Å(now 4.7,conf 0.94), C10@8.6Å(now 4.8,conf 0.79), Y13@16.0Å(now 6.3,conf 0.72), I1@7.7Å(now 4.2,conf 0.67), S74@19.5Å(now 16.0,conf 0.57), E16@16.5Å(now 7.2,conf 0.55), S11@11.6Å(now 7.2,conf 0.55), Y18@15.8Å(now 9.6,conf 0.55)
  - T54↔S27: targets 27.5/10.8Å but partners are 9.6Å apart → too_close_together by 7.1Å
  - I9↔Y13: targets 6.6/16.0Å but partners are 4.1Å apart → too_close_together by 5.3Å
  - E3↔K47: targets 5.0/12.3Å but partners are 23.4Å apart → too_far_apart by 6.1Å
- **L71** — severity 61.52, 32 conflict(s); suspect input ~`L76` (group: push_out)
  - push-out (wants farther): N64@15.0Å(now 3.8,conf 1.00), Q4@27.5Å(now 24.2,conf 0.99), C66@11.0Å(now 5.7,conf 0.99), Q14@27.4Å(now 24.6,conf 0.93), K47@26.8Å(now 15.6,conf 0.82), Y65@12.6Å(now 4.0,conf 0.79), T45@21.3Å(now 16.4,conf 0.60), G85@17.3Å(now 11.5,conf 0.55), Y91@12.9Å(now 10.3,conf 0.55), L82@12.8Å(now 8.8,conf 0.55), C84@15.2Å(now 9.3,conf 0.55), S27@15.6Å(now 12.3,conf 0.55)
  - K47↔L76: targets 26.8/4.9Å but partners are 14.1Å apart → too_close_together by 7.9Å
  - K47↔Y91: targets 26.8/12.9Å but partners are 6.1Å apart → too_close_together by 7.8Å
  - K47↔S74: targets 26.8/8.6Å but partners are 12.9Å apart → too_close_together by 5.4Å
- **I56** — severity 60.38, 28 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): K94@18.0Å(now 21.6,conf 0.55), P93@15.5Å(now 19.6,conf 0.55)
  - push-out (wants farther): K47@27.5Å(now 21.7,conf 1.00), V2@27.5Å(now 21.8,conf 1.00), H28@23.8Å(now 13.9,conf 0.75), Y44@22.7Å(now 19.6,conf 0.70), F43@22.4Å(now 16.6,conf 0.67), V30@21.4Å(now 14.8,conf 0.60), E31@21.1Å(now 14.0,conf 0.60), N64@14.5Å(now 11.7,conf 0.55)
  - C53↔H28: targets 5.0/23.8Å but partners are 11.6Å apart → too_close_together by 7.1Å
  - K47↔C53: targets 27.5/5.0Å but partners are 18.4Å apart → too_close_together by 4.1Å
  - K47↔P93: targets 27.5/15.5Å but partners are 4.9Å apart → too_close_together by 7.1Å

## Secondary Structure (DSSP-like)

- helix(H)=52 · strand(E)=24 · 3-10(G)=11 · coil(C)=7

```
CHHHHHHEHHHHHEHHHEHHCEECHEHEHGHEHHCHHEHHHHHHHGGGEEHEEHGEEHGHGGHHHHHGHHHGEHHGHEHEHHHEHHECCCEEEE
```

## Backbone H-bond Network

- total=66 · helix(i→i+4)=30 · sheet=36
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - T7 ↔ S11  (helix)
  - I9 ↔ Y13  (helix)
  - S11 ↔ L15  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - V36 ↔ R40  (helix)
  - E39 ↔ F43  (helix)
  - R40 ↔ Y44  (helix)
  - G41 ↔ T45  (helix)
  - T54 ↔ S58  (helix)
  - Y60 ↔ N64  (helix)
  - … +46 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=46 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=577 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=344 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.4512 (restraint satisfaction; lower=better)
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
