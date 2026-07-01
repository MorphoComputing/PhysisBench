# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1MSI\sequence\1MSI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1MSI\seeds\seed_7\1MSI.pdb`
- residues: 64
- mode: oracle
- ca_rmsd: 5.115 A
- tm_score_ca_ordered: 0.45903622146866485
- heavy_atom_rmsd: 5.801 A
- sidechain_heavy_atom_rmsd: 6.450 A
- **all-atom quality (honest):** heavy 5.801 A, sidechain 6.450 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/54 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 612
- bin_accuracy: 0.516

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=rejected_lj_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.115340203850339
- ga_delta_rmsd: 3.487302921582331  ga_fitness_mode: energy
- pre_local_rmsd: 5.173536734512695  localized_anchor_rmsd: 5.11530447117902

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I37-S42 → 47 conflicts (58%); P29-G31 → 21 conflicts (26%); Q2-S4 → 7 conflicts (9%)
- explained: 75/81 conflicts by 3 root cause(s)
- metrics: hubs=30 (frac 0.469), conflicts/hub=2.7, max_incompat=6.47Å, chain_span=0.906
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I37-S42 + P29-G31 + Q2-S4 — explain ~75/81 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S42** — severity 12.40, 7 conflict(s); suspect input ~`P38` (group: push_out)
  - pull-in (wants closer): T18@6.2Å(now 16.1,conf 0.55), M21@10.9Å(now 17.0,conf 0.55), R23@15.3Å(now 19.8,conf 0.55)
  - push-out (wants farther): A3@20.6Å(now 15.3,conf 0.59), S4@17.9Å(now 12.5,conf 0.55)
  - A3↔P38: targets 20.6/9.2Å but partners are 6.1Å apart → too_close_together by 5.3Å
  - S4↔I37: targets 17.9/10.3Å but partners are 3.4Å apart → too_close_together by 4.2Å
  - S4↔P38: targets 17.9/9.2Å but partners are 5.0Å apart → too_close_together by 3.8Å
- **T18** — severity 10.29, 5 conflict(s); suspect input ~`S42` (group: pull_in)
  - pull-in (wants closer): S42@6.2Å(now 16.1,conf 0.55), L40@8.1Å(now 12.2,conf 0.55)
  - push-out (wants farther): M59@15.0Å(now 11.5,conf 0.55), Y63@15.0Å(now 9.4,conf 0.55), K61@14.3Å(now 9.7,conf 0.55)
  - M22↔S42: targets 7.0/6.2Å but partners are 19.7Å apart → too_far_apart by 6.5Å
  - M21↔S42: targets 6.0/6.2Å but partners are 17.0Å apart → too_far_apart by 4.8Å
  - R23↔S42: targets 9.8/6.2Å but partners are 19.8Å apart → too_far_apart by 3.8Å
- **I37** — severity 9.98, 5 conflict(s); suspect input ~`D58` (group: pull_in)
  - pull-in (wants closer): P33@7.1Å(now 9.8,conf 0.91)
  - push-out (wants farther): V30@15.0Å(now 8.6,conf 0.99), D58@15.1Å(now 7.4,conf 0.55), P57@11.9Å(now 7.0,conf 0.55)
  - V30↔A34: targets 15.0/6.0Å but partners are 4.8Å apart → too_close_together by 4.2Å
  - L40↔D58: targets 5.0/15.1Å but partners are 5.0Å apart → too_close_together by 5.0Å
  - V41↔D58: targets 7.0/15.1Å but partners are 3.8Å apart → too_close_together by 4.3Å
- **Q2** — severity 9.29, 7 conflict(s); suspect input ~`G31` (group: pull_in)
  - pull-in (wants closer): V26@6.1Å(now 10.7,conf 0.55), V30@7.6Å(now 11.1,conf 0.55), R23@13.3Å(now 17.1,conf 0.55), G31@9.4Å(now 14.4,conf 0.55)
  - push-out (wants farther): M59@19.2Å(now 15.9,conf 0.56), Y63@19.0Å(now 15.9,conf 0.56), D58@18.8Å(now 13.4,conf 0.56), P29@10.4Å(now 5.9,conf 0.55)
  - N8↔G31: targets 17.4/9.4Å but partners are 4.5Å apart → too_close_together by 3.5Å
  - Q9↔G31: targets 21.0/9.4Å but partners are 8.1Å apart → too_close_together by 3.5Å
  - N8↔V30: targets 17.4/7.6Å but partners are 7.6Å apart → too_close_together by 2.3Å
- **V30** — severity 8.53, 4 conflict(s); suspect input ~`S4` (group: pull_in)
  - pull-in (wants closer): Q2@7.6Å(now 11.1,conf 0.55)
  - push-out (wants farther): V27@7.0Å(now 4.0,conf 0.99), E35@13.0Å(now 8.8,conf 0.99), D36@13.0Å(now 8.8,conf 0.99), I37@15.0Å(now 8.6,conf 0.99), S24@11.0Å(now 4.2,conf 0.94), R23@13.1Å(now 7.5,conf 0.91), V26@8.8Å(now 3.2,conf 0.82), A34@10.6Å(now 4.8,conf 0.79), R39@17.4Å(now 13.9,conf 0.55), N8@16.2Å(now 7.6,conf 0.55), E25@9.6Å(now 4.1,conf 0.55), V6@10.1Å(now 5.5,conf 0.55)
  - I37↔S4: targets 15.0/6.0Å but partners are 3.4Å apart → too_close_together by 5.6Å
  - E35↔P33: targets 13.0/7.1Å but partners are 3.0Å apart → too_close_together by 2.9Å
  - S4↔R39: targets 6.0/17.4Å but partners are 8.7Å apart → too_close_together by 2.7Å
- **M43** — severity 8.40, 4 conflict(s); suspect input ~`S4` (group: push_out)
  - pull-in (wants closer): L40@5.1Å(now 8.1,conf 0.91), L19@11.2Å(now 16.0,conf 0.55)
  - push-out (wants farther): S4@16.6Å(now 13.3,conf 0.55)
  - L40↔S4: targets 5.1/16.6Å but partners are 5.4Å apart → too_close_together by 6.1Å
  - I37↔L40: targets 10.9/5.1Å but partners are 2.6Å apart → too_close_together by 3.1Å
  - I37↔S4: targets 10.9/16.6Å but partners are 3.4Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=16 · 3-10(G)=12 · coil(C)=7

```
CEEEGGGGCCGEGHEEHHCHHHEHHCHHGGHHHHHEHHHHGGEEHHEEEEEHEGGCHHHHHHHC
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=9 · sheet=7
  - N14 ↔ T18  (helix)
  - M21 ↔ E25  (helix)
  - V27 ↔ G31  (helix)
  - G31 ↔ E35  (helix)
  - P33 ↔ I37  (helix)
  - E35 ↔ R39  (helix)
  - P57 ↔ K61  (helix)
  - D58 ↔ G62  (helix)
  - M59 ↔ Y63  (helix)
  - S4 ↔ R23  (sheet)
  - R23 ↔ D36  (sheet)
  - D36 ↔ M43  (sheet)
  - D36 ↔ T53  (sheet)
  - Q44 ↔ V49  (sheet)
  - R47 ↔ T53  (sheet)
  - A48 ↔ T53  (sheet)

## Solvent Accessibility (burial)

- buried=21 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=312 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=205 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.2544 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 54 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
