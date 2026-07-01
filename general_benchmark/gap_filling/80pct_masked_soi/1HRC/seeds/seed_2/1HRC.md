# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HRC\seeds\seed_2\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 12.410 A
- tm_score_ca_ordered: 0.17683186843843854
- heavy_atom_rmsd: 13.164 A
- sidechain_heavy_atom_rmsd: 13.898 A
- **all-atom quality (honest):** heavy 13.164 A, sidechain 13.898 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 55
- distogram_pairs: 1043
- bin_accuracy: 0.325

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=63
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 12.41018189922595
- ga_delta_rmsd: -3.8858363169313623  ga_fitness_mode: energy
- pre_local_rmsd: 12.418617241863979  localized_anchor_rmsd: 12.410236997264619

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D1-A14 → 754 conflicts (57%); T88-K99 → 220 conflicts (17%); G44-D49 → 115 conflicts (9%)
- explained: 1089/1324 conflicts by 3 root cause(s)
- metrics: hubs=98 (frac 0.961), conflicts/hub=13.5, max_incompat=15.07Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D1-A14 + T88-K99 + G44-D49 — explain ~1089/1324 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V10** — severity 153.12, 61 conflict(s); suspect input ~`I56` (group: pull_in)
  - pull-in (wants closer): N102@17.6Å(now 22.9,conf 0.55), T88@16.7Å(now 21.1,conf 0.55), K98@15.2Å(now 22.1,conf 0.55), L97@11.5Å(now 16.7,conf 0.55), A100@12.4Å(now 18.9,conf 0.55)
  - push-out (wants farther): E3@9.0Å(now 3.5,conf 1.00), G55@27.4Å(now 17.8,conf 0.96), K6@6.6Å(now 3.7,conf 0.79), I56@26.5Å(now 12.1,conf 0.77), G5@8.0Å(now 4.6,conf 0.72), C16@10.0Å(now 6.9,conf 0.72), T27@15.1Å(now 9.1,conf 0.55), P29@15.3Å(now 8.5,conf 0.55), D1@14.5Å(now 7.1,conf 0.55), V2@12.5Å(now 6.8,conf 0.55), K4@10.4Å(now 5.6,conf 0.55), H25@15.8Å(now 10.2,conf 0.55), K26@14.1Å(now 9.8,conf 0.55)
  - A14↔I56: targets 5.0/26.5Å but partners are 10.6Å apart → too_close_together by 10.9Å
  - I56↔C13: targets 26.5/6.0Å but partners are 10.5Å apart → too_close_together by 10.0Å
  - I56↔G5: targets 26.5/8.0Å but partners are 9.4Å apart → too_close_together by 9.1Å
- **K7** — severity 145.36, 43 conflict(s); suspect input ~`T48` (group: pull_in)
  - pull-in (wants closer): K4@5.0Å(now 8.2,conf 0.99), K86@15.0Å(now 22.9,conf 0.55), Y96@9.2Å(now 17.8,conf 0.55), T88@13.3Å(now 23.5,conf 0.55), A95@11.9Å(now 17.4,conf 0.55)
  - push-out (wants farther): G55@27.5Å(now 20.7,conf 1.00), K54@27.5Å(now 20.3,conf 0.99), T48@27.5Å(now 17.6,conf 0.98), Q11@6.9Å(now 3.8,conf 0.91), C13@9.1Å(now 6.0,conf 0.91), L63@17.7Å(now 11.6,conf 0.55), M64@17.5Å(now 13.2,conf 0.55), L31@16.5Å(now 13.2,conf 0.55), Q15@12.8Å(now 7.4,conf 0.55), K12@8.5Å(now 5.6,conf 0.55), H17@14.1Å(now 10.4,conf 0.55)
  - K4↔T48: targets 5.0/27.5Å but partners are 11.1Å apart → too_close_together by 11.3Å
  - E3↔T48: targets 5.0/27.5Å but partners are 13.1Å apart → too_close_together by 9.4Å
  - G55↔K4: targets 27.5/5.0Å but partners are 14.2Å apart → too_close_together by 8.3Å
- **K85** — severity 127.08, 34 conflict(s); suspect input ~`E89` (group: pull_in)
  - pull-in (wants closer): K6@17.1Å(now 22.8,conf 0.55), K12@12.8Å(now 26.3,conf 0.55)
  - push-out (wants farther): M79@17.0Å(now 9.2,conf 1.00), I80@15.0Å(now 5.9,conf 1.00), P43@27.5Å(now 16.8,conf 1.00), F45@27.4Å(now 15.8,conf 0.96), Q41@26.7Å(now 21.2,conf 0.79), K78@19.6Å(now 12.9,conf 0.69), F81@11.7Å(now 8.9,conf 0.55)
  - F45↔E89: targets 27.4/7.0Å but partners are 8.8Å apart → too_close_together by 11.6Å
  - P43↔E89: targets 27.5/7.0Å but partners are 10.5Å apart → too_close_together by 10.0Å
  - R90↔F45: targets 7.0/27.4Å but partners are 11.1Å apart → too_close_together by 9.3Å
- **D49** — severity 111.51, 33 conflict(s); suspect input ~`K52` (group: push_out)
  - push-out (wants farther): E3@27.5Å(now 17.4,conf 1.00), K4@27.5Å(now 16.0,conf 1.00), K86@27.5Å(now 23.0,conf 0.99), G55@11.0Å(now 3.5,conf 0.99), I56@13.1Å(now 7.9,conf 0.91), K54@7.4Å(now 4.7,conf 0.79), E60@22.6Å(now 18.9,conf 0.69), L34@17.9Å(now 10.4,conf 0.55)
  - T46↔K4: targets 9.0/27.5Å but partners are 6.2Å apart → too_close_together by 12.3Å
  - T46↔E3: targets 9.0/27.5Å but partners are 8.5Å apart → too_close_together by 10.0Å
  - E3↔P43: targets 27.5/14.6Å but partners are 5.4Å apart → too_close_together by 7.6Å
- **T88** — severity 103.02, 32 conflict(s); suspect input ~`E91` (group: pull_in)
  - pull-in (wants closer): V10@16.7Å(now 21.1,conf 0.55), E68@11.3Å(now 16.1,conf 0.55), K7@13.3Å(now 23.5,conf 0.55), K4@10.0Å(now 16.4,conf 0.55)
  - push-out (wants farther): Y47@27.5Å(now 15.0,conf 0.99), G83@13.0Å(now 9.6,conf 0.99), G76@27.1Å(now 17.4,conf 0.88), A82@16.0Å(now 12.3,conf 0.72), K78@25.3Å(now 11.4,conf 0.69), F81@18.1Å(now 9.8,conf 0.55)
  - Y47↔L93: targets 27.5/9.0Å but partners are 7.4Å apart → too_close_together by 11.1Å
  - Y47↔D92: targets 27.5/6.6Å but partners are 10.0Å apart → too_close_together by 10.9Å
  - Y47↔A95: targets 27.5/10.9Å but partners are 7.4Å apart → too_close_together by 9.2Å
- **G5** — severity 100.45, 29 conflict(s); suspect input ~`L93` (group: pull_in)
  - pull-in (wants closer): I8@5.0Å(now 7.8,conf 0.99), Q11@9.1Å(now 11.6,conf 0.91), F9@6.0Å(now 9.8,conf 0.72), L93@4.2Å(now 10.1,conf 0.63), L97@7.7Å(now 12.2,conf 0.55), K87@12.2Å(now 18.2,conf 0.55)
  - push-out (wants farther): N53@27.5Å(now 17.8,conf 0.98), D1@6.9Å(now 4.1,conf 0.91), T77@23.2Å(now 19.0,conf 0.75), K78@23.2Å(now 18.3,conf 0.75), V10@8.0Å(now 4.6,conf 0.72), W58@17.6Å(now 5.8,conf 0.55), L31@15.1Å(now 9.6,conf 0.55), L67@13.2Å(now 10.3,conf 0.55), L34@16.1Å(now 8.5,conf 0.55), L63@13.7Å(now 6.3,conf 0.55)
  - N53↔V2: targets 27.5/4.9Å but partners are 15.7Å apart → too_close_together by 6.8Å
  - F9↔L93: targets 6.0/4.2Å but partners are 19.6Å apart → too_far_apart by 9.3Å
  - N53↔D1: targets 27.5/6.9Å but partners are 14.5Å apart → too_close_together by 6.1Å

## Secondary Structure (DSSP-like)

- helix(H)=53 · strand(E)=33 · 3-10(G)=13 · coil(C)=3

```
EEHHEHHHHHHGHHHEHHCEGGGEEECHEEEHHHGHEHGGHCHHHHHHHHHHHHHHGEEHEGGHEHHGHHHHEEEHEEEHHEEGEEHHHEGEHHEHEHEEHE
```

## Backbone H-bond Network

- total=93 · helix(i→i+4)=27 · sheet=66
  - E3 ↔ K7  (helix)
  - K4 ↔ I8  (helix)
  - K6 ↔ V10  (helix)
  - K7 ↔ Q11  (helix)
  - F9 ↔ C13  (helix)
  - Q11 ↔ Q15  (helix)
  - C13 ↔ H17  (helix)
  - G28 ↔ H32  (helix)
  - H32 ↔ G36  (helix)
  - L34 ↔ K38  (helix)
  - P43 ↔ Y47  (helix)
  - G44 ↔ T48  (helix)
  - T46 ↔ A50  (helix)
  - Y47 ↔ N51  (helix)
  - T48 ↔ K52  (helix)
  - D49 ↔ N53  (helix)
  - A50 ↔ K54  (helix)
  - N51 ↔ G55  (helix)
  - K52 ↔ I56  (helix)
  - I56 ↔ E60  (helix)
  - … +73 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=42 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=661 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=429 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.308 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=55 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
