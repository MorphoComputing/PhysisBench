# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 4.368 A
- tm_score_ca_ordered: 0.36745613842920755
- heavy_atom_rmsd: 5.574 A
- sidechain_heavy_atom_rmsd: 6.314 A
- **all-atom quality (honest):** heavy 5.574 A, sidechain 6.314 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 366
- bin_accuracy: 0.503

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_window_topology_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.367965598642637
- ga_delta_rmsd: 1.4149295439277418  ga_fitness_mode: energy
- pre_local_rmsd: 4.3727891611521645  localized_anchor_rmsd: 4.367927836887151

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K47 → 19 conflicts (43%); N21 → 11 conflicts (25%)
- explained: 30/44 conflicts by 2 root cause(s)
- metrics: hubs=18 (frac 0.383), conflicts/hub=2.4, max_incompat=5.93Å, chain_span=0.745
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K47 + N21 — explain ~30/44 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C37** — severity 12.21, 5 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): K47@20.4Å(now 14.8,conf 0.59), N21@16.5Å(now 12.7,conf 0.55)
  - V30↔K47: targets 7.8/20.4Å but partners are 6.9Å apart → too_close_together by 5.7Å
  - A32↔K47: targets 6.9/20.4Å but partners are 8.7Å apart → too_close_together by 4.9Å
  - K47↔Y34: targets 20.4/4.8Å but partners are 11.4Å apart → too_close_together by 4.3Å
- **N21** — severity 11.00, 7 conflict(s); suspect input ~`P46` (group: push_out)
  - push-out (wants farther): N17@12.9Å(now 8.6,conf 0.84), E16@11.4Å(now 6.9,conf 0.67), L15@10.1Å(now 3.8,conf 0.67), G41@21.7Å(now 18.9,conf 0.61), T45@21.1Å(now 17.3,conf 0.60), P46@20.9Å(now 17.4,conf 0.59), S11@6.1Å(now 3.1,conf 0.55), C37@16.5Å(now 12.7,conf 0.55), Q14@11.0Å(now 3.9,conf 0.55), Y13@11.2Å(now 4.1,conf 0.55)
  - H28↔P46: targets 12.4/20.9Å but partners are 4.4Å apart → too_close_together by 4.0Å
  - L24↔P46: targets 9.0/20.9Å but partners are 8.7Å apart → too_close_together by 3.1Å
  - L24↔T45: targets 9.0/21.1Å but partners are 9.4Å apart → too_close_together by 2.7Å
- **E31** — severity 10.18, 5 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): K47@18.6Å(now 10.5,conf 0.55), I1@12.5Å(now 9.6,conf 0.55), Y44@12.3Å(now 6.6,conf 0.55)
  - S27↔K47: targets 8.9/18.6Å but partners are 3.8Å apart → too_close_together by 5.9Å
  - H28↔K47: targets 7.0/18.6Å but partners are 6.0Å apart → too_close_together by 5.6Å
  - G26↔K47: targets 9.0/18.6Å but partners are 6.2Å apart → too_close_together by 3.4Å
- **E39** — severity 5.32, 4 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): N17@15.1Å(now 18.9,conf 0.55)
  - push-out (wants farther): H23@22.3Å(now 19.6,conf 0.66), P46@20.9Å(now 16.6,conf 0.59)
  - Y34↔P46: targets 7.0/20.9Å but partners are 11.1Å apart → too_close_together by 2.7Å
  - V36↔H23: targets 9.1/22.3Å but partners are 11.2Å apart → too_close_together by 2.0Å
  - L35↔P46: targets 7.0/20.9Å but partners are 11.8Å apart → too_close_together by 2.0Å
- **K47** — severity 4.82, 4 conflict(s); suspect input ~`E31` (group: push_out)
  - push-out (wants farther): G41@19.1Å(now 14.4,conf 0.91), F42@16.0Å(now 13.1,conf 0.72), R40@22.4Å(now 17.6,conf 0.67), C37@20.4Å(now 14.8,conf 0.59), Q22@19.9Å(now 17.4,conf 0.58), E31@18.6Å(now 10.5,conf 0.55), H23@16.7Å(now 12.6,conf 0.55), S27@15.2Å(now 3.8,conf 0.55)
  - I1↔H23: targets 7.5/16.7Å but partners are 6.4Å apart → too_close_together by 2.9Å
  - Y44↔E31: targets 9.4/18.6Å but partners are 6.6Å apart → too_close_together by 2.5Å
  - I1↔S27: targets 7.5/15.2Å but partners are 5.8Å apart → too_close_together by 1.9Å
- **R40** — severity 4.60, 2 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): P46@18.9Å(now 16.0,conf 0.91), K47@22.4Å(now 17.6,conf 0.67)
  - Y34↔K47: targets 7.0/22.4Å but partners are 11.4Å apart → too_close_together by 4.0Å
  - L33↔K47: targets 9.0/22.4Å but partners are 10.6Å apart → too_close_together by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=14 · 3-10(G)=6 · coil(C)=6

```
CCECHHHEEEGHEHHHHEHGECECHHHEHHHHHEHHCHGGHGEEGEE
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=8 · sheet=29
  - L12 ↔ E16  (helix)
  - L15 ↔ C19  (helix)
  - C25 ↔ L29  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - E3 ↔ S8  (sheet)
  - E3 ↔ I9  (sheet)
  - E3 ↔ C10  (sheet)
  - E3 ↔ H23  (sheet)
  - S8 ↔ N21  (sheet)
  - S8 ↔ H23  (sheet)
  - S8 ↔ H28  (sheet)
  - I9 ↔ N21  (sheet)
  - I9 ↔ H23  (sheet)
  - I9 ↔ H28  (sheet)
  - C10 ↔ N21  (sheet)
  - C10 ↔ H23  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=223 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=118 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.1026 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
