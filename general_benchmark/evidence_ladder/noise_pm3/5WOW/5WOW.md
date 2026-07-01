# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\5WOW\seeds\seed_0\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 5.396 A
- tm_score_ca_ordered: 0.24312581966545388
- heavy_atom_rmsd: 7.065 A
- sidechain_heavy_atom_rmsd: 8.269 A
- **all-atom quality (honest):** heavy 7.065 A, sidechain 8.269 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 595
- bin_accuracy: 0.240

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.3956147383162065
- ga_delta_rmsd: -0.010830028566594763  ga_fitness_mode: energy
- pre_local_rmsd: 5.395600462201582  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G1-N25 → 315 conflicts (92%); C28-D36 → 27 conflicts (8%)
- explained: 342/342 conflicts by 2 root cause(s)
- metrics: hubs=36 (frac 0.973), conflicts/hub=9.5, max_incompat=9.3Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G1-N25 + C28-D36 — explain ~342/342 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D33** — severity 15.47, 23 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): L7@5.8Å(now 8.6,conf 0.36)
  - push-out (wants farther): D13@20.5Å(now 17.6,conf 0.24), G24@21.1Å(now 17.8,conf 0.27), C28@19.0Å(now 13.3,conf 0.20), G18@19.5Å(now 14.3,conf 0.22), R9@18.9Å(now 15.8,conf 0.20), A19@18.6Å(now 13.6,conf 0.19)
  - R12↔L7: targets 21.9/5.8Å but partners are 11.2Å apart → too_close_together by 4.8Å
  - D13↔L7: targets 20.5/5.8Å but partners are 9.7Å apart → too_close_together by 5.0Å
  - L7↔G18: targets 5.8/19.5Å but partners are 8.6Å apart → too_close_together by 5.1Å
- **P35** — severity 14.36, 25 conflict(s); suspect input ~`N25` (group: push_out)
  - pull-in (wants closer): D15@18.6Å(now 22.8,conf 0.19), D13@18.1Å(now 22.1,conf 0.18), P17@18.0Å(now 21.9,conf 0.18), N25@10.2Å(now 16.3,conf 0.15), I6@9.8Å(now 12.9,conf 0.16), G1@10.0Å(now 13.1,conf 0.16)
  - push-out (wants farther): R23@21.5Å(now 17.6,conf 0.28), L7@17.4Å(now 14.0,conf 0.17), G29@18.1Å(now 13.1,conf 0.18), P4@16.8Å(now 12.4,conf 0.16)
  - R23↔Y30: targets 21.5/8.2Å but partners are 7.9Å apart → too_close_together by 5.4Å
  - Y30↔G29: targets 8.2/18.1Å but partners are 3.9Å apart → too_close_together by 5.9Å
  - I6↔P4: targets 9.8/16.8Å but partners are 0.6Å apart → too_close_together by 6.4Å
- **Y30** — severity 13.69, 21 conflict(s); suspect input ~`C10` (group: push_out)
  - pull-in (wants closer): K5@7.7Å(now 10.7,conf 0.24), C16@8.6Å(now 11.6,conf 0.20), P17@7.7Å(now 12.6,conf 0.23), G26@6.6Å(now 10.5,conf 0.30), C22@5.6Å(now 9.0,conf 0.38)
  - push-out (wants farther): V2@9.0Å(now 5.5,conf 0.18), C10@17.1Å(now 12.4,conf 0.16)
  - P35↔P17: targets 8.2/7.7Å but partners are 21.9Å apart → too_far_apart by 5.9Å
  - P35↔C22: targets 8.2/5.6Å but partners are 19.0Å apart → too_far_apart by 5.1Å
  - C10↔C22: targets 17.1/5.6Å but partners are 5.1Å apart → too_close_together by 6.4Å
- **V34** — severity 13.57, 19 conflict(s); suspect input ~`C22` (group: pull_in)
  - pull-in (wants closer): C22@9.3Å(now 16.6,conf 0.17), I6@6.8Å(now 9.8,conf 0.28), C28@10.0Å(now 13.4,conf 0.16)
  - push-out (wants farther): R12@24.2Å(now 21.2,conf 0.45), G1@17.7Å(now 9.9,conf 0.17)
  - R12↔C22: targets 24.2/9.3Å but partners are 6.8Å apart → too_close_together by 8.0Å
  - G1↔I6: targets 17.7/6.8Å but partners are 3.7Å apart → too_close_together by 7.2Å
  - G1↔V2: targets 17.7/6.8Å but partners are 4.2Å apart → too_close_together by 6.7Å
- **I6** — severity 11.68, 20 conflict(s); suspect input ~`S14` (group: push_out)
  - pull-in (wants closer): P17@8.4Å(now 12.8,conf 0.21), P35@9.8Å(now 12.9,conf 0.16), V34@6.8Å(now 9.8,conf 0.28), C10@9.8Å(now 13.0,conf 0.16)
  - push-out (wants farther): G24@20.6Å(now 16.4,conf 0.25), C3@8.7Å(now 3.5,conf 0.19), D13@18.3Å(now 12.3,conf 0.18), S14@17.9Å(now 11.3,conf 0.18)
  - P17↔D13: targets 8.4/18.3Å but partners are 3.2Å apart → too_close_together by 6.8Å
  - D13↔C16: targets 18.3/9.0Å but partners are 3.0Å apart → too_close_together by 6.3Å
  - C16↔S14: targets 9.0/17.9Å but partners are 3.4Å apart → too_close_together by 5.5Å
- **P31** — severity 9.95, 16 conflict(s); suspect input ~`G24` (group: pull_in)
  - pull-in (wants closer): L7@5.6Å(now 8.3,conf 0.38), I21@6.6Å(now 9.6,conf 0.30)
  - push-out (wants farther): C3@8.3Å(now 5.2,conf 0.21), V2@8.2Å(now 5.0,conf 0.21), G1@10.1Å(now 5.6,conf 0.16), R11@18.1Å(now 15.4,conf 0.18), C10@17.0Å(now 14.3,conf 0.16), G24@21.3Å(now 13.3,conf 0.28)
  - G24↔C28: targets 21.3/6.9Å but partners are 8.1Å apart → too_close_together by 6.3Å
  - I21↔G24: targets 6.6/21.3Å but partners are 10.8Å apart → too_close_together by 3.9Å
  - L7↔G24: targets 5.6/21.3Å but partners are 13.0Å apart → too_close_together by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=13 · 3-10(G)=5 · coil(C)=3

```
EHHHHEEEGHHEHHHHGHHHGHEHHEECCEEEGGCEE
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=6 · sheet=21
  - C10 ↔ S14  (helix)
  - R11 ↔ D15  (helix)
  - S14 ↔ G18  (helix)
  - D15 ↔ A19  (helix)
  - C16 ↔ C20  (helix)
  - C20 ↔ G24  (helix)
  - G1 ↔ I6  (sheet)
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - L7 ↔ R12  (sheet)
  - L7 ↔ R23  (sheet)
  - L7 ↔ G26  (sheet)
  - L7 ↔ Y27  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ G26  (sheet)
  - Q8 ↔ Y27  (sheet)
  - R12 ↔ R23  (sheet)
  - R12 ↔ G26  (sheet)
  - R12 ↔ Y27  (sheet)
  - R23 ↔ Y30  (sheet)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=189 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=99 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8914 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`5WOW.ensemble.pdb`)
- RMSF mean=1.514Å max=3.474Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 11, 12, 29, 35

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `5WOW.pae.csv`
- mean=0.725Å · max=3.585Å · AlphaFold-PAE analog (low block = rigid unit/domain)
