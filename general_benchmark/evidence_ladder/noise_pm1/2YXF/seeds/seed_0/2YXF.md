# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\2YXF\seeds\seed_0\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 1.316 A
- tm_score_ca_ordered: 0.9110737908683144
- heavy_atom_rmsd: 3.131 A
- sidechain_heavy_atom_rmsd: 3.887 A
- **all-atom quality (honest):** heavy 3.131 A, sidechain 3.887 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 4465
- bin_accuracy: 0.666

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.3161585665434294
- ga_delta_rmsd: 0.11342293097344047  ga_fitness_mode: energy
- pre_local_rmsd: 1.3218871311010405  localized_anchor_rmsd: 1.316139492635865

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I1 → 75 conflicts (18%); K75-D76 → 69 conflicts (16%); K19-S20 → 60 conflicts (14%)
- explained: 204/420 conflicts by 3 root cause(s)
- metrics: hubs=70 (frac 0.722), conflicts/hub=6.0, max_incompat=6.02Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I1 + K75-D76 + K19-S20 — explain ~204/420 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R81** — severity 17.84, 19 conflict(s); suspect input ~`D76` (group: pull_in)
  - pull-in (wants closer): D76@12.7Å(now 15.9,conf 0.34)
  - push-out (wants farther): K58@26.5Å(now 23.6,conf 0.74), I1@22.6Å(now 19.9,conf 0.48)
  - K75↔D76: targets 21.1/12.7Å but partners are 3.4Å apart → too_close_together by 5.0Å
  - H31↔D76: targets 14.2/12.7Å but partners are 31.1Å apart → too_far_apart by 4.2Å
  - I35↔D76: targets 9.4/12.7Å but partners are 25.6Å apart → too_far_apart by 3.5Å
- **D76** — severity 17.32, 16 conflict(s); suspect input ~`T73` (group: push_out)
  - pull-in (wants closer): D59@27.5Å(now 36.2,conf 1.00), I1@27.5Å(now 33.5,conf 1.00), K58@27.5Å(now 35.7,conf 1.00), W60@27.5Å(now 34.6,conf 1.00), S57@27.5Å(now 33.9,conf 0.99), Q2@27.5Å(now 32.5,conf 0.99), S61@27.5Å(now 31.8,conf 0.98), F56@27.4Å(now 32.1,conf 0.97), P32@27.5Å(now 31.8,conf 0.98), H31@27.5Å(now 31.1,conf 0.98), R3@27.5Å(now 30.4,conf 0.98), S33@27.3Å(now 29.8,conf 0.91), S55@27.0Å(now 29.8,conf 0.83), R81@12.7Å(now 15.9,conf 0.34)
  - push-out (wants farther): N24@17.7Å(now 14.7,conf 0.36), S11@15.3Å(now 12.6,conf 0.34)
  - D59↔T73: targets 27.5/4.7Å but partners are 36.8Å apart → too_far_apart by 4.6Å
  - K58↔T73: targets 27.5/4.7Å but partners are 35.9Å apart → too_far_apart by 3.7Å
  - W60↔T73: targets 27.5/4.7Å but partners are 35.5Å apart → too_far_apart by 3.3Å
- **S20** — severity 15.49, 16 conflict(s); suspect input ~`N17` (group: push_out)
  - pull-in (wants closer): Q2@27.5Å(now 34.6,conf 1.00), S88@27.5Å(now 34.6,conf 1.00), D59@27.5Å(now 32.3,conf 0.99), T86@27.5Å(now 34.1,conf 0.99), V85@27.5Å(now 33.6,conf 0.99), W60@27.5Å(now 32.4,conf 0.99), R3@27.5Å(now 32.7,conf 0.99), K58@27.5Å(now 31.5,conf 0.99), P32@27.5Å(now 32.4,conf 0.99), Q89@27.5Å(now 32.9,conf 0.98), L87@27.5Å(now 32.4,conf 0.99), H31@27.4Å(now 31.4,conf 0.95), T4@27.4Å(now 30.7,conf 0.94), D34@27.3Å(now 30.0,conf 0.93), H84@27.4Å(now 30.5,conf 0.97), P72@8.1Å(now 10.9,conf 0.35), I1@27.5Å(now 34.5,conf 1.00)
  - push-out (wants farther): E16@12.1Å(now 9.2,conf 0.34)
  - S88↔N17: targets 27.5/5.7Å but partners are 37.8Å apart → too_far_apart by 4.6Å
  - Q89↔N17: targets 27.5/5.7Å but partners are 36.6Å apart → too_far_apart by 3.4Å
  - T86↔N17: targets 27.5/5.7Å but partners are 36.3Å apart → too_far_apart by 3.1Å
- **A15** — severity 15.44, 12 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): Q2@27.5Å(now 33.6,conf 0.99), Q89@27.5Å(now 35.6,conf 1.00), V85@27.5Å(now 34.6,conf 1.00), T86@27.5Å(now 34.6,conf 0.99), L87@27.5Å(now 33.7,conf 0.99), P32@27.5Å(now 32.5,conf 0.98), R3@27.5Å(now 31.5,conf 0.99), W60@27.5Å(now 30.2,conf 0.98), P90@27.5Å(now 32.5,conf 0.99), H84@27.5Å(now 32.1,conf 0.98), D59@27.5Å(now 30.2,conf 0.98), H31@27.5Å(now 30.6,conf 0.98), D34@27.5Å(now 31.3,conf 0.99), T4@27.4Å(now 30.2,conf 0.96), N83@27.5Å(now 31.0,conf 0.98), I1@27.5Å(now 32.6,conf 1.00), S88@27.5Å(now 36.5,conf 1.00)
  - G18↔S88: targets 4.5/27.5Å but partners are 36.5Å apart → too_far_apart by 4.5Å
  - T86↔G18: targets 27.5/4.5Å but partners are 35.3Å apart → too_far_apart by 3.3Å
  - V85↔G18: targets 27.5/4.5Å but partners are 35.2Å apart → too_far_apart by 3.3Å
- **F70** — severity 14.84, 17 conflict(s); suspect input ~`L39` (group: push_out)
  - pull-in (wants closer): I1@27.5Å(now 31.8,conf 1.00), D59@27.5Å(now 30.8,conf 0.98), Q2@27.5Å(now 31.1,conf 0.99), K58@27.5Å(now 30.6,conf 0.98), W60@27.4Å(now 30.4,conf 0.95), T86@26.8Å(now 29.4,conf 0.80), L39@7.2Å(now 10.5,conf 0.37)
  - push-out (wants farther): N21@8.0Å(now 5.2,conf 0.35), Y66@15.5Å(now 12.2,conf 0.34), V49@12.4Å(now 9.4,conf 0.34)
  - Y67↔Y66: targets 8.0/15.5Å but partners are 3.6Å apart → too_close_together by 4.0Å
  - V82↔L39: targets 20.2/7.2Å but partners are 9.8Å apart → too_close_together by 3.2Å
  - G18↔L39: targets 10.3/7.2Å but partners are 21.0Å apart → too_far_apart by 3.5Å
- **Y66** — severity 14.41, 17 conflict(s); suspect input ~`C80` (group: pull_in)
  - pull-in (wants closer): C80@6.8Å(now 9.8,conf 0.38)
  - push-out (wants farther): I1@24.8Å(now 20.8,conf 0.57), F70@15.5Å(now 12.2,conf 0.34)
  - I1↔R3: targets 24.8/17.0Å but partners are 3.6Å apart → too_close_together by 4.2Å
  - I1↔G29: targets 24.8/12.7Å but partners are 8.0Å apart → too_close_together by 4.2Å
  - I1↔S28: targets 24.8/10.6Å but partners are 11.0Å apart → too_close_together by 3.2Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=42 · 3-10(G)=25 · coil(C)=20

```
CEECCGCEGEEEEEHHHHCEEECEGGGEGGGGHCEEGEGCEHGEGGGCEGECECECHEHEEGEGGEEGCECEEHCECEEEEEEECHEGECCGGGCGE
```

## Backbone H-bond Network

- total=63 · helix(i→i+4)=0 · sheet=63
  - Q8 ↔ N24  (sheet)
  - Q8 ↔ S28  (sheet)
  - Y10 ↔ N21  (sheet)
  - Y10 ↔ F22  (sheet)
  - Y10 ↔ N24  (sheet)
  - S11 ↔ S20  (sheet)
  - S11 ↔ N21  (sheet)
  - S11 ↔ F22  (sheet)
  - S11 ↔ N24  (sheet)
  - R12 ↔ S20  (sheet)
  - R12 ↔ N21  (sheet)
  - R12 ↔ F22  (sheet)
  - R12 ↔ N24  (sheet)
  - H13 ↔ S20  (sheet)
  - H13 ↔ N21  (sheet)
  - H13 ↔ F22  (sheet)
  - H13 ↔ N24  (sheet)
  - P14 ↔ S20  (sheet)
  - P14 ↔ N21  (sheet)
  - P14 ↔ F22  (sheet)
  - … +43 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=42 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=363 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=223 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8477 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
