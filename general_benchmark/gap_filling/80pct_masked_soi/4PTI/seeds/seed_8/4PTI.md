# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4PTI\seeds\seed_8\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 5.513 A
- tm_score_ca_ordered: 0.35199786000440975
- heavy_atom_rmsd: 7.284 A
- sidechain_heavy_atom_rmsd: 8.662 A
- **all-atom quality (honest):** heavy 7.284 A, sidechain 8.662 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 485
- bin_accuracy: 0.520

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.512693518637265
- ga_delta_rmsd: -0.7488291230180684  ga_fitness_mode: energy
- pre_local_rmsd: 5.512670767594775  localized_anchor_rmsd: 5.512670767594775

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C37-R41 → 37 conflicts (59%); Q30-T31 → 13 conflicts (21%); N23 → 4 conflicts (6%)
- explained: 54/63 conflicts by 3 root cause(s)
- metrics: hubs=21 (frac 0.375), conflicts/hub=3.0, max_incompat=5.25Å, chain_span=0.821
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C37-R41 + Q30-T31 + N23 — explain ~54/63 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R38** — severity 18.51, 8 conflict(s); suspect input ~`G27` (group: push_out)
  - push-out (wants farther): V33@13.0Å(now 6.5,conf 0.99), T31@16.9Å(now 9.2,conf 0.91), F32@14.6Å(now 6.7,conf 0.79), G27@24.4Å(now 19.1,conf 0.71), A24@21.5Å(now 17.8,conf 0.61), N23@19.6Å(now 15.0,conf 0.57), P8@11.9Å(now 9.3,conf 0.55)
  - T31↔R41: targets 16.9/9.1Å but partners are 3.9Å apart → too_close_together by 3.9Å
  - N42↔G27: targets 11.0/24.4Å but partners are 8.4Å apart → too_close_together by 4.9Å
  - R41↔G27: targets 9.1/24.4Å but partners are 10.7Å apart → too_close_together by 4.5Å
- **A26** — severity 17.02, 10 conflict(s); suspect input ~`Q30` (group: pull_in)
  - pull-in (wants closer): I18@18.9Å(now 21.7,conf 0.56), S46@16.9Å(now 19.5,conf 0.55)
  - push-out (wants farther): C37@26.1Å(now 21.4,conf 0.72), A39@21.4Å(now 15.0,conf 0.60), R41@18.1Å(now 11.2,conf 0.55)
  - R41↔Q30: targets 18.1/9.1Å but partners are 3.8Å apart → too_close_together by 5.2Å
  - N23↔A39: targets 6.6/21.4Å but partners are 11.1Å apart → too_close_together by 3.7Å
  - A39↔Q30: targets 21.4/9.1Å but partners are 8.2Å apart → too_close_together by 4.1Å
- **G27** — severity 10.67, 6 conflict(s); suspect input ~`R38` (group: push_out)
  - push-out (wants farther): R38@24.4Å(now 19.1,conf 0.71), P1@13.5Å(now 4.8,conf 0.55), T53@12.4Å(now 9.6,conf 0.55)
  - Q30↔R38: targets 9.1/24.4Å but partners are 11.9Å apart → too_close_together by 3.4Å
  - F32↔R38: targets 15.1/24.4Å but partners are 6.7Å apart → too_close_together by 2.6Å
  - A24↔P1: targets 6.8/13.5Å but partners are 3.3Å apart → too_close_together by 3.4Å
- **C37** — severity 10.23, 6 conflict(s); suspect input ~`K40` (group: pull_in)
  - pull-in (wants closer): F44@13.0Å(now 15.9,conf 0.99), N43@12.0Å(now 15.7,conf 0.72), K45@14.2Å(now 17.4,conf 0.55)
  - push-out (wants farther): Q30@19.0Å(now 15.8,conf 1.00), T31@17.0Å(now 12.8,conf 0.99), A26@26.1Å(now 21.4,conf 0.72), V33@11.4Å(now 8.2,conf 0.55), F32@13.9Å(now 10.1,conf 0.55)
  - Q30↔K40: targets 19.0/9.3Å but partners are 6.0Å apart → too_close_together by 3.7Å
  - A26↔N42: targets 26.1/13.6Å but partners are 9.0Å apart → too_close_together by 3.5Å
  - Q30↔R41: targets 19.0/12.1Å but partners are 3.8Å apart → too_close_together by 3.1Å
- **Q30** — severity 8.68, 5 conflict(s); suspect input ~`P1` (group: pull_in)
  - pull-in (wants closer): S46@9.6Å(now 13.4,conf 0.55), R19@8.3Å(now 11.5,conf 0.55)
  - push-out (wants farther): C37@19.0Å(now 15.8,conf 1.00), P1@17.1Å(now 9.7,conf 0.55)
  - N23↔P1: targets 7.1/17.1Å but partners are 5.5Å apart → too_close_together by 4.5Å
  - P1↔A26: targets 17.1/9.1Å but partners are 4.4Å apart → too_close_together by 3.7Å
  - G27↔P1: targets 9.1/17.1Å but partners are 4.8Å apart → too_close_together by 3.2Å
- **L28** — severity 5.33, 4 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): K40@17.6Å(now 12.1,conf 0.55), T53@10.9Å(now 6.7,conf 0.55), D2@14.8Å(now 9.2,conf 0.55)
  - N23↔D2: targets 5.6/14.8Å but partners are 6.0Å apart → too_close_together by 3.1Å
  - A24↔D2: targets 8.2/14.8Å but partners are 3.8Å apart → too_close_together by 2.7Å
  - K25↔D2: targets 8.8/14.8Å but partners are 3.9Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=25 · 3-10(G)=7 · coil(C)=1

```
EEHEGHHEEHEGHEGEHHEEHEEEHHGEGHHEHHHHHEGCEGEEEHEHEHHEHHEE
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=9 · sheet=49
  - F3 ↔ P7  (helix)
  - E6 ↔ T10  (helix)
  - C13 ↔ I17  (helix)
  - I17 ↔ F21  (helix)
  - F21 ↔ K25  (helix)
  - A26 ↔ Q30  (helix)
  - T31 ↔ G35  (helix)
  - S46 ↔ C50  (helix)
  - C50 ↔ C54  (helix)
  - D2 ↔ Y22  (sheet)
  - C4 ↔ Y20  (sheet)
  - C4 ↔ Y22  (sheet)
  - C4 ↔ N23  (sheet)
  - C4 ↔ A24  (sheet)
  - P8 ↔ R16  (sheet)
  - P8 ↔ R19  (sheet)
  - P8 ↔ Y20  (sheet)
  - P8 ↔ Y22  (sheet)
  - P8 ↔ N23  (sheet)
  - P8 ↔ A24  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=282 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=194 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.2411 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
