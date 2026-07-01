# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CRN\sequence\1CRN.pdb`
- output_pdb: `general_benchmark\model_refinement\esmfold\1CRN\seeds\seed_0\1CRN.pdb`
- residues: 44
- mode: oracle
- ca_rmsd: 8.255 A
- tm_score_ca_ordered: 0.13048500394845455
- heavy_atom_rmsd: 8.602 A
- sidechain_heavy_atom_rmsd: 8.762 A
- **all-atom quality (honest):** heavy 8.602 A, sidechain 8.762 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/35 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 861
- bin_accuracy: 0.498

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.2550732646438
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 8.692244757538129  localized_anchor_rmsd: 8.255041610648624

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y43-A44 → 122 conflicts (55%); C15-R16 → 50 conflicts (22%); P4-S5 → 22 conflicts (10%)
- explained: 194/222 conflicts by 3 root cause(s)
- metrics: hubs=37 (frac 0.841), conflicts/hub=6.0, max_incompat=8.23Å, chain_span=0.977
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y43-A44 + C15-R16 + P4-S5 — explain ~194/222 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G30** — severity 25.01, 18 conflict(s); suspect input ~`S5` (group: pull_in)
  - pull-in (wants closer): S5@6.2Å(now 9.8,conf 0.40)
  - push-out (wants farther): A44@22.9Å(now 17.9,conf 0.49), Y43@21.1Å(now 17.3,conf 0.44), A8@9.9Å(now 7.2,conf 0.34), F12@11.0Å(now 8.2,conf 0.34)
  - A44↔S5: targets 22.9/6.2Å but partners are 8.5Å apart → too_close_together by 8.2Å
  - Y43↔S5: targets 21.1/6.2Å but partners are 7.7Å apart → too_close_together by 7.2Å
  - A44↔I6: targets 22.9/6.3Å but partners are 11.4Å apart → too_close_together by 5.2Å
- **I32** — severity 21.42, 16 conflict(s); suspect input ~`S5` (group: push_out)
  - pull-in (wants closer): P4@6.0Å(now 9.1,conf 0.41), S5@6.5Å(now 10.9,conf 0.39), I6@7.0Å(now 10.5,conf 0.37), C15@8.4Å(now 12.9,conf 0.35)
  - push-out (wants farther): A44@22.1Å(now 17.9,conf 0.47), Y43@20.5Å(now 17.9,conf 0.42), T1@10.3Å(now 7.5,conf 0.34)
  - A44↔P4: targets 22.1/6.0Å but partners are 9.2Å apart → too_close_together by 7.0Å
  - A44↔S5: targets 22.1/6.5Å but partners are 8.5Å apart → too_close_together by 7.1Å
  - Y43↔S5: targets 20.5/6.5Å but partners are 7.7Å apart → too_close_together by 6.3Å
- **C31** — severity 18.00, 15 conflict(s); suspect input ~`Y43` (group: pull_in)
  - pull-in (wants closer): S5@5.4Å(now 8.8,conf 0.45), C15@6.0Å(now 10.6,conf 0.41)
  - push-out (wants farther): A44@20.8Å(now 16.1,conf 0.43), Y43@19.2Å(now 16.0,conf 0.39), T1@11.4Å(now 8.3,conf 0.34)
  - S5↔A44: targets 5.4/20.8Å but partners are 8.5Å apart → too_close_together by 6.9Å
  - S5↔Y43: targets 5.4/19.2Å but partners are 7.7Å apart → too_close_together by 6.1Å
  - A44↔P4: targets 20.8/6.2Å but partners are 9.2Å apart → too_close_together by 5.4Å
- **T29** — severity 13.92, 14 conflict(s); suspect input ~`S5` (group: pull_in)
  - pull-in (wants closer): A23@12.7Å(now 15.2,conf 0.34)
  - push-out (wants farther): A44@23.7Å(now 17.9,conf 0.52), Y43@22.1Å(now 17.1,conf 0.47), V7@9.8Å(now 6.3,conf 0.34), N11@14.5Å(now 8.5,conf 0.34), N13@10.4Å(now 7.4,conf 0.34), R9@13.9Å(now 8.6,conf 0.34), A8@13.1Å(now 6.9,conf 0.34), F12@11.8Å(now 6.3,conf 0.34), S10@12.1Å(now 7.9,conf 0.34)
  - A44↔S5: targets 23.7/9.1Å but partners are 8.5Å apart → too_close_together by 6.2Å
  - Y43↔S5: targets 22.1/9.1Å but partners are 7.7Å apart → too_close_together by 5.4Å
  - A44↔R16: targets 23.7/12.8Å but partners are 7.6Å apart → too_close_together by 3.4Å
- **C3** — severity 13.11, 11 conflict(s); suspect input ~`C39` (group: push_out)
  - pull-in (wants closer): C15@5.3Å(now 12.4,conf 0.46), C25@5.9Å(now 9.8,conf 0.41), G19@10.7Å(now 14.9,conf 0.34)
  - push-out (wants farther): A44@17.4Å(now 14.1,conf 0.35)
  - C15↔I34: targets 5.3/7.0Å but partners are 16.9Å apart → too_far_apart by 4.5Å
  - C15↔P35: targets 5.3/9.4Å but partners are 19.2Å apart → too_far_apart by 4.5Å
  - C15↔G36: targets 5.3/10.7Å but partners are 20.6Å apart → too_far_apart by 4.5Å
- **I34** — severity 12.39, 14 conflict(s); suspect input ~`P4` (group: push_out)
  - pull-in (wants closer): P4@6.7Å(now 9.9,conf 0.38), S5@9.6Å(now 12.3,conf 0.34), C25@10.9Å(now 13.4,conf 0.34), C15@11.4Å(now 16.9,conf 0.34)
  - push-out (wants farther): A44@21.6Å(now 18.0,conf 0.45)
  - A44↔P4: targets 21.6/6.7Å but partners are 9.2Å apart → too_close_together by 5.6Å
  - Y43↔P4: targets 20.1/6.7Å but partners are 8.9Å apart → too_close_together by 4.4Å
  - A44↔S5: targets 21.6/9.6Å but partners are 8.5Å apart → too_close_together by 3.5Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=9 · 3-10(G)=8 · coil(C)=11

```
CCHEHEHEGHHHHEHGGEGGCHHHGHHEHECCCCEGGCCCCHHE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=5 · sheet=8
  - C3 ↔ V7  (helix)
  - V7 ↔ N11  (helix)
  - N11 ↔ C15  (helix)
  - E22 ↔ A26  (helix)
  - A23 ↔ T27  (helix)
  - P4 ↔ V14  (sheet)
  - P4 ↔ P18  (sheet)
  - I6 ↔ V14  (sheet)
  - I6 ↔ P18  (sheet)
  - A8 ↔ V14  (sheet)
  - A8 ↔ Y28  (sheet)
  - V14 ↔ Y28  (sheet)
  - V14 ↔ G30  (sheet)

## Solvent Accessibility (burial)

- buried=11 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=145 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=66 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5376 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C2–C39, C3–C31, C15–C25

## Side-chain Rotamers (χ1/χ2)

- 35 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
