# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1YCC/sequence/1YCC.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1YCC/seeds/seed_0/1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 5.385 A
- tm_score_ca_ordered: 0.49052860009119403
- heavy_atom_rmsd: 6.282 A
- sidechain_heavy_atom_rmsd: 7.219 A
- **all-atom quality (honest):** heavy 6.282 A, sidechain 7.219 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 41
- distogram_pairs: 656
- bin_accuracy: 0.386

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.385017353028155
- ga_delta_rmsd: 0.9102245471422394  ga_fitness_mode: energy
- pre_local_rmsd: 5.392860865630352  localized_anchor_rmsd: 5.385045582944072

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E1-K3 → 48 conflicts (32%); T79 → 11 conflicts (7%); G45 → 10 conflicts (7%)
- explained: 69/150 conflicts by 3 root cause(s)
- metrics: hubs=62 (frac 0.602), conflicts/hub=2.4, max_incompat=8.16Å, chain_span=0.981
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E1-K3 + T79 + G45 — explain ~69/150 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F2** — severity 23.73, 13 conflict(s); suspect input ~`S69` (group: pull_in)
  - pull-in (wants closer): V61@17.2Å(now 21.2,conf 0.55), S69@7.6Å(now 10.9,conf 0.55), K100@12.1Å(now 15.4,conf 0.55)
  - push-out (wants farther): S51@27.5Å(now 21.6,conf 1.00), H30@27.4Å(now 18.8,conf 0.96), T12@19.3Å(now 6.2,conf 0.56), Y75@17.1Å(now 13.9,conf 0.55), L86@14.1Å(now 10.9,conf 0.55), G10@14.1Å(now 4.3,conf 0.55), A7@14.0Å(now 6.3,conf 0.55)
  - S51↔S69: targets 27.5/7.6Å but partners are 12.7Å apart → too_close_together by 7.2Å
  - H30↔S69: targets 27.4/7.6Å but partners are 13.4Å apart → too_close_together by 6.5Å
  - S51↔K100: targets 27.5/12.1Å but partners are 9.8Å apart → too_close_together by 5.7Å
- **P29** — severity 20.91, 8 conflict(s); suspect input ~`H37` (group: push_out)
  - push-out (wants farther): K3@27.5Å(now 17.7,conf 1.00), N67@23.4Å(now 14.9,conf 0.76)
  - K3↔H22: targets 27.5/8.2Å but partners are 11.3Å apart → too_close_together by 8.0Å
  - K3↔H37: targets 27.5/9.9Å but partners are 11.8Å apart → too_close_together by 5.8Å
  - N67↔H37: targets 23.4/9.9Å but partners are 7.6Å apart → too_close_together by 5.8Å
- **K8** — severity 17.17, 7 conflict(s); suspect input ~`G5` (group: push_out)
  - push-out (wants farther): D54@27.5Å(now 23.8,conf 1.00), E1@20.8Å(now 6.7,conf 0.59), G5@8.9Å(now 5.6,conf 0.55), L19@14.9Å(now 7.7,conf 0.55), K3@15.1Å(now 6.4,conf 0.55), F14@9.9Å(now 4.4,conf 0.55)
  - E1↔G5: targets 20.8/8.9Å but partners are 4.8Å apart → too_close_together by 7.2Å
  - E1↔T12: targets 20.8/6.7Å but partners are 7.6Å apart → too_close_together by 6.5Å
  - E1↔F14: targets 20.8/9.9Å but partners are 5.0Å apart → too_close_together by 6.0Å
- **T79** — severity 16.27, 10 conflict(s); suspect input ~`E48` (group: pull_in)
  - pull-in (wants closer): A55@5.8Å(now 11.6,conf 0.55), N56@6.0Å(now 10.2,conf 0.55), T53@6.2Å(now 11.4,conf 0.55)
  - push-out (wants farther): K90@23.7Å(now 21.2,conf 0.75), D91@21.7Å(now 18.9,conf 0.62), N74@10.9Å(now 8.0,conf 0.55)
  - T53↔E48: targets 6.2/17.5Å but partners are 5.4Å apart → too_close_together by 6.0Å
  - T53↔Q46: targets 6.2/14.6Å but partners are 3.2Å apart → too_close_together by 5.2Å
  - N56↔E48: targets 6.0/17.5Å but partners are 8.1Å apart → too_close_together by 3.4Å
- **N60** — severity 13.02, 7 conflict(s); suspect input ~`G49` (group: pull_in)
  - pull-in (wants closer): S44@5.3Å(now 8.2,conf 0.56)
  - push-out (wants farther): G49@17.5Å(now 10.8,conf 0.55), E48@15.2Å(now 11.3,conf 0.55)
  - S44↔G49: targets 5.3/17.5Å but partners are 5.4Å apart → too_close_together by 6.8Å
  - G49↔N56: targets 17.5/6.9Å but partners are 6.2Å apart → too_close_together by 4.4Å
  - S44↔E48: targets 5.3/15.2Å but partners are 6.6Å apart → too_close_together by 3.4Å
- **H30** — severity 12.36, 5 conflict(s); suspect input ~`L36` (group: push_out)
  - push-out (wants farther): F2@27.4Å(now 18.8,conf 0.96), N66@23.3Å(now 11.1,conf 0.76), G45@12.9Å(now 7.1,conf 0.55), L99@16.4Å(now 12.3,conf 0.55)
  - N66↔L36: targets 23.3/8.5Å but partners are 6.7Å apart → too_close_together by 8.2Å
  - F2↔L19: targets 27.4/11.2Å but partners are 9.9Å apart → too_close_together by 6.3Å
  - N66↔G45: targets 23.3/12.9Å but partners are 6.9Å apart → too_close_together by 3.5Å

## Secondary Structure (DSSP-like)

- helix(H)=67 · strand(E)=21 · 3-10(G)=12 · coil(C)=3

```
EHHHHHHEHHEHEGHEGHHHHEHHEEHHHHHHHHGGHHHHHEEHHHHHHEHHEEHHHHGHHHGGHHEHHHHHEGHHHHHGHHECCGHGEHEHEGEHHHEHHHC
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=33 · sheet=28
  - F2 ↔ S6  (helix)
  - K3 ↔ A7  (helix)
  - G5 ↔ K9  (helix)
  - S6 ↔ G10  (helix)
  - K15 ↔ L19  (helix)
  - L19 ↔ T23  (helix)
  - T23 ↔ G27  (helix)
  - V24 ↔ G28  (helix)
  - G27 ↔ K31  (helix)
  - P29 ↔ G33  (helix)
  - G33 ↔ H37  (helix)
  - H37 ↔ G41  (helix)
  - F40 ↔ S44  (helix)
  - G41 ↔ G45  (helix)
  - S44 ↔ E48  (helix)
  - G45 ↔ G49  (helix)
  - A47 ↔ S51  (helix)
  - E48 ↔ Y52  (helix)
  - S51 ↔ A55  (helix)
  - Y52 ↔ N56  (helix)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=31 · exposed=44 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=695 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=411 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.7724 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=41 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
