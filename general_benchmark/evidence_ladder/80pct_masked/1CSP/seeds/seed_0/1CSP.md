# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1CSP/sequence/1CSP.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1CSP/seeds/seed_0/1CSP.pdb`
- residues: 65
- mode: oracle
- ca_rmsd: 3.150 A
- tm_score_ca_ordered: 0.6627694599744286
- heavy_atom_rmsd: 4.198 A
- sidechain_heavy_atom_rmsd: 4.894 A
- **all-atom quality (honest):** heavy 4.198 A, sidechain 4.894 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/52 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 391
- bin_accuracy: 0.558

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.1499945188023086
- ga_delta_rmsd: 5.550149346637691  ga_fitness_mode: energy
- pre_local_rmsd: 3.1652739120655182  localized_anchor_rmsd: 3.1500043249364857

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E65 → 17 conflicts (57%); A45 → 6 conflicts (20%)
- explained: 23/30 conflicts by 2 root cause(s)
- metrics: hubs=12 (frac 0.185), conflicts/hub=2.5, max_incompat=9.83Å, chain_span=0.6
- **fix-first:** [LOW_CONFLICT] Root cause(s): E65 + A45 — explain ~23/30 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R55** — severity 18.08, 6 conflict(s); suspect input ~`E52` (group: pull_in)
  - pull-in (wants closer): H28@13.2Å(now 15.9,conf 0.55)
  - push-out (wants farther): E65@27.0Å(now 13.8,conf 0.84)
  - E65↔E52: targets 27.0/7.2Å but partners are 9.9Å apart → too_close_together by 9.8Å
  - E65↔E49: targets 27.0/15.6Å but partners are 4.0Å apart → too_close_together by 7.3Å
  - E65↔V25: targets 27.0/12.9Å but partners are 7.8Å apart → too_close_together by 6.2Å
- **A45** — severity 11.64, 6 conflict(s); suspect input ~`K64` (group: pull_in)
  - pull-in (wants closer): E65@5.4Å(now 9.4,conf 0.56), K64@6.5Å(now 12.7,conf 0.55)
  - push-out (wants farther): N54@27.3Å(now 24.7,conf 0.93), V27@13.3Å(now 7.3,conf 0.55), Q33@13.4Å(now 7.8,conf 0.55), G34@14.5Å(now 10.5,conf 0.55), F8@12.5Å(now 9.9,conf 0.55), G15@13.6Å(now 10.9,conf 0.55)
  - N54↔K64: targets 27.3/6.5Å but partners are 14.7Å apart → too_close_together by 6.2Å
  - N54↔E65: targets 27.3/5.4Å but partners are 16.3Å apart → too_close_together by 5.6Å
  - E65↔E49: targets 5.4/13.4Å but partners are 4.0Å apart → too_close_together by 4.0Å
- **F26** — severity 4.41, 3 conflict(s); suspect input ~`E65` (group: push_out)
  - push-out (wants farther): E65@17.6Å(now 9.0,conf 0.55), T63@14.7Å(now 11.6,conf 0.55)
  - Q58↔E65: targets 5.1/17.6Å but partners are 8.7Å apart → too_close_together by 3.9Å
  - E65↔E49: targets 17.6/11.3Å but partners are 4.0Å apart → too_close_together by 2.3Å
  - I17↔E65: targets 6.5/17.6Å but partners are 9.3Å apart → too_close_together by 1.9Å
- **Q33** — severity 3.79, 3 conflict(s); suspect input ~`F37` (group: push_out)
  - pull-in (wants closer): T63@5.3Å(now 9.5,conf 0.56), N61@6.0Å(now 9.6,conf 0.55)
  - push-out (wants farther): A45@13.4Å(now 7.8,conf 0.55)
  - T63↔F37: targets 5.3/10.1Å but partners are 18.2Å apart → too_far_apart by 2.8Å
  - T63↔E65: targets 5.3/10.8Å but partners are 3.1Å apart → too_close_together by 2.4Å
  - N61↔F37: targets 6.0/10.1Å but partners are 17.9Å apart → too_far_apart by 1.8Å
- **E65** — severity 3.40, 3 conflict(s); suspect input ~`N61` (group: pull_in)
  - pull-in (wants closer): V46@4.7Å(now 7.6,conf 0.59), A45@5.4Å(now 9.4,conf 0.56), Q44@7.8Å(now 13.7,conf 0.55), E41@11.8Å(now 14.9,conf 0.55)
  - push-out (wants farther): R55@27.0Å(now 13.8,conf 0.84), F26@17.6Å(now 9.0,conf 0.55), E49@13.2Å(now 4.0,conf 0.55), N61@11.6Å(now 3.8,conf 0.55)
  - R55↔N61: targets 27.0/11.6Å but partners are 13.2Å apart → too_close_together by 2.2Å
  - V46↔F26: targets 4.7/17.6Å but partners are 10.8Å apart → too_close_together by 2.1Å
  - R55↔V46: targets 27.0/4.7Å but partners are 20.5Å apart → too_close_together by 1.7Å
- **V46** — severity 3.27, 2 conflict(s); suspect input ~`E65` (group: pull_in)
  - pull-in (wants closer): E65@4.7Å(now 7.6,conf 0.59)
  - G53↔E65: targets 21.3/4.7Å but partners are 13.3Å apart → too_close_together by 3.3Å
  - E65↔I50: targets 4.7/12.2Å but partners are 5.1Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=22 · 3-10(G)=13 · coil(C)=8

```
CCEEGGCEGHGGHCEEGGHHHEGCGHHEHHHHGEHHHHHGEHHEEECEGEEEEHEGEECEEHHHC
```

## Backbone H-bond Network

- total=49 · helix(i→i+4)=5 · sheet=44
  - F26 ↔ S30  (helix)
  - V27 ↔ A31  (helix)
  - I32 ↔ G36  (helix)
  - K38 ↔ E42  (helix)
  - T39 ↔ G43  (helix)
  - G3 ↔ F16  (sheet)
  - G3 ↔ Q22  (sheet)
  - K4 ↔ G15  (sheet)
  - K4 ↔ F16  (sheet)
  - K4 ↔ Q22  (sheet)
  - F8 ↔ G15  (sheet)
  - F8 ↔ F16  (sheet)
  - F8 ↔ H28  (sheet)
  - G15 ↔ H28  (sheet)
  - F16 ↔ Q22  (sheet)
  - F16 ↔ H28  (sheet)
  - H28 ↔ G34  (sheet)
  - H28 ↔ E41  (sheet)
  - H28 ↔ Q44  (sheet)
  - H28 ↔ A45  (sheet)
  - … +29 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=39 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=300 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=192 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3434 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 52 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
