# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TEN\seeds\seed_5\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 4.579 A
- tm_score_ca_ordered: 0.5414487889623695
- heavy_atom_rmsd: 5.509 A
- sidechain_heavy_atom_rmsd: 6.237 A
- **all-atom quality (honest):** heavy 5.509 A, sidechain 6.237 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 20
- distogram_pairs: 1075
- bin_accuracy: 0.551

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.579208984348878
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 4.5866818814800965  localized_anchor_rmsd: 4.579169499338329

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K38-V40 → 37 conflicts (34%); D52-N54 → 12 conflicts (11%); A83 → 11 conflicts (10%)
- explained: 60/109 conflicts by 3 root cause(s)
- metrics: hubs=39 (frac 0.443), conflicts/hub=2.8, max_incompat=7.33Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K38-V40 + D52-N54 + A83 — explain ~60/109 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V40** — severity 58.09, 18 conflict(s); suspect input ~`N54` (group: push_out)
  - push-out (wants farther): D43@7.0Å(now 2.5,conf 1.00), I47@19.0Å(now 15.5,conf 1.00), T50@27.4Å(now 22.7,conf 0.95), T46@15.1Å(now 12.2,conf 0.91), N54@27.1Å(now 18.9,conf 0.86), T45@12.0Å(now 8.5,conf 0.72), I58@17.8Å(now 10.9,conf 0.55)
  - Y35↔N54: targets 11.0/27.1Å but partners are 10.1Å apart → too_close_together by 6.0Å
  - N54↔G36: targets 27.1/7.4Å but partners are 13.4Å apart → too_close_together by 6.2Å
  - N54↔I37: targets 27.1/5.4Å but partners are 15.6Å apart → too_close_together by 6.1Å
- **A83** — severity 17.74, 8 conflict(s); suspect input ~`K62` (group: pull_in)
  - pull-in (wants closer): L25@14.8Å(now 17.4,conf 0.55)
  - push-out (wants farther): D14@23.4Å(now 20.1,conf 0.76), P63@23.5Å(now 21.0,conf 0.76), K62@22.6Å(now 16.4,conf 0.69)
  - T86↔K62: targets 11.0/22.6Å but partners are 5.3Å apart → too_close_together by 6.3Å
  - T88↔D14: targets 17.0/23.4Å but partners are 3.3Å apart → too_close_together by 3.1Å
  - T86↔P63: targets 11.0/23.5Å but partners are 9.7Å apart → too_close_together by 2.8Å
- **K38** — severity 17.04, 7 conflict(s); suspect input ~`Y35` (group: push_out)
  - push-out (wants farther): D43@9.0Å(now 3.8,conf 1.00), D52@27.4Å(now 19.9,conf 0.95), R44@9.1Å(now 4.1,conf 0.91), Y35@8.6Å(now 5.9,conf 0.79), T45@11.4Å(now 6.3,conf 0.79), T16@15.6Å(now 12.6,conf 0.55), G59@16.2Å(now 9.1,conf 0.55), L61@12.2Å(now 8.0,conf 0.55)
  - D52↔Y35: targets 27.4/8.6Å but partners are 14.4Å apart → too_close_together by 4.4Å
  - E32↔D52: targets 17.0/27.4Å but partners are 7.0Å apart → too_close_together by 3.4Å
  - D52↔T34: targets 27.4/11.2Å but partners are 11.0Å apart → too_close_together by 5.3Å
- **D52** — severity 15.55, 5 conflict(s); suspect input ~`K38` (group: push_out)
  - push-out (wants farther): T45@21.0Å(now 15.2,conf 0.99), T46@17.0Å(now 12.5,conf 0.99), D48@11.0Å(now 7.3,conf 0.99), K38@27.4Å(now 19.9,conf 0.95), R44@23.0Å(now 18.8,conf 0.73), L49@8.0Å(now 3.9,conf 0.72), E32@12.7Å(now 7.0,conf 0.55), I47@14.2Å(now 7.8,conf 0.55)
  - Q55↔K38: targets 9.0/27.4Å but partners are 13.3Å apart → too_close_together by 5.1Å
  - K38↔Y56: targets 27.4/11.4Å but partners are 11.0Å apart → too_close_together by 5.0Å
  - I58↔K38: targets 17.0/27.4Å but partners are 7.5Å apart → too_close_together by 2.9Å
- **P82** — severity 10.69, 5 conflict(s); suspect input ~`T86` (group: push_out)
  - push-out (wants farther): N60@23.6Å(now 18.3,conf 0.76), P63@26.2Å(now 23.1,conf 0.74), G59@22.3Å(now 18.9,conf 0.66)
  - E85↔N60: targets 10.9/23.6Å but partners are 8.3Å apart → too_close_together by 4.4Å
  - N60↔T86: targets 23.6/13.3Å but partners are 5.7Å apart → too_close_together by 4.7Å
  - N60↔F87: targets 23.6/16.6Å but partners are 3.5Å apart → too_close_together by 3.6Å
- **R44** — severity 8.30, 4 conflict(s); suspect input ~`D52` (group: push_out)
  - push-out (wants farther): K38@9.1Å(now 4.1,conf 0.91), D52@23.0Å(now 18.8,conf 0.73), D64@18.0Å(now 14.5,conf 0.55)
  - I47↔D52: targets 10.6/23.0Å but partners are 7.8Å apart → too_close_together by 4.6Å
  - D48↔D52: targets 13.4/23.0Å but partners are 7.3Å apart → too_close_together by 2.3Å
  - D52↔Y35: targets 23.0/5.6Å but partners are 14.4Å apart → too_close_together by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=33 · 3-10(G)=12 · coil(C)=7

```
CEEEEHHCHGCEEEHEECEEEEEGHHGGGEGGHHEEHHHHHHHHEEHHHHHHGHHEHHEHHEHHEHHGHCCEGHHEHCEEEGEEEGEE
```

## Backbone H-bond Network

- total=51 · helix(i→i+4)=13 · sheet=38
  - L33 ↔ I37  (helix)
  - I37 ↔ P41  (helix)
  - K38 ↔ G42  (helix)
  - D39 ↔ D43  (helix)
  - V40 ↔ R44  (helix)
  - D43 ↔ I47  (helix)
  - R44 ↔ D48  (helix)
  - I47 ↔ E51  (helix)
  - D48 ↔ D52  (helix)
  - T50 ↔ N54  (helix)
  - N54 ↔ I58  (helix)
  - N60 ↔ D64  (helix)
  - P63 ↔ Y67  (helix)
  - D2 ↔ F22  (sheet)
  - A3 ↔ W21  (sheet)
  - A3 ↔ F22  (sheet)
  - A3 ↔ K23  (sheet)
  - P4 ↔ I19  (sheet)
  - P4 ↔ T20  (sheet)
  - P4 ↔ W21  (sheet)
  - … +31 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=33 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=390 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=248 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.1753 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=20 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
