# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HRC\seeds\seed_7\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 10.662 A
- tm_score_ca_ordered: 0.19776871381577332
- heavy_atom_rmsd: 11.297 A
- sidechain_heavy_atom_rmsd: 11.953 A
- **all-atom quality (honest):** heavy 11.297 A, sidechain 11.953 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 65
- distogram_pairs: 1045
- bin_accuracy: 0.335

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.662010897849289
- ga_delta_rmsd: -2.3971521006347363  ga_fitness_mode: energy
- pre_local_rmsd: 10.674288050485083  localized_anchor_rmsd: 10.661993744478183

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V2-V10 → 543 conflicts (40%); D92-A100 → 272 conflicts (20%); Y73-T77 → 149 conflicts (11%)
- explained: 964/1348 conflicts by 3 root cause(s)
- metrics: hubs=96 (frac 0.941), conflicts/hub=14.0, max_incompat=16.82Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V2-V10 + D92-A100 + Y73-T77 — explain ~964/1348 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K7** — severity 156.50, 34 conflict(s); suspect input ~`Y96` (group: push_out)
  - pull-in (wants closer): E3@5.1Å(now 7.8,conf 0.91), V10@5.3Å(now 9.0,conf 0.56), Y96@9.2Å(now 16.7,conf 0.55), T88@13.3Å(now 18.9,conf 0.55), E20@15.9Å(now 18.6,conf 0.55), A95@11.9Å(now 16.7,conf 0.55)
  - push-out (wants farther): G55@27.5Å(now 24.1,conf 1.00), K54@27.5Å(now 20.6,conf 0.99), T48@27.5Å(now 15.0,conf 0.98), K12@8.5Å(now 4.9,conf 0.55)
  - K4↔T48: targets 5.0/27.5Å but partners are 11.2Å apart → too_close_together by 11.3Å
  - T48↔V2: targets 27.5/8.9Å but partners are 7.4Å apart → too_close_together by 11.2Å
  - T48↔E3: targets 27.5/5.1Å but partners are 11.3Å apart → too_close_together by 11.1Å
- **E3** — severity 149.49, 37 conflict(s); suspect input ~`Y96` (group: push_out)
  - pull-in (wants closer): I8@7.0Å(now 11.4,conf 0.94), K7@5.1Å(now 7.8,conf 0.91), V10@9.1Å(now 12.8,conf 0.91), Y96@6.8Å(now 12.4,conf 0.55), A95@8.9Å(now 12.5,conf 0.55), L97@10.5Å(now 16.9,conf 0.55), E91@11.7Å(now 16.5,conf 0.55)
  - push-out (wants farther): D49@27.5Å(now 16.3,conf 1.00), T48@27.5Å(now 11.3,conf 1.00), P75@27.5Å(now 16.2,conf 1.00), I84@16.8Å(now 11.5,conf 0.55), C13@14.8Å(now 11.4,conf 0.55)
  - P75↔V10: targets 27.5/9.1Å but partners are 5.8Å apart → too_close_together by 12.6Å
  - T48↔Y96: targets 27.5/6.8Å but partners are 4.1Å apart → too_close_together by 16.6Å
  - P75↔I8: targets 27.5/7.0Å but partners are 10.9Å apart → too_close_together by 9.6Å
- **G76** — severity 144.87, 31 conflict(s); suspect input ~`T88` (group: pull_in)
  - pull-in (wants closer): P70@9.0Å(now 11.9,conf 0.99), A50@5.9Å(now 14.2,conf 0.55), T48@7.4Å(now 13.0,conf 0.55)
  - push-out (wants farther): V2@27.5Å(now 15.8,conf 1.00), G83@15.0Å(now 11.9,conf 0.99), A100@27.4Å(now 20.0,conf 0.94), T88@27.1Å(now 21.4,conf 0.88), P29@16.3Å(now 13.2,conf 0.55), T39@13.7Å(now 8.6,conf 0.55)
  - V2↔K71: targets 27.5/7.0Å but partners are 8.4Å apart → too_close_together by 12.1Å
  - M79↔V2: targets 9.0/27.5Å but partners are 7.2Å apart → too_close_together by 11.3Å
  - V2↔Y73: targets 27.5/9.0Å but partners are 7.8Å apart → too_close_together by 10.7Å
- **P75** — severity 129.59, 25 conflict(s); suspect input ~`K21` (group: pull_in)
  - pull-in (wants closer): P70@7.0Å(now 10.2,conf 0.99)
  - push-out (wants farther): E3@27.5Å(now 16.2,conf 1.00), K21@27.5Å(now 16.1,conf 0.98), Q41@17.3Å(now 13.8,conf 0.55), I84@17.2Å(now 12.1,conf 0.55)
  - E3↔P70: targets 27.5/7.0Å but partners are 7.7Å apart → too_close_together by 12.8Å
  - K71↔E3: targets 5.0/27.5Å but partners are 10.1Å apart → too_close_together by 12.4Å
  - E3↔F81: targets 27.5/13.0Å but partners are 4.1Å apart → too_close_together by 10.4Å
- **T77** — severity 120.66, 38 conflict(s); suspect input ~`G5` (group: pull_in)
  - pull-in (wants closer): P70@7.0Å(now 11.5,conf 0.99), Y47@8.4Å(now 13.2,conf 0.55)
  - push-out (wants farther): A95@23.2Å(now 14.1,conf 0.76), G5@23.2Å(now 12.6,conf 0.75), E89@21.9Å(now 18.2,conf 0.62), L34@17.0Å(now 10.8,conf 0.55), C13@15.5Å(now 5.2,conf 0.55), Q41@14.3Å(now 11.3,conf 0.55)
  - P70↔G5: targets 7.0/23.2Å but partners are 3.7Å apart → too_close_together by 12.5Å
  - Y73↔G5: targets 8.9/23.2Å but partners are 4.1Å apart → too_close_together by 10.2Å
  - K71↔G5: targets 7.0/23.2Å but partners are 6.5Å apart → too_close_together by 9.8Å
- **Y96** — severity 119.62, 34 conflict(s); suspect input ~`E3` (group: pull_in)
  - pull-in (wants closer): A100@5.4Å(now 10.1,conf 0.79), V2@4.5Å(now 8.7,conf 0.61), E3@6.8Å(now 12.4,conf 0.55), K7@9.2Å(now 16.7,conf 0.55), K4@7.9Å(now 11.4,conf 0.55)
  - push-out (wants farther): L93@5.0Å(now 2.3,conf 0.99), N51@22.4Å(now 6.9,conf 0.66), Y73@21.3Å(now 10.3,conf 0.60), T18@13.0Å(now 9.7,conf 0.55), K59@13.0Å(now 7.1,conf 0.55), H17@14.0Å(now 10.3,conf 0.55)
  - N51↔V2: targets 22.4/4.5Å but partners are 6.4Å apart → too_close_together by 11.5Å
  - A100↔K7: targets 5.4/9.2Å but partners are 26.2Å apart → too_far_apart by 11.5Å
  - L93↔N51: targets 5.0/22.4Å but partners are 8.0Å apart → too_close_together by 9.3Å

## Secondary Structure (DSSP-like)

- helix(H)=58 · strand(E)=32 · 3-10(G)=10 · coil(C)=2

```
EHHEGHEHHHGHEHHGCEEHEGCEEGHEGGHHHHHHHHHHEHEHEHHHHEHHHHHHHEHEHEHHHEHHEHHHHHEHEHEGEHEEGEHHEEHEHHEHEHHGHE
```

## Backbone H-bond Network

- total=98 · helix(i→i+4)=30 · sheet=68
  - V2 ↔ K6  (helix)
  - K6 ↔ V10  (helix)
  - I8 ↔ K12  (helix)
  - V10 ↔ A14  (helix)
  - T27 ↔ L31  (helix)
  - L31 ↔ F35  (helix)
  - H32 ↔ G36  (helix)
  - L34 ↔ K38  (helix)
  - F35 ↔ T39  (helix)
  - G36 ↔ G40  (helix)
  - K38 ↔ A42  (helix)
  - G40 ↔ G44  (helix)
  - A42 ↔ T46  (helix)
  - G44 ↔ T48  (helix)
  - Y47 ↔ N51  (helix)
  - T48 ↔ K52  (helix)
  - N51 ↔ G55  (helix)
  - K52 ↔ I56  (helix)
  - G55 ↔ K59  (helix)
  - T57 ↔ E61  (helix)
  - … +78 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=39 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=866 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=639 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.1228 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=65 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
