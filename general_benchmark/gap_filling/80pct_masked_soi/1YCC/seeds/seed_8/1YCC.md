# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1YCC\seeds\seed_8\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 7.332 A
- tm_score_ca_ordered: 0.37722995815329796
- heavy_atom_rmsd: 7.987 A
- sidechain_heavy_atom_rmsd: 8.670 A
- **all-atom quality (honest):** heavy 7.987 A, sidechain 8.670 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 25
- distogram_pairs: 1051
- bin_accuracy: 0.436

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=9.216017336000977 -> 8.623359851570696 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.331754120984168
- ga_delta_rmsd: 1.0499830852499672  ga_fitness_mode: energy
- pre_local_rmsd: 7.393683864164786  localized_anchor_rmsd: 7.331737726506651

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T79-K80 → 210 conflicts (23%); E1-F2 → 130 conflicts (14%)
- explained: 340/912 conflicts by 2 root cause(s)
- metrics: hubs=85 (frac 0.825), conflicts/hub=10.7, max_incompat=16.89Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T79-K80 + E1-F2 — explain ~340/912 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T79** — severity 227.08, 60 conflict(s); suspect input ~`T53` (group: pull_in)
  - pull-in (wants closer): K26@23.4Å(now 26.3,conf 0.76), A55@5.8Å(now 22.7,conf 0.55), N56@6.0Å(now 20.3,conf 0.55), T53@6.2Å(now 22.1,conf 0.55), E48@17.5Å(now 27.1,conf 0.55), R42@17.5Å(now 23.7,conf 0.55), S44@11.2Å(now 18.5,conf 0.55), Q46@14.6Å(now 20.7,conf 0.55), D54@8.1Å(now 20.4,conf 0.55)
  - push-out (wants farther): L72@13.0Å(now 5.0,conf 0.99), Y75@9.1Å(now 5.3,conf 0.91), T73@13.4Å(now 3.8,conf 0.79), L86@16.6Å(now 13.2,conf 0.79), K90@23.7Å(now 19.4,conf 0.75), D91@21.7Å(now 15.6,conf 0.62), R17@17.2Å(now 11.0,conf 0.55), N74@10.9Å(now 3.2,conf 0.55), M68@14.4Å(now 10.7,conf 0.55)
  - A82↔A55: targets 7.0/5.8Å but partners are 29.7Å apart → too_far_apart by 16.9Å
  - A82↔T53: targets 7.0/6.2Å but partners are 29.4Å apart → too_far_apart by 16.2Å
  - A82↔N56: targets 7.0/6.0Å but partners are 27.7Å apart → too_far_apart by 14.7Å
- **D54** — severity 105.03, 30 conflict(s); suspect input ~`K80` (group: pull_in)
  - pull-in (wants closer): M81@12.4Å(now 22.2,conf 0.55), T79@8.1Å(now 20.4,conf 0.55), K80@9.8Å(now 25.6,conf 0.55)
  - push-out (wants farther): A11@27.5Å(now 23.7,conf 1.00), N60@10.7Å(now 5.9,conf 0.82), V61@12.8Å(now 6.5,conf 0.82)
  - K58↔K80: targets 5.5/9.8Å but partners are 30.8Å apart → too_far_apart by 15.6Å
  - I57↔K80: targets 6.2/9.8Å but partners are 30.4Å apart → too_far_apart by 14.4Å
  - K58↔T79: targets 5.5/8.1Å but partners are 25.3Å apart → too_far_apart by 11.8Å
- **P29** — severity 92.91, 16 conflict(s); suspect input ~`K3` (group: pull_in)
  - pull-in (wants closer): G33@9.0Å(now 12.1,conf 0.99)
  - push-out (wants farther): K3@27.5Å(now 13.4,conf 1.00), R17@17.6Å(now 13.6,conf 0.55), H22@8.2Å(now 5.6,conf 0.55)
  - N35↔K3: targets 5.0/27.5Å but partners are 7.2Å apart → too_close_together by 15.3Å
  - K3↔L36: targets 27.5/8.9Å but partners are 4.8Å apart → too_close_together by 13.8Å
  - K3↔V24: targets 27.5/7.1Å but partners are 8.1Å apart → too_close_together by 12.3Å
- **N56** — severity 90.20, 25 conflict(s); suspect input ~`T79` (group: pull_in)
  - pull-in (wants closer): T79@6.0Å(now 20.3,conf 0.55), G85@16.4Å(now 25.1,conf 0.55), G84@16.3Å(now 27.4,conf 0.55)
  - push-out (wants farther): V61@8.8Å(now 3.5,conf 0.82), W63@12.6Å(now 9.4,conf 0.79), G10@23.7Å(now 20.1,conf 0.76), N60@6.9Å(now 3.3,conf 0.55), L62@11.3Å(now 7.4,conf 0.55)
  - K59↔T79: targets 5.3/6.0Å but partners are 24.1Å apart → too_far_apart by 12.9Å
  - T53↔T79: targets 5.0/6.0Å but partners are 22.1Å apart → too_far_apart by 11.1Å
  - S51↔T79: targets 9.2/6.0Å but partners are 25.6Å apart → too_far_apart by 10.5Å
- **K58** — severity 65.58, 15 conflict(s); suspect input ~`G78` (group: push_out)
  - pull-in (wants closer): P34@16.7Å(now 20.5,conf 0.55), G78@10.8Å(now 33.4,conf 0.55)
  - push-out (wants farther): A4@27.5Å(now 23.0,conf 1.00)
  - A55↔G78: targets 5.5/10.8Å but partners are 31.1Å apart → too_far_apart by 14.7Å
  - D54↔G78: targets 5.5/10.8Å but partners are 29.1Å apart → too_far_apart by 12.8Å
  - T53↔G78: targets 8.6/10.8Å but partners are 31.2Å apart → too_far_apart by 11.8Å
- **H30** — severity 64.36, 13 conflict(s); suspect input ~`F2` (group: pull_in)
  - pull-in (wants closer): M81@13.5Å(now 21.2,conf 0.55)
  - push-out (wants farther): F2@27.4Å(now 16.7,conf 0.96), L19@11.2Å(now 6.6,conf 0.55)
  - N35↔F2: targets 5.0/27.4Å but partners are 11.2Å apart → too_close_together by 11.3Å
  - F2↔P34: targets 27.4/4.9Å but partners are 11.7Å apart → too_close_together by 10.8Å
  - H37↔F2: targets 11.0/27.4Å but partners are 7.8Å apart → too_close_together by 8.6Å

## Secondary Structure (DSSP-like)

- helix(H)=48 · strand(E)=35 · 3-10(G)=14 · coil(C)=6

```
EHHHHHHGHHEHHHEHEHEHHEGHHEGEEEEHHEECEGECHEEHHGEEHEGGGEHHHEGEGHCHCEHCHEEHEEHEHHHGHHEEHGHEGHHEHGHHHEHHHEC
```

## Backbone H-bond Network

- total=109 · helix(i→i+4)=20 · sheet=89
  - F2 ↔ S6  (helix)
  - K3 ↔ A7  (helix)
  - G5 ↔ K9  (helix)
  - S6 ↔ G10  (helix)
  - G10 ↔ F14  (helix)
  - T12 ↔ T16  (helix)
  - F14 ↔ C18  (helix)
  - T16 ↔ Q20  (helix)
  - Q20 ↔ V24  (helix)
  - G41 ↔ G45  (helix)
  - G45 ↔ G49  (helix)
  - Y75 ↔ T79  (helix)
  - P77 ↔ M81  (helix)
  - G78 ↔ A82  (helix)
  - M81 ↔ G85  (helix)
  - K87 ↔ D91  (helix)
  - D91 ↔ L95  (helix)
  - N93 ↔ T97  (helix)
  - L95 ↔ L99  (helix)
  - T97 ↔ K101  (helix)
  - … +89 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=53 · exposed=25 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=486 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=238 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.6625 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=25 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
