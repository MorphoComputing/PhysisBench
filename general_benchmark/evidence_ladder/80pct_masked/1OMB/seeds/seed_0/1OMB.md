# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1OMB/sequence/1OMB.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1OMB/seeds/seed_0/1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 5.188 A
- tm_score_ca_ordered: 0.17365489090725136
- heavy_atom_rmsd: 6.468 A
- sidechain_heavy_atom_rmsd: 7.622 A
- **all-atom quality (honest):** heavy 6.468 A, sidechain 7.622 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 17
- distogram_pairs: 93
- bin_accuracy: 0.441

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.187549406468251
- ga_delta_rmsd: 1.5467897318921828  ga_fitness_mode: energy
- pre_local_rmsd: 5.187585195261338  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K14 → 5 conflicts (56%)
- explained: 5/9 conflicts by 1 root cause(s)
- metrics: hubs=7 (frac 0.212), conflicts/hub=1.3, max_incompat=2.86Å, chain_span=0.909
- **fix-first:** [LOW_CONFLICT] Root cause(s): K14 — explain ~5/9 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G18** — severity 2.88, 2 conflict(s); suspect input ~`G12` (group: push_out)
  - push-out (wants farther): E3@12.8Å(now 7.3,conf 0.55), G12@12.6Å(now 9.9,conf 0.55), I1@10.0Å(now 5.6,conf 0.55)
  - K14↔G12: targets 7.0/12.6Å but partners are 3.0Å apart → too_close_together by 2.7Å
  - K14↔E3: targets 7.0/12.8Å but partners are 3.2Å apart → too_close_together by 2.6Å
- **R17** — severity 2.79, 2 conflict(s); suspect input ~`R22` (group: push_out)
  - push-out (wants farther): I26@24.6Å(now 21.3,conf 0.70), E3@11.8Å(now 7.5,conf 0.55)
  - I26↔R22: targets 24.6/15.5Å but partners are 6.2Å apart → too_close_together by 2.9Å
  - I26↔P20: targets 24.6/9.9Å but partners are 12.4Å apart → too_close_together by 2.3Å
- **T9** — severity 1.32, 1 conflict(s); suspect input ~`D4` (group: push_out)
  - push-out (wants farther): D4@14.5Å(now 10.2,conf 0.55), G6@10.1Å(now 7.5,conf 0.55)
  - K14↔D4: targets 6.8/14.5Å but partners are 5.2Å apart → too_close_together by 2.4Å
- **A2** — severity 1.30, 1 conflict(s); suspect input ~`W10` (group: pull_in)
  - pull-in (wants closer): T33@10.5Å(now 13.7,conf 0.55)
  - push-out (wants farther): W10@15.9Å(now 11.4,conf 0.55), R19@9.8Å(now 6.4,conf 0.55)
  - C15↔W10: targets 6.3/15.9Å but partners are 7.2Å apart → too_close_together by 2.4Å
- **E31** — severity 1.12, 1 conflict(s); suspect input ~`G11` (group: pull_in)
  - pull-in (wants closer): K7@4.7Å(now 7.3,conf 0.59)
  - K7↔G11: targets 4.7/13.6Å but partners are 6.8Å apart → too_close_together by 2.0Å
- **K14** — severity 1.02, 1 conflict(s); suspect input ~`E3` (group: push_out)
  - push-out (wants farther): W10@7.5Å(now 4.5,conf 0.55), E3@11.2Å(now 3.2,conf 0.55), Y5@11.6Å(now 3.8,conf 0.55)
  - I1↔E3: targets 6.6/11.2Å but partners are 2.8Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=9 · 3-10(G)=2 · coil(C)=2

```
CHHHHHEHHHHHHHEEHHEECEGHHHGHEHEHE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=7 · sheet=17
  - A2 ↔ G6  (helix)
  - G6 ↔ W10  (helix)
  - T9 ↔ T13  (helix)
  - W10 ↔ K14  (helix)
  - K14 ↔ G18  (helix)
  - S24 ↔ T28  (helix)
  - T28 ↔ C32  (helix)
  - K7 ↔ C15  (sheet)
  - K7 ↔ C16  (sheet)
  - K7 ↔ R19  (sheet)
  - K7 ↔ P20  (sheet)
  - K7 ↔ R22  (sheet)
  - C15 ↔ P20  (sheet)
  - C15 ↔ E31  (sheet)
  - C15 ↔ T33  (sheet)
  - C16 ↔ T33  (sheet)
  - R19 ↔ E31  (sheet)
  - R19 ↔ T33  (sheet)
  - P20 ↔ N29  (sheet)
  - P20 ↔ E31  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=183 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=108 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2334 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=17 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
