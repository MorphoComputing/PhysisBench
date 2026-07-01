# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4PTI\seeds\seed_7\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 6.985 A
- tm_score_ca_ordered: 0.27783343620823586
- heavy_atom_rmsd: 8.762 A
- sidechain_heavy_atom_rmsd: 10.236 A
- **all-atom quality (honest):** heavy 8.762 A, sidechain 10.236 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 484
- bin_accuracy: 0.597

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=42
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.985453746215307
- ga_delta_rmsd: -0.21779999387970417  ga_fitness_mode: energy
- pre_local_rmsd: 6.995000483620301  localized_anchor_rmsd: 6.985472013659552

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P1-P8 → 51 conflicts (86%); A47 → 3 conflicts (5%)
- explained: 54/59 conflicts by 2 root cause(s)
- metrics: hubs=20 (frac 0.357), conflicts/hub=3.0, max_incompat=8.4Å, chain_span=0.893
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P1-P8 + A47 — explain ~54/59 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I18** — severity 18.61, 7 conflict(s); suspect input ~`T31` (group: pull_in)
  - pull-in (wants closer): C50@13.0Å(now 15.6,conf 0.55)
  - push-out (wants farther): P1@21.8Å(now 14.9,conf 0.62), L5@19.1Å(now 13.5,conf 0.56), F3@19.0Å(now 13.0,conf 0.56)
  - F3↔T31: targets 19.0/6.5Å but partners are 5.5Å apart → too_close_together by 7.0Å
  - L5↔T31: targets 19.1/6.5Å but partners are 5.9Å apart → too_close_together by 6.7Å
  - P1↔T31: targets 21.8/6.5Å but partners are 8.7Å apart → too_close_together by 6.6Å
- **P1** — severity 15.10, 6 conflict(s); suspect input ~`Q30` (group: pull_in)
  - pull-in (wants closer): A39@16.4Å(now 20.1,conf 0.55)
  - push-out (wants farther): I18@21.8Å(now 14.9,conf 0.62), R19@18.2Å(now 12.6,conf 0.55), Q30@17.1Å(now 7.3,conf 0.55), G27@13.5Å(now 10.6,conf 0.55), A47@16.1Å(now 10.7,conf 0.55)
  - C4↔Q30: targets 5.0/17.1Å but partners are 3.7Å apart → too_close_together by 8.4Å
  - C4↔I18: targets 5.0/21.8Å but partners are 11.7Å apart → too_close_together by 5.0Å
  - L5↔Q30: targets 6.8/17.1Å but partners are 4.8Å apart → too_close_together by 5.5Å
- **A15** — severity 13.37, 6 conflict(s); suspect input ~`V33` (group: push_out)
  - push-out (wants farther): P8@15.0Å(now 11.8,conf 0.99), D2@27.2Å(now 22.9,conf 0.91), P7@19.0Å(now 16.0,conf 0.56)
  - I18↔D2: targets 9.0/27.2Å but partners are 14.4Å apart → too_close_together by 3.9Å
  - D2↔V33: targets 27.2/8.4Å but partners are 14.7Å apart → too_close_together by 4.2Å
  - Y20↔D2: targets 15.0/27.2Å but partners are 9.9Å apart → too_close_together by 2.4Å
- **F3** — severity 8.40, 5 conflict(s); suspect input ~`V33` (group: push_out)
  - push-out (wants farther): I18@19.0Å(now 13.0,conf 0.56), V33@18.2Å(now 12.1,conf 0.55), A47@16.0Å(now 12.6,conf 0.55)
  - P8↔V33: targets 10.0/18.2Å but partners are 3.2Å apart → too_close_together by 5.0Å
  - P7↔V33: targets 7.3/18.2Å but partners are 7.5Å apart → too_close_together by 3.4Å
  - E6↔V33: targets 5.5/18.2Å but partners are 10.1Å apart → too_close_together by 2.6Å
- **D2** — severity 6.84, 3 conflict(s); suspect input ~`L5` (group: push_out)
  - push-out (wants farther): A15@27.2Å(now 22.9,conf 0.91), K45@18.8Å(now 15.5,conf 0.56), C29@14.9Å(now 7.0,conf 0.55), L28@14.8Å(now 7.4,conf 0.55)
  - C29↔L5: targets 14.9/5.0Å but partners are 5.1Å apart → too_close_together by 4.7Å
  - L28↔L5: targets 14.8/5.0Å but partners are 5.5Å apart → too_close_together by 4.2Å
  - P8↔A15: targets 13.1/27.2Å but partners are 11.8Å apart → too_close_together by 2.4Å
- **G27** — severity 5.08, 3 conflict(s); suspect input ~`T31` (group: pull_in)
  - pull-in (wants closer): Q30@9.0Å(now 11.8,conf 0.94)
  - push-out (wants farther): E6@13.0Å(now 9.9,conf 0.55), P1@13.5Å(now 10.6,conf 0.55), T53@12.4Å(now 8.1,conf 0.55)
  - Q30↔T31: targets 9.0/12.9Å but partners are 1.5Å apart → too_close_together by 2.3Å
  - Q30↔F32: targets 9.0/15.4Å but partners are 4.5Å apart → too_close_together by 1.9Å
  - N23↔E6: targets 7.0/13.0Å but partners are 3.4Å apart → too_close_together by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=23 · 3-10(G)=5 · coil(C)=6

```
EEHHEECEHHHHCEEEHHEECCHEGHHEEGEGCEHHEHEEHHEGHHEHEGHHEHEC
```

## Backbone H-bond Network

- total=51 · helix(i→i+4)=5 · sheet=46
  - N23 ↔ G27  (helix)
  - R38 ↔ N42  (helix)
  - R41 ↔ K45  (helix)
  - N42 ↔ S46  (helix)
  - E48 ↔ R52  (helix)
  - P1 ↔ E6  (sheet)
  - P1 ↔ Y20  (sheet)
  - D2 ↔ Y20  (sheet)
  - L5 ↔ R19  (sheet)
  - L5 ↔ Y20  (sheet)
  - L5 ↔ A24  (sheet)
  - E6 ↔ R19  (sheet)
  - E6 ↔ Y20  (sheet)
  - E6 ↔ A24  (sheet)
  - P8 ↔ K14  (sheet)
  - P8 ↔ A15  (sheet)
  - P8 ↔ R16  (sheet)
  - P8 ↔ R19  (sheet)
  - P8 ↔ Y20  (sheet)
  - K14 ↔ Y34  (sheet)
  - … +31 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=246 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=149 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1462 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
