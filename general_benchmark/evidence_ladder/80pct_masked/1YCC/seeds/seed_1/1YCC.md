# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1YCC/sequence/1YCC.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1YCC/seeds/seed_1/1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 5.512 A
- tm_score_ca_ordered: 0.512716411775414
- heavy_atom_rmsd: 6.353 A
- sidechain_heavy_atom_rmsd: 7.103 A
- **all-atom quality (honest):** heavy 6.353 A, sidechain 7.103 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 27
- distogram_pairs: 656
- bin_accuracy: 0.460

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=57
- rigid_domain_reconvergence: applied=True accepted=18 rmsd=7.8547883466343205 -> 6.612442237794544 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.512267005102912
- ga_delta_rmsd: 1.042298042305985  ga_fitness_mode: energy
- pre_local_rmsd: 5.521849728093388  localized_anchor_rmsd: 5.512280583973476

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E1-F2 → 54 conflicts (41%); T79 → 22 conflicts (16%); N93 → 14 conflicts (10%)
- explained: 90/133 conflicts by 3 root cause(s)
- metrics: hubs=44 (frac 0.427), conflicts/hub=3.0, max_incompat=11.91Å, chain_span=0.981
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E1-F2 + T79 + N93 — explain ~90/133 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T79** — severity 26.85, 16 conflict(s); suspect input ~`R42` (group: push_out)
  - pull-in (wants closer): A55@5.8Å(now 14.0,conf 0.55), N56@6.0Å(now 12.6,conf 0.55), T53@6.2Å(now 12.3,conf 0.55), M68@14.4Å(now 17.6,conf 0.55), D54@8.1Å(now 13.4,conf 0.55)
  - push-out (wants farther): K90@23.7Å(now 20.5,conf 0.75), E48@17.5Å(now 13.3,conf 0.55)
  - N56↔R42: targets 6.0/17.5Å but partners are 5.1Å apart → too_close_together by 6.4Å
  - A55↔R42: targets 5.8/17.5Å but partners are 6.4Å apart → too_close_together by 5.4Å
  - A55↔G84: targets 5.8/11.7Å but partners are 21.7Å apart → too_far_apart by 4.2Å
- **E89** — severity 22.59, 9 conflict(s); suspect input ~`F2` (group: pull_in)
  - pull-in (wants closer): N93@6.1Å(now 9.7,conf 0.55), F2@8.4Å(now 15.7,conf 0.55), D64@15.6Å(now 18.4,conf 0.55), A7@14.3Å(now 17.0,conf 0.55), G5@10.1Å(now 15.8,conf 0.55)
  - push-out (wants farther): G28@27.4Å(now 22.5,conf 0.97), Q46@27.2Å(now 24.5,conf 0.91), L13@12.9Å(now 10.0,conf 0.55), G85@10.9Å(now 6.6,conf 0.55)
  - G28↔F2: targets 27.4/8.4Å but partners are 8.9Å apart → too_close_together by 10.1Å
  - K101↔F2: targets 18.2/8.4Å but partners are 3.8Å apart → too_close_together by 6.0Å
  - G27↔F2: targets 27.5/8.4Å but partners are 13.1Å apart → too_close_together by 6.0Å
- **H30** — severity 18.55, 4 conflict(s); suspect input ~`L36` (group: push_out)
  - push-out (wants farther): F2@27.4Å(now 11.4,conf 0.96), Q20@11.3Å(now 8.0,conf 0.55), L99@16.4Å(now 13.2,conf 0.55), M81@13.5Å(now 10.6,conf 0.55)
  - F2↔L36: targets 27.4/8.5Å but partners are 7.0Å apart → too_close_together by 11.9Å
  - F2↔L19: targets 27.4/11.2Å but partners are 7.0Å apart → too_close_together by 9.2Å
  - F2↔L99: targets 27.4/16.4Å but partners are 3.7Å apart → too_close_together by 7.3Å
- **N93** — severity 18.53, 8 conflict(s); suspect input ~`K3` (group: pull_in)
  - pull-in (wants closer): K90@5.1Å(now 7.9,conf 0.57), E89@6.1Å(now 9.7,conf 0.55), K3@6.3Å(now 9.4,conf 0.55)
  - push-out (wants farther): K80@23.1Å(now 19.4,conf 0.75), N56@22.6Å(now 18.8,conf 0.68), L19@17.5Å(now 10.8,conf 0.55), V24@17.1Å(now 12.5,conf 0.55), T12@12.9Å(now 8.9,conf 0.55), Y98@8.7Å(now 4.8,conf 0.55)
  - E89↔K3: targets 6.1/6.3Å but partners are 18.7Å apart → too_far_apart by 6.4Å
  - K90↔K3: targets 5.1/6.3Å but partners are 17.3Å apart → too_far_apart by 5.9Å
  - F2↔V24: targets 6.6/17.1Å but partners are 5.2Å apart → too_close_together by 5.3Å
- **E48** — severity 16.45, 8 conflict(s); suspect input ~`G38` (group: push_out)
  - push-out (wants farther): E1@27.5Å(now 17.4,conf 1.00), S6@27.5Å(now 23.4,conf 1.00), T79@17.5Å(now 13.3,conf 0.55), S51@8.5Å(now 5.8,conf 0.55), I57@12.3Å(now 9.6,conf 0.55)
  - E1↔G38: targets 27.5/12.2Å but partners are 6.8Å apart → too_close_together by 8.4Å
  - E1↔K26: targets 27.5/13.2Å but partners are 7.3Å apart → too_close_together by 7.0Å
  - E1↔I39: targets 27.5/12.3Å but partners are 9.8Å apart → too_close_together by 5.4Å
- **F2** — severity 16.03, 9 conflict(s); suspect input ~`N93` (group: pull_in)
  - pull-in (wants closer): S69@7.6Å(now 13.2,conf 0.55), K90@9.5Å(now 15.1,conf 0.55), E89@8.4Å(now 15.7,conf 0.55)
  - push-out (wants farther): S51@27.5Å(now 16.7,conf 1.00), H30@27.4Å(now 11.4,conf 0.96), T12@19.3Å(now 10.4,conf 0.56), A102@17.6Å(now 5.0,conf 0.55), V61@17.2Å(now 14.4,conf 0.55), L99@13.3Å(now 3.7,conf 0.55), L95@11.4Å(now 7.4,conf 0.55), G10@14.1Å(now 7.8,conf 0.55), K100@12.1Å(now 6.7,conf 0.55), A7@14.0Å(now 6.2,conf 0.55)
  - H30↔N93: targets 27.4/6.6Å but partners are 16.2Å apart → too_close_together by 4.6Å
  - H30↔K100: targets 27.4/12.1Å but partners are 11.4Å apart → too_close_together by 4.0Å
  - S51↔K100: targets 27.5/12.1Å but partners are 11.6Å apart → too_close_together by 3.8Å

## Secondary Structure (DSSP-like)

- helix(H)=59 · strand(E)=30 · 3-10(G)=12 · coil(C)=2

```
EHGHHHGEHHHHGHHEHEHEHECHEHHHEHHHEEGHHHEHHEGGHHHHHEHHEHHHHHEEHHEEHEHEHHEGEHHEGHHHEHEGHEHHEEGHEHEHHGGHHHC
```

## Backbone H-bond Network

- total=91 · helix(i→i+4)=28 · sheet=63
  - F2 ↔ S6  (helix)
  - G5 ↔ K9  (helix)
  - S6 ↔ G10  (helix)
  - G10 ↔ F14  (helix)
  - A11 ↔ K15  (helix)
  - K15 ↔ L19  (helix)
  - R17 ↔ C21  (helix)
  - V24 ↔ G28  (helix)
  - G27 ↔ K31  (helix)
  - G28 ↔ V32  (helix)
  - V32 ↔ L36  (helix)
  - L36 ↔ F40  (helix)
  - H37 ↔ G41  (helix)
  - G41 ↔ G45  (helix)
  - G45 ↔ G49  (helix)
  - A47 ↔ S51  (helix)
  - E48 ↔ Y52  (helix)
  - Y52 ↔ N56  (helix)
  - D54 ↔ K58  (helix)
  - I57 ↔ V61  (helix)
  - … +71 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=68 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=609 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=342 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.567 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=27 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
