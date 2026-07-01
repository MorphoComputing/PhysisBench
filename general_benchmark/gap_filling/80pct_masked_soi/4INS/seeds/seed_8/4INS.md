# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4INS\sequence\4INS.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4INS\seeds\seed_8\4INS.pdb`
- residues: 94
- mode: oracle
- ca_rmsd: 7.627 A
- tm_score_ca_ordered: 0.3699807718087911
- heavy_atom_rmsd: 8.665 A
- sidechain_heavy_atom_rmsd: 9.605 A
- **all-atom quality (honest):** heavy 8.665 A, sidechain 9.605 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 6/6
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/86 (0.0)
- lj_severe: 0
- lj_near: 32
- distogram_pairs: 1197
- bin_accuracy: 0.392

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.627424359177141
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 7.627380808458788  localized_anchor_rmsd: 7.627380808458788

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G41-K47 → 336 conflicts (40%); Y65-V67 → 118 conflicts (14%); H75-L76 → 65 conflicts (8%)
- explained: 519/838 conflicts by 3 root cause(s)
- metrics: hubs=87 (frac 0.926), conflicts/hub=9.6, max_incompat=10.55Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G41-K47 + Y65-V67 + H75-L76 — explain ~519/838 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V67** — severity 102.50, 39 conflict(s); suspect input ~`Q61` (group: pull_in)
  - pull-in (wants closer): Q61@5.8Å(now 9.7,conf 0.52)
  - push-out (wants farther): R40@27.5Å(now 22.9,conf 0.99), C25@27.4Å(now 23.2,conf 0.94), L35@27.3Å(now 23.4,conf 0.92), T45@27.2Å(now 20.4,conf 0.89), G38@27.1Å(now 20.4,conf 0.86), F42@26.6Å(now 19.4,conf 0.78), H28@23.7Å(now 20.0,conf 0.75), G73@17.6Å(now 14.8,conf 0.69), L80@15.0Å(now 11.0,conf 0.55)
  - E63↔F42: targets 6.9/26.6Å but partners are 13.5Å apart → too_close_together by 6.2Å
  - G38↔Q61: targets 27.1/5.8Å but partners are 12.5Å apart → too_close_together by 8.8Å
  - T45↔E63: targets 27.2/6.9Å but partners are 14.9Å apart → too_close_together by 5.4Å
- **K47** — severity 76.53, 29 conflict(s); suspect input ~`E50` (group: pull_in)
  - pull-in (wants closer): I9@16.7Å(now 22.3,conf 0.55), L24@15.3Å(now 21.7,conf 0.55), C6@12.3Å(now 24.9,conf 0.55)
  - push-out (wants farther): S55@27.5Å(now 17.1,conf 1.00), I56@27.5Å(now 22.3,conf 1.00), H70@27.5Å(now 15.0,conf 1.00), C57@27.4Å(now 21.9,conf 0.97), L71@26.8Å(now 14.8,conf 0.82), G38@22.8Å(now 7.8,conf 0.71), V36@20.9Å(now 6.0,conf 0.59), G41@19.8Å(now 9.3,conf 0.57), E31@18.3Å(now 12.8,conf 0.55), A32@18.2Å(now 13.5,conf 0.55), F42@16.2Å(now 7.5,conf 0.55), R40@16.0Å(now 4.6,conf 0.49), C53@19.6Å(now 14.7,conf 0.49), T54@23.4Å(now 13.8,conf 0.49)
  - S55↔E50: targets 27.5/13.4Å but partners are 5.8Å apart → too_close_together by 8.3Å
  - S55↔Q51: targets 27.5/16.0Å but partners are 4.0Å apart → too_close_together by 7.5Å
  - I56↔Q51: targets 27.5/16.0Å but partners are 5.5Å apart → too_close_together by 6.0Å
- **Y18** — severity 67.26, 29 conflict(s); suspect input ~`F43` (group: pull_in)
  - pull-in (wants closer): F43@5.9Å(now 11.2,conf 0.55), Y44@7.5Å(now 11.1,conf 0.55), C37@7.9Å(now 10.8,conf 0.55)
  - push-out (wants farther): S55@27.3Å(now 20.4,conf 0.93), S58@26.8Å(now 20.3,conf 0.81), L59@23.6Å(now 18.0,conf 0.76), T54@25.5Å(now 19.3,conf 0.70), L24@13.1Å(now 7.8,conf 0.67), Q22@12.2Å(now 7.3,conf 0.67), C25@14.5Å(now 10.7,conf 0.58), N21@16.6Å(now 8.2,conf 0.55), S74@16.4Å(now 13.8,conf 0.55), V2@10.5Å(now 7.2,conf 0.55), I9@16.0Å(now 13.5,conf 0.55), H23@12.2Å(now 3.8,conf 0.52)
  - S58↔F43: targets 26.8/5.9Å but partners are 12.5Å apart → too_close_together by 8.4Å
  - S55↔F43: targets 27.3/5.9Å but partners are 13.8Å apart → too_close_together by 7.6Å
  - L59↔F43: targets 23.6/5.9Å but partners are 10.5Å apart → too_close_together by 7.2Å
- **C19** — severity 64.99, 33 conflict(s); suspect input ~`G41` (group: pull_in)
  - pull-in (wants closer): V83@20.4Å(now 23.4,conf 0.59), G41@5.8Å(now 9.9,conf 0.55), G88@14.3Å(now 18.0,conf 0.55)
  - push-out (wants farther): H23@11.4Å(now 8.7,conf 0.79), Q69@26.4Å(now 22.2,conf 0.76), S55@24.7Å(now 18.1,conf 0.70), S58@25.5Å(now 20.6,conf 0.70), G26@17.9Å(now 14.8,conf 0.55), L24@16.9Å(now 12.4,conf 0.55), S27@16.7Å(now 13.9,conf 0.55), L12@11.1Å(now 6.9,conf 0.55)
  - S55↔G41: targets 24.7/5.8Å but partners are 9.8Å apart → too_close_together by 9.1Å
  - S58↔G41: targets 25.5/5.8Å but partners are 12.7Å apart → too_close_together by 7.1Å
  - Q69↔G41: targets 26.4/5.8Å but partners are 13.8Å apart → too_close_together by 6.8Å
- **I56** — severity 56.11, 27 conflict(s); suspect input ~`Q69` (group: pull_in)
  - pull-in (wants closer): Q69@5.1Å(now 14.0,conf 0.57), G73@13.5Å(now 18.3,conf 0.55)
  - push-out (wants farther): K47@27.5Å(now 22.3,conf 1.00), F43@22.4Å(now 16.6,conf 0.67), G41@19.9Å(now 14.5,conf 0.58), E39@19.7Å(now 15.6,conf 0.57), P93@15.5Å(now 12.2,conf 0.55)
  - K47↔C53: targets 27.5/6.0Å but partners are 14.7Å apart → too_close_together by 6.8Å
  - K47↔V49: targets 27.5/12.5Å but partners are 10.1Å apart → too_close_together by 4.9Å
  - F43↔Q69: targets 22.4/5.1Å but partners are 11.7Å apart → too_close_together by 5.6Å
- **C72** — severity 55.90, 27 conflict(s); suspect input ~`T54` (group: push_out)
  - pull-in (wants closer): H75@5.0Å(now 9.3,conf 0.99), E78@9.2Å(now 14.3,conf 0.82), A79@9.4Å(now 16.4,conf 0.79), L76@6.0Å(now 10.7,conf 0.72), V77@8.0Å(now 11.6,conf 0.72), L80@11.3Å(now 14.3,conf 0.55)
  - push-out (wants farther): N68@13.0Å(now 8.8,conf 0.94), P46@22.7Å(now 12.2,conf 0.70), V49@7.2Å(now 3.8,conf 0.55), N64@16.6Å(now 10.5,conf 0.55), Y65@15.0Å(now 8.1,conf 0.55), R40@15.5Å(now 10.8,conf 0.55), G41@13.6Å(now 6.9,conf 0.55)
  - H75↔P46: targets 5.0/22.7Å but partners are 12.4Å apart → too_close_together by 5.3Å
  - H75↔Y65: targets 5.0/15.0Å but partners are 3.2Å apart → too_close_together by 6.8Å
  - A79↔T54: targets 9.4/8.1Å but partners are 24.1Å apart → too_far_apart by 6.6Å

## Secondary Structure (DSSP-like)

- helix(H)=54 · strand(E)=24 · 3-10(G)=7 · coil(C)=9

```
CHHHHCGCEEEEHHHEHEHHEHHEHEHHGHHHHHHHHEHGHHHEHEHEEEHHCHECCEHHHEHHHHHHEHHHEHGHGHHHHEGHGHHHCCECEE
```

## Backbone H-bond Network

- total=65 · helix(i→i+4)=27 · sheet=38
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - S27 ↔ E31  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L33 ↔ C37  (helix)
  - L35 ↔ E39  (helix)
  - C37 ↔ G41  (helix)
  - E39 ↔ F43  (helix)
  - G41 ↔ T45  (helix)
  - F43 ↔ K47  (helix)
  - K47 ↔ Q51  (helix)
  - L59 ↔ E63  (helix)
  - Y60 ↔ N64  (helix)
  - Q61 ↔ Y65  (helix)
  - E63 ↔ V67  (helix)
  - N64 ↔ N68  (helix)
  - … +45 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=522 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=315 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.8061 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=32 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=6: C5–C10, C6–C25, C19–C37, C52–C57, C53–C72, C66–C84

## Side-chain Rotamers (χ1/χ2)

- 86 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
