# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HRC\seeds\seed_8\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 8.329 A
- tm_score_ca_ordered: 0.2642250285122661
- heavy_atom_rmsd: 9.331 A
- sidechain_heavy_atom_rmsd: 10.383 A
- **all-atom quality (honest):** heavy 9.331 A, sidechain 10.383 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 59
- distogram_pairs: 1043
- bin_accuracy: 0.282

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.328619047139956
- ga_delta_rmsd: -0.025662777727355035  ga_fitness_mode: energy
- pre_local_rmsd: 8.352987667155759  localized_anchor_rmsd: 8.328634669241314

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I84-A100 → 649 conflicts (50%); I74-I80 → 140 conflicts (11%); R37-Q41 → 126 conflicts (10%)
- explained: 915/1300 conflicts by 3 root cause(s)
- metrics: hubs=99 (frac 0.971), conflicts/hub=13.1, max_incompat=14.8Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I84-A100 + I74-I80 + R37-Q41 — explain ~915/1300 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T88** — severity 182.30, 48 conflict(s); suspect input ~`K78` (group: pull_in)
  - pull-in (wants closer): E68@11.3Å(now 14.9,conf 0.55), E65@12.7Å(now 16.1,conf 0.55), M64@10.1Å(now 15.0,conf 0.55)
  - push-out (wants farther): G83@13.0Å(now 8.4,conf 1.00), Y47@27.5Å(now 18.0,conf 0.99), K24@27.5Å(now 16.1,conf 0.99), A95@9.1Å(now 6.0,conf 0.91), G76@27.1Å(now 12.7,conf 0.88), L93@8.6Å(now 5.2,conf 0.79), K78@25.3Å(now 9.2,conf 0.69), F81@18.1Å(now 8.8,conf 0.55), V10@16.7Å(now 12.1,conf 0.55), L97@14.1Å(now 10.0,conf 0.55), K4@10.0Å(now 5.7,conf 0.55)
  - D92↔K24: targets 5.0/27.5Å but partners are 13.5Å apart → too_close_together by 9.0Å
  - D92↔G76: targets 5.0/27.1Å but partners are 12.6Å apart → too_close_together by 9.6Å
  - D92↔K78: targets 5.0/25.3Å but partners are 8.7Å apart → too_close_together by 11.7Å
- **G76** — severity 114.61, 32 conflict(s); suspect input ~`T88` (group: pull_in)
  - pull-in (wants closer): A50@5.9Å(now 9.7,conf 0.55), T48@7.4Å(now 12.0,conf 0.55), G28@14.4Å(now 17.4,conf 0.55)
  - push-out (wants farther): V2@27.5Å(now 15.6,conf 1.00), A100@27.4Å(now 15.5,conf 0.94), T88@27.1Å(now 12.7,conf 0.88), N69@12.8Å(now 10.0,conf 0.82), P70@9.4Å(now 5.0,conf 0.79), I80@10.6Å(now 4.7,conf 0.79), F81@12.6Å(now 6.0,conf 0.79), A82@14.0Å(now 10.1,conf 0.72), G83@14.4Å(now 8.7,conf 0.69), E65@16.4Å(now 10.1,conf 0.55)
  - M79↔T88: targets 9.0/27.1Å but partners are 7.1Å apart → too_close_together by 11.0Å
  - V2↔M79: targets 27.5/9.0Å but partners are 10.4Å apart → too_close_together by 8.1Å
  - K71↔T88: targets 7.0/27.1Å but partners are 13.1Å apart → too_close_together by 7.1Å
- **K85** — severity 109.17, 29 conflict(s); suspect input ~`Q41` (group: pull_in)
  - pull-in (wants closer): K12@12.8Å(now 15.8,conf 0.55)
  - push-out (wants farther): M79@17.0Å(now 5.5,conf 1.00), I80@15.0Å(now 9.8,conf 1.00), P43@27.5Å(now 17.2,conf 1.00), F45@27.4Å(now 17.8,conf 0.96), Q41@26.7Å(now 11.3,conf 0.79), K78@19.4Å(now 10.0,conf 0.79), K6@17.1Å(now 13.2,conf 0.55), F81@11.7Å(now 4.7,conf 0.55)
  - E89↔Q41: targets 7.0/26.7Å but partners are 5.9Å apart → too_close_together by 13.8Å
  - E89↔P43: targets 7.0/27.5Å but partners are 12.6Å apart → too_close_together by 7.9Å
  - R90↔Q41: targets 7.1/26.7Å but partners are 10.6Å apart → too_close_together by 8.9Å
- **G5** — severity 103.08, 31 conflict(s); suspect input ~`L93` (group: pull_in)
  - pull-in (wants closer): I8@5.0Å(now 7.6,conf 0.94), L97@7.7Å(now 12.1,conf 0.55)
  - push-out (wants farther): D1@7.0Å(now 4.2,conf 0.99), V2@5.0Å(now 2.3,conf 0.99), N53@27.5Å(now 14.4,conf 0.98), T77@23.2Å(now 13.6,conf 0.75), K78@23.2Å(now 11.9,conf 0.75), W58@17.6Å(now 15.1,conf 0.55), L31@15.1Å(now 10.1,conf 0.55), L34@16.1Å(now 10.3,conf 0.55), K87@12.2Å(now 7.0,conf 0.55)
  - N53↔L93: targets 27.5/4.2Å but partners are 9.3Å apart → too_close_together by 13.9Å
  - K78↔L93: targets 23.2/4.2Å but partners are 7.3Å apart → too_close_together by 11.6Å
  - V2↔N53: targets 5.0/27.5Å but partners are 15.3Å apart → too_close_together by 7.2Å
- **A95** — severity 101.27, 45 conflict(s); suspect input ~`R37` (group: pull_in)
  - pull-in (wants closer): K98@5.0Å(now 10.6,conf 0.99), I8@11.3Å(now 14.1,conf 0.55), E60@8.5Å(now 15.9,conf 0.55), K7@11.9Å(now 15.1,conf 0.55)
  - push-out (wants farther): E89@9.0Å(now 6.5,conf 1.00), T88@9.1Å(now 6.0,conf 0.91), T77@23.2Å(now 13.9,conf 0.76), I74@21.8Å(now 15.9,conf 0.62), R37@16.7Å(now 6.3,conf 0.55), V19@13.2Å(now 6.1,conf 0.55), G36@14.5Å(now 9.6,conf 0.55), K87@12.5Å(now 9.0,conf 0.55), G33@14.0Å(now 4.8,conf 0.55)
  - K98↔K7: targets 5.0/11.9Å but partners are 25.4Å apart → too_far_apart by 8.4Å
  - T77↔R90: targets 23.2/8.8Å but partners are 6.8Å apart → too_close_together by 7.7Å
  - T77↔E91: targets 23.2/6.3Å but partners are 9.3Å apart → too_close_together by 7.6Å
- **Q11** — severity 100.87, 36 conflict(s); suspect input ~`Q41` (group: pull_in)
  - pull-in (wants closer): I80@15.1Å(now 19.5,conf 0.55), I94@14.5Å(now 19.2,conf 0.55), L97@13.8Å(now 20.9,conf 0.55), V19@14.0Å(now 17.4,conf 0.55)
  - push-out (wants farther): N53@27.5Å(now 20.5,conf 0.99), K7@7.0Å(now 4.1,conf 0.99), Q41@23.9Å(now 11.4,conf 0.74), G22@21.5Å(now 17.0,conf 0.61), K86@15.4Å(now 12.4,conf 0.55), K26@15.4Å(now 10.7,conf 0.55), K6@8.6Å(now 5.1,conf 0.55), V2@14.4Å(now 11.6,conf 0.55)
  - A14↔Q41: targets 7.0/23.9Å but partners are 6.8Å apart → too_close_together by 10.1Å
  - G5↔Q41: targets 9.0/23.9Å but partners are 7.2Å apart → too_close_together by 7.6Å
  - H17↔Q41: targets 11.0/23.9Å but partners are 5.7Å apart → too_close_together by 7.2Å

## Secondary Structure (DSSP-like)

- helix(H)=71 · strand(E)=20 · 3-10(G)=9 · coil(C)=2

```
EHHHHEHHHHHHHEHEHHHHEEECHGHGEEGHGGHEHHHGHEEEHHHHHHHHEEHHHHGHHGHHHHHHHHHHGHHHHHHHHEHHHHHHHEHEHHHHEHHCHE
```

## Backbone H-bond Network

- total=73 · helix(i→i+4)=37 · sheet=36
  - E3 ↔ K7  (helix)
  - K7 ↔ Q11  (helix)
  - I8 ↔ K12  (helix)
  - Q11 ↔ Q15  (helix)
  - C13 ↔ H17  (helix)
  - Q15 ↔ V19  (helix)
  - R37 ↔ Q41  (helix)
  - Q41 ↔ F45  (helix)
  - F45 ↔ D49  (helix)
  - T46 ↔ A50  (helix)
  - Y47 ↔ N51  (helix)
  - T48 ↔ K52  (helix)
  - K52 ↔ I56  (helix)
  - I56 ↔ E60  (helix)
  - T57 ↔ E61  (helix)
  - E60 ↔ M64  (helix)
  - E61 ↔ E65  (helix)
  - L63 ↔ L67  (helix)
  - M64 ↔ E68  (helix)
  - E65 ↔ N69  (helix)
  - … +53 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=32 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=836 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=563 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=7.5534 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=59 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
