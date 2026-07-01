# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1KTH\seeds\seed_9\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 6.789 A
- tm_score_ca_ordered: 0.30333110494044063
- heavy_atom_rmsd: 8.287 A
- sidechain_heavy_atom_rmsd: 9.419 A
- **all-atom quality (honest):** heavy 8.287 A, sidechain 9.419 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 489
- bin_accuracy: 0.603

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.788952120534095
- ga_delta_rmsd: -0.32121102586441985  ga_fitness_mode: energy
- pre_local_rmsd: 6.788917945642697  localized_anchor_rmsd: 6.788917945642697

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T1-D2 → 28 conflicts (58%); L6 → 9 conflicts (19%); R31-W33 → 4 conflicts (8%)
- explained: 41/48 conflicts by 3 root cause(s)
- metrics: hubs=21 (frac 0.375), conflicts/hub=2.3, max_incompat=6.8Å, chain_span=0.875
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T1-D2 + L6 + R31-W33 — explain ~41/48 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D2** — severity 17.63, 9 conflict(s); suspect input ~`R31` (group: pull_in)
  - pull-in (wants closer): G39@15.3Å(now 20.0,conf 0.55), E41@9.9Å(now 16.1,conf 0.55)
  - push-out (wants farther): D15@27.0Å(now 23.7,conf 0.84), K8@13.1Å(now 10.0,conf 0.84), K5@6.9Å(now 3.3,conf 0.67), W33@20.9Å(now 14.6,conf 0.60), R31@18.9Å(now 8.3,conf 0.56), K19@18.4Å(now 12.2,conf 0.55)
  - K5↔R31: targets 6.9/18.9Å but partners are 5.2Å apart → too_close_together by 6.8Å
  - L6↔R31: targets 8.4/18.9Å but partners are 3.9Å apart → too_close_together by 6.6Å
  - L6↔W33: targets 8.4/20.9Å but partners are 8.3Å apart → too_close_together by 4.2Å
- **T1** — severity 12.86, 6 conflict(s); suspect input ~`L6` (group: pull_in)
  - pull-in (wants closer): C54@7.3Å(now 12.2,conf 0.55)
  - push-out (wants farther): K8@15.0Å(now 11.7,conf 0.94), A30@17.4Å(now 7.9,conf 0.55), K5@7.5Å(now 4.4,conf 0.55), W20@16.1Å(now 9.7,conf 0.55)
  - A30↔K5: targets 17.4/7.5Å but partners are 3.8Å apart → too_close_together by 6.1Å
  - C4↔W20: targets 6.9/16.1Å but partners are 4.6Å apart → too_close_together by 4.6Å
  - A30↔L6: targets 17.4/9.7Å but partners are 3.4Å apart → too_close_together by 4.2Å
- **D15** — severity 7.50, 5 conflict(s); suspect input ~`L18` (group: push_out)
  - push-out (wants farther): D2@27.0Å(now 23.7,conf 0.84), L6@21.4Å(now 17.9,conf 0.60)
  - D2↔L18: targets 27.0/10.6Å but partners are 13.9Å apart → too_close_together by 2.5Å
  - L6↔F32: targets 21.4/13.3Å but partners are 5.4Å apart → too_close_together by 2.6Å
  - D2↔R31: targets 27.0/16.1Å but partners are 8.3Å apart → too_close_together by 2.6Å
- **L6** — severity 6.36, 5 conflict(s); suspect input ~`D9` (group: push_out)
  - push-out (wants farther): D15@21.4Å(now 17.9,conf 0.60), G35@17.1Å(now 14.0,conf 0.55), S28@13.4Å(now 9.5,conf 0.55), R31@14.5Å(now 3.9,conf 0.55), W33@15.6Å(now 8.3,conf 0.55), Y34@14.4Å(now 10.5,conf 0.55), E10@12.0Å(now 9.5,conf 0.55)
  - W33↔D9: targets 15.6/8.3Å but partners are 3.8Å apart → too_close_together by 3.4Å
  - Y34↔D9: targets 14.4/8.3Å but partners are 3.6Å apart → too_close_together by 2.5Å
  - I3↔R31: targets 8.6/14.5Å but partners are 3.8Å apart → too_close_together by 2.1Å
- **W33** — severity 5.50, 3 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): D2@20.9Å(now 14.6,conf 0.60), L6@15.6Å(now 8.3,conf 0.55)
  - A30↔D2: targets 11.0/20.9Å but partners are 5.4Å apart → too_close_together by 4.5Å
  - D2↔K19: targets 20.9/6.0Å but partners are 12.2Å apart → too_close_together by 2.7Å
  - D2↔L18: targets 20.9/4.7Å but partners are 13.9Å apart → too_close_together by 2.3Å
- **Q47** — severity 3.94, 2 conflict(s); suspect input ~`R31` (group: pull_in)
  - pull-in (wants closer): R31@8.0Å(now 12.1,conf 0.55)
  - L6↔R31: targets 16.4/8.0Å but partners are 3.9Å apart → too_close_together by 4.5Å
  - P7↔R31: targets 16.4/8.0Å but partners are 5.8Å apart → too_close_together by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=25 · 3-10(G)=5 · coil(C)=4

```
CEHHHHHHEHHHHEEEGHEEEEEHHHGHHEEGCEHECCEEEGEEHEEHGHEHHEEE
```

## Backbone H-bond Network

- total=72 · helix(i→i+4)=4 · sheet=68
  - I3 ↔ P7  (helix)
  - P7 ↔ G11  (helix)
  - N25 ↔ C29  (helix)
  - K48 ↔ K52  (helix)
  - D2 ↔ K19  (sheet)
  - D2 ↔ W20  (sheet)
  - D2 ↔ Y21  (sheet)
  - D2 ↔ Y22  (sheet)
  - D9 ↔ R14  (sheet)
  - D9 ↔ D15  (sheet)
  - D9 ↔ F16  (sheet)
  - D9 ↔ K19  (sheet)
  - D9 ↔ W20  (sheet)
  - D9 ↔ Y21  (sheet)
  - D9 ↔ Y22  (sheet)
  - R14 ↔ Y34  (sheet)
  - D15 ↔ Y34  (sheet)
  - F16 ↔ Y34  (sheet)
  - F16 ↔ G36  (sheet)
  - K19 ↔ A30  (sheet)
  - … +52 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=21 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=233 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=139 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1556 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
