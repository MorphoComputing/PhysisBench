# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2YXF\sequence\2YXF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2YXF\seeds\seed_5\2YXF.pdb`
- residues: 97
- mode: oracle
- ca_rmsd: 7.631 A
- tm_score_ca_ordered: 0.3152424304054606
- heavy_atom_rmsd: 9.027 A
- sidechain_heavy_atom_rmsd: 10.111 A
- **all-atom quality (honest):** heavy 9.027 A, sidechain 10.111 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/92 (0.0)
- lj_severe: 0
- lj_near: 28
- distogram_pairs: 1254
- bin_accuracy: 0.445

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=51
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.630743057037267
- ga_delta_rmsd: 0.23850591110290775  ga_fitness_mode: energy
- pre_local_rmsd: 7.66202407637263  localized_anchor_rmsd: 7.630729130551372

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V85-R97 → 371 conflicts (49%); L65-T68 → 111 conflicts (15%); K19-F22 → 64 conflicts (8%)
- explained: 546/752 conflicts by 3 root cause(s)
- metrics: hubs=90 (frac 0.928), conflicts/hub=8.4, max_incompat=10.94Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V85-R97 + L65-T68 + K19-F22 — explain ~546/752 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L87** — severity 112.12, 44 conflict(s); suspect input ~`V49` (group: pull_in)
  - pull-in (wants closer): Q2@10.9Å(now 16.3,conf 0.55)
  - push-out (wants farther): N21@27.5Å(now 22.0,conf 1.00), R12@27.4Å(now 22.7,conf 0.95), R97@25.3Å(now 19.0,conf 0.69), L23@22.6Å(now 17.9,conf 0.69), V49@22.6Å(now 16.4,conf 0.69), D96@21.9Å(now 18.6,conf 0.62), Y67@21.5Å(now 18.7,conf 0.61), Y10@21.3Å(now 16.5,conf 0.60), L54@19.4Å(now 15.7,conf 0.57), F30@11.2Å(now 8.4,conf 0.55), I35@10.3Å(now 6.1,conf 0.55)
  - N21↔R81: targets 27.5/11.0Å but partners are 10.8Å apart → too_close_together by 5.7Å
  - K91↔R97: targets 7.0/25.3Å but partners are 10.4Å apart → too_close_together by 7.9Å
  - R81↔V49: targets 11.0/22.6Å but partners are 5.6Å apart → too_close_together by 6.0Å
- **T86** — severity 104.10, 35 conflict(s); suspect input ~`E50` (group: pull_in)
  - pull-in (wants closer): I92@13.1Å(now 15.8,conf 0.91), Q2@7.2Å(now 11.7,conf 0.55)
  - push-out (wants farther): P14@27.5Å(now 24.0,conf 1.00), N21@27.5Å(now 22.4,conf 1.00), F22@27.4Å(now 19.9,conf 0.97), E50@26.9Å(now 18.5,conf 0.82), I46@23.2Å(now 20.5,conf 0.75), E47@24.0Å(now 19.1,conf 0.74), T68@26.1Å(now 23.2,conf 0.73), D53@20.8Å(now 12.2,conf 0.59), L54@18.5Å(now 13.4,conf 0.55), V27@13.3Å(now 8.3,conf 0.55), I35@9.9Å(now 5.4,conf 0.55)
  - I92↔E50: targets 13.1/26.9Å but partners are 4.5Å apart → too_close_together by 9.3Å
  - R81↔E50: targets 13.0/26.9Å but partners are 5.6Å apart → too_close_together by 8.2Å
  - K91↔E50: targets 10.9/26.9Å but partners are 9.1Å apart → too_close_together by 6.9Å
- **Q89** — severity 75.78, 28 conflict(s); suspect input ~`H51` (group: push_out)
  - push-out (wants farther): P14@27.5Å(now 22.5,conf 1.00), D96@21.0Å(now 15.3,conf 0.99), F56@23.8Å(now 18.4,conf 0.75), V82@8.0Å(now 3.8,conf 0.72), V93@12.0Å(now 8.1,conf 0.72), H51@24.4Å(now 11.8,conf 0.71), Y10@22.0Å(now 10.6,conf 0.63), L65@21.0Å(now 14.2,conf 0.60), L64@19.5Å(now 12.6,conf 0.57), K41@19.3Å(now 13.9,conf 0.56), N42@19.0Å(now 16.4,conf 0.56), W95@18.8Å(now 12.3,conf 0.56), L39@16.4Å(now 5.9,conf 0.55), V27@16.1Å(now 10.6,conf 0.55)
  - I92↔H51: targets 8.8/24.4Å but partners are 4.7Å apart → too_close_together by 10.9Å
  - N83↔H51: targets 7.0/24.4Å but partners are 9.2Å apart → too_close_together by 8.3Å
  - V82↔H51: targets 8.0/24.4Å but partners are 8.2Å apart → too_close_together by 8.2Å
- **F22** — severity 57.19, 22 conflict(s); suspect input ~`T86` (group: push_out)
  - push-out (wants farther): Q2@27.5Å(now 24.1,conf 1.00), S88@27.5Å(now 18.9,conf 0.99), T86@27.4Å(now 19.9,conf 0.97), P32@27.3Å(now 24.3,conf 0.93), V82@18.5Å(now 13.1,conf 0.55), L65@11.7Å(now 8.3,conf 0.55)
  - S88↔C25: targets 27.5/9.0Å but partners are 10.3Å apart → too_close_together by 8.2Å
  - C25↔T86: targets 9.0/27.4Å but partners are 11.9Å apart → too_close_together by 6.6Å
  - V27↔T86: targets 15.0/27.4Å but partners are 8.3Å apart → too_close_together by 4.2Å
- **D96** — severity 39.86, 20 conflict(s); suspect input ~`V9` (group: pull_in)
  - pull-in (wants closer): P5@18.9Å(now 23.6,conf 0.56), V9@7.7Å(now 11.8,conf 0.55), N24@11.6Å(now 16.1,conf 0.55)
  - push-out (wants farther): Q89@21.0Å(now 15.3,conf 0.99), K91@15.0Å(now 10.0,conf 0.99), P90@18.9Å(now 13.2,conf 0.91), I92@11.4Å(now 6.1,conf 0.79), L54@23.3Å(now 19.1,conf 0.76), V85@26.3Å(now 20.6,conf 0.75), H84@22.5Å(now 18.7,conf 0.68), L87@21.9Å(now 18.6,conf 0.62), V49@19.2Å(now 7.2,conf 0.56), I46@17.5Å(now 13.1,conf 0.55), E69@16.4Å(now 12.7,conf 0.55), R81@14.4Å(now 9.9,conf 0.55)
  - P90↔V93: targets 18.9/9.1Å but partners are 5.7Å apart → too_close_together by 4.1Å
  - Q89↔V9: targets 21.0/7.7Å but partners are 6.9Å apart → too_close_together by 6.4Å
  - Q89↔V93: targets 21.0/9.1Å but partners are 8.1Å apart → too_close_together by 3.8Å
- **S88** — severity 39.83, 14 conflict(s); suspect input ~`I92` (group: push_out)
  - push-out (wants farther): K75@27.5Å(now 24.8,conf 1.00), F22@27.5Å(now 18.9,conf 0.99), W95@21.0Å(now 15.1,conf 0.99), N83@8.9Å(now 5.4,conf 0.91), V82@10.6Å(now 6.1,conf 0.79), V93@13.4Å(now 10.5,conf 0.79), Y67@23.9Å(now 18.8,conf 0.74), S57@25.4Å(now 20.0,conf 0.69), I46@22.5Å(now 14.7,conf 0.68), L40@19.5Å(now 12.0,conf 0.57), A79@18.5Å(now 14.0,conf 0.55)
  - V85↔S57: targets 7.6/25.4Å but partners are 10.1Å apart → too_close_together by 7.7Å
  - I92↔W95: targets 11.0/21.0Å but partners are 5.2Å apart → too_close_together by 4.7Å
  - F22↔R81: targets 27.5/12.6Å but partners are 9.1Å apart → too_close_together by 5.8Å

## Secondary Structure (DSSP-like)

- helix(H)=39 · strand(E)=40 · 3-10(G)=14 · coil(C)=4

```
CEEHEHHHHEGGHEHHHEHEGGHEEGHHHHHEGGGHEEGEEHEHEHEEGHHHEHHEGHHHECEEEEEHECGEEEHEEGHEEGCEHHEHHEEHHEHHE
```

## Backbone H-bond Network

- total=81 · helix(i→i+4)=15 · sheet=66
  - T4 ↔ Q8  (helix)
  - V9 ↔ H13  (helix)
  - H13 ↔ N17  (helix)
  - A15 ↔ K19  (helix)
  - K19 ↔ L23  (helix)
  - L23 ↔ V27  (helix)
  - V27 ↔ H31  (helix)
  - N42 ↔ I46  (helix)
  - I46 ↔ E50  (helix)
  - E50 ↔ L54  (helix)
  - L54 ↔ K58  (helix)
  - K75 ↔ A79  (helix)
  - V85 ↔ Q89  (helix)
  - Q89 ↔ V93  (helix)
  - I92 ↔ D96  (helix)
  - P5 ↔ N24  (sheet)
  - P5 ↔ C25  (sheet)
  - Y10 ↔ N24  (sheet)
  - Y10 ↔ C25  (sheet)
  - P14 ↔ S20  (sheet)
  - … +61 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=37 · exposed=35 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=480 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=338 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.7686 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=28 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C25–C80

## Side-chain Rotamers (χ1/χ2)

- 92 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
