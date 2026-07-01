# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1YCC\seeds\seed_0\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 3.118 A
- tm_score_ca_ordered: 0.7267600750816644
- heavy_atom_rmsd: 4.341 A
- sidechain_heavy_atom_rmsd: 5.151 A
- **all-atom quality (honest):** heavy 4.341 A, sidechain 5.151 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 1055
- bin_accuracy: 0.637

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.1182714236685065
- ga_delta_rmsd: 3.091151310398987  ga_fitness_mode: energy
- pre_local_rmsd: 3.1450579349442607  localized_anchor_rmsd: 3.118283411498304

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** T97-C103 → 164 conflicts (76%); N93-D94 → 10 conflicts (5%)
- explained: 174/215 conflicts by 2 root cause(s)
- metrics: hubs=53 (frac 0.515), conflicts/hub=4.1, max_incompat=7.6Å, chain_span=0.971
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): T97-C103 + N93-D94 — explain ~174/215 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V24** — severity 32.37, 17 conflict(s); suspect input ~`Y98` (group: pull_in)
  - pull-in (wants closer): N93@17.1Å(now 21.2,conf 0.55), T97@13.2Å(now 18.1,conf 0.55), D94@15.6Å(now 18.2,conf 0.55), Y98@10.2Å(now 18.1,conf 0.55)
  - P29↔Y98: targets 7.0/10.2Å but partners are 24.1Å apart → too_far_apart by 6.9Å
  - H30↔Y98: targets 9.0/10.2Å but partners are 25.3Å apart → too_far_apart by 6.1Å
  - K31↔Y98: targets 11.0/10.2Å but partners are 25.9Å apart → too_far_apart by 4.8Å
- **C103** — severity 30.04, 13 conflict(s); suspect input ~`P29` (group: push_out)
  - pull-in (wants closer): K100@6.9Å(now 10.0,conf 0.91), P29@11.4Å(now 17.0,conf 0.79), I39@6.7Å(now 10.4,conf 0.55), F40@7.5Å(now 10.2,conf 0.55), Q46@15.0Å(now 19.4,conf 0.55), G33@14.8Å(now 19.2,conf 0.55), R42@11.6Å(now 15.3,conf 0.55)
  - push-out (wants farther): K3@17.5Å(now 14.0,conf 0.55), A11@11.7Å(now 4.6,conf 0.55), G5@16.1Å(now 7.9,conf 0.55)
  - K100↔P29: targets 6.9/11.4Å but partners are 25.9Å apart → too_far_apart by 7.6Å
  - K100↔G5: targets 6.9/16.1Å but partners are 3.9Å apart → too_close_together by 5.4Å
  - Y98↔P29: targets 9.0/11.4Å but partners are 24.1Å apart → too_far_apart by 3.6Å
- **H37** — severity 22.14, 11 conflict(s); suspect input ~`A102` (group: pull_in)
  - pull-in (wants closer): A102@7.5Å(now 14.4,conf 0.55)
  - A102↔G49: targets 7.5/13.8Å but partners are 28.2Å apart → too_far_apart by 6.9Å
  - A102↔Q46: targets 7.5/11.6Å but partners are 24.4Å apart → too_far_apart by 5.3Å
  - H30↔A102: targets 11.0/7.5Å but partners are 23.2Å apart → too_far_apart by 4.6Å
- **L99** — severity 20.71, 12 conflict(s); suspect input ~`E25` (group: pull_in)
  - pull-in (wants closer): H30@16.4Å(now 21.9,conf 0.55), Q20@15.5Å(now 18.9,conf 0.55), F14@8.4Å(now 11.4,conf 0.55), E25@10.3Å(now 18.8,conf 0.55), G27@15.7Å(now 19.4,conf 0.55)
  - push-out (wants farther): D94@9.0Å(now 4.3,conf 0.99), N93@9.1Å(now 6.0,conf 0.91), R92@10.0Å(now 6.7,conf 0.72), K9@11.2Å(now 7.7,conf 0.55), F2@13.3Å(now 8.8,conf 0.55), A7@8.0Å(now 4.9,conf 0.55), K90@14.2Å(now 10.4,conf 0.55)
  - N93↔E25: targets 9.1/10.3Å but partners are 24.9Å apart → too_far_apart by 5.4Å
  - I96↔E25: targets 5.0/10.3Å but partners are 20.1Å apart → too_far_apart by 4.8Å
  - E25↔K90: targets 10.3/14.2Å but partners are 28.7Å apart → too_far_apart by 4.2Å
- **L36** — severity 19.66, 9 conflict(s); suspect input ~`A102` (group: push_out)
  - pull-in (wants closer): A102@9.3Å(now 15.4,conf 0.55)
  - push-out (wants farther): T16@16.2Å(now 13.1,conf 0.55)
  - A102↔H30: targets 9.3/8.5Å but partners are 23.2Å apart → too_far_apart by 5.4Å
  - G45↔A102: targets 11.1/9.3Å but partners are 25.2Å apart → too_far_apart by 4.9Å
  - A102↔Q46: targets 9.3/10.5Å but partners are 24.4Å apart → too_far_apart by 4.7Å
- **I39** — severity 17.52, 11 conflict(s); suspect input ~`C103` (group: push_out)
  - pull-in (wants closer): C103@6.7Å(now 10.4,conf 0.55)
  - push-out (wants farther): A11@16.3Å(now 11.5,conf 0.55)
  - C103↔A11: targets 6.7/16.3Å but partners are 4.6Å apart → too_close_together by 5.0Å
  - S44↔C103: targets 9.0/6.7Å but partners are 19.3Å apart → too_far_apart by 3.6Å
  - C103↔Q46: targets 6.7/9.2Å but partners are 19.4Å apart → too_far_apart by 3.5Å

## Secondary Structure (DSSP-like)

- helix(H)=40 · strand(E)=39 · 3-10(G)=14 · coil(C)=10

```
EECCEGEHHHHHHHGGEHGHEEEHHHECECEHECGCEHHEHEEEHEEEHCEEEHEHHEGCEGGEHEHHHGGHHEEEGHHCEGEGEEEEHHHHHHHHHHHEGEC
```

## Backbone H-bond Network

- total=97 · helix(i→i+4)=16 · sheet=81
  - K8 ↔ T12  (helix)
  - K9 ↔ L13  (helix)
  - G10 ↔ F14  (helix)
  - F14 ↔ C18  (helix)
  - Q20 ↔ V24  (helix)
  - G41 ↔ G45  (helix)
  - G45 ↔ G49  (helix)
  - E65 ↔ S69  (helix)
  - M68 ↔ L72  (helix)
  - S69 ↔ T73  (helix)
  - E89 ↔ N93  (helix)
  - K90 ↔ D94  (helix)
  - D91 ↔ L95  (helix)
  - R92 ↔ I96  (helix)
  - D94 ↔ Y98  (helix)
  - L95 ↔ L99  (helix)
  - R17 ↔ H22  (sheet)
  - R17 ↔ T23  (sheet)
  - C21 ↔ P29  (sheet)
  - C21 ↔ K31  (sheet)
  - … +77 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=38 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=402 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=175 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6804 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
