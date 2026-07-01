# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1KTH\seeds\seed_4\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 7.070 A
- tm_score_ca_ordered: 0.3031155685688215
- heavy_atom_rmsd: 8.207 A
- sidechain_heavy_atom_rmsd: 9.255 A
- **all-atom quality (honest):** heavy 8.207 A, sidechain 9.255 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 489
- bin_accuracy: 0.507

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_window_topology_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.070266310195388
- ga_delta_rmsd: -0.3650221719577287  ga_fitness_mode: energy
- pre_local_rmsd: 7.079246831948426  localized_anchor_rmsd: 7.070237145921032

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D2 → 11 conflicts (27%); G11 → 8 conflicts (20%); L6 → 4 conflicts (10%)
- explained: 23/41 conflicts by 3 root cause(s)
- metrics: hubs=23 (frac 0.411), conflicts/hub=1.8, max_incompat=5.91Å, chain_span=0.875
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D2 + G11 + L6 — explain ~23/41 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D2** — severity 9.87, 4 conflict(s); suspect input ~`G39` (group: push_out)
  - push-out (wants farther): D15@27.0Å(now 21.4,conf 0.84), C50@13.4Å(now 7.9,conf 0.55), E49@16.2Å(now 8.5,conf 0.55), E51@14.3Å(now 8.6,conf 0.55)
  - D15↔G39: targets 27.0/15.3Å but partners are 5.8Å apart → too_close_together by 5.9Å
  - D15↔L6: targets 27.0/8.8Å but partners are 14.5Å apart → too_close_together by 3.6Å
  - D15↔E41: targets 27.0/9.9Å but partners are 13.4Å apart → too_close_together by 3.7Å
- **E49** — severity 6.16, 3 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): P7@17.5Å(now 12.8,conf 0.55), D2@16.2Å(now 8.5,conf 0.55)
  - V53↔D2: targets 8.0/16.2Å but partners are 3.8Å apart → too_close_together by 4.4Å
  - K52↔D2: targets 5.4/16.2Å but partners are 6.5Å apart → too_close_together by 4.2Å
  - C54↔D2: targets 9.0/16.2Å but partners are 4.5Å apart → too_close_together by 2.7Å
- **L18** — severity 5.34, 2 conflict(s); suspect input ~`W33` (group: pull_in)
  - pull-in (wants closer): W33@4.7Å(now 7.9,conf 0.59), S46@9.1Å(now 15.1,conf 0.55)
  - push-out (wants farther): P24@19.0Å(now 15.3,conf 0.99), N25@21.0Å(now 16.6,conf 0.99), G11@12.7Å(now 9.3,conf 0.82), T12@13.6Å(now 10.2,conf 0.69), C4@17.4Å(now 14.0,conf 0.55)
  - T12↔W33: targets 13.6/4.7Å but partners are 3.3Å apart → too_close_together by 5.6Å
  - G11↔W33: targets 12.7/4.7Å but partners are 4.4Å apart → too_close_together by 3.5Å
- **L6** — severity 4.22, 3 conflict(s); suspect input ~`D9` (group: push_out)
  - push-out (wants farther): D15@21.4Å(now 14.5,conf 0.60), E51@14.7Å(now 10.6,conf 0.55), Q47@16.4Å(now 11.2,conf 0.55)
  - D15↔D9: targets 21.4/8.3Å but partners are 9.4Å apart → too_close_together by 3.6Å
  - G11↔D15: targets 13.4/21.4Å but partners are 5.7Å apart → too_close_together by 2.3Å
  - D15↔N42: targets 21.4/6.0Å but partners are 13.9Å apart → too_close_together by 1.6Å
- **S46** — severity 3.79, 2 conflict(s); suspect input ~`L18` (group: pull_in)
  - pull-in (wants closer): L18@9.1Å(now 15.1,conf 0.55)
  - push-out (wants farther): P24@17.0Å(now 12.6,conf 0.55), K8@14.9Å(now 6.8,conf 0.55)
  - E49↔L18: targets 5.5/9.1Å but partners are 19.4Å apart → too_far_apart by 4.9Å
  - R31↔K8: targets 8.9/14.9Å but partners are 3.9Å apart → too_close_together by 2.1Å
- **E51** — severity 3.53, 2 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): D9@17.7Å(now 15.1,conf 0.55), L6@14.7Å(now 10.6,conf 0.55), D2@14.3Å(now 8.6,conf 0.55)
  - C54↔D2: targets 5.0/14.3Å but partners are 4.5Å apart → too_close_together by 4.8Å
  - F44↔D9: targets 9.0/17.7Å but partners are 7.0Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=24 · 3-10(G)=7 · coil(C)=2

```
EHEHHGHHEHHHEEEGEHEGHEHHHGEHEEECHEGEHHHEEGEGHEEHCHHEHEEE
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=5 · sheet=47
  - C4 ↔ K8  (helix)
  - K8 ↔ T12  (helix)
  - Y21 ↔ N25  (helix)
  - P24 ↔ S28  (helix)
  - W33 ↔ C37  (helix)
  - I3 ↔ D9  (sheet)
  - I3 ↔ K19  (sheet)
  - I3 ↔ Y22  (sheet)
  - D9 ↔ R14  (sheet)
  - D9 ↔ D15  (sheet)
  - D9 ↔ I17  (sheet)
  - D9 ↔ K19  (sheet)
  - D9 ↔ Y22  (sheet)
  - D9 ↔ C29  (sheet)
  - R14 ↔ Y34  (sheet)
  - D15 ↔ Y34  (sheet)
  - I17 ↔ Y34  (sheet)
  - I17 ↔ G36  (sheet)
  - K19 ↔ C29  (sheet)
  - K19 ↔ A30  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=259 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=173 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.8883 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
