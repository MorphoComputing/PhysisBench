# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1HPH\seeds\seed_1\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 4.293 A
- tm_score_ca_ordered: 0.2786530428265123
- heavy_atom_rmsd: 5.933 A
- sidechain_heavy_atom_rmsd: 7.097 A
- **all-atom quality (honest):** heavy 5.933 A, sidechain 7.097 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 528
- bin_accuracy: 0.367

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain_block reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.292565634027479
- ga_delta_rmsd: 0.01743124522234396  ga_fitness_mode: energy
- pre_local_rmsd: 4.292605432015346  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L14-M17 → 131 conflicts (54%); R24-K26 → 29 conflicts (12%); E21 → 23 conflicts (10%)
- explained: 183/242 conflicts by 3 root cause(s)
- metrics: hubs=33 (frac 0.943), conflicts/hub=7.3, max_incompat=9.25Å, chain_span=0.971
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L14-M17 + R24-K26 + E21 — explain ~183/242 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K26** — severity 21.12, 27 conflict(s); suspect input ~`N15` (group: pull_in)
  - pull-in (wants closer): N15@10.0Å(now 14.4,conf 0.16), G11@9.1Å(now 11.7,conf 0.18)
  - push-out (wants farther): V30@9.1Å(now 5.7,conf 0.18), S16@17.4Å(now 14.7,conf 0.17), L14@20.3Å(now 12.6,conf 0.24), M17@20.2Å(now 13.6,conf 0.24)
  - M17↔R19: targets 20.2/7.9Å but partners are 4.7Å apart → too_close_together by 7.6Å
  - V20↔M17: targets 7.8/20.2Å but partners are 5.3Å apart → too_close_together by 7.1Å
  - W22↔M17: targets 6.5/20.2Å but partners are 7.6Å apart → too_close_together by 6.1Å
- **L14** — severity 20.27, 21 conflict(s); suspect input ~`I4` (group: push_out)
  - pull-in (wants closer): R24@6.6Å(now 12.5,conf 0.30), I4@8.9Å(now 14.0,conf 0.19), M17@6.0Å(now 9.2,conf 0.35)
  - push-out (wants farther): D29@19.9Å(now 15.9,conf 0.23), K26@20.3Å(now 12.6,conf 0.24), L6@18.8Å(now 12.2,conf 0.20)
  - K26↔R24: targets 20.3/6.6Å but partners are 4.5Å apart → too_close_together by 9.2Å
  - K26↔W22: targets 20.3/7.7Å but partners are 6.1Å apart → too_close_together by 6.6Å
  - R24↔I4: targets 6.6/8.9Å but partners are 23.6Å apart → too_far_apart by 8.1Å
- **R24** — severity 15.63, 18 conflict(s); suspect input ~`L14` (group: pull_in)
  - pull-in (wants closer): M7@17.3Å(now 20.4,conf 0.17), L14@6.6Å(now 12.5,conf 0.30)
  - push-out (wants farther): L6@23.7Å(now 21.0,conf 0.41), E21@8.1Å(now 4.9,conf 0.21), L27@8.8Å(now 5.8,conf 0.19), V20@10.1Å(now 5.8,conf 0.16), K12@16.6Å(now 13.3,conf 0.15), N15@16.4Å(now 13.5,conf 0.15)
  - H8↔L14: targets 23.1/6.6Å but partners are 9.8Å apart → too_close_together by 6.7Å
  - L6↔L14: targets 23.7/6.6Å but partners are 12.2Å apart → too_close_together by 5.0Å
  - N9↔L14: targets 19.1/6.6Å but partners are 6.5Å apart → too_close_together by 6.0Å
- **M17** — severity 9.78, 13 conflict(s); suspect input ~`K26` (group: push_out)
  - pull-in (wants closer): S2@19.2Å(now 22.9,conf 0.21), K12@9.2Å(now 12.2,conf 0.18), L14@6.0Å(now 9.2,conf 0.35)
  - push-out (wants farther): H8@22.3Å(now 18.7,conf 0.32), K26@20.2Å(now 13.6,conf 0.24)
  - H8↔L14: targets 22.3/6.0Å but partners are 9.8Å apart → too_close_together by 6.5Å
  - V20↔K26: targets 5.6/20.2Å but partners are 8.6Å apart → too_close_together by 6.0Å
  - E21↔K26: targets 7.4/20.2Å but partners are 7.9Å apart → too_close_together by 4.9Å
- **E21** — severity 7.48, 13 conflict(s); suspect input ~`L10` (group: pull_in)
  - pull-in (wants closer): V1@21.1Å(now 23.9,conf 0.27), D29@9.5Å(now 12.5,conf 0.17), L10@10.3Å(now 15.2,conf 0.15)
  - push-out (wants farther): R24@8.1Å(now 4.9,conf 0.21), H31@19.7Å(now 15.6,conf 0.22), A35@21.7Å(now 16.0,conf 0.29), V30@16.4Å(now 12.9,conf 0.15)
  - H31↔D29: targets 19.7/9.5Å but partners are 3.2Å apart → too_close_together by 7.0Å
  - L6↔L10: targets 21.9/10.3Å but partners are 4.7Å apart → too_close_together by 6.9Å
  - H31↔Q28: targets 19.7/9.3Å but partners are 6.3Å apart → too_close_together by 4.1Å
- **N15** — severity 7.29, 14 conflict(s); suspect input ~`K26` (group: pull_in)
  - pull-in (wants closer): N32@19.4Å(now 22.0,conf 0.21), V34@18.4Å(now 21.4,conf 0.19), K26@10.0Å(now 14.4,conf 0.16)
  - push-out (wants farther): F33@22.7Å(now 19.9,conf 0.34), Q28@21.3Å(now 18.7,conf 0.28), L6@16.7Å(now 13.9,conf 0.16), K12@9.8Å(now 6.7,conf 0.16), I4@19.8Å(now 16.4,conf 0.22), R24@16.4Å(now 13.5,conf 0.15)
  - I4↔N9: targets 19.8/6.9Å but partners are 7.6Å apart → too_close_together by 5.4Å
  - F33↔K26: targets 22.7/10.0Å but partners are 7.5Å apart → too_close_together by 5.2Å
  - V30↔K26: targets 20.9/10.0Å but partners are 5.7Å apart → too_close_together by 5.2Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=13 · 3-10(G)=2 · coil(C)=3

```
CEHHHHEHEHEEEHEEHHHHGHHEHEEHCHHEGCE
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=6 · sheet=16
  - I4 ↔ H8  (helix)
  - L6 ↔ L10  (helix)
  - L10 ↔ L14  (helix)
  - L14 ↔ E18  (helix)
  - E18 ↔ W22  (helix)
  - R19 ↔ L23  (helix)
  - S2 ↔ M7  (sheet)
  - S2 ↔ N9  (sheet)
  - S2 ↔ G11  (sheet)
  - M7 ↔ K12  (sheet)
  - M7 ↔ H13  (sheet)
  - M7 ↔ N15  (sheet)
  - N9 ↔ N15  (sheet)
  - N9 ↔ S16  (sheet)
  - G11 ↔ S16  (sheet)
  - G11 ↔ K26  (sheet)
  - K12 ↔ K26  (sheet)
  - R24 ↔ A35  (sheet)
  - K26 ↔ N32  (sheet)
  - K26 ↔ A35  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=100 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=6 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5723 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
