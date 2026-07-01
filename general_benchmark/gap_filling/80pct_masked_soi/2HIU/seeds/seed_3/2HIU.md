# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2HIU\seeds\seed_3\2HIU.pdb`
- residues: 47
- mode: oracle
- ca_rmsd: 3.937 A
- tm_score_ca_ordered: 0.39165286238500047
- heavy_atom_rmsd: 5.265 A
- sidechain_heavy_atom_rmsd: 6.143 A
- **all-atom quality (honest):** heavy 5.265 A, sidechain 6.143 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 366
- bin_accuracy: 0.525

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.9369194254326536
- ga_delta_rmsd: -0.5245228806555771  ga_fitness_mode: energy
- pre_local_rmsd: 3.9369769751931587  localized_anchor_rmsd: 3.9369769751931587

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Q4-T7 → 12 conflicts (67%)
- explained: 12/18 conflicts by 1 root cause(s)
- metrics: hubs=10 (frac 0.213), conflicts/hub=1.8, max_incompat=4.0Å, chain_span=0.979
- **fix-first:** [LOW_CONFLICT] Root cause(s): Q4-T7 — explain ~12/18 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q4** — severity 6.86, 4 conflict(s); suspect input ~`I1` (group: push_out)
  - pull-in (wants closer): I1@5.1Å(now 8.8,conf 0.57)
  - push-out (wants farther): L24@8.2Å(now 5.3,conf 0.55)
  - I9↔I1: targets 6.0/5.1Å but partners are 14.3Å apart → too_far_apart by 3.1Å
  - I1↔S8: targets 5.1/5.2Å but partners are 13.7Å apart → too_far_apart by 3.4Å
  - I1↔V30: targets 5.1/13.2Å but partners are 5.0Å apart → too_close_together by 3.1Å
- **C5** — severity 6.12, 4 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): I1@6.4Å(now 10.3,conf 0.69)
  - I1↔I9: targets 6.4/4.4Å but partners are 14.3Å apart → too_far_apart by 3.5Å
  - I1↔S8: targets 6.4/4.9Å but partners are 13.7Å apart → too_far_apart by 2.5Å
  - I1↔Q22: targets 6.4/6.7Å but partners are 15.4Å apart → too_far_apart by 2.3Å
- **V2** — severity 3.46, 2 conflict(s); suspect input ~`T45` (group: pull_in)
  - pull-in (wants closer): T7@7.0Å(now 10.4,conf 0.99)
  - T7↔T45: targets 7.0/7.8Å but partners are 18.8Å apart → too_far_apart by 4.0Å
  - T7↔F43: targets 7.0/12.1Å but partners are 21.4Å apart → too_far_apart by 2.3Å
- **Q14** — severity 2.65, 2 conflict(s); suspect input ~`Q22` (group: push_out)
  - push-out (wants farther): N17@8.9Å(now 6.3,conf 0.91), V20@9.5Å(now 5.7,conf 0.58), N21@11.0Å(now 4.3,conf 0.55), Q22@12.1Å(now 5.7,conf 0.55)
  - S11↔Q22: targets 5.1/12.1Å but partners are 4.0Å apart → too_close_together by 3.0Å
  - S11↔N21: targets 5.1/11.0Å but partners are 4.1Å apart → too_close_together by 1.8Å
- **E3** — severity 1.54, 1 conflict(s); suspect input ~`T45` (group: pull_in)
  - pull-in (wants closer): T7@4.8Å(now 7.5,conf 0.58)
  - T7↔T45: targets 4.8/11.1Å but partners are 18.8Å apart → too_far_apart by 2.8Å
- **K47** — severity 1.32, 1 conflict(s); suspect input ~`E31` (group: push_out)
  - push-out (wants farther): E31@18.6Å(now 15.2,conf 0.55)
  - I1↔E31: targets 8.1/18.6Å but partners are 8.1Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=14 · 3-10(G)=9 · coil(C)=8

```
CECEHHEECCEHGHEHHHCEEEECHHGGGCHHEHGHHHHGGEGEEGC
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=4 · sheet=26
  - L12 ↔ E16  (helix)
  - Q14 ↔ Y18  (helix)
  - A32 ↔ V36  (helix)
  - Y34 ↔ G38  (helix)
  - V2 ↔ T7  (sheet)
  - V2 ↔ S8  (sheet)
  - V2 ↔ S11  (sheet)
  - V2 ↔ Q22  (sheet)
  - Q4 ↔ S11  (sheet)
  - Q4 ↔ N21  (sheet)
  - Q4 ↔ Q22  (sheet)
  - Q4 ↔ H23  (sheet)
  - T7 ↔ N21  (sheet)
  - T7 ↔ Q22  (sheet)
  - T7 ↔ H23  (sheet)
  - S8 ↔ N21  (sheet)
  - S8 ↔ Q22  (sheet)
  - S8 ↔ H23  (sheet)
  - S11 ↔ V20  (sheet)
  - S11 ↔ N21  (sheet)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=206 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=105 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.6341 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
