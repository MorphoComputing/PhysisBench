# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1FKF\seeds\seed_8\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 9.226 A
- tm_score_ca_ordered: 0.2819733190564796
- heavy_atom_rmsd: 10.225 A
- sidechain_heavy_atom_rmsd: 11.202 A
- **all-atom quality (honest):** heavy 10.225 A, sidechain 11.202 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 70
- distogram_pairs: 1087
- bin_accuracy: 0.306

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=740 mode=rotamer
- phase_b_ca_rmsd_after: 9.226259845761916
- ga_delta_rmsd: 3.0124844277673155  ga_fitness_mode: energy
- pre_local_rmsd: 9.232599610429755  localized_anchor_rmsd: 9.226305627363898

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F98-L103 → 366 conflicts (31%); E4-P8 → 282 conflicts (24%); Y79-G88 → 199 conflicts (17%)
- explained: 847/1188 conflicts by 3 root cause(s)
- metrics: hubs=96 (frac 0.914), conflicts/hub=12.4, max_incompat=14.06Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F98-L103 + E4-P8 + Y79-G88 — explain ~847/1188 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P8** — severity 161.85, 39 conflict(s); suspect input ~`T5` (group: pull_in)
  - pull-in (wants closer): R70@6.7Å(now 11.0,conf 0.55), K72@11.8Å(now 15.3,conf 0.55)
  - push-out (wants farther): P15@15.0Å(now 6.9,conf 1.00), P87@27.5Å(now 14.7,conf 1.00), A83@27.5Å(now 12.1,conf 1.00), G85@27.5Å(now 19.6,conf 1.00), G82@27.5Å(now 15.5,conf 1.00), T13@11.0Å(now 7.5,conf 0.94), Q2@15.5Å(now 12.9,conf 0.55), A63@14.3Å(now 10.4,conf 0.55)
  - E4↔P87: targets 9.0/27.5Å but partners are 5.9Å apart → too_close_together by 12.6Å
  - E4↔A83: targets 9.0/27.5Å but partners are 6.7Å apart → too_close_together by 11.8Å
  - E4↔G82: targets 9.0/27.5Å but partners are 8.7Å apart → too_close_together by 9.8Å
- **P92** — severity 145.92, 34 conflict(s); suspect input ~`E101` (group: push_out)
  - push-out (wants farther): L96@11.0Å(now 7.6,conf 1.00), L105@27.5Å(now 17.4,conf 1.00), F98@17.0Å(now 12.0,conf 0.99), D99@20.9Å(now 11.0,conf 0.91), E101@27.0Å(now 12.4,conf 0.85), V100@22.6Å(now 13.8,conf 0.69), I55@15.2Å(now 12.4,conf 0.55)
  - E101↔H86: targets 27.0/7.3Å but partners are 6.4Å apart → too_close_together by 13.3Å
  - P87↔E101: targets 11.0/27.0Å but partners are 3.9Å apart → too_close_together by 12.2Å
  - E101↔G88: targets 27.0/11.1Å but partners are 3.5Å apart → too_close_together by 12.4Å
- **P91** — severity 120.39, 30 conflict(s); suspect input ~`H86` (group: pull_in)
  - pull-in (wants closer): H86@5.0Å(now 8.9,conf 0.94), G88@7.9Å(now 11.2,conf 0.55)
  - push-out (wants farther): L105@27.5Å(now 17.8,conf 1.00), F14@27.5Å(now 23.3,conf 1.00), K16@27.5Å(now 23.8,conf 1.00), L96@10.9Å(now 8.1,conf 0.91), T95@9.2Å(now 6.4,conf 0.82), F98@15.2Å(now 11.7,conf 0.82), V100@21.2Å(now 13.5,conf 0.60), R56@17.9Å(now 10.4,conf 0.55), S76@12.8Å(now 8.7,conf 0.55)
  - L105↔H86: targets 27.5/5.0Å but partners are 11.0Å apart → too_close_together by 11.5Å
  - L105↔P87: targets 27.5/9.0Å but partners are 9.3Å apart → too_close_together by 9.2Å
  - L105↔G85: targets 27.5/3.1Å but partners are 16.2Å apart → too_close_together by 8.2Å
- **V67** — severity 107.41, 41 conflict(s); suspect input ~`L102` (group: pull_in)
  - pull-in (wants closer): G9@5.2Å(now 11.4,conf 0.57), L102@5.5Å(now 10.7,conf 0.56), V100@11.2Å(now 15.2,conf 0.55), T20@12.1Å(now 16.1,conf 0.55)
  - push-out (wants farther): G88@27.5Å(now 19.7,conf 1.00), G85@27.5Å(now 22.6,conf 1.00), D78@27.1Å(now 23.4,conf 0.88), Q64@10.2Å(now 7.4,conf 0.55)
  - G88↔L102: targets 27.5/5.5Å but partners are 9.1Å apart → too_close_together by 12.9Å
  - G88↔V100: targets 27.5/11.2Å but partners are 4.6Å apart → too_close_together by 11.7Å
  - G88↔G9: targets 27.5/5.2Å but partners are 13.2Å apart → too_close_together by 9.1Å
- **E53** — severity 103.04, 29 conflict(s); suspect input ~`I6` (group: push_out)
  - push-out (wants farther): E60@11.0Å(now 8.3,conf 0.99), I6@24.5Å(now 5.9,conf 0.71), V3@19.6Å(now 6.6,conf 0.57), L73@17.1Å(now 11.9,conf 0.55), L102@16.5Å(now 4.3,conf 0.55), H86@15.6Å(now 9.7,conf 0.55), G57@11.5Å(now 8.0,conf 0.55), V100@16.2Å(now 8.1,conf 0.55)
  - E59↔I6: targets 7.0/24.5Å but partners are 6.1Å apart → too_close_together by 11.4Å
  - W58↔I6: targets 9.0/24.5Å but partners are 4.1Å apart → too_close_together by 11.4Å
  - M48↔I6: targets 5.1/24.5Å but partners are 8.3Å apart → too_close_together by 11.1Å
- **Q52** — severity 98.06, 25 conflict(s); suspect input ~`E4` (group: pull_in)
  - pull-in (wants closer): G18@12.1Å(now 17.0,conf 0.55)
  - push-out (wants farther): W58@11.0Å(now 8.5,conf 0.99), R56@9.1Å(now 6.4,conf 0.91), G57@12.9Å(now 8.2,conf 0.91), E4@23.1Å(now 7.3,conf 0.74), T5@24.0Å(now 7.5,conf 0.73), Q64@17.2Å(now 4.1,conf 0.55), H86@16.6Å(now 8.6,conf 0.55), E59@8.3Å(now 4.5,conf 0.55), V62@13.7Å(now 7.0,conf 0.55)
  - T5↔M48: targets 24.0/8.0Å but partners are 3.6Å apart → too_close_together by 12.4Å
  - I55↔E4: targets 7.4/23.1Å but partners are 5.5Å apart → too_close_together by 10.1Å
  - E4↔M48: targets 23.1/8.0Å but partners are 4.9Å apart → too_close_together by 10.2Å

## Secondary Structure (DSSP-like)

- helix(H)=56 · strand(E)=32 · 3-10(G)=8 · coil(C)=9

```
CEHEHHHHEHHHHHHHHHGHECEGEHCECEHGEHGHEHHHEEHEEEECHEHEHHHHEHEHHHHHHHEHEGGHCEGCHHHHHHHGHECHEEEHEHECHEHHHHEHE
```

## Backbone H-bond Network

- total=84 · helix(i→i+4)=28 · sheet=56
  - V3 ↔ S7  (helix)
  - I6 ↔ D10  (helix)
  - S7 ↔ G11  (helix)
  - P8 ↔ R12  (helix)
  - D10 ↔ F14  (helix)
  - G11 ↔ P15  (helix)
  - R12 ↔ K16  (helix)
  - T13 ↔ R17  (helix)
  - F14 ↔ G18  (helix)
  - K16 ↔ T20  (helix)
  - D36 ↔ D40  (helix)
  - L49 ↔ E53  (helix)
  - K51 ↔ I55  (helix)
  - V54 ↔ W58  (helix)
  - R56 ↔ E60  (helix)
  - W58 ↔ V62  (helix)
  - E60 ↔ Q64  (helix)
  - G61 ↔ M65  (helix)
  - V62 ↔ S66  (helix)
  - Q64 ↔ G68  (helix)
  - … +64 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=40 · exposed=34 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=877 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=674 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.5168 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=70 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
