# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 1.587 A
- tm_score_ca_ordered: 0.7551918445622176
- heavy_atom_rmsd: 3.480 A
- sidechain_heavy_atom_rmsd: 4.249 A
- **all-atom quality (honest):** heavy 3.480 A, sidechain 4.249 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 990
- bin_accuracy: 0.519

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.587072795391888
- ga_delta_rmsd: 0.2709733386943305  ga_fitness_mode: energy
- pre_local_rmsd: 1.7614816306129815  localized_anchor_rmsd: 1.587138833304511

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C19-Q22 → 62 conflicts (47%); C37-G38 → 36 conflicts (28%); I9-S11 → 16 conflicts (12%)
- explained: 114/131 conflicts by 3 root cause(s)
- metrics: hubs=35 (frac 0.745), conflicts/hub=3.7, max_incompat=5.19Å, chain_span=0.957
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C19-Q22 + C37-G38 + I9-S11 — explain ~114/131 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 10.98, 11 conflict(s); suspect input ~`N21` (group: push_out)
  - pull-in (wants closer): C37@5.6Å(now 9.4,conf 0.43), F43@10.8Å(now 13.7,conf 0.34), R40@10.6Å(now 13.4,conf 0.34)
  - push-out (wants farther): V20@14.1Å(now 11.2,conf 0.34), Q22@17.4Å(now 11.0,conf 0.35), N21@15.8Å(now 10.4,conf 0.34)
  - Q22↔C10: targets 17.4/9.4Å but partners are 3.3Å apart → too_close_together by 4.6Å
  - Q22↔S11: targets 17.4/8.1Å but partners are 5.4Å apart → too_close_together by 3.8Å
  - Y13↔Q22: targets 4.3/17.4Å but partners are 9.7Å apart → too_close_together by 3.4Å
- **F43** — severity 10.65, 11 conflict(s); suspect input ~`L15` (group: push_out)
  - pull-in (wants closer): I9@19.0Å(now 21.7,conf 0.38), C19@6.1Å(now 11.4,conf 0.41), E16@10.8Å(now 13.7,conf 0.34), L15@10.5Å(now 13.9,conf 0.34), N17@8.4Å(now 11.8,conf 0.35)
  - push-out (wants farther): S27@16.6Å(now 14.1,conf 0.35)
  - S11↔L15: targets 18.9/10.5Å but partners are 3.2Å apart → too_close_together by 5.2Å
  - C19↔V36: targets 6.1/13.6Å but partners are 3.7Å apart → too_close_together by 3.9Å
  - N21↔L15: targets 22.0/10.5Å but partners are 7.9Å apart → too_close_together by 3.5Å
- **C37** — severity 10.47, 12 conflict(s); suspect input ~`I9` (group: push_out)
  - pull-in (wants closer): I9@15.3Å(now 20.2,conf 0.34), E16@5.6Å(now 9.4,conf 0.43), N21@14.4Å(now 17.6,conf 0.34), L12@7.3Å(now 9.9,conf 0.36), I1@11.5Å(now 14.0,conf 0.34)
  - push-out (wants farther): P46@18.7Å(now 16.2,conf 0.38), T45@16.8Å(now 14.2,conf 0.35), S27@16.3Å(now 13.8,conf 0.35)
  - R40↔I9: targets 5.7/15.3Å but partners are 24.9Å apart → too_far_apart by 3.9Å
  - E3↔I1: targets 20.4/11.5Å but partners are 4.9Å apart → too_close_together by 3.9Å
  - E16↔Q14: targets 5.6/13.0Å but partners are 4.5Å apart → too_close_together by 2.9Å
- **Q22** — severity 8.89, 10 conflict(s); suspect input ~`A32` (group: pull_in)
  - pull-in (wants closer): A32@8.7Å(now 12.2,conf 0.35), H28@8.0Å(now 12.4,conf 0.35)
  - push-out (wants farther): C19@18.7Å(now 15.3,conf 0.38), Y18@17.5Å(now 14.3,conf 0.36), C10@5.9Å(now 3.3,conf 0.42), N17@17.1Å(now 12.4,conf 0.35), Y13@12.9Å(now 9.7,conf 0.34), E16@17.4Å(now 11.0,conf 0.35), I1@13.0Å(now 10.3,conf 0.34), Q4@10.0Å(now 7.2,conf 0.34), S11@8.5Å(now 5.4,conf 0.35), L15@13.5Å(now 7.7,conf 0.34), Q14@13.0Å(now 7.4,conf 0.34)
  - A32↔Y34: targets 8.7/18.2Å but partners are 5.2Å apart → too_close_together by 4.4Å
  - E39↔A32: targets 23.8/8.7Å but partners are 12.0Å apart → too_close_together by 3.2Å
  - E16↔S11: targets 17.4/8.5Å but partners are 5.7Å apart → too_close_together by 3.1Å
- **A32** — severity 7.26, 10 conflict(s); suspect input ~`E39` (group: push_out)
  - pull-in (wants closer): Q22@8.7Å(now 12.2,conf 0.35), I9@11.2Å(now 13.9,conf 0.34), C25@7.6Å(now 10.3,conf 0.36)
  - push-out (wants farther): C19@12.0Å(now 8.6,conf 0.34), G41@14.5Å(now 11.2,conf 0.34)
  - E39↔Q22: targets 11.7/8.7Å but partners are 23.0Å apart → too_far_apart by 2.6Å
  - E39↔I9: targets 11.7/11.2Å but partners are 25.3Å apart → too_far_apart by 2.4Å
  - G38↔Q22: targets 9.1/8.7Å but partners are 20.0Å apart → too_far_apart by 2.3Å
- **L15** — severity 6.33, 8 conflict(s); suspect input ~`R40` (group: pull_in)
  - pull-in (wants closer): F43@10.5Å(now 13.9,conf 0.34), R40@12.3Å(now 15.1,conf 0.34), Y44@9.0Å(now 11.8,conf 0.34), G38@9.8Å(now 13.0,conf 0.34)
  - push-out (wants farther): S11@6.9Å(now 3.2,conf 0.38), V20@14.8Å(now 9.0,conf 0.34), H23@12.0Å(now 9.2,conf 0.34), N21@12.8Å(now 7.9,conf 0.34), Q22@13.5Å(now 7.7,conf 0.34), L24@11.9Å(now 8.6,conf 0.34)
  - C10↔Q22: targets 6.5/13.5Å but partners are 3.3Å apart → too_close_together by 3.7Å
  - R40↔I9: targets 12.3/9.7Å but partners are 24.9Å apart → too_far_apart by 2.8Å
  - I9↔G38: targets 9.7/9.8Å but partners are 22.1Å apart → too_far_apart by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=9 · 3-10(G)=9 · coil(C)=5

```
CHHHHHHEEGGHGHHHHHGHCEEEGHHHGHHHGHHGHHHECGCCEEE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=11 · sheet=6
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - L12 ↔ E16  (helix)
  - Q14 ↔ Y18  (helix)
  - E16 ↔ V20  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - Y34 ↔ G38  (helix)
  - L35 ↔ E39  (helix)
  - S8 ↔ Q22  (sheet)
  - S8 ↔ H23  (sheet)
  - S8 ↔ L24  (sheet)
  - I9 ↔ Q22  (sheet)
  - I9 ↔ H23  (sheet)
  - I9 ↔ L24  (sheet)

## Solvent Accessibility (burial)

- buried=22 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=176 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=75 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2973 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
