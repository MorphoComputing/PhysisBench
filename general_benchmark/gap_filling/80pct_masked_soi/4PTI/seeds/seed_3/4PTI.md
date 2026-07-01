# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4PTI\seeds\seed_3\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 4.335 A
- tm_score_ca_ordered: 0.396446463499235
- heavy_atom_rmsd: 5.306 A
- sidechain_heavy_atom_rmsd: 6.146 A
- **all-atom quality (honest):** heavy 5.306 A, sidechain 6.146 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 17
- distogram_pairs: 483
- bin_accuracy: 0.458

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.335473913038256
- ga_delta_rmsd: -0.7214060148644368  ga_fitness_mode: energy
- pre_local_rmsd: 4.3354431762375825  localized_anchor_rmsd: 4.3354431762375825

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C29-Q30 → 28 conflicts (31%); N23 → 17 conflicts (19%); P1 → 11 conflicts (12%)
- explained: 56/90 conflicts by 3 root cause(s)
- metrics: hubs=29 (frac 0.518), conflicts/hub=3.1, max_incompat=8.48Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C29-Q30 + N23 + P1 — explain ~56/90 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A26** — severity 35.57, 17 conflict(s); suspect input ~`R41` (group: pull_in)
  - pull-in (wants closer): N23@5.4Å(now 8.0,conf 0.79), C29@8.0Å(now 11.3,conf 0.72)
  - push-out (wants farther): C37@26.1Å(now 22.9,conf 0.72), A39@21.4Å(now 17.4,conf 0.60), R41@18.1Å(now 13.2,conf 0.55), L5@11.1Å(now 6.0,conf 0.55)
  - N23↔C37: targets 5.4/26.1Å but partners are 15.1Å apart → too_close_together by 5.5Å
  - N23↔A39: targets 5.4/21.4Å but partners are 10.1Å apart → too_close_together by 5.8Å
  - N23↔R41: targets 5.4/18.1Å but partners are 7.0Å apart → too_close_together by 5.7Å
- **C29** — severity 19.51, 11 conflict(s); suspect input ~`D2` (group: push_out)
  - pull-in (wants closer): N23@5.0Å(now 8.3,conf 0.99), A26@8.0Å(now 11.3,conf 0.72), Y20@6.0Å(now 10.4,conf 0.55)
  - push-out (wants farther): D2@14.9Å(now 8.2,conf 0.55), R41@13.3Å(now 6.3,conf 0.55)
  - N23↔D2: targets 5.0/14.9Å but partners are 5.3Å apart → too_close_together by 4.6Å
  - Y22↔D2: targets 4.9/14.9Å but partners are 5.8Å apart → too_close_together by 4.2Å
  - N23↔R52: targets 5.0/10.3Å but partners are 18.9Å apart → too_far_apart by 3.6Å
- **P1** — severity 14.21, 7 conflict(s); suspect input ~`Q30` (group: pull_in)
  - pull-in (wants closer): G56@8.2Å(now 11.3,conf 0.55)
  - push-out (wants farther): I18@21.8Å(now 18.0,conf 0.62), Y34@20.4Å(now 17.4,conf 0.59), R19@18.2Å(now 15.0,conf 0.55), Q30@17.1Å(now 8.3,conf 0.55), G27@13.5Å(now 3.6,conf 0.55), A47@16.1Å(now 13.6,conf 0.55)
  - C4↔Q30: targets 5.0/17.1Å but partners are 3.6Å apart → too_close_together by 8.5Å
  - C4↔I18: targets 5.0/21.8Å but partners are 12.7Å apart → too_close_together by 4.1Å
  - L5↔G56: targets 7.1/8.2Å but partners are 18.6Å apart → too_far_apart by 3.3Å
- **Q30** — severity 10.46, 6 conflict(s); suspect input ~`P1` (group: push_out)
  - push-out (wants farther): C37@19.0Å(now 14.7,conf 1.00), G36@17.0Å(now 14.0,conf 0.99), P1@17.1Å(now 8.3,conf 0.55), L5@13.1Å(now 10.2,conf 0.55), G56@15.6Å(now 12.5,conf 0.55)
  - C37↔V33: targets 19.0/10.4Å but partners are 3.7Å apart → too_close_together by 4.9Å
  - G27↔P1: targets 9.0/17.1Å but partners are 3.6Å apart → too_close_together by 4.5Å
  - C37↔G35: targets 19.0/15.4Å but partners are 0.8Å apart → too_close_together by 2.7Å
- **G27** — severity 9.00, 7 conflict(s); suspect input ~`G35` (group: pull_in)
  - pull-in (wants closer): N23@6.6Å(now 9.1,conf 0.79)
  - push-out (wants farther): P1@13.5Å(now 3.6,conf 0.55), C4@10.3Å(now 7.5,conf 0.55)
  - N23↔G35: targets 6.6/23.4Å but partners are 14.6Å apart → too_close_together by 2.3Å
  - N23↔R38: targets 6.6/24.4Å but partners are 15.9Å apart → too_close_together by 1.9Å
  - A24↔P1: targets 6.6/13.5Å but partners are 4.5Å apart → too_close_together by 2.5Å
- **L28** — severity 6.30, 5 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): T31@10.9Å(now 7.2,conf 0.91), K40@17.6Å(now 13.6,conf 0.55), D2@14.8Å(now 4.5,conf 0.55)
  - N23↔D2: targets 5.6/14.8Å but partners are 5.3Å apart → too_close_together by 3.9Å
  - F21↔K40: targets 8.6/17.6Å but partners are 6.6Å apart → too_close_together by 2.4Å
  - Y22↔D2: targets 6.9/14.8Å but partners are 5.8Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=18 · 3-10(G)=9 · coil(C)=3

```
EEHHCEGCEGEHEGHGEGEEGGGHHEGEHEHHHHHHHHHHEHEEHHEHHHEHHEHC
```

## Backbone H-bond Network

- total=38 · helix(i→i+4)=11 · sheet=27
  - K25 ↔ C29  (helix)
  - C29 ↔ V33  (helix)
  - T31 ↔ G35  (helix)
  - V33 ↔ C37  (helix)
  - Y34 ↔ R38  (helix)
  - G35 ↔ A39  (helix)
  - R38 ↔ N42  (helix)
  - N42 ↔ S46  (helix)
  - S46 ↔ C50  (helix)
  - E48 ↔ R52  (helix)
  - D49 ↔ T53  (helix)
  - P1 ↔ E6  (sheet)
  - P1 ↔ Y20  (sheet)
  - D2 ↔ Y20  (sheet)
  - E6 ↔ Y20  (sheet)
  - E6 ↔ A26  (sheet)
  - Y9 ↔ I17  (sheet)
  - Y9 ↔ R19  (sheet)
  - Y9 ↔ Y20  (sheet)
  - R19 ↔ L28  (sheet)
  - … +18 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=266 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=172 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.0311 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=17 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
