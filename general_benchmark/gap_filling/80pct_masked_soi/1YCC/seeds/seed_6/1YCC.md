# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1YCC\seeds\seed_6\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 11.582 A
- tm_score_ca_ordered: 0.19994385734891468
- heavy_atom_rmsd: 12.243 A
- sidechain_heavy_atom_rmsd: 12.864 A
- **all-atom quality (honest):** heavy 12.243 A, sidechain 12.864 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 31
- distogram_pairs: 1050
- bin_accuracy: 0.409

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 11.581925827093194
- ga_delta_rmsd: -1.5993616549948815  ga_fitness_mode: energy
- pre_local_rmsd: 11.58186883702992  localized_anchor_rmsd: 11.58186883702992

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E1-K15 → 322 conflicts (59%); K90-L95 → 58 conflicts (11%)
- explained: 380/544 conflicts by 2 root cause(s)
- metrics: hubs=76 (frac 0.738), conflicts/hub=7.2, max_incompat=12.92Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E1-K15 + K90-L95 — explain ~380/544 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P29** — severity 74.02, 21 conflict(s); suspect input ~`N35` (group: pull_in)
  - pull-in (wants closer): Y50@9.9Å(now 13.5,conf 0.55)
  - push-out (wants farther): K3@27.5Å(now 16.8,conf 1.00), K26@9.0Å(now 4.7,conf 0.99), V24@7.4Å(now 4.9,conf 0.79), N67@23.4Å(now 19.5,conf 0.76), E25@8.0Å(now 3.5,conf 0.72)
  - K3↔N35: targets 27.5/5.4Å but partners are 12.0Å apart → too_close_together by 10.1Å
  - G33↔K3: targets 9.0/27.5Å but partners are 10.6Å apart → too_close_together by 7.9Å
  - K3↔L36: targets 27.5/9.0Å but partners are 11.5Å apart → too_close_together by 7.0Å
- **K8** — severity 67.18, 22 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): E65@16.9Å(now 20.4,conf 0.55), I96@11.0Å(now 13.8,conf 0.55), E89@16.2Å(now 19.2,conf 0.55), D91@11.7Å(now 18.7,conf 0.55)
  - push-out (wants farther): K15@9.0Å(now 5.0,conf 1.00), F2@17.0Å(now 7.0,conf 0.99), A4@12.6Å(now 4.3,conf 0.79), E1@20.8Å(now 6.5,conf 0.59), T12@6.7Å(now 4.2,conf 0.55), G5@8.9Å(now 4.4,conf 0.55), L19@14.9Å(now 8.7,conf 0.55), K3@15.1Å(now 5.5,conf 0.55)
  - A11↔E1: targets 3.4/20.8Å but partners are 4.5Å apart → too_close_together by 12.9Å
  - L13↔E1: targets 7.1/20.8Å but partners are 3.8Å apart → too_close_together by 9.9Å
  - F2↔A11: targets 17.0/3.4Å but partners are 6.5Å apart → too_close_together by 7.1Å
- **L13** — severity 58.04, 27 conflict(s); suspect input ~`D91` (group: pull_in)
  - pull-in (wants closer): R92@9.0Å(now 17.5,conf 0.55), E89@12.9Å(now 17.8,conf 0.55), D91@7.7Å(now 17.3,conf 0.55)
  - push-out (wants farther): L19@9.0Å(now 6.5,conf 0.99), Q20@11.1Å(now 5.0,conf 0.91), S44@21.8Å(now 15.2,conf 0.62)
  - K9↔D91: targets 6.9/7.7Å but partners are 21.2Å apart → too_far_apart by 6.6Å
  - T16↔D91: targets 5.4/7.7Å but partners are 19.2Å apart → too_far_apart by 6.1Å
  - D91↔E25: targets 7.7/16.0Å but partners are 29.6Å apart → too_far_apart by 5.9Å
- **K9** — severity 57.32, 23 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): T97@9.0Å(now 17.1,conf 0.55), K88@13.6Å(now 25.0,conf 0.55), K87@15.9Å(now 26.0,conf 0.55)
  - push-out (wants farther): F2@16.9Å(now 10.3,conf 0.91), A4@11.1Å(now 5.3,conf 0.91), K15@9.4Å(now 5.7,conf 0.79), E1@19.6Å(now 7.8,conf 0.57), C18@13.4Å(now 10.3,conf 0.55), K3@14.2Å(now 7.3,conf 0.55)
  - F2↔T12: targets 16.9/5.1Å but partners are 5.9Å apart → too_close_together by 5.8Å
  - L13↔E1: targets 6.9/19.6Å but partners are 3.8Å apart → too_close_together by 8.9Å
  - F2↔G5: targets 16.9/8.6Å but partners are 2.6Å apart → too_close_together by 5.7Å
- **T12** — severity 51.33, 22 conflict(s); suspect input ~`F2` (group: pull_in)
  - pull-in (wants closer): N93@12.9Å(now 16.2,conf 0.55), D91@10.6Å(now 18.1,conf 0.55), G85@15.9Å(now 19.2,conf 0.55)
  - push-out (wants farther): G5@13.0Å(now 4.2,conf 1.00), I57@27.5Å(now 23.6,conf 0.99), S6@10.6Å(now 6.1,conf 0.79), F2@19.3Å(now 5.9,conf 0.56), K8@6.7Å(now 4.2,conf 0.55), A4@15.7Å(now 7.8,conf 0.55)
  - I57↔C18: targets 27.5/9.0Å but partners are 14.1Å apart → too_close_together by 4.4Å
  - K15↔F2: targets 4.4/19.3Å but partners are 8.1Å apart → too_close_together by 6.8Å
  - I57↔R17: targets 27.5/7.1Å but partners are 16.7Å apart → too_close_together by 3.7Å
- **L99** — severity 41.65, 18 conflict(s); suspect input ~`E25` (group: pull_in)
  - pull-in (wants closer): E25@10.3Å(now 19.2,conf 0.55), G27@15.7Å(now 18.8,conf 0.55)
  - push-out (wants farther): M81@17.5Å(now 13.5,conf 0.55), F2@13.3Å(now 9.3,conf 0.55), Q20@15.5Å(now 12.5,conf 0.55), R42@13.8Å(now 11.0,conf 0.55)
  - D94↔E25: targets 9.0/10.3Å but partners are 28.7Å apart → too_far_apart by 9.3Å
  - E25↔K90: targets 10.3/14.2Å but partners are 33.0Å apart → too_far_apart by 8.5Å
  - L95↔E25: targets 6.2/10.3Å but partners are 24.6Å apart → too_far_apart by 8.1Å

## Secondary Structure (DSSP-like)

- helix(H)=59 · strand(E)=29 · 3-10(G)=13 · coil(C)=2

```
EHHGHHHEHHEGEHHHEHEHEGHHEHHGHHHHGHHHGHEGHEHHEHHHHEHEHEHHHHHEHHEGHHGEHHHHGEEEHHGEHEECEEGEHEHHHHEHHGHHHEC
```

## Backbone H-bond Network

- total=90 · helix(i→i+4)=29 · sheet=61
  - F2 ↔ S6  (helix)
  - K3 ↔ A7  (helix)
  - G5 ↔ K9  (helix)
  - S6 ↔ G10  (helix)
  - G10 ↔ F14  (helix)
  - F14 ↔ C18  (helix)
  - T16 ↔ Q20  (helix)
  - Q20 ↔ V24  (helix)
  - T23 ↔ G27  (helix)
  - G27 ↔ K31  (helix)
  - K31 ↔ N35  (helix)
  - V32 ↔ L36  (helix)
  - P34 ↔ G38  (helix)
  - H43 ↔ A47  (helix)
  - S44 ↔ E48  (helix)
  - A47 ↔ S51  (helix)
  - G49 ↔ T53  (helix)
  - S51 ↔ A55  (helix)
  - A55 ↔ K59  (helix)
  - K58 ↔ L62  (helix)
  - … +70 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=42 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=567 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=298 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.7156 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=31 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
