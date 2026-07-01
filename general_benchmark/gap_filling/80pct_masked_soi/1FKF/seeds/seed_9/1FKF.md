# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1FKF\seeds\seed_9\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 11.470 A
- tm_score_ca_ordered: 0.18367068529898506
- heavy_atom_rmsd: 12.682 A
- sidechain_heavy_atom_rmsd: 13.830 A
- **all-atom quality (honest):** heavy 12.682 A, sidechain 13.830 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 73
- distogram_pairs: 1088
- bin_accuracy: 0.293

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 11.469973473313255
- ga_delta_rmsd: 0.2998145858075958  ga_fitness_mode: energy
- pre_local_rmsd: 11.470425916409807  localized_anchor_rmsd: 11.46995125804605

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G18-S38 → 1196 conflicts (70%); E4-I6 → 148 conflicts (9%)
- explained: 1344/1716 conflicts by 2 root cause(s)
- metrics: hubs=102 (frac 0.971), conflicts/hub=16.8, max_incompat=17.1Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G18-S38 + E4-I6 — explain ~1344/1716 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E30** — severity 241.50, 61 conflict(s); suspect input ~`C21` (group: pull_in)
  - pull-in (wants closer): V97@6.2Å(now 14.6,conf 0.55), G82@14.8Å(now 18.3,conf 0.55), T74@8.4Å(now 13.7,conf 0.55), P77@11.6Å(now 16.2,conf 0.55), A94@8.1Å(now 19.4,conf 0.55), G85@14.2Å(now 18.3,conf 0.55)
  - push-out (wants farther): K51@27.4Å(now 13.3,conf 0.94), P15@26.9Å(now 14.6,conf 0.82), S37@15.2Å(now 9.3,conf 0.82), M48@26.6Å(now 10.2,conf 0.78), F47@23.6Å(now 7.3,conf 0.76), C21@24.4Å(now 13.1,conf 0.71), D40@19.7Å(now 12.3,conf 0.57), G57@15.0Å(now 5.6,conf 0.55), W58@16.3Å(now 5.5,conf 0.55)
  - P15↔K34: targets 26.9/9.4Å but partners are 5.8Å apart → too_close_together by 11.7Å
  - P15↔G27: targets 26.9/9.2Å but partners are 7.6Å apart → too_close_together by 10.1Å
  - G27↔C21: targets 9.2/24.4Å but partners are 3.6Å apart → too_close_together by 11.6Å
- **M48** — severity 239.46, 45 conflict(s); suspect input ~`E30` (group: pull_in)
  - pull-in (wants closer): K51@8.9Å(now 11.8,conf 0.91), E53@5.1Å(now 7.7,conf 0.91), T20@4.8Å(now 11.6,conf 0.58)
  - push-out (wants farther): D31@27.5Å(now 14.2,conf 0.99), G32@27.2Å(now 9.7,conf 0.90), E30@26.6Å(now 10.2,conf 0.78), K34@23.6Å(now 13.8,conf 0.76), A63@10.6Å(now 6.7,conf 0.55), V62@10.6Å(now 6.0,conf 0.55), E60@12.1Å(now 3.8,conf 0.55)
  - E53↔G32: targets 5.1/27.2Å but partners are 7.5Å apart → too_close_together by 14.7Å
  - F45↔D31: targets 11.0/27.5Å but partners are 3.8Å apart → too_close_together by 12.7Å
  - E53↔E30: targets 5.1/26.6Å but partners are 6.5Å apart → too_close_together by 14.9Å
- **K33** — severity 208.60, 47 conflict(s); suspect input ~`C21` (group: pull_in)
  - pull-in (wants closer): P92@15.4Å(now 23.3,conf 0.55), V97@9.6Å(now 13.9,conf 0.55), A94@12.0Å(now 20.9,conf 0.55)
  - push-out (wants farther): G27@7.0Å(now 4.5,conf 1.00), R17@27.5Å(now 10.9,conf 1.00), G50@27.5Å(now 11.9,conf 1.00), S38@14.6Å(now 9.7,conf 0.79), C21@25.0Å(now 7.0,conf 0.69), V23@20.1Å(now 11.8,conf 0.58), R41@17.6Å(now 14.8,conf 0.55), R39@15.4Å(now 12.1,conf 0.55), S37@11.5Å(now 7.2,conf 0.55), D99@12.3Å(now 7.8,conf 0.55), T26@10.2Å(now 6.4,conf 0.55)
  - M28↔R17: targets 5.0/27.5Å but partners are 6.3Å apart → too_close_together by 16.2Å
  - G50↔L29: targets 27.5/5.0Å but partners are 9.7Å apart → too_close_together by 12.8Å
  - G27↔R17: targets 7.0/27.5Å but partners are 8.8Å apart → too_close_together by 11.7Å
- **G18** — severity 205.37, 57 conflict(s); suspect input ~`C21` (group: pull_in)
  - pull-in (wants closer): G50@7.0Å(now 15.6,conf 0.55), Q52@12.1Å(now 17.2,conf 0.55)
  - push-out (wants farther): H24@19.0Å(now 15.9,conf 1.00), G32@27.5Å(now 9.8,conf 1.00), F35@27.5Å(now 13.1,conf 0.99), G11@18.9Å(now 14.2,conf 0.91), Y25@20.9Å(now 12.2,conf 0.91), I6@26.5Å(now 10.1,conf 0.77), T26@23.3Å(now 11.9,conf 0.76), G27@23.8Å(now 7.7,conf 0.75), F47@9.6Å(now 4.8,conf 0.55), M65@15.8Å(now 12.7,conf 0.55)
  - P15↔I6: targets 7.4/26.5Å but partners are 7.4Å apart → too_close_together by 11.7Å
  - F35↔P15: targets 27.5/7.4Å but partners are 10.1Å apart → too_close_together by 10.0Å
  - V22↔F35: targets 13.0/27.5Å but partners are 7.4Å apart → too_close_together by 7.1Å
- **G27** — severity 180.88, 62 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): D36@5.3Å(now 9.5,conf 0.56), L96@7.1Å(now 17.7,conf 0.55), P87@15.3Å(now 19.7,conf 0.55), D40@11.4Å(now 15.6,conf 0.55)
  - push-out (wants farther): K33@7.0Å(now 4.5,conf 1.00), C21@17.0Å(now 3.6,conf 0.99), V23@12.9Å(now 8.8,conf 0.91), G18@23.8Å(now 7.7,conf 0.75), K16@23.0Å(now 8.7,conf 0.73), T20@20.0Å(now 4.3,conf 0.72), V22@16.0Å(now 6.3,conf 0.72), Q19@22.5Å(now 7.7,conf 0.68), L103@16.9Å(now 7.8,conf 0.55), Q69@16.7Å(now 11.2,conf 0.55), E4@14.8Å(now 11.7,conf 0.55), T5@15.8Å(now 8.8,conf 0.55), V62@14.2Å(now 6.5,conf 0.55), E101@12.0Å(now 5.4,conf 0.55)
  - C21↔K34: targets 17.0/5.0Å but partners are 3.5Å apart → too_close_together by 8.5Å
  - K34↔K16: targets 5.0/23.0Å but partners are 6.6Å apart → too_close_together by 11.4Å
  - K34↔G18: targets 5.0/23.8Å but partners are 8.9Å apart → too_close_together by 9.9Å
- **M28** — severity 159.91, 54 conflict(s); suspect input ~`T95` (group: pull_in)
  - pull-in (wants closer): F35@5.6Å(now 8.2,conf 0.56), Y79@15.2Å(now 19.5,conf 0.55), T95@9.2Å(now 22.2,conf 0.55), Y81@13.6Å(now 20.1,conf 0.55), G88@14.2Å(now 18.7,conf 0.55)
  - push-out (wants farther): V22@19.0Å(now 9.4,conf 1.00), V23@17.0Å(now 11.4,conf 0.99), K51@23.6Å(now 17.9,conf 0.76), Q52@21.3Å(now 15.6,conf 0.60), C21@20.4Å(now 5.3,conf 0.59), A63@20.3Å(now 8.2,conf 0.59), Q64@20.2Å(now 11.3,conf 0.58), P44@17.2Å(now 5.0,conf 0.55), V3@14.9Å(now 6.5,conf 0.55), V1@14.6Å(now 11.7,conf 0.55), S38@12.4Å(now 7.9,conf 0.55), I6@15.9Å(now 7.9,conf 0.55)
  - K34↔C21: targets 4.6/20.4Å but partners are 3.5Å apart → too_close_together by 12.4Å
  - V22↔K34: targets 19.0/4.6Å but partners are 6.6Å apart → too_close_together by 7.8Å
  - K33↔A63: targets 5.0/20.3Å but partners are 5.1Å apart → too_close_together by 10.2Å

## Secondary Structure (DSSP-like)

- helix(H)=46 · strand(E)=34 · 3-10(G)=17 · coil(C)=8

```
CEEEGHHEEHHHEHEHHHGHGEHGGHEHHHHEHEHGHHEHEHEEGGECEEHCGHGHHEHHHGHGHEHEGEECGHGEHHHHHHHHEHHECEEEGECEGEEEHCHHC
```

## Backbone H-bond Network

- total=86 · helix(i→i+4)=19 · sheet=67
  - I6 ↔ D10  (helix)
  - D10 ↔ F14  (helix)
  - R12 ↔ K16  (helix)
  - F14 ↔ G18  (helix)
  - K16 ↔ T20  (helix)
  - T26 ↔ E30  (helix)
  - D31 ↔ F35  (helix)
  - S38 ↔ N42  (helix)
  - R56 ↔ E60  (helix)
  - G57 ↔ G61  (helix)
  - E59 ↔ A63  (helix)
  - G61 ↔ M65  (helix)
  - A63 ↔ V67  (helix)
  - T74 ↔ D78  (helix)
  - P77 ↔ Y81  (helix)
  - D78 ↔ G82  (helix)
  - Y79 ↔ A83  (helix)
  - G82 ↔ H86  (helix)
  - A83 ↔ P87  (helix)
  - Q2 ↔ P8  (sheet)
  - … +66 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=47 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=890 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=690 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=7.1912 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=73 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
