# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CSP\sequence\1CSP.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CSP\seeds\seed_7\1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 9.968 A
- tm_score_ca_ordered: 0.19335700853185103
- heavy_atom_rmsd: 11.366 A
- sidechain_heavy_atom_rmsd: 12.287 A
- **all-atom quality (honest):** heavy 11.366 A, sidechain 12.287 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 20
- distogram_pairs: 633
- bin_accuracy: 0.501

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.967922788665183
- ga_delta_rmsd: -1.3125450855628973  ga_fitness_mode: energy
- pre_local_rmsd: 9.9962310871853  localized_anchor_rmsd: 9.967922212275779

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I50-A60 → 101 conflicts (73%); A45-S47 → 17 conflicts (12%); L1-G3 → 6 conflicts (4%)
- explained: 124/138 conflicts by 3 root cause(s)
- metrics: hubs=30 (frac 0.462), conflicts/hub=4.6, max_incompat=7.61Å, chain_span=0.985
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I50-A60 + A45-S47 + L1-G3 — explain ~124/138 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G53** — severity 35.33, 18 conflict(s); suspect input ~`G3` (group: pull_in)
  - pull-in (wants closer): A60@11.1Å(now 15.1,conf 0.91)
  - push-out (wants farther): N9@23.2Å(now 18.8,conf 0.75), F8@22.2Å(now 17.7,conf 0.65), G3@20.6Å(now 11.9,conf 0.59), S47@19.7Å(now 16.8,conf 0.57)
  - P57↔G3: targets 7.0/20.6Å but partners are 6.0Å apart → too_close_together by 7.6Å
  - G3↔Q58: targets 20.6/8.7Å but partners are 5.9Å apart → too_close_together by 6.0Å
  - A60↔K38: targets 11.1/22.6Å but partners are 6.9Å apart → too_close_together by 4.5Å
- **N9** — severity 29.76, 16 conflict(s); suspect input ~`G13` (group: push_out)
  - push-out (wants farther): G53@23.2Å(now 18.8,conf 0.75), E49@20.1Å(now 15.3,conf 0.58), I50@19.5Å(now 12.2,conf 0.57), S47@18.8Å(now 15.1,conf 0.56), I32@13.7Å(now 11.2,conf 0.55), F26@11.7Å(now 8.8,conf 0.55), Q58@15.9Å(now 12.1,conf 0.55), H28@9.9Å(now 6.6,conf 0.55)
  - F14↔I50: targets 5.0/19.5Å but partners are 7.8Å apart → too_close_together by 6.7Å
  - I50↔G13: targets 19.5/5.8Å but partners are 8.2Å apart → too_close_together by 5.5Å
  - F14↔G53: targets 5.0/23.2Å but partners are 14.5Å apart → too_close_together by 3.7Å
- **N54** — severity 24.32, 9 conflict(s); suspect input ~`A45` (group: push_out)
  - push-out (wants farther): S47@23.5Å(now 19.3,conf 1.00), A45@27.3Å(now 23.9,conf 0.93), F8@23.1Å(now 17.1,conf 0.75)
  - S47↔A59: targets 23.5/13.0Å but partners are 5.9Å apart → too_close_together by 4.6Å
  - S47↔Q58: targets 23.5/11.0Å but partners are 8.8Å apart → too_close_together by 3.7Å
  - A59↔A45: targets 13.0/27.3Å but partners are 10.8Å apart → too_close_together by 3.5Å
- **A45** — severity 23.31, 15 conflict(s); suspect input ~`V5` (group: pull_in)
  - pull-in (wants closer): E65@5.4Å(now 10.8,conf 0.56), L1@10.7Å(now 14.2,conf 0.55)
  - push-out (wants farther): N54@27.3Å(now 23.9,conf 0.93), E52@22.2Å(now 19.7,conf 0.72), V27@13.3Å(now 10.7,conf 0.55), G15@13.6Å(now 10.8,conf 0.55)
  - E65↔E20: targets 5.4/12.8Å but partners are 22.2Å apart → too_far_apart by 4.1Å
  - E65↔K6: targets 5.4/9.5Å but partners are 19.0Å apart → too_far_apart by 4.1Å
  - N54↔V5: targets 27.3/6.4Å but partners are 17.1Å apart → too_close_together by 3.8Å
- **E52** — severity 16.23, 8 conflict(s); suspect input ~`G3` (group: push_out)
  - push-out (wants farther): A45@22.2Å(now 19.7,conf 0.72), K12@21.8Å(now 15.6,conf 0.62), G3@17.3Å(now 10.8,conf 0.55), E2@17.1Å(now 10.1,conf 0.55), R55@7.2Å(now 4.3,conf 0.55)
  - P57↔G3: targets 5.0/17.3Å but partners are 6.0Å apart → too_close_together by 6.2Å
  - P57↔E2: targets 5.0/17.1Å but partners are 6.4Å apart → too_close_together by 5.7Å
  - Q58↔G3: targets 7.0/17.3Å but partners are 5.9Å apart → too_close_together by 4.4Å
- **V46** — severity 11.51, 6 conflict(s); suspect input ~`K4` (group: pull_in)
  - pull-in (wants closer): E65@4.7Å(now 10.7,conf 0.59)
  - push-out (wants farther): G56@20.2Å(now 16.8,conf 0.58), Q58@13.9Å(now 10.5,conf 0.55)
  - E65↔K4: targets 4.7/6.0Å but partners are 16.5Å apart → too_far_apart by 5.8Å
  - E65↔E18: targets 4.7/9.7Å but partners are 19.7Å apart → too_far_apart by 5.3Å
  - E65↔D23: targets 4.7/15.4Å but partners are 24.1Å apart → too_far_apart by 3.9Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=26 · 3-10(G)=15 · coil(C)=10

```
CEEEEGCCHHGHHCEEGGCEHCEGCCEGHGGGEEEGGEECHHGCEEGHEHHEHHHEEEEGEEEGE
```

## Backbone H-bond Network

- total=56 · helix(i→i+4)=2 · sheet=54
  - N9 ↔ G13  (helix)
  - V51 ↔ R55  (helix)
  - G3 ↔ G15  (sheet)
  - G3 ↔ F16  (sheet)
  - G3 ↔ E20  (sheet)
  - G3 ↔ D23  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ E20  (sheet)
  - K4 ↔ D23  (sheet)
  - V5 ↔ G15  (sheet)
  - V5 ↔ F16  (sheet)
  - V5 ↔ E20  (sheet)
  - V5 ↔ D23  (sheet)
  - G15 ↔ D23  (sheet)
  - G15 ↔ V27  (sheet)
  - F16 ↔ D23  (sheet)
  - F16 ↔ V27  (sheet)
  - V27 ↔ Q33  (sheet)
  - V27 ↔ K38  (sheet)
  - … +36 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=306 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=213 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.8982 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=20 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
