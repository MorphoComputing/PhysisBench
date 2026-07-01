# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1KTH\seeds\seed_1\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 1.963 A
- tm_score_ca_ordered: 0.7424401390342334
- heavy_atom_rmsd: 4.069 A
- sidechain_heavy_atom_rmsd: 5.293 A
- **all-atom quality (honest):** heavy 4.069 A, sidechain 5.293 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 489
- bin_accuracy: 0.710

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.9631983279044853
- ga_delta_rmsd: 0.9330302579099103  ga_fitness_mode: energy
- pre_local_rmsd: 2.0149449132124757  localized_anchor_rmsd: 1.9632224811712835

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** I17-L18 → 4 conflicts (80%)
- explained: 4/5 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.089), conflicts/hub=1.0, max_incompat=2.83Å, chain_span=0.393
- **fix-first:** [LOW_CONFLICT] Root cause(s): I17-L18 — explain ~4/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q47** — severity 1.54, 1 conflict(s); suspect input ~`N25` (group: push_out)
  - push-out (wants farther): N25@16.3Å(now 12.2,conf 0.55)
  - K27↔N25: targets 12.6/16.3Å but partners are 0.8Å apart → too_close_together by 2.8Å
- **S46** — severity 1.32, 1 conflict(s); suspect input ~`L18` (group: pull_in)
  - pull-in (wants closer): L18@9.1Å(now 12.1,conf 0.55)
  - E49↔L18: targets 5.5/9.1Å but partners are 17.0Å apart → too_far_apart by 2.4Å
- **K43** — severity 1.06, 1 conflict(s); suspect input ~`I17` (group: pull_in)
  - pull-in (wants closer): I17@10.6Å(now 14.8,conf 0.55)
  - C54↔I17: targets 10.8/10.6Å but partners are 23.3Å apart → too_far_apart by 1.9Å
- **E41** — severity 1.03, 1 conflict(s); suspect input ~`D2` (group: pull_in)
  - pull-in (wants closer): I17@14.4Å(now 18.4,conf 0.55)
  - I17↔D2: targets 14.4/9.9Å but partners are 26.2Å apart → too_far_apart by 1.9Å
- **N25** — severity 0.92, 1 conflict(s); suspect input ~`R31` (group: push_out)
  - push-out (wants farther): L18@21.0Å(now 18.5,conf 0.99), C29@11.0Å(now 7.5,conf 0.94), S28@9.4Å(now 5.3,conf 0.79), Q47@16.3Å(now 12.2,conf 0.55)
  - L18↔R31: targets 21.0/14.4Å but partners are 4.9Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=29 · 3-10(G)=5 · coil(C)=12

```
CECHHEEGEEECEEEEECEEECEHEHHEGECEGGGEECEECHEECECHCHHEHECE
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=0 · sheet=58
  - D2 ↔ P7  (sheet)
  - L6 ↔ Y21  (sheet)
  - L6 ↔ D23  (sheet)
  - P7 ↔ Y21  (sheet)
  - P7 ↔ D23  (sheet)
  - D9 ↔ I17  (sheet)
  - D9 ↔ K19  (sheet)
  - D9 ↔ W20  (sheet)
  - D9 ↔ Y21  (sheet)
  - D9 ↔ D23  (sheet)
  - E10 ↔ D15  (sheet)
  - E10 ↔ F16  (sheet)
  - E10 ↔ I17  (sheet)
  - E10 ↔ K19  (sheet)
  - E10 ↔ W20  (sheet)
  - E10 ↔ Y21  (sheet)
  - E10 ↔ A30  (sheet)
  - G11 ↔ F16  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ K19  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=215 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=128 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2825 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
