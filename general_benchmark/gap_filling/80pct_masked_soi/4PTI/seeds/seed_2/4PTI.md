# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\4PTI\sequence\4PTI.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\4PTI\seeds\seed_2\4PTI.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 7.000 A
- tm_score_ca_ordered: 0.2558330967882907
- heavy_atom_rmsd: 8.736 A
- sidechain_heavy_atom_rmsd: 10.198 A
- **all-atom quality (honest):** heavy 8.736 A, sidechain 10.198 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 485
- bin_accuracy: 0.499

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.999864108393094
- ga_delta_rmsd: -0.586732640771257  ga_fitness_mode: energy
- pre_local_rmsd: 7.065695830798746  localized_anchor_rmsd: 6.999916228385674

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P1-E6 → 49 conflicts (72%); C29-V33 → 13 conflicts (19%)
- explained: 62/68 conflicts by 2 root cause(s)
- metrics: hubs=23 (frac 0.411), conflicts/hub=3.0, max_incompat=8.28Å, chain_span=0.839
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P1-E6 + C29-V33 — explain ~62/68 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I18** — severity 20.22, 8 conflict(s); suspect input ~`T31` (group: push_out)
  - push-out (wants farther): P1@21.8Å(now 15.6,conf 0.62), L5@19.1Å(now 10.3,conf 0.56), F3@19.0Å(now 14.1,conf 0.56), T10@10.1Å(now 7.2,conf 0.55)
  - L5↔T31: targets 19.1/6.5Å but partners are 4.4Å apart → too_close_together by 8.3Å
  - P1↔T31: targets 21.8/6.5Å but partners are 8.8Å apart → too_close_together by 6.5Å
  - F21↔F3: targets 9.4/19.0Å but partners are 3.8Å apart → too_close_together by 5.8Å
- **P1** — severity 16.26, 8 conflict(s); suspect input ~`Q30` (group: push_out)
  - push-out (wants farther): S46@17.0Å(now 13.5,conf 0.99), I18@21.8Å(now 15.6,conf 0.62), R19@18.2Å(now 13.7,conf 0.55), Q30@17.1Å(now 8.5,conf 0.55), G27@13.5Å(now 8.1,conf 0.55), A47@16.1Å(now 10.7,conf 0.55)
  - C4↔Q30: targets 5.0/17.1Å but partners are 5.3Å apart → too_close_together by 6.8Å
  - L5↔I18: targets 7.0/21.8Å but partners are 10.3Å apart → too_close_together by 4.5Å
  - C4↔I18: targets 5.0/21.8Å but partners are 12.7Å apart → too_close_together by 4.1Å
- **A15** — severity 8.64, 5 conflict(s); suspect input ~`V33` (group: push_out)
  - push-out (wants farther): P8@15.1Å(now 12.4,conf 0.91), T10@10.9Å(now 8.1,conf 0.91), D2@27.2Å(now 23.9,conf 0.91), P7@19.0Å(now 15.2,conf 0.56)
  - I18↔D2: targets 9.1/27.2Å but partners are 15.7Å apart → too_close_together by 2.4Å
  - P7↔V33: targets 19.0/8.4Å but partners are 6.7Å apart → too_close_together by 4.0Å
  - D2↔V33: targets 27.2/8.4Å but partners are 15.2Å apart → too_close_together by 3.6Å
- **S46** — severity 8.53, 4 conflict(s); suspect input ~`E6` (group: push_out)
  - push-out (wants farther): P1@17.0Å(now 13.5,conf 0.99), K40@15.4Å(now 12.8,conf 0.79), E6@17.4Å(now 12.1,conf 0.55)
  - E6↔T31: targets 17.4/8.9Å but partners are 3.0Å apart → too_close_together by 5.4Å
  - Y20↔E6: targets 6.0/17.4Å but partners are 6.5Å apart → too_close_together by 4.9Å
  - K40↔N43: targets 15.4/8.0Å but partners are 5.3Å apart → too_close_together by 2.1Å
- **F3** — severity 8.14, 6 conflict(s); suspect input ~`V33` (group: push_out)
  - push-out (wants farther): Y9@12.9Å(now 9.8,conf 0.91), I18@19.0Å(now 14.1,conf 0.56), V33@18.2Å(now 12.1,conf 0.55), E48@16.8Å(now 13.3,conf 0.55), Y34@16.5Å(now 12.2,conf 0.55), A47@16.0Å(now 12.2,conf 0.55)
  - E6↔I18: targets 7.1/19.0Å but partners are 8.9Å apart → too_close_together by 3.0Å
  - P8↔V33: targets 11.0/18.2Å but partners are 4.5Å apart → too_close_together by 2.8Å
  - P8↔I18: targets 11.0/19.0Å but partners are 5.4Å apart → too_close_together by 2.6Å
- **C29** — severity 6.76, 3 conflict(s); suspect input ~`D2` (group: push_out)
  - pull-in (wants closer): V33@13.0Å(now 15.9,conf 1.00), N23@5.1Å(now 8.0,conf 0.91), Y20@6.0Å(now 11.0,conf 0.55), E48@8.8Å(now 11.8,conf 0.55)
  - push-out (wants farther): D2@14.9Å(now 10.8,conf 0.55), R41@13.3Å(now 6.2,conf 0.55)
  - N23↔D2: targets 5.1/14.9Å but partners are 4.1Å apart → too_close_together by 5.6Å
  - Y22↔D2: targets 3.8/14.9Å but partners are 6.2Å apart → too_close_together by 4.9Å
  - A26↔D2: targets 8.6/14.9Å but partners are 4.4Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=19 · 3-10(G)=10 · coil(C)=5

```
EEHEHEHHCHCEHEEEGEGECEGGHHHHHEHGHEEHHEGGGGECHEHCGHEHHHHE
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=5 · sheet=25
  - F3 ↔ P7  (helix)
  - K25 ↔ C29  (helix)
  - C29 ↔ V33  (helix)
  - V33 ↔ C37  (helix)
  - C50 ↔ C54  (helix)
  - P1 ↔ E6  (sheet)
  - P1 ↔ Y20  (sheet)
  - D2 ↔ Y20  (sheet)
  - D2 ↔ Y22  (sheet)
  - C4 ↔ Y20  (sheet)
  - C4 ↔ Y22  (sheet)
  - E6 ↔ I18  (sheet)
  - E6 ↔ Y20  (sheet)
  - E6 ↔ Y22  (sheet)
  - K14 ↔ Y34  (sheet)
  - A15 ↔ Y34  (sheet)
  - R16 ↔ Y34  (sheet)
  - I18 ↔ Q30  (sheet)
  - I18 ↔ Y34  (sheet)
  - Y20 ↔ Q30  (sheet)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=270 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=174 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.4487 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
