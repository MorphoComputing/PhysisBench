# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1YCC\seeds\seed_1\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 13.170 A
- tm_score_ca_ordered: 0.16317744268160495
- heavy_atom_rmsd: 13.629 A
- sidechain_heavy_atom_rmsd: 14.043 A
- **all-atom quality (honest):** heavy 13.629 A, sidechain 14.043 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 28
- distogram_pairs: 1054
- bin_accuracy: 0.368

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=48
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=8.305467328165454 -> 7.87670689598426 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 13.170171687350509
- ga_delta_rmsd: -5.474265164502679  ga_fitness_mode: energy
- pre_local_rmsd: 13.204885283283964  localized_anchor_rmsd: 13.170168465058453

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N93-A102 → 285 conflicts (41%); T79-F83 → 115 conflicts (16%); E1-K3 → 82 conflicts (12%)
- explained: 482/701 conflicts by 3 root cause(s)
- metrics: hubs=97 (frac 0.942), conflicts/hub=7.2, max_incompat=14.16Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N93-A102 + T79-F83 + E1-K3 — explain ~482/701 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S69** — severity 108.30, 25 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): N66@5.0Å(now 7.8,conf 0.94), E1@9.2Å(now 23.1,conf 0.55), F2@7.6Å(now 15.9,conf 0.55)
  - push-out (wants farther): H22@17.2Å(now 10.2,conf 0.55), G38@16.6Å(now 7.0,conf 0.55), Y98@12.7Å(now 9.7,conf 0.55), T97@10.7Å(now 7.9,conf 0.55), A102@16.4Å(now 11.4,conf 0.55), F40@12.3Å(now 9.4,conf 0.55)
  - T73↔E1: targets 6.3/9.2Å but partners are 29.7Å apart → too_far_apart by 14.2Å
  - E1↔N74: targets 9.2/9.2Å but partners are 32.4Å apart → too_far_apart by 14.1Å
  - E1↔P77: targets 9.2/16.1Å but partners are 39.3Å apart → too_far_apart by 14.1Å
- **T79** — severity 71.22, 32 conflict(s); suspect input ~`T53` (group: push_out)
  - pull-in (wants closer): A55@5.8Å(now 9.4,conf 0.55), N56@6.0Å(now 11.2,conf 0.55), T53@6.2Å(now 17.0,conf 0.55), E48@17.5Å(now 22.1,conf 0.55), D54@8.1Å(now 13.8,conf 0.55)
  - push-out (wants farther): K26@23.4Å(now 11.0,conf 0.76), D91@21.7Å(now 18.6,conf 0.62), K87@18.3Å(now 15.5,conf 0.55), N35@16.2Å(now 11.2,conf 0.55)
  - A82↔T53: targets 8.4/6.2Å but partners are 25.1Å apart → too_far_apart by 10.6Å
  - K26↔A55: targets 23.4/5.8Å but partners are 9.6Å apart → too_close_together by 8.0Å
  - T53↔G84: targets 6.2/11.7Å but partners are 25.7Å apart → too_far_apart by 7.9Å
- **N93** — severity 62.33, 20 conflict(s); suspect input ~`K3` (group: push_out)
  - pull-in (wants closer): K90@5.1Å(now 8.1,conf 0.57), E89@6.1Å(now 9.8,conf 0.55), K3@6.3Å(now 13.9,conf 0.55), F2@6.6Å(now 10.3,conf 0.55), G85@13.3Å(now 15.9,conf 0.55)
  - push-out (wants farther): L99@9.1Å(now 4.2,conf 0.91), N56@22.6Å(now 16.1,conf 0.68), V24@17.1Å(now 14.5,conf 0.55), Y98@8.7Å(now 3.9,conf 0.55)
  - E89↔K3: targets 6.1/6.3Å but partners are 23.2Å apart → too_far_apart by 10.8Å
  - K90↔K3: targets 5.1/6.3Å but partners are 21.2Å apart → too_far_apart by 9.8Å
  - L86↔K3: targets 10.6/6.3Å but partners are 26.2Å apart → too_far_apart by 9.3Å
- **C21** — severity 44.21, 19 conflict(s); suspect input ~`T53` (group: pull_in)
  - pull-in (wants closer): E48@16.6Å(now 22.1,conf 0.55), A47@14.8Å(now 17.7,conf 0.55), T53@15.4Å(now 23.3,conf 0.55), Y52@13.6Å(now 20.7,conf 0.55), A82@9.7Å(now 17.2,conf 0.55), A102@16.0Å(now 23.7,conf 0.55)
  - push-out (wants farther): G28@12.8Å(now 9.6,conf 0.82), G27@16.0Å(now 12.4,conf 0.72), E25@13.2Å(now 8.4,conf 0.55), V24@10.4Å(now 5.8,conf 0.55), Y71@16.2Å(now 13.4,conf 0.55), K26@15.8Å(now 12.3,conf 0.55)
  - V32↔A102: targets 5.0/16.0Å but partners are 28.3Å apart → too_far_apart by 7.3Å
  - V32↔T53: targets 5.0/15.4Å but partners are 27.7Å apart → too_far_apart by 7.3Å
  - V32↔Y52: targets 5.0/13.6Å but partners are 24.8Å apart → too_far_apart by 6.2Å
- **H22** — severity 42.22, 17 conflict(s); suspect input ~`S51` (group: pull_in)
  - pull-in (wants closer): C103@11.1Å(now 14.5,conf 0.91), E48@14.6Å(now 19.9,conf 0.55), S51@13.8Å(now 22.4,conf 0.55)
  - push-out (wants farther): E1@27.5Å(now 23.8,conf 0.99), N74@17.4Å(now 13.8,conf 0.55), S69@17.2Å(now 10.2,conf 0.55)
  - L19↔S51: targets 5.1/13.8Å but partners are 27.6Å apart → too_far_apart by 8.7Å
  - C18↔S51: targets 6.6/13.8Å but partners are 28.0Å apart → too_far_apart by 7.6Å
  - T16↔S51: targets 11.0/13.8Å but partners are 31.7Å apart → too_far_apart by 6.8Å
- **M68** — severity 40.99, 12 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): E1@11.4Å(now 23.7,conf 0.55)
  - push-out (wants farther): K87@12.8Å(now 8.7,conf 0.55), G38@13.3Å(now 7.4,conf 0.55), D94@12.2Å(now 9.4,conf 0.55), L95@10.1Å(now 7.4,conf 0.55), K101@14.0Å(now 11.1,conf 0.55)
  - Y71↔E1: targets 5.0/11.4Å but partners are 28.4Å apart → too_far_apart by 12.0Å
  - Y75↔E1: targets 9.1/11.4Å but partners are 32.0Å apart → too_far_apart by 11.5Å
  - N74↔E1: targets 9.6/11.4Å but partners are 32.4Å apart → too_far_apart by 11.4Å

## Secondary Structure (DSSP-like)

- helix(H)=56 · strand(E)=28 · 3-10(G)=15 · coil(C)=4

```
EHHEEEHEHHEHGHHHHEHHEGHEEHHHGHEHEEEEEGHCGHHHHHGHHEGGGEHHHHHGEHHGEHHEEEGHEGGCHEHHHHEHECHGHHHHHHHHEHHHHHC
```

## Backbone H-bond Network

- total=72 · helix(i→i+4)=26 · sheet=46
  - K3 ↔ A7  (helix)
  - G10 ↔ F14  (helix)
  - T12 ↔ T16  (helix)
  - T16 ↔ Q20  (helix)
  - L19 ↔ T23  (helix)
  - T23 ↔ G27  (helix)
  - K26 ↔ H30  (helix)
  - R42 ↔ Q46  (helix)
  - S44 ↔ E48  (helix)
  - G45 ↔ G49  (helix)
  - A55 ↔ K59  (helix)
  - K58 ↔ L62  (helix)
  - K59 ↔ W63  (helix)
  - L62 ↔ N66  (helix)
  - W63 ↔ N67  (helix)
  - P77 ↔ M81  (helix)
  - K80 ↔ G84  (helix)
  - K87 ↔ D91  (helix)
  - E89 ↔ N93  (helix)
  - K90 ↔ D94  (helix)
  - … +52 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=34 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=517 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=267 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.2447 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=28 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
