# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2HIU\seeds\seed_7\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 6.577 A
- tm_score_ca_ordered: 0.16595969750278733
- heavy_atom_rmsd: 7.699 A
- sidechain_heavy_atom_rmsd: 8.625 A
- **all-atom quality (honest):** heavy 7.699 A, sidechain 8.625 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 368
- bin_accuracy: 0.410

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=13 rmsd=5.55018929409847 -> 4.383778713373201 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.577214433796856
- ga_delta_rmsd: -2.4964167820999688  ga_fitness_mode: energy
- pre_local_rmsd: 6.597719641374338  localized_anchor_rmsd: 6.577231764477265

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y44-K47 → 61 conflicts (52%); Y34 → 13 conflicts (11%); N21 → 7 conflicts (6%)
- explained: 81/117 conflicts by 3 root cause(s)
- metrics: hubs=37 (frac 0.787), conflicts/hub=3.2, max_incompat=6.38Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y44-K47 + Y34 + N21 — explain ~81/117 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N21** — severity 17.30, 8 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): C5@9.0Å(now 12.9,conf 0.55)
  - push-out (wants farther): E16@12.7Å(now 6.9,conf 0.82), T45@21.1Å(now 16.6,conf 0.60), P46@20.9Å(now 13.3,conf 0.59), N17@13.5Å(now 3.4,conf 0.59), C37@16.5Å(now 13.4,conf 0.55), Y13@11.2Å(now 7.4,conf 0.55)
  - L24↔P46: targets 9.0/20.9Å but partners are 6.3Å apart → too_close_together by 5.6Å
  - P46↔L29: targets 20.9/11.9Å but partners are 3.1Å apart → too_close_together by 5.8Å
  - T45↔L29: targets 21.1/11.9Å but partners are 4.8Å apart → too_close_together by 4.4Å
- **C37** — severity 15.80, 7 conflict(s); suspect input ~`K47` (group: pull_in)
  - pull-in (wants closer): G41@7.3Å(now 10.4,conf 0.82)
  - push-out (wants farther): Y44@11.4Å(now 7.7,conf 0.79), K47@20.4Å(now 15.0,conf 0.59), N21@16.5Å(now 13.4,conf 0.55)
  - V30↔K47: targets 9.6/20.4Å but partners are 5.4Å apart → too_close_together by 5.4Å
  - E31↔K47: targets 8.5/20.4Å but partners are 7.3Å apart → too_close_together by 4.6Å
  - L33↔K47: targets 5.8/20.4Å but partners are 10.1Å apart → too_close_together by 4.5Å
- **R40** — severity 14.20, 8 conflict(s); suspect input ~`K47` (group: pull_in)
  - pull-in (wants closer): S11@17.2Å(now 21.2,conf 0.55), E16@10.7Å(now 15.9,conf 0.55), Q14@15.7Å(now 18.9,conf 0.55)
  - push-out (wants farther): P46@19.0Å(now 16.3,conf 0.99), K47@22.4Å(now 18.4,conf 0.67), E3@22.2Å(now 19.5,conf 0.65)
  - F43↔K47: targets 9.0/22.4Å but partners are 10.0Å apart → too_close_together by 3.5Å
  - T45↔K47: targets 15.0/22.4Å but partners are 4.3Å apart → too_close_together by 3.1Å
  - F43↔P46: targets 9.0/19.0Å but partners are 7.9Å apart → too_close_together by 2.1Å
- **E31** — severity 12.58, 6 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): K47@18.6Å(now 7.3,conf 0.55), I1@12.5Å(now 7.7,conf 0.55), Y44@12.3Å(now 4.1,conf 0.55)
  - G26↔K47: targets 9.0/18.6Å but partners are 3.2Å apart → too_close_together by 6.4Å
  - H28↔K47: targets 6.2/18.6Å but partners are 7.0Å apart → too_close_together by 5.4Å
  - S27↔K47: targets 8.0/18.6Å but partners are 6.3Å apart → too_close_together by 4.3Å
- **E39** — severity 11.68, 8 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): C10@20.2Å(now 23.3,conf 0.58), N17@15.1Å(now 18.5,conf 0.55), L15@14.7Å(now 18.1,conf 0.55)
  - push-out (wants farther): P46@20.9Å(now 16.8,conf 0.59), Y44@14.9Å(now 11.6,conf 0.55), F43@12.5Å(now 9.3,conf 0.55)
  - Y34↔P46: targets 7.0/20.9Å but partners are 10.1Å apart → too_close_together by 3.8Å
  - Y34↔Y44: targets 7.0/14.9Å but partners are 4.8Å apart → too_close_together by 3.1Å
  - P46↔A32: targets 20.9/12.7Å but partners are 5.1Å apart → too_close_together by 3.1Å
- **Q22** — severity 10.81, 6 conflict(s); suspect input ~`K47` (group: pull_in)
  - pull-in (wants closer): C5@6.7Å(now 12.9,conf 0.55)
  - push-out (wants farther): E16@13.0Å(now 9.6,conf 0.94), N17@15.0Å(now 5.3,conf 0.67), K47@19.9Å(now 13.1,conf 0.58), P46@19.3Å(now 11.9,conf 0.56), Y13@13.3Å(now 10.3,conf 0.55)
  - L29↔P46: targets 11.2/19.3Å but partners are 3.1Å apart → too_close_together by 5.0Å
  - L29↔K47: targets 11.2/19.9Å but partners are 4.5Å apart → too_close_together by 4.2Å
  - G26↔K47: targets 13.4/19.9Å but partners are 3.2Å apart → too_close_together by 3.3Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=11 · 3-10(G)=3 · coil(C)=5

```
CHHHHHHHHEHHHHHHHHHHEEEGHHHHEGHHEHEHCECECEGCHHE
```

## Backbone H-bond Network

- total=31 · helix(i→i+4)=13 · sheet=18
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - Q4 ↔ S8  (helix)
  - C5 ↔ I9  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - E16 ↔ V20  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - A32 ↔ V36  (helix)
  - C10 ↔ N21  (sheet)
  - C10 ↔ Q22  (sheet)
  - C10 ↔ H23  (sheet)
  - C10 ↔ L29  (sheet)
  - N21 ↔ L29  (sheet)
  - Q22 ↔ L29  (sheet)
  - H23 ↔ L29  (sheet)
  - … +11 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=239 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=127 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.8617 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
