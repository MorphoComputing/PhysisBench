# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TIT\seeds\seed_5\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 6.859 A
- tm_score_ca_ordered: 0.3642569397853316
- heavy_atom_rmsd: 8.132 A
- sidechain_heavy_atom_rmsd: 9.264 A
- **all-atom quality (honest):** heavy 8.132 A, sidechain 9.264 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 23
- distogram_pairs: 1027
- bin_accuracy: 0.560

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.858905586390436
- ga_delta_rmsd: 0.4003242125225057  ga_fitness_mode: energy
- pre_local_rmsd: 6.86846029181027  localized_anchor_rmsd: 6.858925346107017

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q32-S43 → 196 conflicts (76%); K5-G9 → 17 conflicts (7%)
- explained: 213/258 conflicts by 2 root cause(s)
- metrics: hubs=55 (frac 0.632), conflicts/hub=4.7, max_incompat=8.9Å, chain_span=0.931
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q32-S43 + K5-G9 — explain ~213/258 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T41** — severity 35.97, 17 conflict(s); suspect input ~`Y8` (group: push_out)
  - push-out (wants farther): S25@24.5Å(now 18.4,conf 0.71), P27@22.1Å(now 17.2,conf 0.64), L24@21.6Å(now 15.6,conf 0.61), P6@21.5Å(now 13.7,conf 0.61), Y8@20.9Å(now 6.9,conf 0.59), E16@19.2Å(now 13.0,conf 0.56), A81@19.1Å(now 15.2,conf 0.56)
  - K34↔Y8: targets 9.0/20.9Å but partners are 4.2Å apart → too_close_together by 7.7Å
  - Q38↔Y8: targets 9.4/20.9Å but partners are 3.9Å apart → too_close_together by 7.5Å
  - Q38↔P6: targets 9.4/21.5Å but partners are 7.4Å apart → too_close_together by 4.6Å
- **Q38** — severity 32.89, 14 conflict(s); suspect input ~`I22` (group: pull_in)
  - pull-in (wants closer): L35@5.0Å(now 8.3,conf 1.00), H60@17.0Å(now 19.5,conf 0.55), A74@14.9Å(now 18.6,conf 0.55), L64@14.7Å(now 19.7,conf 0.55)
  - push-out (wants farther): P6@18.9Å(now 7.4,conf 0.56), I22@18.7Å(now 11.5,conf 0.56), G9@17.2Å(now 4.2,conf 0.55), A81@14.6Å(now 9.0,conf 0.55), L83@14.0Å(now 10.9,conf 0.55)
  - K34↔G9: targets 5.0/17.2Å but partners are 5.0Å apart → too_close_together by 7.2Å
  - K34↔P6: targets 5.0/18.9Å but partners are 8.0Å apart → too_close_together by 5.9Å
  - W33↔I22: targets 8.9/18.7Å but partners are 3.9Å apart → too_close_together by 5.9Å
- **P44** — severity 26.01, 11 conflict(s); suspect input ~`E23` (group: push_out)
  - push-out (wants farther): I1@27.5Å(now 24.8,conf 1.00), P6@25.9Å(now 21.3,conf 0.71), E23@24.6Å(now 19.0,conf 0.70), G9@22.4Å(now 15.9,conf 0.66), T17@13.1Å(now 8.8,conf 0.55)
  - P39↔P6: targets 15.0/25.9Å but partners are 6.4Å apart → too_close_together by 4.5Å
  - L40↔P6: targets 11.4/25.9Å but partners are 10.3Å apart → too_close_together by 4.1Å
  - L40↔G9: targets 11.4/22.4Å but partners are 6.6Å apart → too_close_together by 4.3Å
- **S25** — severity 24.01, 10 conflict(s); suspect input ~`P39` (group: push_out)
  - push-out (wants farther): G31@13.0Å(now 5.9,conf 1.00), H60@27.4Å(now 24.2,conf 0.97), Q32@15.1Å(now 11.3,conf 0.91), P39@22.9Å(now 13.1,conf 0.72), T41@24.5Å(now 18.4,conf 0.71), N82@22.6Å(now 20.1,conf 0.69), I48@19.4Å(now 15.7,conf 0.57), A80@17.3Å(now 14.4,conf 0.55), K78@12.5Å(now 8.0,conf 0.55)
  - I22↔P39: targets 9.1/22.9Å but partners are 6.5Å apart → too_close_together by 7.3Å
  - I22↔T41: targets 9.1/24.5Å but partners are 9.6Å apart → too_close_together by 5.8Å
  - Q32↔P39: targets 15.1/22.9Å but partners are 3.7Å apart → too_close_together by 4.1Å
- **L40** — severity 23.52, 12 conflict(s); suspect input ~`G9` (group: push_out)
  - push-out (wants farther): G9@19.1Å(now 6.6,conf 0.56), E21@18.1Å(now 6.8,conf 0.55), A81@17.2Å(now 12.6,conf 0.55), H55@16.8Å(now 14.2,conf 0.55)
  - K34↔G9: targets 6.9/19.1Å but partners are 5.0Å apart → too_close_together by 7.2Å
  - W33↔E21: targets 7.4/18.1Å but partners are 5.1Å apart → too_close_together by 5.6Å
  - G37↔G9: targets 9.0/19.1Å but partners are 5.0Å apart → too_close_together by 5.0Å
- **S43** — severity 22.29, 8 conflict(s); suspect input ~`K5` (group: pull_in)
  - pull-in (wants closer): L64@17.7Å(now 21.3,conf 0.55)
  - push-out (wants farther): K5@25.9Å(now 15.6,conf 0.71), E11@20.8Å(now 14.5,conf 0.59), F13@19.8Å(now 15.6,conf 0.57), E16@16.4Å(now 12.0,conf 0.55), H19@16.3Å(now 5.4,conf 0.55)
  - P39↔K5: targets 13.0/25.9Å but partners are 6.1Å apart → too_close_together by 6.8Å
  - K5↔L40: targets 25.9/8.7Å but partners are 9.0Å apart → too_close_together by 8.2Å
  - C46↔H19: targets 5.0/16.3Å but partners are 3.7Å apart → too_close_together by 7.5Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=31 · 3-10(G)=13 · coil(C)=12

```
CEHHHHEEECCCCHHEHEHHGEEEHHEHHGHHHGGHEEHEEHEHGHGCCECHHEEGEEGEHHEGHEGGHHHHEGHCCEEEGECECEE
```

## Backbone H-bond Network

- total=44 · helix(i→i+4)=8 · sheet=36
  - G15 ↔ H19  (helix)
  - S25 ↔ V29  (helix)
  - D28 ↔ Q32  (helix)
  - Q32 ↔ K36  (helix)
  - A42 ↔ C46  (helix)
  - N61 ↔ G65  (helix)
  - G65 ↔ E69  (helix)
  - S71 ↔ A75  (helix)
  - E2 ↔ I22  (sheet)
  - L7 ↔ I22  (sheet)
  - L7 ↔ E23  (sheet)
  - L7 ↔ L24  (sheet)
  - Y8 ↔ A18  (sheet)
  - Y8 ↔ I22  (sheet)
  - Y8 ↔ E23  (sheet)
  - G9 ↔ A18  (sheet)
  - G9 ↔ I22  (sheet)
  - I22 ↔ P27  (sheet)
  - I22 ↔ G37  (sheet)
  - I22 ↔ Q38  (sheet)
  - … +24 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=32 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=418 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=296 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.4322 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=23 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
