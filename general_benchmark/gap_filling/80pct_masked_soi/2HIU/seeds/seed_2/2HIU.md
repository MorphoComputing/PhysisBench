# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2HIU\seeds\seed_2\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 3.891 A
- tm_score_ca_ordered: 0.49290367678200436
- heavy_atom_rmsd: 5.259 A
- sidechain_heavy_atom_rmsd: 6.120 A
- **all-atom quality (honest):** heavy 5.259 A, sidechain 6.120 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 366
- bin_accuracy: 0.563

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.891202121857548
- ga_delta_rmsd: 0.47099482655246216  ga_fitness_mode: energy
- pre_local_rmsd: 3.8912288256588425  localized_anchor_rmsd: 3.8912288256588425

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** N17 → 6 conflicts (60%); S11 → 3 conflicts (30%)
- explained: 9/10 conflicts by 2 root cause(s)
- metrics: hubs=7 (frac 0.149), conflicts/hub=1.4, max_incompat=4.52Å, chain_span=0.553
- **fix-first:** [LOW_CONFLICT] Root cause(s): N17 + S11 — explain ~9/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H28** — severity 4.79, 3 conflict(s); suspect input ~`N17` (group: push_out)
  - push-out (wants farther): N17@16.2Å(now 10.6,conf 0.55)
  - A32↔N17: targets 5.8/16.2Å but partners are 5.8Å apart → too_close_together by 4.5Å
  - E31↔N17: targets 5.5/16.2Å but partners are 8.0Å apart → too_close_together by 2.7Å
  - L33↔N17: targets 9.0/16.2Å but partners are 5.6Å apart → too_close_together by 1.6Å
- **Q14** — severity 2.59, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): N21@11.0Å(now 6.5,conf 0.55), Q22@12.1Å(now 8.7,conf 0.55)
  - S11↔Q22: targets 5.1/12.1Å but partners are 4.0Å apart → too_close_together by 3.0Å
  - S11↔N21: targets 5.1/11.0Å but partners are 4.1Å apart → too_close_together by 1.8Å
- **E16** — severity 1.28, 1 conflict(s); suspect input ~`H23` (group: push_out)
  - pull-in (wants closer): R40@10.7Å(now 13.2,conf 0.55), Y44@10.7Å(now 14.7,conf 0.55)
  - push-out (wants farther): H23@14.0Å(now 10.2,conf 0.67)
  - S11↔H23: targets 7.1/14.0Å but partners are 5.0Å apart → too_close_together by 1.9Å
- **E39** — severity 1.26, 1 conflict(s); suspect input ~`N17` (group: push_out)
  - push-out (wants farther): N17@15.1Å(now 12.0,conf 0.55)
  - V36↔N17: targets 9.0/15.1Å but partners are 3.8Å apart → too_close_together by 2.3Å
- **L29** — severity 1.18, 1 conflict(s); suspect input ~`N17` (group: push_out)
  - push-out (wants farther): N17@12.5Å(now 9.7,conf 0.55)
  - A32↔N17: targets 4.6/12.5Å but partners are 5.8Å apart → too_close_together by 2.2Å
- **R40** — severity 1.01, 1 conflict(s); suspect input ~`Q14` (group: pull_in)
  - pull-in (wants closer): E16@10.7Å(now 13.2,conf 0.55)
  - E16↔Q14: targets 10.7/15.7Å but partners are 3.2Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=17 · 3-10(G)=6 · coil(C)=4

```
CHEGEHHEECCHHHHHEHHEEECEGHEHHGHEGHHHHHHGGEEEEEE
```

## Backbone H-bond Network

- total=32 · helix(i→i+4)=7 · sheet=25
  - V2 ↔ C6  (helix)
  - L12 ↔ E16  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - E31 ↔ L35  (helix)
  - Y34 ↔ G38  (helix)
  - L35 ↔ E39  (helix)
  - E3 ↔ S8  (sheet)
  - E3 ↔ I9  (sheet)
  - E3 ↔ Q22  (sheet)
  - C5 ↔ V20  (sheet)
  - C5 ↔ N21  (sheet)
  - C5 ↔ Q22  (sheet)
  - C5 ↔ L24  (sheet)
  - S8 ↔ N21  (sheet)
  - S8 ↔ Q22  (sheet)
  - S8 ↔ L24  (sheet)
  - I9 ↔ V20  (sheet)
  - I9 ↔ N21  (sheet)
  - I9 ↔ Q22  (sheet)
  - … +12 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=204 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=93 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1505 (restraint satisfaction; lower=better)
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
