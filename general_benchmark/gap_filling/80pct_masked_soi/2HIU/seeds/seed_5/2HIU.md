# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2HIU\seeds\seed_5\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 3.558 A
- tm_score_ca_ordered: 0.4208963949452861
- heavy_atom_rmsd: 5.155 A
- sidechain_heavy_atom_rmsd: 6.073 A
- **all-atom quality (honest):** heavy 5.155 A, sidechain 6.073 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 366
- bin_accuracy: 0.475

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.5581512345568203
- ga_delta_rmsd: 1.2989232274510036  ga_fitness_mode: energy
- pre_local_rmsd: 3.585057539423425  localized_anchor_rmsd: 3.5581370622751054

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E39 → 6 conflicts (38%); I1 → 4 conflicts (25%)
- explained: 10/16 conflicts by 2 root cause(s)
- metrics: hubs=10 (frac 0.213), conflicts/hub=1.6, max_incompat=3.45Å, chain_span=0.957
- **fix-first:** [LOW_CONFLICT] Root cause(s): E39 + I1 — explain ~10/16 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I1** — severity 4.01, 3 conflict(s); suspect input ~`F42` (group: pull_in)
  - pull-in (wants closer): F42@12.1Å(now 15.3,conf 0.55)
  - Q4↔F42: targets 5.1/12.1Å but partners are 20.6Å apart → too_far_apart by 3.4Å
  - T7↔F42: targets 10.6/12.1Å but partners are 25.0Å apart → too_far_apart by 2.4Å
  - C5↔F42: targets 7.0/12.1Å but partners are 20.6Å apart → too_far_apart by 1.5Å
- **E39** — severity 3.26, 2 conflict(s); suspect input ~`P46` (group: pull_in)
  - pull-in (wants closer): N17@15.1Å(now 18.9,conf 0.55), L15@14.7Å(now 17.9,conf 0.55)
  - push-out (wants farther): F42@9.0Å(now 5.9,conf 0.99), P46@20.9Å(now 17.5,conf 0.59), F43@12.5Å(now 9.2,conf 0.55)
  - L35↔P46: targets 7.8/20.9Å but partners are 9.7Å apart → too_close_together by 3.4Å
  - Y34↔P46: targets 7.0/20.9Å but partners are 11.8Å apart → too_close_together by 2.0Å
- **Y18** — severity 3.26, 2 conflict(s); suspect input ~`Y44` (group: push_out)
  - pull-in (wants closer): N21@11.0Å(now 13.9,conf 1.00)
  - push-out (wants farther): L29@10.7Å(now 8.1,conf 0.55)
  - N21↔Y44: targets 11.0/6.0Å but partners are 20.4Å apart → too_far_apart by 3.5Å
  - N21↔F43: targets 11.0/6.0Å but partners are 19.4Å apart → too_far_apart by 2.5Å
- **P46** — severity 2.89, 2 conflict(s); suspect input ~`G41` (group: pull_in)
  - pull-in (wants closer): N17@12.2Å(now 14.9,conf 0.55)
  - push-out (wants farther): E39@20.9Å(now 17.5,conf 0.59)
  - E39↔G41: targets 20.9/16.3Å but partners are 1.6Å apart → too_close_together by 3.0Å
  - E39↔F43: targets 20.9/9.3Å but partners are 9.2Å apart → too_close_together by 2.3Å
- **V36** — severity 2.18, 2 conflict(s); suspect input ~`S11` (group: pull_in)
  - pull-in (wants closer): Y13@8.5Å(now 11.1,conf 0.55), S11@9.4Å(now 12.0,conf 0.55)
  - push-out (wants farther): L33@6.9Å(now 2.6,conf 0.94), F43@9.6Å(now 5.3,conf 0.69), V30@10.1Å(now 7.5,conf 0.67)
  - E39↔S11: targets 9.0/9.4Å but partners are 20.5Å apart → too_far_apart by 2.1Å
  - E39↔Y13: targets 9.0/8.5Å but partners are 19.5Å apart → too_far_apart by 1.9Å
- **V30** — severity 2.08, 1 conflict(s); suspect input ~`V36` (group: push_out)
  - push-out (wants farther): V36@10.1Å(now 7.5,conf 0.67)
  - L33↔V36: targets 4.4/10.1Å but partners are 2.6Å apart → too_close_together by 3.1Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=18 · 3-10(G)=2 · coil(C)=2

```
CGEEHHHEECEHEHHHHHHHHEEHHEHEHEHHHGHEHHHHHEEEEEE
```

## Backbone H-bond Network

- total=54 · helix(i→i+4)=10 · sheet=44
  - L12 ↔ E16  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - N17 ↔ N21  (helix)
  - N21 ↔ C25  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - E31 ↔ L35  (helix)
  - L35 ↔ E39  (helix)
  - C37 ↔ G41  (helix)
  - E3 ↔ S8  (sheet)
  - E3 ↔ I9  (sheet)
  - E3 ↔ Q22  (sheet)
  - E3 ↔ H23  (sheet)
  - Q4 ↔ I9  (sheet)
  - Q4 ↔ S11  (sheet)
  - Q4 ↔ Q22  (sheet)
  - Q4 ↔ H23  (sheet)
  - S8 ↔ Q22  (sheet)
  - S8 ↔ H23  (sheet)
  - … +34 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=196 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=84 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.4321 (restraint satisfaction; lower=better)
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
