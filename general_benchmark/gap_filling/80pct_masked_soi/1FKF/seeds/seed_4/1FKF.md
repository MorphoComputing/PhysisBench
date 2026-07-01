# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1FKF\seeds\seed_4\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 11.834 A
- tm_score_ca_ordered: 0.23594138874681955
- heavy_atom_rmsd: 12.763 A
- sidechain_heavy_atom_rmsd: 13.655 A
- **all-atom quality (honest):** heavy 12.763 A, sidechain 13.655 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 44
- distogram_pairs: 1093
- bin_accuracy: 0.350

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 11.833541613294543
- ga_delta_rmsd: -2.9505239755197064  ga_fitness_mode: energy
- pre_local_rmsd: 11.833514583790425  localized_anchor_rmsd: 11.833514583790425

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S66-K72 → 236 conflicts (33%); M48-E53 → 150 conflicts (21%); F98-L102 → 88 conflicts (12%)
- explained: 474/721 conflicts by 3 root cause(s)
- metrics: hubs=93 (frac 0.886), conflicts/hub=7.8, max_incompat=10.05Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S66-K72 + M48-E53 + F98-L102 — explain ~474/721 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **M48** — severity 79.30, 23 conflict(s); suspect input ~`K51` (group: pull_in)
  - pull-in (wants closer): T20@4.8Å(now 12.8,conf 0.58), Q69@17.4Å(now 23.4,conf 0.55), A63@10.6Å(now 14.0,conf 0.55)
  - push-out (wants farther): D31@27.5Å(now 16.2,conf 0.99), G32@27.2Å(now 16.1,conf 0.90), Q52@7.4Å(now 3.6,conf 0.79), V54@8.6Å(now 3.6,conf 0.79), E30@26.6Å(now 17.9,conf 0.78), K34@23.6Å(now 16.3,conf 0.76), I55@11.8Å(now 6.2,conf 0.55)
  - D31↔E53: targets 27.5/5.1Å but partners are 12.9Å apart → too_close_together by 9.5Å
  - E53↔G32: targets 5.1/27.2Å but partners are 13.4Å apart → too_close_together by 8.7Å
  - G32↔K51: targets 27.2/8.6Å but partners are 10.3Å apart → too_close_together by 8.4Å
- **G18** — severity 69.68, 21 conflict(s); suspect input ~`I6` (group: pull_in)
  - pull-in (wants closer): G50@7.0Å(now 23.5,conf 0.55), F47@9.6Å(now 13.1,conf 0.55), Q52@12.1Å(now 18.7,conf 0.55)
  - push-out (wants farther): H24@19.0Å(now 16.3,conf 1.00), V22@13.0Å(now 10.3,conf 0.99), I6@26.5Å(now 16.6,conf 0.77), T26@23.3Å(now 20.1,conf 0.76)
  - P15↔I6: targets 7.4/26.5Å but partners are 9.0Å apart → too_close_together by 10.1Å
  - V23↔I6: targets 15.0/26.5Å but partners are 4.2Å apart → too_close_together by 7.4Å
  - T13↔I6: targets 13.2/26.5Å but partners are 6.1Å apart → too_close_together by 7.2Å
- **L102** — severity 53.92, 19 conflict(s); suspect input ~`P44` (group: pull_in)
  - pull-in (wants closer): G68@5.4Å(now 10.5,conf 0.56), V67@5.5Å(now 10.5,conf 0.56), E53@16.5Å(now 20.1,conf 0.55), P44@9.7Å(now 14.6,conf 0.55)
  - push-out (wants farther): L96@19.0Å(now 15.5,conf 0.99), F98@13.0Å(now 8.7,conf 0.99), L105@8.9Å(now 5.6,conf 0.91), H93@27.2Å(now 21.0,conf 0.90), R17@15.0Å(now 10.6,conf 0.55), T13@10.5Å(now 3.7,conf 0.55), T74@15.9Å(now 10.8,conf 0.55), F14@9.8Å(now 7.1,conf 0.55), L73@12.1Å(now 9.6,conf 0.55), G11@12.1Å(now 5.7,conf 0.55)
  - G68↔P44: targets 5.4/9.7Å but partners are 23.6Å apart → too_far_apart by 8.5Å
  - G68↔D36: targets 5.4/17.0Å but partners are 29.6Å apart → too_far_apart by 7.2Å
  - G68↔S38: targets 5.4/12.6Å but partners are 24.9Å apart → too_far_apart by 6.9Å
- **E30** — severity 49.31, 20 conflict(s); suspect input ~`K51` (group: pull_in)
  - pull-in (wants closer): V97@6.2Å(now 10.1,conf 0.55), A71@15.2Å(now 21.5,conf 0.55), L73@11.2Å(now 17.6,conf 0.55), T74@8.4Å(now 14.4,conf 0.55), P77@11.6Å(now 15.3,conf 0.55), E4@14.4Å(now 19.1,conf 0.55), I75@9.9Å(now 14.0,conf 0.55)
  - push-out (wants farther): K51@27.4Å(now 13.8,conf 0.94), P15@26.9Å(now 23.5,conf 0.82), M48@26.6Å(now 17.9,conf 0.78), F47@23.6Å(now 19.5,conf 0.76), G88@17.1Å(now 11.9,conf 0.55), G85@14.2Å(now 8.9,conf 0.55)
  - K33↔K51: targets 7.0/27.4Å but partners are 14.4Å apart → too_close_together by 5.9Å
  - K51↔K34: targets 27.4/9.2Å but partners are 11.7Å apart → too_close_together by 6.5Å
  - G27↔K51: targets 9.0/27.4Å but partners are 13.2Å apart → too_close_together by 5.2Å
- **D99** — severity 48.60, 20 conflict(s); suspect input ~`K34` (group: pull_in)
  - pull-in (wants closer): G68@13.1Å(now 19.1,conf 0.55), V67@14.6Å(now 19.7,conf 0.55), Q69@10.6Å(now 15.7,conf 0.55), D31@13.4Å(now 16.3,conf 0.55), K34@10.5Å(now 13.1,conf 0.55)
  - push-out (wants farther): H93@19.0Å(now 14.6,conf 0.99), K104@15.4Å(now 10.9,conf 0.79), L105@16.6Å(now 12.8,conf 0.79), P92@19.8Å(now 16.5,conf 0.69), F14@17.6Å(now 11.4,conf 0.55), P15@17.3Å(now 13.7,conf 0.55), I90@16.6Å(now 8.9,conf 0.55), A94@16.1Å(now 13.2,conf 0.55)
  - G68↔K33: targets 13.1/12.3Å but partners are 32.8Å apart → too_far_apart by 7.5Å
  - G68↔K34: targets 13.1/10.5Å but partners are 30.6Å apart → too_far_apart by 7.0Å
  - Q69↔K33: targets 10.6/12.3Å but partners are 29.6Å apart → too_far_apart by 6.7Å
- **T20** — severity 48.08, 23 conflict(s); suspect input ~`I6` (group: pull_in)
  - pull-in (wants closer): M48@4.8Å(now 12.8,conf 0.58), F47@5.5Å(now 10.5,conf 0.56), K46@6.3Å(now 11.9,conf 0.55), L49@7.5Å(now 15.6,conf 0.55)
  - push-out (wants farther): K16@9.0Å(now 3.8,conf 1.00), T26@19.0Å(now 14.6,conf 0.99), G27@21.0Å(now 16.9,conf 0.99), T13@13.4Å(now 7.2,conf 0.79), F14@9.8Å(now 4.2,conf 0.69), I6@22.1Å(now 12.5,conf 0.64), R70@17.1Å(now 12.0,conf 0.55), R12@16.7Å(now 10.9,conf 0.55), Q64@14.9Å(now 11.1,conf 0.55), P15@8.2Å(now 3.8,conf 0.55), E59@12.0Å(now 9.3,conf 0.55)
  - V23↔I6: targets 10.0/22.1Å but partners are 4.2Å apart → too_close_together by 7.9Å
  - M48↔V67: targets 4.8/12.1Å but partners are 23.1Å apart → too_far_apart by 6.2Å
  - H24↔I6: targets 13.0/22.1Å but partners are 4.0Å apart → too_close_together by 5.1Å

## Secondary Structure (DSSP-like)

- helix(H)=60 · strand(E)=27 · 3-10(G)=14 · coil(C)=4

```
CEHHEHHEEHHHGHHHHHEHECEEEGEEGGHHHEHGEHHHEHEEHHHHHHHGGHHHHHGHHEHHHHHGECEGHHHEEHHHEGHHHEHHHEGGHHGEHHEHHHHEC
```

## Backbone H-bond Network

- total=73 · helix(i→i+4)=24 · sheet=49
  - V3 ↔ S7  (helix)
  - I6 ↔ D10  (helix)
  - S7 ↔ G11  (helix)
  - D10 ↔ F14  (helix)
  - G11 ↔ P15  (helix)
  - R12 ↔ K16  (helix)
  - F14 ↔ G18  (helix)
  - K16 ↔ T20  (helix)
  - D31 ↔ F35  (helix)
  - F35 ↔ R39  (helix)
  - N42 ↔ K46  (helix)
  - K46 ↔ G50  (helix)
  - G50 ↔ V54  (helix)
  - V54 ↔ W58  (helix)
  - R56 ↔ E60  (helix)
  - G57 ↔ G61  (helix)
  - E60 ↔ Q64  (helix)
  - A63 ↔ V67  (helix)
  - T74 ↔ D78  (helix)
  - Y79 ↔ A83  (helix)
  - … +53 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=47 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=537 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=341 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.659 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=44 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
