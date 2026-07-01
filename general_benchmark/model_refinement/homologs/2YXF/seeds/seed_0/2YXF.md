# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\model_refinement\homologs\2YXF\seeds\seed_0\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 3.630 A
- tm_score_ca_ordered: 0.7480735465261198
- heavy_atom_rmsd: 4.849 A
- sidechain_heavy_atom_rmsd: 5.627 A
- **all-atom quality (honest):** heavy 4.849 A, sidechain 5.627 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 4465
- bin_accuracy: 0.809

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=3.6272224026267543 -> 3.224792802676215 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.6301090465508503
- ga_delta_rmsd: -0.5040567318138289  ga_fitness_mode: energy
- pre_local_rmsd: 3.6698626179287195  localized_anchor_rmsd: 3.630172275959839

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I1 → 256 conflicts (84%)
- explained: 256/306 conflicts by 1 root cause(s)
- metrics: hubs=55 (frac 0.567), conflicts/hub=5.6, max_incompat=9.28Å, chain_span=0.928
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I1 — explain ~256/306 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P32** — severity 27.49, 16 conflict(s); suspect input ~`Q2` (group: push_out)
  - pull-in (wants closer): G18@27.5Å(now 34.5,conf 1.00), E74@27.5Å(now 34.3,conf 1.00), N17@27.5Å(now 34.4,conf 1.00), K19@27.5Å(now 34.8,conf 1.00), E16@27.5Å(now 34.5,conf 1.00), K75@27.5Å(now 34.0,conf 1.00), T73@27.5Å(now 33.6,conf 1.00), S20@27.5Å(now 33.0,conf 0.99), D76@27.5Å(now 31.9,conf 0.98), A15@27.5Å(now 31.3,conf 0.98), P72@27.5Å(now 31.4,conf 0.98), T71@27.5Å(now 31.6,conf 0.98), P14@27.5Å(now 30.6,conf 0.98)
  - push-out (wants farther): I1@26.7Å(now 17.1,conf 0.78)
  - I1↔R3: targets 26.7/7.4Å but partners are 11.2Å apart → too_close_together by 8.2Å
  - I1↔S61: targets 26.7/7.8Å but partners are 10.8Å apart → too_close_together by 8.1Å
  - I1↔G29: targets 26.7/9.7Å but partners are 8.7Å apart → too_close_together by 8.3Å
- **H31** — severity 26.37, 14 conflict(s); suspect input ~`Q2` (group: push_out)
  - pull-in (wants closer): G18@27.5Å(now 33.9,conf 1.00), E74@27.5Å(now 33.6,conf 1.00), N17@27.5Å(now 33.6,conf 1.00), K19@27.5Å(now 34.1,conf 1.00), K75@27.5Å(now 33.5,conf 1.00), E16@27.5Å(now 33.4,conf 0.99), T73@27.5Å(now 33.1,conf 0.99), S20@27.5Å(now 32.6,conf 0.99), D76@27.5Å(now 31.7,conf 0.98), T71@27.4Å(now 31.4,conf 0.97), P72@27.4Å(now 30.9,conf 0.97), A15@27.4Å(now 30.2,conf 0.96)
  - push-out (wants farther): I1@24.8Å(now 14.0,conf 0.57)
  - I1↔R3: targets 24.8/5.5Å but partners are 11.2Å apart → too_close_together by 8.1Å
  - I1↔S61: targets 24.8/5.8Å but partners are 10.8Å apart → too_close_together by 8.2Å
  - I1↔Q2: targets 24.8/5.9Å but partners are 12.6Å apart → too_close_together by 6.2Å
- **S33** — severity 24.45, 15 conflict(s); suspect input ~`F30` (group: push_out)
  - pull-in (wants closer): G18@27.5Å(now 33.0,conf 1.00), E74@27.5Å(now 33.5,conf 1.00), N17@27.5Å(now 33.2,conf 0.99), K75@27.5Å(now 33.2,conf 0.99), K19@27.5Å(now 33.1,conf 0.99), E16@27.5Å(now 33.3,conf 0.99), T73@27.5Å(now 32.4,conf 0.99), S20@27.4Å(now 31.1,conf 0.96), D76@27.4Å(now 30.9,conf 0.95), A15@27.4Å(now 30.2,conf 0.95), P72@27.4Å(now 29.9,conf 0.94)
  - push-out (wants farther): I1@26.2Å(now 18.4,conf 0.70)
  - I1↔F30: targets 26.2/7.1Å but partners are 11.9Å apart → too_close_together by 7.2Å
  - I1↔G29: targets 26.2/10.0Å but partners are 8.7Å apart → too_close_together by 7.5Å
  - I1↔S61: targets 26.2/8.3Å but partners are 10.8Å apart → too_close_together by 7.1Å
- **T86** — severity 23.27, 11 conflict(s); suspect input ~`T4` (group: push_out)
  - pull-in (wants closer): G18@27.5Å(now 33.8,conf 1.00), K19@27.5Å(now 35.1,conf 1.00), N17@27.5Å(now 33.1,conf 1.00), E16@27.5Å(now 33.5,conf 0.99), E74@27.5Å(now 31.5,conf 0.99), S20@27.5Å(now 33.7,conf 0.99), T73@27.5Å(now 31.7,conf 0.99), K75@27.5Å(now 30.6,conf 0.98), T71@27.4Å(now 31.2,conf 0.97), P14@27.4Å(now 30.5,conf 0.97), A15@27.4Å(now 30.5,conf 0.97), P72@27.4Å(now 30.2,conf 0.96), N21@27.4Å(now 30.4,conf 0.96), H13@27.4Å(now 29.9,conf 0.95)
  - push-out (wants farther): I1@27.3Å(now 17.9,conf 0.93)
  - I1↔T4: targets 27.3/5.9Å but partners are 12.6Å apart → too_close_together by 8.8Å
  - I1↔R3: targets 27.3/6.9Å but partners are 11.2Å apart → too_close_together by 9.3Å
  - I1↔Q2: targets 27.3/7.0Å but partners are 12.6Å apart → too_close_together by 7.7Å
- **H84** — severity 22.61, 14 conflict(s); suspect input ~`P5` (group: push_out)
  - pull-in (wants closer): G18@27.5Å(now 31.2,conf 0.99), K19@27.5Å(now 32.3,conf 0.98), N17@27.4Å(now 30.9,conf 0.97), E16@27.4Å(now 31.6,conf 0.97), S20@27.3Å(now 30.5,conf 0.93)
  - push-out (wants farther): I1@27.2Å(now 19.7,conf 0.89)
  - I1↔P5: targets 27.2/7.6Å but partners are 12.1Å apart → too_close_together by 7.5Å
  - I1↔T4: targets 27.2/7.4Å but partners are 12.6Å apart → too_close_together by 7.2Å
  - I1↔F30: targets 27.2/8.5Å but partners are 11.9Å apart → too_close_together by 6.8Å
- **I35** — severity 21.00, 16 conflict(s); suspect input ~`G29` (group: push_out)
  - pull-in (wants closer): K19@27.4Å(now 30.1,conf 0.94), E16@27.4Å(now 30.2,conf 0.94)
  - push-out (wants farther): I1@26.9Å(now 20.5,conf 0.81)
  - I1↔G29: targets 26.9/11.6Å but partners are 8.7Å apart → too_close_together by 6.6Å
  - I1↔F30: targets 26.9/8.7Å but partners are 11.9Å apart → too_close_together by 6.3Å
  - I1↔P5: targets 26.9/8.8Å but partners are 12.1Å apart → too_close_together by 6.0Å

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=45 · 3-10(G)=27 · coil(C)=17

```
CEEGCGCEGEEHECCCGEECEEGEGGGEHEEECCECGEGGGHGEEGGGEEEECCEEEHGGEEEEEGEGGEGEEHCEEEEECGEEHHEHECCGGGCGE
```

## Backbone H-bond Network

- total=70 · helix(i→i+4)=0 · sheet=70
  - Q8 ↔ N24  (sheet)
  - Q8 ↔ S28  (sheet)
  - Y10 ↔ N21  (sheet)
  - Y10 ↔ F22  (sheet)
  - Y10 ↔ N24  (sheet)
  - S11 ↔ G18  (sheet)
  - S11 ↔ K19  (sheet)
  - S11 ↔ N21  (sheet)
  - S11 ↔ F22  (sheet)
  - S11 ↔ N24  (sheet)
  - H13 ↔ G18  (sheet)
  - H13 ↔ K19  (sheet)
  - H13 ↔ N21  (sheet)
  - H13 ↔ F22  (sheet)
  - H13 ↔ N24  (sheet)
  - N24 ↔ D38  (sheet)
  - S28 ↔ I35  (sheet)
  - F30 ↔ I35  (sheet)
  - I35 ↔ H51  (sheet)
  - D38 ↔ E44  (sheet)
  - … +50 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=50 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=348 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=219 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8695 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
