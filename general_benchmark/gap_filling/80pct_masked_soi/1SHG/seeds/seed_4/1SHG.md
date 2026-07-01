# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1SHG\seeds\seed_4\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 9.861 A
- tm_score_ca_ordered: 0.10688696828254281
- heavy_atom_rmsd: 10.654 A
- sidechain_heavy_atom_rmsd: 11.379 A
- **all-atom quality (honest):** heavy 10.654 A, sidechain 11.379 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 37
- distogram_pairs: 475
- bin_accuracy: 0.324

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=8.583752664663061 -> 7.246955416865264 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.861291647649798
- ga_delta_rmsd: -2.815983593124967  ga_fitness_mode: energy
- pre_local_rmsd: 9.904645157089492  localized_anchor_rmsd: 9.861305229481596

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q10-K20 → 213 conflicts (54%); E1-Y7 → 68 conflicts (17%); W36 → 20 conflicts (5%)
- explained: 301/395 conflicts by 3 root cause(s)
- metrics: hubs=49 (frac 0.891), conflicts/hub=8.1, max_incompat=11.09Å, chain_span=0.982
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q10-K20 + E1-Y7 + W36 — explain ~301/395 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K12** — severity 107.04, 32 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): A50@16.0Å(now 19.8,conf 0.55)
  - push-out (wants farther): A5@17.0Å(now 11.9,conf 1.00), Y7@15.1Å(now 11.4,conf 0.91), L6@17.4Å(now 7.5,conf 0.79), R15@8.6Å(now 4.7,conf 0.79), E1@23.8Å(now 10.7,conf 0.75), K54@22.5Å(now 19.3,conf 0.68), L27@19.3Å(now 9.8,conf 0.56), S30@19.2Å(now 12.5,conf 0.56), N29@19.1Å(now 14.6,conf 0.56)
  - V17↔E1: targets 7.1/23.8Å but partners are 5.9Å apart → too_close_together by 10.8Å
  - E16↔E1: targets 6.6/23.8Å but partners are 6.9Å apart → too_close_together by 10.3Å
  - E1↔Y9: targets 23.8/10.0Å but partners are 3.1Å apart → too_close_together by 10.7Å
- **P14** — severity 88.21, 25 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): G45@8.5Å(now 11.1,conf 0.55)
  - push-out (wants farther): Y7@21.0Å(now 15.4,conf 0.99), E1@23.2Å(now 13.6,conf 0.75), L2@22.5Å(now 11.7,conf 0.68), A5@19.6Å(now 15.9,conf 0.57), T26@19.1Å(now 13.6,conf 0.56)
  - E11↔E1: targets 9.0/23.2Å but partners are 6.3Å apart → too_close_together by 7.9Å
  - E11↔L2: targets 9.0/22.5Å but partners are 4.8Å apart → too_close_together by 8.7Å
  - Q10↔E1: targets 11.4/23.2Å but partners are 3.9Å apart → too_close_together by 7.9Å
- **Q10** — severity 84.03, 25 conflict(s); suspect input ~`E1` (group: pull_in)
  - pull-in (wants closer): A50@14.2Å(now 19.2,conf 0.55), A49@14.0Å(now 17.1,conf 0.55)
  - push-out (wants farther): V3@17.0Å(now 7.6,conf 1.00), L4@15.0Å(now 6.4,conf 1.00), Y7@11.0Å(now 7.2,conf 0.99), E16@9.0Å(now 4.3,conf 0.99), R15@11.1Å(now 7.2,conf 0.91), A5@11.4Å(now 8.2,conf 0.79), E1@21.8Å(now 3.9,conf 0.62), T31@21.4Å(now 6.0,conf 0.61), L6@13.0Å(now 4.8,conf 0.55)
  - V17↔E1: targets 5.4/21.8Å but partners are 5.9Å apart → too_close_together by 10.4Å
  - E1↔T18: targets 21.8/4.6Å but partners are 6.4Å apart → too_close_together by 10.8Å
  - E1↔M19: targets 21.8/6.5Å but partners are 4.1Å apart → too_close_together by 11.1Å
- **K21** — severity 38.58, 22 conflict(s); suspect input ~`L6` (group: push_out)
  - pull-in (wants closer): Y7@4.5Å(now 7.2,conf 0.61), L6@5.3Å(now 11.6,conf 0.56), T18@10.3Å(now 13.2,conf 0.55)
  - push-out (wants farther): K53@11.0Å(now 7.0,conf 0.55), L2@14.2Å(now 10.9,conf 0.55)
  - R15↔L6: targets 19.1/5.3Å but partners are 8.2Å apart → too_close_together by 5.6Å
  - L6↔L2: targets 5.3/14.2Å but partners are 3.5Å apart → too_close_together by 5.4Å
  - Y7↔L2: targets 4.5/14.2Å but partners are 4.5Å apart → too_close_together by 5.2Å
- **R43** — severity 36.09, 16 conflict(s); suspect input ~`L55` (group: pull_in)
  - pull-in (wants closer): S13@13.9Å(now 16.7,conf 0.55)
  - push-out (wants farther): P48@15.0Å(now 9.2,conf 1.00), A50@19.0Å(now 12.7,conf 0.99), F46@9.4Å(now 5.5,conf 0.79), A49@17.4Å(now 11.4,conf 0.79), L55@19.6Å(now 12.9,conf 0.57), Y7@17.5Å(now 13.4,conf 0.55), Y51@17.3Å(now 11.7,conf 0.55), T26@10.3Å(now 4.1,conf 0.55), V47@11.8Å(now 6.3,conf 0.55)
  - E39↔L55: targets 5.0/19.6Å but partners are 7.9Å apart → too_close_together by 6.7Å
  - E39↔A50: targets 5.0/19.0Å but partners are 10.3Å apart → too_close_together by 3.7Å
  - V40↔A50: targets 5.0/19.0Å but partners are 10.6Å apart → too_close_together by 3.4Å
- **E11** — severity 35.60, 14 conflict(s); suspect input ~`L28` (group: push_out)
  - push-out (wants farther): L6@15.0Å(now 3.1,conf 1.00), Y7@13.0Å(now 7.2,conf 1.00), L4@17.0Å(now 6.7,conf 0.99), R15@9.0Å(now 5.6,conf 0.99), A5@13.4Å(now 8.1,conf 0.79), K53@18.1Å(now 14.9,conf 0.55), L28@17.0Å(now 10.8,conf 0.55)
  - L4↔T18: targets 17.0/4.9Å but partners are 4.9Å apart → too_close_together by 7.2Å
  - L4↔V17: targets 17.0/5.0Å but partners are 6.0Å apart → too_close_together by 5.9Å
  - V17↔L28: targets 5.0/17.0Å but partners are 5.9Å apart → too_close_together by 6.0Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=18 · 3-10(G)=5 · coil(C)=2

```
ECHGHHHHHHEEHHEHHHEEHHEHGEHEHHHEHGGHHEHHHGHHEHEEEHEEEHC
```

## Backbone H-bond Network

- total=48 · helix(i→i+4)=13 · sheet=35
  - V3 ↔ Y7  (helix)
  - A5 ↔ Y9  (helix)
  - L6 ↔ Q10  (helix)
  - Y9 ↔ S13  (helix)
  - Q10 ↔ P14  (helix)
  - S13 ↔ V17  (helix)
  - V17 ↔ K21  (helix)
  - L27 ↔ T31  (helix)
  - K33 ↔ K37  (helix)
  - K37 ↔ N41  (helix)
  - V40 ↔ Q44  (helix)
  - F46 ↔ A50  (helix)
  - A50 ↔ K54  (helix)
  - E1 ↔ E11  (sheet)
  - E1 ↔ K12  (sheet)
  - E1 ↔ R15  (sheet)
  - E1 ↔ M19  (sheet)
  - E1 ↔ K20  (sheet)
  - E11 ↔ M19  (sheet)
  - E11 ↔ K20  (sheet)
  - … +28 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=374 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=274 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=7.1849 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=37 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
