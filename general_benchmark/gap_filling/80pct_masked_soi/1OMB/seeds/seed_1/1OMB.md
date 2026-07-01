# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1OMB\seeds\seed_1\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 4.192 A
- tm_score_ca_ordered: 0.19965168817832885
- heavy_atom_rmsd: 5.395 A
- sidechain_heavy_atom_rmsd: 6.158 A
- **all-atom quality (honest):** heavy 5.395 A, sidechain 6.158 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 205
- bin_accuracy: 0.454

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.191511430489915
- ga_delta_rmsd: 0.04428558311628805  ga_fitness_mode: energy
- pre_local_rmsd: 4.191531771084425  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E3 → 14 conflicts (50%); W10 → 6 conflicts (21%)
- explained: 20/28 conflicts by 2 root cause(s)
- metrics: hubs=11 (frac 0.333), conflicts/hub=2.5, max_incompat=5.79Å, chain_span=0.909
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E3 + W10 — explain ~20/28 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C32** — severity 6.80, 4 conflict(s); suspect input ~`E3` (group: pull_in)
  - pull-in (wants closer): E3@8.1Å(now 15.1,conf 0.55)
  - push-out (wants farther): T9@9.3Å(now 6.1,conf 0.55), N29@9.9Å(now 7.3,conf 0.55)
  - M25↔E3: targets 13.1/8.1Å but partners are 25.1Å apart → too_far_apart by 3.9Å
  - I26↔E3: targets 15.0/8.1Å but partners are 26.1Å apart → too_far_apart by 3.0Å
  - G27↔E3: targets 13.0/8.1Å but partners are 24.1Å apart → too_far_apart by 3.0Å
- **E3** — severity 6.62, 4 conflict(s); suspect input ~`G6` (group: pull_in)
  - pull-in (wants closer): G6@5.5Å(now 8.7,conf 0.67), N29@14.9Å(now 18.1,conf 0.55), T33@9.6Å(now 13.7,conf 0.55), C32@8.1Å(now 15.1,conf 0.55)
  - T9↔G6: targets 14.4/5.5Å but partners are 5.8Å apart → too_close_together by 3.1Å
  - W10↔C32: targets 17.0/8.1Å but partners are 5.4Å apart → too_close_together by 3.5Å
  - W10↔G6: targets 17.0/5.5Å but partners are 9.0Å apart → too_close_together by 2.5Å
- **G6** — severity 6.16, 3 conflict(s); suspect input ~`C30` (group: pull_in)
  - pull-in (wants closer): E3@5.5Å(now 8.7,conf 0.67), C30@8.5Å(now 11.5,conf 0.55)
  - push-out (wants farther): W10@13.0Å(now 9.0,conf 0.94), G11@14.7Å(now 8.3,conf 0.82), G12@11.8Å(now 3.7,conf 0.69), T13@10.2Å(now 3.8,conf 0.55), T9@10.1Å(now 5.8,conf 0.55)
  - E3↔C30: targets 5.5/8.5Å but partners are 19.7Å apart → too_far_apart by 5.8Å
  - I1↔C30: targets 6.1/8.5Å but partners are 17.5Å apart → too_far_apart by 2.9Å
  - A2↔C30: targets 7.6/8.5Å but partners are 18.7Å apart → too_far_apart by 2.6Å
- **Y5** — severity 4.83, 3 conflict(s); suspect input ~`C8` (group: pull_in)
  - pull-in (wants closer): R22@8.7Å(now 11.3,conf 0.55), C23@10.3Å(now 15.3,conf 0.55)
  - push-out (wants farther): W10@15.1Å(now 11.4,conf 0.91), T9@12.0Å(now 8.2,conf 0.72), A2@8.4Å(now 5.3,conf 0.69), G11@15.8Å(now 10.2,conf 0.69), G12@15.0Å(now 5.7,conf 0.58), I1@8.9Å(now 5.0,conf 0.55), K14@11.6Å(now 7.2,conf 0.55)
  - W10↔C8: targets 15.1/9.2Å but partners are 3.8Å apart → too_close_together by 2.2Å
  - C8↔G11: targets 9.2/15.8Å but partners are 4.1Å apart → too_close_together by 2.5Å
  - C8↔G12: targets 9.2/15.0Å but partners are 3.5Å apart → too_close_together by 2.3Å
- **W10** — severity 4.43, 3 conflict(s); suspect input ~`T13` (group: push_out)
  - push-out (wants farther): G6@13.0Å(now 9.0,conf 0.94), Y5@15.1Å(now 11.4,conf 0.91), K7@10.9Å(now 7.6,conf 0.91), D4@17.6Å(now 14.9,conf 0.69)
  - D4↔T13: targets 17.6/7.8Å but partners are 6.3Å apart → too_close_together by 3.5Å
  - Y5↔T13: targets 15.1/7.8Å but partners are 4.3Å apart → too_close_together by 3.0Å
  - D4↔K14: targets 17.6/7.5Å but partners are 8.5Å apart → too_close_together by 1.6Å
- **N29** — severity 3.72, 3 conflict(s); suspect input ~`E3` (group: pull_in)
  - pull-in (wants closer): E3@14.9Å(now 18.1,conf 0.55)
  - push-out (wants farther): T33@13.0Å(now 8.0,conf 0.99), C32@9.9Å(now 7.3,conf 0.55)
  - S24↔E3: targets 6.9/14.9Å but partners are 24.4Å apart → too_far_apart by 2.5Å
  - I26↔E3: targets 8.9/14.9Å but partners are 26.1Å apart → too_far_apart by 2.3Å
  - M25↔E3: targets 8.2/14.9Å but partners are 25.1Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=14 · 3-10(G)=1 · coil(C)=3

```
CEHCECEEHHHEGHEEHHEEHHHEEHEEHHHHE
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=4 · sheet=29
  - W10 ↔ K14  (helix)
  - R17 ↔ C21  (helix)
  - R22 ↔ I26  (helix)
  - I26 ↔ C30  (helix)
  - A2 ↔ K7  (sheet)
  - A2 ↔ G12  (sheet)
  - A2 ↔ C15  (sheet)
  - A2 ↔ C16  (sheet)
  - Y5 ↔ G12  (sheet)
  - Y5 ↔ C15  (sheet)
  - Y5 ↔ C16  (sheet)
  - Y5 ↔ R19  (sheet)
  - Y5 ↔ P20  (sheet)
  - K7 ↔ G12  (sheet)
  - K7 ↔ C15  (sheet)
  - K7 ↔ C16  (sheet)
  - K7 ↔ R19  (sheet)
  - K7 ↔ P20  (sheet)
  - C8 ↔ C15  (sheet)
  - C8 ↔ C16  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=149 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=83 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.8249 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
