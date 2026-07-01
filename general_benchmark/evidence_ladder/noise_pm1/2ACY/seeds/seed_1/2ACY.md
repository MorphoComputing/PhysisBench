# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2ACY\sequence\2ACY.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\2ACY\seeds\seed_1\2ACY.pdb`
- residues: 96
- mode: oracle
- ca_rmsd: 0.443 A
- tm_score_ca_ordered: 0.9850151907883106
- heavy_atom_rmsd: 2.809 A
- sidechain_heavy_atom_rmsd: 3.692 A
- **all-atom quality (honest):** heavy 2.809 A, sidechain 3.692 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/83 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 4371
- bin_accuracy: 0.670

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4426504496055594
- ga_delta_rmsd: 0.12422922204024722  ga_fitness_mode: energy
- pre_local_rmsd: 0.4503017353149638  localized_anchor_rmsd: 0.4426302340994361

## Failure Classification

- primary_reason: `HEAVY_ATOM_RMSD_HIGH`
- reasons: `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P53-R58 → 38 conflicts (29%); A77-F79 → 25 conflicts (19%); E11-F13 → 14 conflicts (11%)
- explained: 77/132 conflicts by 3 root cause(s)
- metrics: hubs=47 (frac 0.49), conflicts/hub=2.8, max_incompat=4.72Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P53-R58 + A77-F79 + E11-F13 — explain ~77/132 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F79** — severity 6.79, 8 conflict(s); suspect input ~`Q51` (group: push_out)
  - push-out (wants farther): T91@24.1Å(now 21.4,conf 0.53)
  - T91↔Q51: targets 24.1/11.3Å but partners are 9.4Å apart → too_close_together by 3.4Å
  - T91↔V8: targets 24.1/6.5Å but partners are 15.1Å apart → too_close_together by 2.6Å
  - T91↔D9: targets 24.1/5.7Å but partners are 16.1Å apart → too_close_together by 2.3Å
- **K87** — severity 6.65, 7 conflict(s); suspect input ~`P53` (group: pull_in)
  - pull-in (wants closer): K71@27.5Å(now 34.5,conf 0.99), K15@27.5Å(now 33.3,conf 0.99), G18@27.5Å(now 32.8,conf 0.99), H73@27.4Å(now 33.2,conf 0.97), V19@27.4Å(now 32.5,conf 0.96), P70@27.4Å(now 32.8,conf 0.96), G14@27.5Å(now 32.1,conf 0.98), S72@27.5Å(now 32.4,conf 0.98), D75@27.4Å(now 31.8,conf 0.97), G44@27.4Å(now 31.1,conf 0.97), Q43@27.3Å(now 30.8,conf 0.93), Q17@27.4Å(now 30.9,conf 0.95), I74@27.4Å(now 30.6,conf 0.96), V16@27.4Å(now 30.3,conf 0.97), F20@27.3Å(now 30.1,conf 0.93), G29@14.6Å(now 17.6,conf 0.34), P53@8.0Å(now 11.2,conf 0.35)
  - P53↔S55: targets 8.0/17.2Å but partners are 5.8Å apart → too_close_together by 3.5Å
  - P53↔K56: targets 8.0/16.8Å but partners are 5.4Å apart → too_close_together by 3.4Å
  - R58↔P53: targets 19.4/8.0Å but partners are 8.6Å apart → too_close_together by 2.8Å
- **E11** — severity 6.19, 8 conflict(s); suspect input ~`R58` (group: pull_in)
  - pull-in (wants closer): R58@12.2Å(now 15.3,conf 0.34)
  - push-out (wants farther): S72@16.8Å(now 14.3,conf 0.35)
  - S55↔R58: targets 19.9/12.2Å but partners are 5.0Å apart → too_close_together by 2.8Å
  - T45↔R58: targets 5.8/12.2Å but partners are 20.6Å apart → too_far_apart by 2.6Å
  - V16↔S72: targets 9.3/16.8Å but partners are 5.0Å apart → too_close_together by 2.5Å
- **G29** — severity 5.75, 8 conflict(s); suspect input ~`K87` (group: pull_in)
  - pull-in (wants closer): K87@14.6Å(now 17.6,conf 0.34)
  - push-out (wants farther): L32@8.4Å(now 5.3,conf 0.35)
  - T25↔K87: targets 4.9/14.6Å but partners are 22.2Å apart → too_far_apart by 2.7Å
  - K87↔V19: targets 14.6/15.3Å but partners are 32.5Å apart → too_far_apart by 2.6Å
  - K87↔S69: targets 14.6/12.1Å but partners are 29.1Å apart → too_far_apart by 2.5Å
- **R58** — severity 5.02, 7 conflict(s); suspect input ~`E11` (group: pull_in)
  - pull-in (wants closer): Q43@22.8Å(now 25.3,conf 0.49), E11@12.2Å(now 15.3,conf 0.34)
  - D42↔E11: targets 26.9/12.2Å but partners are 12.1Å apart → too_close_together by 2.6Å
  - Q43↔S55: targets 22.8/5.2Å but partners are 29.7Å apart → too_far_apart by 1.7Å
  - S55↔E11: targets 5.2/12.2Å but partners are 19.7Å apart → too_far_apart by 2.3Å
- **P53** — severity 4.79, 5 conflict(s); suspect input ~`K87` (group: push_out)
  - pull-in (wants closer): D42@27.0Å(now 29.7,conf 0.84), K87@8.0Å(now 11.2,conf 0.35)
  - push-out (wants farther): L88@13.0Å(now 10.0,conf 0.34)
  - D42↔D3: targets 27.0/4.8Å but partners are 34.0Å apart → too_far_apart by 2.2Å
  - K56↔K87: targets 4.9/8.0Å but partners are 16.0Å apart → too_far_apart by 3.1Å
  - R58↔K87: targets 8.0/8.0Å but partners are 18.5Å apart → too_far_apart by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=33 · 3-10(G)=25 · coil(C)=11

```
EECEGGGECEGGGEHEEHHHHGHHGHHHHEHHHEGEECECEHHGEGEEEGEEECHHHGHHHHHGHEEECGCEGCCEGGCEHHEGEGEGGEGEGEGC
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=13 · sheet=29
  - K15 ↔ V19  (helix)
  - V19 ↔ K23  (helix)
  - F20 ↔ Y24  (helix)
  - K23 ↔ A27  (helix)
  - Y24 ↔ E28  (helix)
  - A27 ↔ K31  (helix)
  - E28 ↔ L32  (helix)
  - G29 ↔ G33  (helix)
  - S55 ↔ H59  (helix)
  - K56 ↔ M60  (helix)
  - V57 ↔ Q61  (helix)
  - H59 ↔ W63  (helix)
  - Q61 ↔ E65  (helix)
  - K30 ↔ G36  (sheet)
  - K30 ↔ W37  (sheet)
  - L34 ↔ Q49  (sheet)
  - L34 ↔ Q51  (sheet)
  - L34 ↔ G52  (sheet)
  - L34 ↔ P53  (sheet)
  - G36 ↔ Q47  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=44 · exposed=28 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=390 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=216 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9883 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 83 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
