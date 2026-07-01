# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HRC\seeds\seed_5\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 10.592 A
- tm_score_ca_ordered: 0.2526481162044974
- heavy_atom_rmsd: 11.597 A
- sidechain_heavy_atom_rmsd: 12.495 A
- **all-atom quality (honest):** heavy 11.597 A, sidechain 12.495 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 1043
- bin_accuracy: 0.500

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=57
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.592372128527819
- ga_delta_rmsd: 0.21481499850046504  ga_fitness_mode: energy
- pre_local_rmsd: 10.592353128670029  localized_anchor_rmsd: 10.592353128670029

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P70-K78 → 193 conflicts (51%); T88-K99 → 114 conflicts (30%); M64-L67 → 21 conflicts (6%)
- explained: 328/377 conflicts by 3 root cause(s)
- metrics: hubs=66 (frac 0.647), conflicts/hub=5.7, max_incompat=7.15Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P70-K78 + T88-K99 + M64-L67 — explain ~328/377 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T88** — severity 48.49, 23 conflict(s); suspect input ~`E91` (group: pull_in)
  - pull-in (wants closer): E91@4.9Å(now 7.7,conf 0.58)
  - push-out (wants farther): A82@16.9Å(now 13.4,conf 0.91), A95@10.9Å(now 7.0,conf 0.91), G76@27.1Å(now 23.9,conf 0.88), K78@25.3Å(now 21.6,conf 0.69), F81@18.1Å(now 14.7,conf 0.55), L97@14.1Å(now 10.5,conf 0.55)
  - A82↔D92: targets 16.9/5.1Å but partners are 7.9Å apart → too_close_together by 3.9Å
  - K78↔E91: targets 25.3/4.9Å but partners are 14.5Å apart → too_close_together by 6.0Å
  - G76↔E91: targets 27.1/4.9Å but partners are 16.3Å apart → too_close_together by 5.9Å
- **K72** — severity 31.23, 13 conflict(s); suspect input ~`K99` (group: push_out)
  - push-out (wants farther): P75@6.9Å(now 4.3,conf 0.91), K99@26.6Å(now 20.3,conf 0.78), K59@17.6Å(now 14.5,conf 0.55), E61@15.2Å(now 12.6,conf 0.55), M64@12.6Å(now 8.6,conf 0.55)
  - Y66↔K99: targets 7.0/26.6Å but partners are 12.9Å apart → too_close_together by 6.7Å
  - L67↔K99: targets 9.1/26.6Å but partners are 12.0Å apart → too_close_together by 5.5Å
  - K99↔N69: targets 26.6/5.4Å but partners are 14.0Å apart → too_close_together by 7.2Å
- **G28** — severity 29.77, 19 conflict(s); suspect input ~`T77` (group: pull_in)
  - pull-in (wants closer): P70@13.1Å(now 16.7,conf 0.55), T77@10.8Å(now 15.9,conf 0.55), K78@8.7Å(now 12.6,conf 0.55), G76@14.4Å(now 19.5,conf 0.55), I74@14.3Å(now 18.7,conf 0.55)
  - K24↔T77: targets 9.1/10.8Å but partners are 24.4Å apart → too_far_apart by 4.5Å
  - K24↔G76: targets 9.1/14.4Å but partners are 27.7Å apart → too_far_apart by 4.2Å
  - H25↔T77: targets 7.0/10.8Å but partners are 21.8Å apart → too_far_apart by 4.0Å
- **K78** — severity 29.11, 17 conflict(s); suspect input ~`K26` (group: pull_in)
  - pull-in (wants closer): K26@12.9Å(now 18.2,conf 0.55), G28@8.7Å(now 12.6,conf 0.55), Q15@14.5Å(now 20.3,conf 0.55), A14@16.2Å(now 19.9,conf 0.55)
  - push-out (wants farther): G5@23.2Å(now 19.4,conf 0.75), A100@23.1Å(now 20.0,conf 0.74), T88@25.3Å(now 21.6,conf 0.69), E61@21.3Å(now 11.1,conf 0.60), W58@17.9Å(now 11.1,conf 0.55), Y66@13.7Å(now 9.8,conf 0.55)
  - P75↔K26: targets 8.0/12.9Å but partners are 26.6Å apart → too_far_apart by 5.7Å
  - K71↔K26: targets 9.0/12.9Å but partners are 27.4Å apart → too_far_apart by 5.6Å
  - P75↔Q15: targets 8.0/14.5Å but partners are 27.4Å apart → too_far_apart by 4.9Å
- **I74** — severity 29.02, 18 conflict(s); suspect input ~`A95` (group: pull_in)
  - pull-in (wants closer): T27@16.8Å(now 22.7,conf 0.55), F45@16.7Å(now 19.8,conf 0.55), P29@15.3Å(now 19.5,conf 0.55), T48@9.6Å(now 14.1,conf 0.55), G28@14.3Å(now 18.7,conf 0.55)
  - push-out (wants farther): K99@23.7Å(now 19.9,conf 0.75), A95@21.8Å(now 15.6,conf 0.62), K98@20.8Å(now 16.4,conf 0.59), I56@10.9Å(now 8.0,conf 0.55), T57@13.3Å(now 10.0,conf 0.55)
  - P70↔A95: targets 6.0/21.8Å but partners are 11.1Å apart → too_close_together by 4.7Å
  - K71↔T27: targets 5.1/16.8Å but partners are 26.1Å apart → too_far_apart by 4.2Å
  - K71↔T48: targets 5.1/9.6Å but partners are 18.8Å apart → too_far_apart by 4.0Å
- **K99** — severity 27.72, 14 conflict(s); suspect input ~`K72` (group: pull_in)
  - pull-in (wants closer): G23@15.6Å(now 19.8,conf 0.55), K21@12.4Å(now 15.9,conf 0.55)
  - push-out (wants farther): K72@26.6Å(now 20.3,conf 0.78), I74@23.7Å(now 19.9,conf 0.75), R90@14.4Å(now 11.0,conf 0.55), E89@15.7Å(now 11.4,conf 0.55), E61@15.9Å(now 9.7,conf 0.55)
  - A95↔K72: targets 7.0/26.6Å but partners are 14.6Å apart → too_close_together by 5.0Å
  - I94↔K72: targets 9.0/26.6Å but partners are 12.6Å apart → too_close_together by 5.0Å
  - N102↔E61: targets 6.9/15.9Å but partners are 3.7Å apart → too_close_together by 5.3Å

## Secondary Structure (DSSP-like)

- helix(H)=55 · strand(E)=31 · 3-10(G)=11 · coil(C)=5

```
EHHHHHHGGHHHHGHHHHHEHGGEEEGHEHEHEHGCGECECHHHEGEEEHHEHHEECEEHEHHEHEHHGHHHEHHHEHHHHHHHEEHHGEHHEHEHHHEHCE
```

## Backbone H-bond Network

- total=94 · helix(i→i+4)=26 · sheet=68
  - E3 ↔ K7  (helix)
  - K7 ↔ Q11  (helix)
  - Q11 ↔ Q15  (helix)
  - K12 ↔ C16  (helix)
  - C13 ↔ H17  (helix)
  - Q15 ↔ V19  (helix)
  - H17 ↔ K21  (helix)
  - G28 ↔ H32  (helix)
  - A50 ↔ K54  (helix)
  - L63 ↔ L67  (helix)
  - L67 ↔ K71  (helix)
  - E68 ↔ K72  (helix)
  - P70 ↔ I74  (helix)
  - K71 ↔ P75  (helix)
  - K72 ↔ G76  (helix)
  - I74 ↔ K78  (helix)
  - G76 ↔ I80  (helix)
  - K78 ↔ A82  (helix)
  - I80 ↔ I84  (helix)
  - G83 ↔ K87  (helix)
  - … +74 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=33 · exposed=44 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=508 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=261 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.1685 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
