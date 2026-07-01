# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 3.205 A
- tm_score_ca_ordered: 0.3088835797119707
- heavy_atom_rmsd: 4.784 A
- sidechain_heavy_atom_rmsd: 5.791 A
- **all-atom quality (honest):** heavy 4.784 A, sidechain 5.791 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.357

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.204911073619329
- ga_delta_rmsd: -0.19636380409149634  ga_fitness_mode: energy
- pre_local_rmsd: 3.2048580554807695  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 9% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T13-A16 → 109 conflicts (45%); V9-F10 → 48 conflicts (20%); N27-L28 → 29 conflicts (12%)
- explained: 186/243 conflicts by 3 root cause(s)
- metrics: hubs=33 (frac 0.971), conflicts/hub=7.4, max_incompat=9.4Å, chain_span=0.941
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T13-A16 + V9-F10 + N27-L28 — explain ~186/243 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L20** — severity 17.31, 26 conflict(s); suspect input ~`F10` (group: push_out)
  - pull-in (wants closer): R14@6.7Å(now 11.8,conf 0.29), T13@9.3Å(now 12.2,conf 0.17), N27@8.3Å(now 10.8,conf 0.21), F10@7.8Å(now 12.4,conf 0.23)
  - push-out (wants farther): K24@8.0Å(now 4.8,conf 0.22), K32@19.3Å(now 14.6,conf 0.21), E31@17.1Å(now 14.5,conf 0.16)
  - D5↔F10: targets 20.9/7.8Å but partners are 7.2Å apart → too_close_together by 5.9Å
  - E4↔F10: targets 22.2/7.8Å but partners are 9.5Å apart → too_close_together by 5.0Å
  - V9↔F10: targets 17.8/7.8Å but partners are 3.6Å apart → too_close_together by 6.4Å
- **R14** — severity 15.04, 24 conflict(s); suspect input ~`L22` (group: push_out)
  - pull-in (wants closer): F6@7.0Å(now 11.0,conf 0.28), G33@5.6Å(now 9.4,conf 0.38), L22@10.1Å(now 14.2,conf 0.16), K24@10.0Å(now 13.6,conf 0.16), L20@6.7Å(now 11.8,conf 0.29)
  - push-out (wants farther): F17@9.8Å(now 6.3,conf 0.16), N27@20.5Å(now 13.5,conf 0.24), E31@16.4Å(now 13.5,conf 0.15)
  - G33↔N27: targets 5.6/20.5Å but partners are 9.8Å apart → too_close_together by 5.0Å
  - S2↔L20: targets 8.3/6.7Å but partners are 20.0Å apart → too_far_apart by 5.1Å
  - L20↔D3: targets 6.7/8.2Å but partners are 19.5Å apart → too_far_apart by 4.6Å
- **L28** — severity 11.80, 13 conflict(s); suspect input ~`K7` (group: pull_in)
  - pull-in (wants closer): V9@6.7Å(now 10.7,conf 0.29), G11@8.9Å(now 14.3,conf 0.19)
  - push-out (wants farther): Q25@10.3Å(now 4.7,conf 0.15), D3@18.9Å(now 16.1,conf 0.20), K7@20.6Å(now 14.6,conf 0.25)
  - V9↔K7: targets 6.7/20.6Å but partners are 4.5Å apart → too_close_together by 9.4Å
  - F10↔K7: targets 6.5/20.6Å but partners are 6.4Å apart → too_close_together by 7.6Å
  - K7↔G11: targets 20.6/8.9Å but partners are 4.3Å apart → too_close_together by 7.4Å
- **T13** — severity 10.93, 16 conflict(s); suspect input ~`L20` (group: push_out)
  - pull-in (wants closer): K7@6.2Å(now 9.7,conf 0.33), K29@8.0Å(now 12.1,conf 0.22), L20@9.3Å(now 12.2,conf 0.17), K30@9.7Å(now 15.0,conf 0.17), E4@6.4Å(now 11.3,conf 0.32)
  - push-out (wants farther): A16@9.2Å(now 6.2,conf 0.18), F10@8.8Å(now 6.1,conf 0.19), K24@17.8Å(now 14.5,conf 0.17), L22@18.5Å(now 14.6,conf 0.19), S2@16.4Å(now 9.5,conf 0.15)
  - E4↔N19: targets 6.4/7.7Å but partners are 20.6Å apart → too_far_apart by 6.6Å
  - L20↔E4: targets 9.3/6.4Å but partners are 21.6Å apart → too_far_apart by 5.9Å
  - L22↔L20: targets 18.5/9.3Å but partners are 3.3Å apart → too_close_together by 5.9Å
- **E4** — severity 9.32, 11 conflict(s); suspect input ~`T13` (group: pull_in)
  - pull-in (wants closer): T13@6.4Å(now 11.3,conf 0.32)
  - push-out (wants farther): Q26@24.0Å(now 20.1,conf 0.43), K30@21.0Å(now 17.9,conf 0.26), A8@7.9Å(now 5.3,conf 0.23), L1@9.6Å(now 4.3,conf 0.17)
  - N19↔T13: targets 21.1/6.4Å but partners are 10.0Å apart → too_close_together by 4.7Å
  - L20↔T13: targets 22.2/6.4Å but partners are 12.2Å apart → too_close_together by 3.6Å
  - Q26↔F10: targets 24.0/7.9Å but partners are 11.6Å apart → too_close_together by 4.5Å
- **V9** — severity 8.85, 13 conflict(s); suspect input ~`A16` (group: pull_in)
  - pull-in (wants closer): F17@7.5Å(now 11.4,conf 0.24), K29@8.2Å(now 11.1,conf 0.21), L28@6.7Å(now 10.7,conf 0.29)
  - push-out (wants farther): F6@6.9Å(now 1.8,conf 0.28), P21@18.7Å(now 15.4,conf 0.19), D5@9.4Å(now 4.3,conf 0.17), Q25@16.3Å(now 12.4,conf 0.15), A16@19.4Å(now 13.2,conf 0.21), L1@10.4Å(now 5.5,conf 0.15), N19@18.6Å(now 15.6,conf 0.19)
  - F17↔A16: targets 7.5/19.4Å but partners are 5.1Å apart → too_close_together by 6.7Å
  - F17↔N19: targets 7.5/18.6Å but partners are 4.3Å apart → too_close_together by 6.7Å
  - A16↔R14: targets 19.4/10.1Å but partners are 4.0Å apart → too_close_together by 5.3Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=7 · 3-10(G)=3 · coil(C)=1

```
EEHHEHHHHHHEEHHHHHEHHGHHGEHHHHGHHC
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=11 · sheet=9
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - F6 ↔ F10  (helix)
  - K7 ↔ G11  (helix)
  - F10 ↔ R14  (helix)
  - G11 ↔ S15  (helix)
  - R14 ↔ A18  (helix)
  - F17 ↔ P21  (helix)
  - W23 ↔ N27  (helix)
  - K24 ↔ L28  (helix)
  - K29 ↔ G33  (helix)
  - L1 ↔ M12  (sheet)
  - L1 ↔ T13  (sheet)
  - S2 ↔ M12  (sheet)
  - S2 ↔ T13  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ T13  (sheet)
  - M12 ↔ N19  (sheet)
  - T13 ↔ N19  (sheet)
  - N19 ↔ Q26  (sheet)

## Solvent Accessibility (burial)

- buried=7 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=111 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=19 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.813 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
