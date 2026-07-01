# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 6.600 A
- tm_score_ca_ordered: 0.19909443318277886
- heavy_atom_rmsd: 7.742 A
- sidechain_heavy_atom_rmsd: 8.509 A
- **all-atom quality (honest):** heavy 7.742 A, sidechain 8.509 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 367
- bin_accuracy: 0.518

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.599800308771518
- ga_delta_rmsd: 0.08264083355422969  ga_fitness_mode: energy
- pre_local_rmsd: 6.608752040357754  localized_anchor_rmsd: 6.599838549480958

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E16-C19 → 17 conflicts (57%); R40-F43 → 8 conflicts (27%); S11-Y13 → 4 conflicts (13%)
- explained: 29/30 conflicts by 3 root cause(s)
- metrics: hubs=14 (frac 0.298), conflicts/hub=2.1, max_incompat=3.89Å, chain_span=0.957
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E16-C19 + R40-F43 + S11-Y13 — explain ~29/30 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I1** — severity 6.45, 4 conflict(s); suspect input ~`F42` (group: pull_in)
  - pull-in (wants closer): Y13@11.2Å(now 15.0,conf 0.55), C19@11.5Å(now 14.3,conf 0.55), F42@12.1Å(now 15.5,conf 0.55)
  - Q4↔F42: targets 5.1/12.1Å but partners are 21.0Å apart → too_far_apart by 3.8Å
  - S8↔F42: targets 9.0/12.1Å but partners are 24.4Å apart → too_far_apart by 3.3Å
  - T7↔F42: targets 9.1/12.1Å but partners are 24.1Å apart → too_far_apart by 2.9Å
- **S27** — severity 4.08, 3 conflict(s); suspect input ~`Y18` (group: push_out)
  - push-out (wants farther): L12@15.2Å(now 11.8,conf 0.55), Y18@15.2Å(now 12.5,conf 0.55)
  - V30↔Y18: targets 6.0/15.2Å but partners are 6.6Å apart → too_close_together by 2.6Å
  - Y18↔A32: targets 15.2/8.6Å but partners are 4.0Å apart → too_close_together by 2.5Å
  - L33↔Y18: targets 9.1/15.2Å but partners are 3.8Å apart → too_close_together by 2.3Å
- **C19** — severity 3.77, 3 conflict(s); suspect input ~`F43` (group: push_out)
  - pull-in (wants closer): Q22@10.6Å(now 14.0,conf 0.79), F43@7.1Å(now 12.7,conf 0.55), I1@11.5Å(now 14.3,conf 0.55)
  - push-out (wants farther): C10@14.3Å(now 11.5,conf 0.55)
  - Q22↔F43: targets 10.6/7.1Å but partners are 21.2Å apart → too_far_apart by 3.5Å
  - Y13↔F43: targets 7.8/7.1Å but partners are 16.7Å apart → too_far_apart by 1.8Å
  - L12↔F43: targets 6.1/7.1Å but partners are 14.8Å apart → too_far_apart by 1.6Å
- **L33** — severity 3.77, 4 conflict(s); suspect input ~`F42` (group: pull_in)
  - pull-in (wants closer): Q22@13.2Å(now 16.1,conf 0.55), S11@9.5Å(now 12.3,conf 0.55)
  - G38↔Q22: targets 7.0/13.2Å but partners are 22.1Å apart → too_far_apart by 1.9Å
  - S11↔F42: targets 9.5/8.1Å but partners are 19.4Å apart → too_far_apart by 1.8Å
  - Q22↔F42: targets 13.2/8.1Å but partners are 23.0Å apart → too_far_apart by 1.7Å
- **H28** — severity 3.39, 3 conflict(s); suspect input ~`N17` (group: push_out)
  - pull-in (wants closer): T7@12.0Å(now 14.9,conf 0.55)
  - push-out (wants farther): N17@16.2Å(now 10.8,conf 0.55)
  - A32↔N17: targets 5.8/16.2Å but partners are 7.3Å apart → too_close_together by 3.0Å
  - L24↔N17: targets 5.1/16.2Å but partners are 9.4Å apart → too_close_together by 1.6Å
  - E31↔N17: targets 5.3/16.2Å but partners are 9.2Å apart → too_close_together by 1.6Å
- **E16** — severity 3.39, 3 conflict(s); suspect input ~`R40` (group: pull_in)
  - pull-in (wants closer): R40@10.7Å(now 15.1,conf 0.55), Y44@10.7Å(now 15.5,conf 0.55)
  - push-out (wants farther): Y13@5.0Å(now 1.9,conf 0.94), V30@12.3Å(now 8.9,conf 0.55), H23@13.0Å(now 9.6,conf 0.52)
  - I9↔R40: targets 13.1/10.7Å but partners are 26.3Å apart → too_far_apart by 2.5Å
  - S11↔R40: targets 7.4/10.7Å but partners are 20.3Å apart → too_far_apart by 2.2Å
  - S11↔H23: targets 7.4/13.0Å but partners are 4.0Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=18 · 3-10(G)=4 · coil(C)=4

```
CHHEHHHCEEGHEHGHHHGEEHECHEHEHHHHEHHHEGHEECEEEEE
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=9 · sheet=30
  - V2 ↔ C6  (helix)
  - L12 ↔ E16  (helix)
  - Q14 ↔ Y18  (helix)
  - Y18 ↔ Q22  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L35 ↔ E39  (helix)
  - Q4 ↔ I9  (sheet)
  - Q4 ↔ C10  (sheet)
  - Q4 ↔ N21  (sheet)
  - Q4 ↔ H23  (sheet)
  - I9 ↔ V20  (sheet)
  - I9 ↔ N21  (sheet)
  - I9 ↔ H23  (sheet)
  - C10 ↔ V20  (sheet)
  - C10 ↔ N21  (sheet)
  - C10 ↔ H23  (sheet)
  - C10 ↔ G26  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=193 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=90 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2867 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
