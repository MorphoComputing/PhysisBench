# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\5WOW\seeds\seed_1\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 5.698 A
- tm_score_ca_ordered: 0.20197037587707248
- heavy_atom_rmsd: 7.146 A
- sidechain_heavy_atom_rmsd: 8.140 A
- **all-atom quality (honest):** heavy 7.146 A, sidechain 8.140 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 595
- bin_accuracy: 0.284

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.698052161663316
- ga_delta_rmsd: -1.1682920394754932  ga_fitness_mode: energy
- pre_local_rmsd: 5.698106930152619  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C28-D36 → 219 conflicts (76%); G1-C10 → 59 conflicts (20%)
- explained: 278/290 conflicts by 2 root cause(s)
- metrics: hubs=35 (frac 0.946), conflicts/hub=8.3, max_incompat=9.76Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C28-D36 + G1-C10 — explain ~278/290 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A19** — severity 12.08, 10 conflict(s); suspect input ~`R9` (group: pull_in)
  - pull-in (wants closer): C16@6.0Å(now 8.8,conf 0.34), V2@7.0Å(now 11.6,conf 0.27)
  - push-out (wants farther): P35@16.6Å(now 12.6,conf 0.15), P31@10.1Å(now 6.8,conf 0.16), R11@20.0Å(now 13.2,conf 0.23), D33@18.6Å(now 13.2,conf 0.19), R9@20.6Å(now 12.3,conf 0.25)
  - C16↔R9: targets 6.0/20.6Å but partners are 4.8Å apart → too_close_together by 9.8Å
  - R11↔C16: targets 20.0/6.0Å but partners are 6.5Å apart → too_close_together by 7.5Å
  - R9↔C22: targets 20.6/7.8Å but partners are 6.6Å apart → too_close_together by 6.2Å
- **P35** — severity 11.81, 24 conflict(s); suspect input ~`N25` (group: pull_in)
  - pull-in (wants closer): D15@18.6Å(now 21.9,conf 0.19), D13@18.1Å(now 20.8,conf 0.18), N25@10.2Å(now 17.3,conf 0.15), I6@9.8Å(now 12.5,conf 0.16), G1@10.0Å(now 12.7,conf 0.16)
  - push-out (wants farther): C16@21.2Å(now 18.2,conf 0.27), A19@16.6Å(now 12.6,conf 0.15), R23@21.5Å(now 16.3,conf 0.28), Q8@19.1Å(now 15.9,conf 0.20), L7@17.4Å(now 14.4,conf 0.17), G29@18.1Å(now 13.4,conf 0.18), C28@18.4Å(now 15.6,conf 0.19), P4@16.8Å(now 12.6,conf 0.16)
  - R23↔Y30: targets 21.5/8.2Å but partners are 7.5Å apart → too_close_together by 5.8Å
  - R23↔N25: targets 21.5/10.2Å but partners are 4.2Å apart → too_close_together by 7.1Å
  - G24↔N25: targets 19.9/10.2Å but partners are 3.0Å apart → too_close_together by 6.6Å
- **V34** — severity 11.70, 20 conflict(s); suspect input ~`C22` (group: pull_in)
  - pull-in (wants closer): C22@9.3Å(now 15.4,conf 0.17), I6@6.8Å(now 9.6,conf 0.28), C28@10.0Å(now 13.5,conf 0.16)
  - push-out (wants farther): R12@24.2Å(now 20.9,conf 0.45), C16@19.2Å(now 16.1,conf 0.21), G1@17.7Å(now 9.7,conf 0.17)
  - R12↔C22: targets 24.2/9.3Å but partners are 6.3Å apart → too_close_together by 8.6Å
  - G1↔V2: targets 17.7/6.8Å but partners are 3.2Å apart → too_close_together by 7.7Å
  - R12↔P31: targets 24.2/6.3Å but partners are 14.7Å apart → too_close_together by 3.2Å
- **D33** — severity 10.99, 14 conflict(s); suspect input ~`C28` (group: pull_in)
  - pull-in (wants closer): R11@17.1Å(now 20.0,conf 0.16), L7@5.8Å(now 8.9,conf 0.36)
  - push-out (wants farther): K5@9.6Å(now 6.9,conf 0.17), V2@8.1Å(now 5.4,conf 0.22), C3@9.3Å(now 5.5,conf 0.18), C28@19.0Å(now 12.6,conf 0.20), G18@19.5Å(now 14.4,conf 0.22), R9@18.9Å(now 15.1,conf 0.20), A19@18.6Å(now 13.2,conf 0.19)
  - C28↔L7: targets 19.0/5.8Å but partners are 6.5Å apart → too_close_together by 6.7Å
  - L7↔G18: targets 5.8/19.5Å but partners are 8.2Å apart → too_close_together by 5.5Å
  - L7↔R9: targets 5.8/18.9Å but partners are 7.4Å apart → too_close_together by 5.7Å
- **Y30** — severity 10.20, 16 conflict(s); suspect input ~`C10` (group: push_out)
  - pull-in (wants closer): K5@7.7Å(now 10.8,conf 0.24), P17@7.7Å(now 12.9,conf 0.23), G26@6.6Å(now 11.4,conf 0.30)
  - push-out (wants farther): V2@9.0Å(now 6.3,conf 0.18), I21@9.8Å(now 6.3,conf 0.16), C10@17.1Å(now 11.3,conf 0.16), S14@16.6Å(now 14.1,conf 0.15)
  - P35↔G26: targets 8.2/6.6Å but partners are 20.4Å apart → too_far_apart by 5.5Å
  - C10↔C22: targets 17.1/5.6Å but partners are 5.3Å apart → too_close_together by 6.2Å
  - C3↔G26: targets 5.6/6.6Å but partners are 15.2Å apart → too_far_apart by 3.0Å
- **C28** — severity 9.31, 15 conflict(s); suspect input ~`V34` (group: pull_in)
  - pull-in (wants closer): V34@10.0Å(now 13.5,conf 0.16)
  - push-out (wants farther): R9@7.2Å(now 3.6,conf 0.26), Q8@7.1Å(now 4.3,conf 0.27), C20@9.3Å(now 6.8,conf 0.17), C16@8.8Å(now 6.2,conf 0.19), D33@19.0Å(now 12.6,conf 0.20), G1@8.8Å(now 6.0,conf 0.19), P35@18.4Å(now 15.6,conf 0.19), D36@18.2Å(now 14.4,conf 0.18)
  - D33↔C3: targets 19.0/8.4Å but partners are 5.5Å apart → too_close_together by 5.1Å
  - D33↔P31: targets 19.0/6.9Å but partners are 7.8Å apart → too_close_together by 4.3Å
  - V2↔D33: targets 9.0/19.0Å but partners are 5.4Å apart → too_close_together by 4.6Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=13 · 3-10(G)=4 · coil(C)=5

```
CHHHEHEECCHHEHHHEEHCEEEHHEGHGGECHEHGE
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=4 · sheet=31
  - V2 ↔ I6  (helix)
  - R11 ↔ D15  (helix)
  - D15 ↔ A19  (helix)
  - G24 ↔ C28  (helix)
  - K5 ↔ P17  (sheet)
  - K5 ↔ G18  (sheet)
  - K5 ↔ I21  (sheet)
  - L7 ↔ D13  (sheet)
  - L7 ↔ P17  (sheet)
  - L7 ↔ G18  (sheet)
  - L7 ↔ I21  (sheet)
  - L7 ↔ C22  (sheet)
  - Q8 ↔ D13  (sheet)
  - Q8 ↔ P17  (sheet)
  - Q8 ↔ G18  (sheet)
  - Q8 ↔ I21  (sheet)
  - Q8 ↔ C22  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ G26  (sheet)
  - D13 ↔ G18  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=160 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=86 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8627 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
