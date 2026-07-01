# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1KTH\seeds\seed_0\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 8.808 A
- tm_score_ca_ordered: 0.1550967470882332
- heavy_atom_rmsd: 9.605 A
- sidechain_heavy_atom_rmsd: 10.520 A
- **all-atom quality (honest):** heavy 9.605 A, sidechain 10.520 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 33
- distogram_pairs: 159
- bin_accuracy: 0.220

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.808320401597927
- ga_delta_rmsd: 0.31920883351051366  ga_fitness_mode: energy
- pre_local_rmsd: 8.808337446789166  localized_anchor_rmsd: 8.808337446789166

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N25-A30 → 59 conflicts (88%); R14-L18 → 8 conflicts (12%)
- explained: 67/67 conflicts by 2 root cause(s)
- metrics: hubs=10 (frac 0.179), conflicts/hub=6.7, max_incompat=6.41Å, chain_span=0.911
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N25-A30 + R14-L18 — explain ~67/67 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S28** — severity 16.24, 15 conflict(s); suspect input ~`N25` (group: push_out)
  - push-out (wants farther): K5@27.0Å(now 19.0,conf 0.85), G11@26.8Å(now 19.4,conf 0.80), E51@25.9Å(now 21.6,conf 0.67), R14@25.9Å(now 17.5,conf 0.66), V53@24.1Å(now 21.5,conf 0.53), P56@22.1Å(now 18.5,conf 0.47), T1@22.0Å(now 14.0,conf 0.46), K52@23.8Å(now 20.6,conf 0.44), L18@18.3Å(now 14.4,conf 0.37), F32@6.8Å(now 3.5,conf 0.31), F16@20.8Å(now 15.8,conf 0.30)
  - R14↔N25: targets 25.9/5.8Å but partners are 14.5Å apart → too_close_together by 5.6Å
  - K5↔N25: targets 27.0/5.8Å but partners are 16.7Å apart → too_close_together by 4.5Å
  - T1↔Y34: targets 22.0/6.3Å but partners are 11.3Å apart → too_close_together by 4.3Å
- **N25** — severity 16.21, 15 conflict(s); suspect input ~`A30` (group: push_out)
  - push-out (wants farther): E51@27.4Å(now 24.3,conf 0.94), K5@27.2Å(now 16.7,conf 0.90), V53@26.8Å(now 23.6,conf 0.80), G11@26.8Å(now 17.1,conf 0.80), K52@26.0Å(now 23.0,conf 0.66), P56@25.2Å(now 20.9,conf 0.59), R14@24.9Å(now 14.5,conf 0.58), T1@24.3Å(now 15.0,conf 0.54), L18@15.8Å(now 10.8,conf 0.34), F16@19.8Å(now 13.1,conf 0.27)
  - T1↔A30: targets 24.3/6.5Å but partners are 11.7Å apart → too_close_together by 6.1Å
  - T1↔S28: targets 24.3/5.8Å but partners are 14.0Å apart → too_close_together by 4.5Å
  - R14↔L18: targets 24.9/15.8Å but partners are 4.4Å apart → too_close_together by 4.7Å
- **T26** — severity 12.53, 12 conflict(s); suspect input ~`A30` (group: push_out)
  - push-out (wants farther): E51@26.7Å(now 23.0,conf 0.79), K5@26.6Å(now 19.3,conf 0.76), G11@26.2Å(now 19.6,conf 0.70), R14@24.0Å(now 17.4,conf 0.53), T1@23.0Å(now 14.9,conf 0.49), K52@24.4Å(now 21.9,conf 0.48), Y34@9.7Å(now 6.6,conf 0.34), F16@19.5Å(now 15.8,conf 0.27)
  - T1↔A30: targets 23.0/5.5Å but partners are 11.7Å apart → too_close_together by 5.8Å
  - K5↔A30: targets 26.6/5.5Å but partners are 17.3Å apart → too_close_together by 3.8Å
  - G11↔A30: targets 26.2/5.5Å but partners are 17.5Å apart → too_close_together by 3.2Å
- **G11** — severity 11.02, 10 conflict(s); suspect input ~`R14` (group: push_out)
  - push-out (wants farther): E51@26.9Å(now 22.9,conf 0.82), S28@26.8Å(now 19.4,conf 0.80), N25@26.8Å(now 17.1,conf 0.80), T26@26.2Å(now 19.6,conf 0.70), K52@26.0Å(now 23.0,conf 0.65), V53@25.1Å(now 20.7,conf 0.59), P56@24.9Å(now 20.1,conf 0.57), Y34@24.2Å(now 18.8,conf 0.53), A30@23.9Å(now 17.5,conf 0.52), F32@23.9Å(now 18.6,conf 0.44), L18@16.1Å(now 8.3,conf 0.35), T1@12.7Å(now 10.1,conf 0.34), F16@9.5Å(now 5.2,conf 0.21)
  - N25↔R14: targets 26.8/5.9Å but partners are 14.5Å apart → too_close_together by 6.4Å
  - R14↔L18: targets 5.9/16.1Å but partners are 4.4Å apart → too_close_together by 5.8Å
  - S28↔R14: targets 26.8/5.9Å but partners are 17.5Å apart → too_close_together by 3.4Å
- **K5** — severity 4.22, 5 conflict(s); suspect input ~`G11` (group: push_out)
  - push-out (wants farther): N25@27.2Å(now 16.7,conf 0.90), S28@27.0Å(now 19.0,conf 0.85), T26@26.6Å(now 19.3,conf 0.76), A30@24.5Å(now 17.3,conf 0.55), Y34@24.1Å(now 18.4,conf 0.53), L18@20.9Å(now 11.3,conf 0.43), F32@23.4Å(now 17.7,conf 0.41), P56@19.2Å(now 16.6,conf 0.38), R14@12.3Å(now 8.7,conf 0.34), K52@21.8Å(now 18.8,conf 0.33), F16@15.2Å(now 9.3,conf 0.20)
  - L18↔G11: targets 20.9/8.4Å but partners are 8.3Å apart → too_close_together by 4.2Å
  - L18↔R14: targets 20.9/12.3Å but partners are 4.4Å apart → too_close_together by 4.2Å
  - N25↔G11: targets 27.2/8.4Å but partners are 17.1Å apart → too_close_together by 1.7Å
- **A30** — severity 2.31, 3 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): K5@24.5Å(now 17.3,conf 0.55), E51@24.0Å(now 20.1,conf 0.53), G11@23.9Å(now 17.5,conf 0.52), R14@22.4Å(now 15.9,conf 0.47), P56@20.0Å(now 17.1,conf 0.41), T1@19.4Å(now 11.7,conf 0.39), K52@22.4Å(now 19.4,conf 0.35), L18@15.7Å(now 13.1,conf 0.34), F16@18.0Å(now 14.2,conf 0.23)
  - Y34↔T1: targets 5.5/19.4Å but partners are 11.3Å apart → too_close_together by 2.5Å
  - R14↔L18: targets 22.4/15.7Å but partners are 4.4Å apart → too_close_together by 2.2Å
  - R14↔F16: targets 22.4/18.0Å but partners are 1.9Å apart → too_close_together by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=7 · 3-10(G)=6 · coil(C)=3

```
EECHHHHGHEHHHHGHHHEGHHGHHHHHHHHHHGHHHHHHCECEGHHHHHHHHHHE
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=27 · sheet=6
  - K5 ↔ D9  (helix)
  - P7 ↔ G11  (helix)
  - D9 ↔ C13  (helix)
  - T12 ↔ F16  (helix)
  - C13 ↔ I17  (helix)
  - R14 ↔ L18  (helix)
  - I17 ↔ Y21  (helix)
  - L18 ↔ Y22  (helix)
  - Y21 ↔ N25  (helix)
  - Y22 ↔ T26  (helix)
  - P24 ↔ S28  (helix)
  - N25 ↔ C29  (helix)
  - T26 ↔ A30  (helix)
  - K27 ↔ R31  (helix)
  - S28 ↔ F32  (helix)
  - C29 ↔ W33  (helix)
  - R31 ↔ G35  (helix)
  - F32 ↔ G36  (helix)
  - W33 ↔ C37  (helix)
  - G35 ↔ G39  (helix)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=31 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=439 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=295 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.7247 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=33 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
