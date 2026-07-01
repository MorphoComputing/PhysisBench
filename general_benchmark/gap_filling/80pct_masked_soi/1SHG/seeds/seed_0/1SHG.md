# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1SHG\seeds\seed_0\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 2.135 A
- tm_score_ca_ordered: 0.7421370226623578
- heavy_atom_rmsd: 4.091 A
- sidechain_heavy_atom_rmsd: 5.151 A
- **all-atom quality (honest):** heavy 4.091 A, sidechain 5.151 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 476
- bin_accuracy: 0.660

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.135108629032267
- ga_delta_rmsd: 2.1480861207376485  ga_fitness_mode: energy
- pre_local_rmsd: 2.1351251222201952  localized_anchor_rmsd: 2.1351251222201952

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K54-L55 → 14 conflicts (78%)
- explained: 14/18 conflicts by 1 root cause(s)
- metrics: hubs=9 (frac 0.164), conflicts/hub=2.0, max_incompat=6.77Å, chain_span=0.727
- **fix-first:** [LOW_CONFLICT] Root cause(s): K54-L55 — explain ~14/18 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R43** — severity 11.51, 4 conflict(s); suspect input ~`L55` (group: push_out)
  - push-out (wants farther): L55@19.6Å(now 13.9,conf 0.57)
  - E39↔L55: targets 5.0/19.6Å but partners are 7.9Å apart → too_close_together by 6.8Å
  - L55↔T26: targets 19.6/10.3Å but partners are 4.2Å apart → too_close_together by 5.1Å
  - V40↔L55: targets 5.0/19.6Å but partners are 10.1Å apart → too_close_together by 4.6Å
- **K20** — severity 3.55, 3 conflict(s); suspect input ~`L55` (group: push_out)
  - push-out (wants farther): L55@16.6Å(now 12.3,conf 0.55)
  - D23↔L55: targets 5.8/16.6Å but partners are 8.1Å apart → too_close_together by 2.7Å
  - L55↔I24: targets 16.6/9.2Å but partners are 5.2Å apart → too_close_together by 2.2Å
  - L55↔L25: targets 16.6/10.1Å but partners are 4.9Å apart → too_close_together by 1.6Å
- **E11** — severity 3.03, 3 conflict(s); suspect input ~`K53` (group: push_out)
  - push-out (wants farther): K53@18.1Å(now 14.7,conf 0.55)
  - V17↔K53: targets 5.0/18.1Å but partners are 11.1Å apart → too_close_together by 1.9Å
  - T18↔K53: targets 4.9/18.1Å but partners are 11.3Å apart → too_close_together by 1.9Å
  - K53↔M19: targets 18.1/8.1Å but partners are 8.3Å apart → too_close_together by 1.7Å
- **M19** — severity 2.96, 2 conflict(s); suspect input ~`L25` (group: push_out)
  - push-out (wants farther): L55@16.5Å(now 11.8,conf 0.55)
  - L55↔L25: targets 16.5/8.6Å but partners are 4.9Å apart → too_close_together by 3.0Å
  - I24↔L55: targets 9.0/16.5Å but partners are 5.2Å apart → too_close_together by 2.4Å
- **W36** — severity 2.12, 2 conflict(s); suspect input ~`K54` (group: push_out)
  - pull-in (wants closer): K54@11.0Å(now 14.2,conf 0.55)
  - push-out (wants farther): L55@14.4Å(now 11.2,conf 0.55)
  - N32↔K54: targets 6.5/11.0Å but partners are 19.8Å apart → too_far_apart by 2.3Å
  - T31↔K54: targets 7.1/11.0Å but partners are 19.7Å apart → too_far_apart by 1.6Å
- **T18** — severity 1.43, 1 conflict(s); suspect input ~`K54` (group: push_out)
  - push-out (wants farther): K54@17.5Å(now 14.5,conf 0.55), K53@15.7Å(now 11.3,conf 0.55)
  - I24↔K54: targets 11.1/17.5Å but partners are 3.8Å apart → too_close_together by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=5 · strand(E)=33 · 3-10(G)=8 · coil(C)=9

```
EEEGCHEEEEEEECCEGEEEGGEGECGCECHECEEEEEEEHGEECEEEEHEEGHC
```

## Backbone H-bond Network

- total=113 · helix(i→i+4)=1 · sheet=112
  - A50 ↔ K54  (helix)
  - V3 ↔ M19  (sheet)
  - V3 ↔ K20  (sheet)
  - V3 ↔ D23  (sheet)
  - Y7 ↔ T18  (sheet)
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - D8 ↔ T18  (sheet)
  - D8 ↔ M19  (sheet)
  - D8 ↔ K20  (sheet)
  - D8 ↔ D23  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ T18  (sheet)
  - Y9 ↔ M19  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ D23  (sheet)
  - Q10 ↔ E16  (sheet)
  - Q10 ↔ T18  (sheet)
  - Q10 ↔ M19  (sheet)
  - … +93 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=223 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=147 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3246 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
