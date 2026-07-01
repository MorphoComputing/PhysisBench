# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 1.845 A
- tm_score_ca_ordered: 0.7213951328315313
- heavy_atom_rmsd: 3.560 A
- sidechain_heavy_atom_rmsd: 4.337 A
- **all-atom quality (honest):** heavy 3.560 A, sidechain 4.337 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 990
- bin_accuracy: 0.507

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.8450295746515157
- ga_delta_rmsd: -0.17423222748815537  ga_fitness_mode: energy
- pre_local_rmsd: 2.006604669172229  localized_anchor_rmsd: 1.8450336774573346

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L15-E16 → 61 conflicts (40%); Q22 → 30 conflicts (20%); C37 → 14 conflicts (9%)
- explained: 105/154 conflicts by 3 root cause(s)
- metrics: hubs=32 (frac 0.681), conflicts/hub=4.8, max_incompat=5.83Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L15-E16 + Q22 + C37 — explain ~105/154 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 13.00, 14 conflict(s); suspect input ~`N21` (group: pull_in)
  - pull-in (wants closer): C37@5.6Å(now 8.8,conf 0.43), F43@10.8Å(now 13.9,conf 0.34), G41@11.2Å(now 13.9,conf 0.34), R40@10.6Å(now 13.9,conf 0.34)
  - push-out (wants farther): H23@15.5Å(now 12.4,conf 0.34), V20@14.1Å(now 10.6,conf 0.34), Q22@17.4Å(now 9.3,conf 0.35), S11@8.1Å(now 5.5,conf 0.35), N21@15.8Å(now 10.1,conf 0.34)
  - Y13↔Q22: targets 4.3/17.4Å but partners are 8.4Å apart → too_close_together by 4.6Å
  - Q22↔S11: targets 17.4/8.1Å but partners are 4.8Å apart → too_close_together by 4.5Å
  - Q22↔C10: targets 17.4/9.4Å but partners are 3.9Å apart → too_close_together by 4.0Å
- **F43** — severity 10.24, 11 conflict(s); suspect input ~`L15` (group: push_out)
  - pull-in (wants closer): C19@6.1Å(now 9.2,conf 0.41), E16@10.8Å(now 13.9,conf 0.34), L15@10.5Å(now 14.1,conf 0.34), N17@8.4Å(now 12.1,conf 0.35)
  - push-out (wants farther): S27@16.6Å(now 14.0,conf 0.35)
  - S11↔L15: targets 18.9/10.5Å but partners are 3.0Å apart → too_close_together by 5.3Å
  - Q22↔L15: targets 20.9/10.5Å but partners are 6.6Å apart → too_close_together by 3.7Å
  - N21↔L15: targets 22.0/10.5Å but partners are 7.9Å apart → too_close_together by 3.5Å
- **L15** — severity 9.76, 14 conflict(s); suspect input ~`R40` (group: pull_in)
  - pull-in (wants closer): F43@10.5Å(now 14.1,conf 0.34), R40@12.3Å(now 15.5,conf 0.34), Y44@9.0Å(now 11.9,conf 0.34), G38@9.8Å(now 13.2,conf 0.34)
  - push-out (wants farther): S11@6.9Å(now 3.0,conf 0.38), V20@14.8Å(now 8.8,conf 0.34), H23@12.0Å(now 8.5,conf 0.34), N21@12.8Å(now 7.9,conf 0.34), Q22@13.5Å(now 6.6,conf 0.34), L24@11.9Å(now 7.8,conf 0.34)
  - C10↔Q22: targets 6.5/13.5Å but partners are 3.9Å apart → too_close_together by 3.1Å
  - L12↔V20: targets 5.0/14.8Å but partners are 6.8Å apart → too_close_together by 2.9Å
  - R40↔S8: targets 12.3/11.3Å but partners are 25.9Å apart → too_far_apart by 2.2Å
- **C37** — severity 9.54, 10 conflict(s); suspect input ~`I9` (group: pull_in)
  - pull-in (wants closer): I9@15.3Å(now 18.8,conf 0.34), E16@5.6Å(now 8.8,conf 0.43), N21@14.4Å(now 17.0,conf 0.34), I1@11.5Å(now 14.1,conf 0.34)
  - E3↔I1: targets 20.4/11.5Å but partners are 4.8Å apart → too_close_together by 4.0Å
  - G41↔E16: targets 5.6/5.6Å but partners are 13.9Å apart → too_far_apart by 2.6Å
  - R40↔I9: targets 5.7/15.3Å but partners are 24.3Å apart → too_far_apart by 3.3Å
- **Q22** — severity 8.39, 10 conflict(s); suspect input ~`A32` (group: pull_in)
  - pull-in (wants closer): A32@8.7Å(now 12.5,conf 0.35), H28@8.0Å(now 13.1,conf 0.35)
  - push-out (wants farther): P46@19.4Å(now 15.8,conf 0.39), C19@18.7Å(now 14.3,conf 0.38), Y44@19.1Å(now 15.6,conf 0.38), Y18@17.5Å(now 12.2,conf 0.36), N17@17.1Å(now 9.6,conf 0.35), V2@13.1Å(now 10.6,conf 0.34), Y13@12.9Å(now 8.4,conf 0.34), E16@17.4Å(now 9.3,conf 0.35), I1@13.0Å(now 8.4,conf 0.34), Q4@10.0Å(now 5.5,conf 0.34), S11@8.5Å(now 4.8,conf 0.35), L15@13.5Å(now 6.6,conf 0.34), Q14@13.0Å(now 5.1,conf 0.34)
  - A32↔Y34: targets 8.7/18.2Å but partners are 5.2Å apart → too_close_together by 4.3Å
  - E39↔A32: targets 23.8/8.7Å but partners are 11.8Å apart → too_close_together by 3.3Å
  - E16↔S11: targets 17.4/8.5Å but partners are 5.5Å apart → too_close_together by 3.3Å
- **L33** — severity 7.32, 10 conflict(s); suspect input ~`I9` (group: push_out)
  - pull-in (wants closer): I9@12.4Å(now 15.1,conf 0.34), I1@7.9Å(now 10.6,conf 0.35)
  - push-out (wants farther): Y18@8.9Å(now 6.0,conf 0.34), R40@12.3Å(now 9.4,conf 0.34)
  - G38↔I9: targets 6.1/12.4Å but partners are 21.4Å apart → too_far_apart by 2.9Å
  - G38↔I1: targets 6.1/7.9Å but partners are 16.5Å apart → too_far_apart by 2.4Å
  - V2↔I1: targets 13.9/7.9Å but partners are 3.6Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=12 · 3-10(G)=4 · coil(C)=6

```
CHHEHHHEEGEHEHHHHHHHECEEGHHHGHHHHHHGHHHECECCCEE
```

## Backbone H-bond Network

- total=29 · helix(i→i+4)=12 · sheet=17
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - L12 ↔ E16  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - Y34 ↔ G38  (helix)
  - L35 ↔ E39  (helix)
  - Q4 ↔ I9  (sheet)
  - Q4 ↔ S11  (sheet)
  - Q4 ↔ Y13  (sheet)
  - Q4 ↔ N21  (sheet)
  - Q4 ↔ H23  (sheet)
  - Q4 ↔ L24  (sheet)
  - S8 ↔ N21  (sheet)
  - S8 ↔ H23  (sheet)
  - … +9 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=181 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=80 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3188 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
