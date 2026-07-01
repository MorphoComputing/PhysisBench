# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1VII\seeds\seed_0\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.013 A
- tm_score_ca_ordered: 0.541695985129746
- heavy_atom_rmsd: 3.955 A
- sidechain_heavy_atom_rmsd: 5.174 A
- **all-atom quality (honest):** heavy 3.955 A, sidechain 5.174 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.381

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.013282856763798
- ga_delta_rmsd: 0.12231600234489326  ga_fitness_mode: energy
- pre_local_rmsd: 2.0133561039820673  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `INPUT_SELF_CONTRADICTORY` (validated) — 9% of input target triples are triangle-impossible — the restraints contradict each other before folding (corrupt/over-noised/incompatibly-fused input)
- **root cause(s):** T13-F17 → 128 conflicts (52%); K7-F10 → 58 conflicts (24%); L20-W23 → 24 conflicts (10%)
- explained: 210/247 conflicts by 3 root cause(s)
- metrics: hubs=34 (frac 1.0), conflicts/hub=7.3, max_incompat=9.62Å, chain_span=0.971
- **fix-first:** [INPUT_SELF_CONTRADICTORY] Root cause(s): T13-F17 + K7-F10 + L20-W23 — explain ~210/247 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L20** — severity 13.76, 19 conflict(s); suspect input ~`K32` (group: push_out)
  - pull-in (wants closer): R14@6.7Å(now 10.7,conf 0.29), T13@9.3Å(now 12.5,conf 0.17), N27@8.3Å(now 10.9,conf 0.21), F10@7.8Å(now 12.8,conf 0.23)
  - push-out (wants farther): K32@19.3Å(now 14.9,conf 0.21), E31@17.1Å(now 14.2,conf 0.16)
  - E4↔R14: targets 22.2/6.7Å but partners are 11.2Å apart → too_close_together by 4.3Å
  - V9↔F10: targets 17.8/7.8Å but partners are 3.8Å apart → too_close_together by 6.2Å
  - L28↔K32: targets 7.8/19.3Å but partners are 6.4Å apart → too_close_together by 5.1Å
- **R14** — severity 13.36, 22 conflict(s); suspect input ~`N27` (group: push_out)
  - pull-in (wants closer): G33@5.6Å(now 9.2,conf 0.38), L22@10.1Å(now 13.2,conf 0.16), K24@10.0Å(now 13.2,conf 0.16), L20@6.7Å(now 10.7,conf 0.29), A8@7.3Å(now 9.9,conf 0.26)
  - push-out (wants farther): F17@9.8Å(now 4.8,conf 0.16), N27@20.5Å(now 13.9,conf 0.24)
  - G33↔N27: targets 5.6/20.5Å but partners are 8.7Å apart → too_close_together by 6.1Å
  - N27↔K29: targets 20.5/10.3Å but partners are 3.4Å apart → too_close_together by 6.8Å
  - L20↔A8: targets 6.7/7.3Å but partners are 17.8Å apart → too_far_apart by 3.8Å
- **E4** — severity 13.34, 17 conflict(s); suspect input ~`T13` (group: pull_in)
  - pull-in (wants closer): W23@20.9Å(now 23.5,conf 0.26), F10@7.9Å(now 11.9,conf 0.23), T13@6.4Å(now 10.7,conf 0.32)
  - push-out (wants farther): Q26@24.0Å(now 20.4,conf 0.43), K30@21.0Å(now 18.3,conf 0.26), S15@17.4Å(now 14.0,conf 0.17)
  - N19↔T13: targets 21.1/6.4Å but partners are 10.3Å apart → too_close_together by 4.5Å
  - Q26↔F10: targets 24.0/7.9Å but partners are 11.1Å apart → too_close_together by 5.0Å
  - S15↔T13: targets 17.4/6.4Å but partners are 4.2Å apart → too_close_together by 6.8Å
- **T13** — severity 11.30, 19 conflict(s); suspect input ~`L20` (group: push_out)
  - pull-in (wants closer): K29@8.0Å(now 12.8,conf 0.22), L20@9.3Å(now 12.5,conf 0.17), K30@9.7Å(now 15.3,conf 0.17), E4@6.4Å(now 10.7,conf 0.32), N19@7.7Å(now 10.3,conf 0.23)
  - push-out (wants farther): A16@9.2Å(now 6.5,conf 0.18), F17@8.7Å(now 6.0,conf 0.19), K24@17.8Å(now 13.8,conf 0.17), L22@18.5Å(now 14.6,conf 0.19), S2@16.4Å(now 10.2,conf 0.15)
  - E4↔N19: targets 6.4/7.7Å but partners are 19.8Å apart → too_far_apart by 5.8Å
  - L22↔L20: targets 18.5/9.3Å but partners are 3.4Å apart → too_close_together by 5.8Å
  - N27↔K29: targets 17.2/8.0Å but partners are 3.4Å apart → too_close_together by 5.9Å
- **L28** — severity 10.43, 11 conflict(s); suspect input ~`K7` (group: push_out)
  - pull-in (wants closer): V9@6.7Å(now 9.9,conf 0.29), G11@8.9Å(now 12.1,conf 0.19)
  - push-out (wants farther): Q25@10.3Å(now 4.9,conf 0.15), K7@20.6Å(now 13.4,conf 0.25)
  - V9↔K7: targets 6.7/20.6Å but partners are 4.3Å apart → too_close_together by 9.6Å
  - F10↔K7: targets 6.5/20.6Å but partners are 6.7Å apart → too_close_together by 7.4Å
  - K32↔K7: targets 6.9/20.6Å but partners are 9.5Å apart → too_close_together by 4.3Å
- **V9** — severity 8.79, 13 conflict(s); suspect input ~`A16` (group: push_out)
  - pull-in (wants closer): F17@7.5Å(now 11.5,conf 0.24), K29@8.2Å(now 11.1,conf 0.21), L28@6.7Å(now 9.9,conf 0.29), S2@8.3Å(now 11.5,conf 0.21)
  - push-out (wants farther): P21@18.7Å(now 15.9,conf 0.19), Q25@16.3Å(now 13.5,conf 0.15), A16@19.4Å(now 13.6,conf 0.21), N19@18.6Å(now 16.0,conf 0.19)
  - F17↔A16: targets 7.5/19.4Å but partners are 4.7Å apart → too_close_together by 7.2Å
  - F17↔N19: targets 7.5/18.6Å but partners are 4.7Å apart → too_close_together by 6.4Å
  - A16↔R14: targets 19.4/10.1Å but partners are 3.7Å apart → too_close_together by 5.6Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=11 · 3-10(G)=1 · coil(C)=2

```
CEHEEHEHHHHEEHHHHHEHHEHHHEHHHEGEHC
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=12 · sheet=14
  - F6 ↔ F10  (helix)
  - F10 ↔ R14  (helix)
  - G11 ↔ S15  (helix)
  - R14 ↔ A18  (helix)
  - A16 ↔ L20  (helix)
  - F17 ↔ P21  (helix)
  - L20 ↔ K24  (helix)
  - P21 ↔ Q25  (helix)
  - W23 ↔ N27  (helix)
  - K24 ↔ L28  (helix)
  - Q25 ↔ K29  (helix)
  - K29 ↔ G33  (helix)
  - S2 ↔ K7  (sheet)
  - S2 ↔ T13  (sheet)
  - E4 ↔ T13  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ T13  (sheet)
  - K7 ↔ M12  (sheet)
  - K7 ↔ T13  (sheet)
  - M12 ↔ N19  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=106 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1VII.ensemble.pdb`)
- RMSF mean=1.349Å max=2.552Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 32, 15, 11, 31

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1VII.pae.csv`
- mean=0.466Å · max=3.182Å · AlphaFold-PAE analog (low block = rigid unit/domain)
