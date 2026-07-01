# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1FKF\sequence\1FKF.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1FKF\seeds\seed_1\1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 2.137 A
- tm_score_ca_ordered: 0.857034515961646
- heavy_atom_rmsd: 3.511 A
- sidechain_heavy_atom_rmsd: 4.334 A
- **all-atom quality (honest):** heavy 3.511 A, sidechain 4.334 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 3442
- bin_accuracy: 0.586

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=2.4344778713178954 -> 2.193703887026326 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.136857763725984
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.140455132083298  localized_anchor_rmsd: 2.136844533663606

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P87-A94 → 282 conflicts (54%); T84 → 49 conflicts (9%)
- explained: 331/521 conflicts by 2 root cause(s)
- metrics: hubs=71 (frac 0.676), conflicts/hub=7.3, max_incompat=7.43Å, chain_span=0.981
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P87-A94 + T84 — explain ~331/521 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D36** — severity 26.47, 22 conflict(s); suspect input ~`P91` (group: push_out)
  - pull-in (wants closer): Y79@15.7Å(now 19.3,conf 0.34), P92@16.7Å(now 19.6,conf 0.35), I90@9.9Å(now 13.3,conf 0.34), G88@12.1Å(now 14.7,conf 0.34), P91@12.6Å(now 18.1,conf 0.34), P87@13.4Å(now 16.5,conf 0.34)
  - push-out (wants farther): F47@18.6Å(now 15.9,conf 0.37)
  - P91↔D40: targets 12.6/6.7Å but partners are 25.9Å apart → too_far_apart by 6.7Å
  - R41↔P91: targets 8.2/12.6Å but partners are 27.2Å apart → too_far_apart by 6.5Å
  - I90↔D40: targets 9.9/6.7Å but partners are 21.5Å apart → too_far_apart by 4.9Å
- **S76** — severity 25.84, 22 conflict(s); suspect input ~`H93` (group: pull_in)
  - pull-in (wants closer): N42@26.4Å(now 28.9,conf 0.73), P44@22.0Å(now 24.5,conf 0.47), T20@22.1Å(now 25.2,conf 0.47), Y81@8.3Å(now 10.9,conf 0.35)
  - push-out (wants farther): G88@18.4Å(now 11.9,conf 0.37), P87@18.0Å(now 9.8,conf 0.36), K72@15.2Å(now 12.2,conf 0.34), T84@15.1Å(now 6.4,conf 0.34), P91@12.9Å(now 8.1,conf 0.34), I90@14.6Å(now 11.0,conf 0.34), P92@11.4Å(now 6.8,conf 0.34)
  - P87↔H93: targets 18.0/7.4Å but partners are 3.5Å apart → too_close_together by 7.1Å
  - P87↔A94: targets 18.0/8.7Å but partners are 3.1Å apart → too_close_together by 6.2Å
  - T95↔P87: targets 5.3/18.0Å but partners are 7.0Å apart → too_close_together by 5.7Å
- **G27** — severity 23.69, 26 conflict(s); suspect input ~`R39` (group: pull_in)
  - pull-in (wants closer): I90@7.8Å(now 11.6,conf 0.36), G82@13.2Å(now 16.1,conf 0.34), T74@7.9Å(now 10.8,conf 0.35)
  - push-out (wants farther): D99@9.4Å(now 5.4,conf 0.34), L103@18.8Å(now 16.1,conf 0.38), R70@14.9Å(now 12.2,conf 0.34), E30@12.6Å(now 9.8,conf 0.34)
  - R39↔I90: targets 8.6/7.8Å but partners are 21.4Å apart → too_far_apart by 5.0Å
  - R39↔G82: targets 8.6/13.2Å but partners are 25.9Å apart → too_far_apart by 4.0Å
  - G88↔I90: targets 14.0/7.8Å but partners are 2.3Å apart → too_close_together by 3.9Å
- **E30** — severity 22.38, 20 conflict(s); suspect input ~`A94` (group: pull_in)
  - pull-in (wants closer): G18@27.4Å(now 30.3,conf 0.97), P77@9.4Å(now 12.7,conf 0.34)
  - push-out (wants farther): P87@18.5Å(now 12.7,conf 0.37), G88@18.4Å(now 11.4,conf 0.37), T84@18.4Å(now 15.0,conf 0.37), G61@18.2Å(now 15.2,conf 0.37), G27@12.6Å(now 9.8,conf 0.34)
  - P87↔A94: targets 18.5/8.3Å but partners are 3.1Å apart → too_close_together by 7.2Å
  - G88↔A94: targets 18.4/8.3Å but partners are 4.3Å apart → too_close_together by 5.9Å
  - T84↔P77: targets 18.4/9.4Å but partners are 3.3Å apart → too_close_together by 5.7Å
- **P77** — severity 20.61, 16 conflict(s); suspect input ~`P87` (group: push_out)
  - pull-in (wants closer): N42@26.7Å(now 29.5,conf 0.78), V22@22.7Å(now 25.2,conf 0.48), P15@21.0Å(now 24.6,conf 0.43), T26@16.1Å(now 19.1,conf 0.35), D31@13.1Å(now 15.9,conf 0.34), M28@12.2Å(now 14.8,conf 0.34), E30@9.4Å(now 12.7,conf 0.34)
  - push-out (wants farther): A83@7.5Å(now 4.9,conf 0.36), T84@10.5Å(now 3.3,conf 0.34), P87@15.4Å(now 6.6,conf 0.34), G88@15.4Å(now 9.5,conf 0.34), P92@8.4Å(now 4.0,conf 0.35), P91@9.2Å(now 5.9,conf 0.34)
  - A94↔P87: targets 5.3/15.4Å but partners are 3.1Å apart → too_close_together by 7.0Å
  - H93↔P87: targets 5.3/15.4Å but partners are 3.5Å apart → too_close_together by 6.7Å
  - A94↔G88: targets 5.3/15.4Å but partners are 4.3Å apart → too_close_together by 5.8Å
- **I75** — severity 20.43, 15 conflict(s); suspect input ~`P87` (group: pull_in)
  - pull-in (wants closer): F45@16.4Å(now 19.3,conf 0.35)
  - push-out (wants farther): P87@19.5Å(now 10.9,conf 0.39), A80@10.3Å(now 5.7,conf 0.34), H93@11.9Å(now 9.3,conf 0.34), T84@15.3Å(now 9.2,conf 0.34), P91@15.1Å(now 9.9,conf 0.34)
  - T95↔P87: targets 5.1/19.5Å but partners are 7.0Å apart → too_close_together by 7.4Å
  - P87↔A94: targets 19.5/9.7Å but partners are 3.1Å apart → too_close_together by 6.8Å
  - L96↔P87: targets 5.7/19.5Å but partners are 8.4Å apart → too_close_together by 5.4Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=34 · 3-10(G)=30 · coil(C)=9

```
CEEEGHCEHEEEEGEEGHECGCEGEGGGGHEHEGHEEHHHGHEEEEEEEHHHHEHGHHHGHHHHEGGGEGECGGGGCGHEHEHHHEHCHEGHCGHGGGGEGGHEC
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=8 · sheet=31
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - E53 ↔ G57  (helix)
  - G57 ↔ G61  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - Y79 ↔ A83  (helix)
  - A83 ↔ P87  (helix)
  - V3 ↔ P8  (sheet)
  - V3 ↔ D10  (sheet)
  - V3 ↔ G11  (sheet)
  - V3 ↔ R12  (sheet)
  - E4 ↔ D10  (sheet)
  - E4 ↔ G11  (sheet)
  - P8 ↔ T13  (sheet)
  - D10 ↔ P15  (sheet)
  - T13 ↔ Q19  (sheet)
  - V23 ↔ S37  (sheet)
  - V23 ↔ K43  (sheet)
  - Y25 ↔ D36  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=52 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=473 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=271 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1159 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
