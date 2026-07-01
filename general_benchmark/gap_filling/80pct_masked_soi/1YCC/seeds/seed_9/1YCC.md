# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1YCC\seeds\seed_9\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 3.620 A
- tm_score_ca_ordered: 0.6220588156110721
- heavy_atom_rmsd: 4.752 A
- sidechain_heavy_atom_rmsd: 5.653 A
- **all-atom quality (honest):** heavy 4.752 A, sidechain 5.653 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 29
- distogram_pairs: 1050
- bin_accuracy: 0.535

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=60
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.6204640563946686
- ga_delta_rmsd: 6.465516407451798  ga_fitness_mode: energy
- pre_local_rmsd: 3.6215007568112347  localized_anchor_rmsd: 3.620479771347203

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T53-A55 → 59 conflicts (28%); E1 → 33 conflicts (16%); K9-G10 → 22 conflicts (11%)
- explained: 114/207 conflicts by 3 root cause(s)
- metrics: hubs=51 (frac 0.495), conflicts/hub=4.1, max_incompat=6.56Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T53-A55 + E1 + K9-G10 — explain ~114/207 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T79** — severity 58.06, 30 conflict(s); suspect input ~`T53` (group: pull_in)
  - pull-in (wants closer): A55@5.8Å(now 9.2,conf 0.55), T53@6.2Å(now 13.6,conf 0.55), K31@15.7Å(now 18.8,conf 0.55), D54@8.1Å(now 11.9,conf 0.55)
  - push-out (wants farther): L72@13.0Å(now 7.6,conf 1.00), T73@13.0Å(now 10.0,conf 0.99), Y75@9.2Å(now 5.1,conf 0.82), R42@17.5Å(now 13.4,conf 0.55), N74@10.9Å(now 7.6,conf 0.55), S44@11.2Å(now 7.9,conf 0.55), M68@14.4Å(now 8.1,conf 0.55)
  - T53↔G84: targets 6.2/11.7Å but partners are 24.4Å apart → too_far_apart by 6.5Å
  - G85↔T53: targets 13.0/6.2Å but partners are 25.3Å apart → too_far_apart by 6.1Å
  - K87↔T53: targets 18.3/6.2Å but partners are 30.3Å apart → too_far_apart by 5.8Å
- **C103** — severity 22.66, 8 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): E1@21.0Å(now 11.1,conf 0.99), K100@7.0Å(now 3.3,conf 0.99), I96@10.9Å(now 6.8,conf 0.91), T97@10.6Å(now 8.0,conf 0.79), K80@21.6Å(now 17.4,conf 0.61), K3@17.5Å(now 11.7,conf 0.55), F40@7.5Å(now 4.9,conf 0.55), E65@11.7Å(now 7.8,conf 0.55), G5@16.1Å(now 12.2,conf 0.55)
  - E1↔K100: targets 21.0/7.0Å but partners are 8.6Å apart → too_close_together by 5.4Å
  - E1↔I96: targets 21.0/10.9Å but partners are 4.7Å apart → too_close_together by 5.4Å
  - E1↔L99: targets 21.0/5.4Å but partners are 10.1Å apart → too_close_together by 5.4Å
- **G10** — severity 19.37, 13 conflict(s); suspect input ~`G5` (group: pull_in)
  - pull-in (wants closer): G5@7.1Å(now 9.9,conf 0.91), Y98@5.0Å(now 7.9,conf 0.57)
  - push-out (wants farther): N56@23.7Å(now 21.0,conf 0.76), Q46@23.8Å(now 21.0,conf 0.75), E70@16.4Å(now 13.2,conf 0.55), A4@10.3Å(now 7.1,conf 0.55)
  - K3↔G5: targets 13.0/7.1Å but partners are 2.8Å apart → too_close_together by 3.1Å
  - G5↔K15: targets 7.1/8.9Å but partners are 18.3Å apart → too_far_apart by 2.3Å
  - G5↔F14: targets 7.1/6.6Å but partners are 16.4Å apart → too_far_apart by 2.7Å
- **K9** — severity 15.07, 7 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): A4@11.0Å(now 6.3,conf 0.94), F2@16.9Å(now 12.7,conf 0.91), E1@19.6Å(now 9.0,conf 0.57), L99@11.2Å(now 8.4,conf 0.55), K3@14.2Å(now 10.2,conf 0.55)
  - G5↔E1: targets 8.0/19.6Å but partners are 5.4Å apart → too_close_together by 6.2Å
  - S6↔E1: targets 4.9/19.6Å but partners are 8.5Å apart → too_close_together by 6.2Å
  - G5↔K3: targets 8.0/14.2Å but partners are 2.8Å apart → too_close_together by 3.4Å
- **Y98** — severity 13.18, 6 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): G10@5.0Å(now 7.9,conf 0.57), V24@10.2Å(now 13.1,conf 0.55)
  - push-out (wants farther): A102@6.6Å(now 3.8,conf 0.79), E1@17.0Å(now 9.6,conf 0.55)
  - L95↔E1: targets 5.0/17.0Å but partners are 6.6Å apart → too_close_together by 5.4Å
  - D94↔E1: targets 7.0/17.0Å but partners are 4.9Å apart → too_close_together by 5.1Å
  - R92↔E1: targets 9.4/17.0Å but partners are 3.3Å apart → too_close_together by 4.3Å
- **K8** — severity 12.55, 6 conflict(s); suspect input ~`G5` (group: push_out)
  - push-out (wants farther): A4@11.4Å(now 5.9,conf 0.79), E1@20.8Å(now 11.7,conf 0.59), K3@15.1Å(now 12.0,conf 0.55)
  - E1↔G5: targets 20.8/8.9Å but partners are 5.4Å apart → too_close_together by 6.6Å
  - E1↔I96: targets 20.8/11.0Å but partners are 4.7Å apart → too_close_together by 5.1Å
  - A11↔E1: targets 4.0/20.8Å but partners are 13.1Å apart → too_close_together by 3.7Å

## Secondary Structure (DSSP-like)

- helix(H)=45 · strand(E)=33 · 3-10(G)=17 · coil(C)=8

```
EHEHHGHHHEGHGGHHEHHHEEEHEHEEEEEHEGCGEHCCGEEEGEGEHGHHHHHHGCEGCHGEGHHEHEHEHEEHHEEHECCEGHHEHHHGGHHHHEHHHHC
```

## Backbone H-bond Network

- total=92 · helix(i→i+4)=19 · sheet=73
  - A4 ↔ K8  (helix)
  - G5 ↔ K9  (helix)
  - K8 ↔ T12  (helix)
  - T12 ↔ T16  (helix)
  - K15 ↔ L19  (helix)
  - T16 ↔ Q20  (helix)
  - Q20 ↔ V24  (helix)
  - S51 ↔ A55  (helix)
  - Y52 ↔ N56  (helix)
  - L62 ↔ N66  (helix)
  - N67 ↔ Y71  (helix)
  - S69 ↔ T73  (helix)
  - T73 ↔ P77  (helix)
  - L86 ↔ K90  (helix)
  - K87 ↔ D91  (helix)
  - K90 ↔ D94  (helix)
  - D91 ↔ L95  (helix)
  - L95 ↔ L99  (helix)
  - T97 ↔ K101  (helix)
  - E1 ↔ G10  (sheet)
  - … +72 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=38 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=499 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=263 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.9242 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=29 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
