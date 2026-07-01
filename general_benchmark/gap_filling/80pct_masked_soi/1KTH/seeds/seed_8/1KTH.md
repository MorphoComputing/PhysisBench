# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1KTH\seeds\seed_8\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 7.107 A
- tm_score_ca_ordered: 0.2792182122359079
- heavy_atom_rmsd: 8.527 A
- sidechain_heavy_atom_rmsd: 9.510 A
- **all-atom quality (honest):** heavy 8.527 A, sidechain 9.510 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 489
- bin_accuracy: 0.824

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_domain_topology_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 7.106585505337851
- ga_delta_rmsd: -0.044565177303664605  ga_fitness_mode: energy
- pre_local_rmsd: 7.129381778635599  localized_anchor_rmsd: 7.10662590725813

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** T1 → 13 conflicts (93%)
- explained: 13/14 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.089), conflicts/hub=2.8, max_incompat=7.34Å, chain_span=0.393
- **fix-first:** [LOW_CONFLICT] Root cause(s): T1 — explain ~13/14 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C13** — severity 18.06, 6 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): T1@27.4Å(now 22.2,conf 0.94)
  - E10↔T1: targets 9.0/27.4Å but partners are 13.6Å apart → too_close_together by 4.8Å
  - K8↔T1: targets 15.0/27.4Å but partners are 7.9Å apart → too_close_together by 4.5Å
  - T1↔D9: targets 27.4/11.1Å but partners are 11.7Å apart → too_close_together by 4.5Å
- **A30** — severity 10.08, 4 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): T1@17.4Å(now 5.5,conf 0.55)
  - Y22↔T1: targets 6.4/17.4Å but partners are 3.7Å apart → too_close_together by 7.3Å
  - D23↔T1: targets 7.2/17.4Å but partners are 3.3Å apart → too_close_together by 7.0Å
  - K27↔T1: targets 9.0/17.4Å but partners are 6.0Å apart → too_close_together by 2.4Å
- **K8** — severity 4.06, 2 conflict(s); suspect input ~`D23` (group: push_out)
  - push-out (wants farther): T1@15.1Å(now 7.9,conf 0.91), I3@12.2Å(now 7.4,conf 0.69)
  - T1↔D23: targets 15.1/7.9Å but partners are 3.3Å apart → too_close_together by 4.0Å
  - T1↔Y22: targets 15.1/7.9Å but partners are 3.7Å apart → too_close_together by 3.5Å
- **C29** — severity 2.64, 1 conflict(s); suspect input ~`I3` (group: push_out)
  - push-out (wants farther): I3@13.0Å(now 7.2,conf 0.55)
  - Y22↔I3: targets 4.4/13.0Å but partners are 3.8Å apart → too_close_together by 4.8Å
- **W20** — severity 1.03, 1 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): T1@16.1Å(now 8.6,conf 0.55)
  - D23↔T1: targets 11.0/16.1Å but partners are 3.3Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=28 · 3-10(G)=5 · coil(C)=11

```
EEHHGEEHEHCECECEGEEEEECHCHEECEEGEEHEECEEECECHEGHHHGHCCEE
```

## Backbone H-bond Network

- total=76 · helix(i→i+4)=3 · sheet=73
  - C4 ↔ K8  (helix)
  - G45 ↔ E49  (helix)
  - K48 ↔ K52  (helix)
  - T1 ↔ L6  (sheet)
  - T1 ↔ P7  (sheet)
  - T1 ↔ D9  (sheet)
  - T1 ↔ K19  (sheet)
  - T1 ↔ W20  (sheet)
  - T1 ↔ Y21  (sheet)
  - D2 ↔ P7  (sheet)
  - D2 ↔ Y21  (sheet)
  - D2 ↔ Y22  (sheet)
  - L6 ↔ W20  (sheet)
  - L6 ↔ Y21  (sheet)
  - L6 ↔ Y22  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - P7 ↔ Y22  (sheet)
  - D9 ↔ L18  (sheet)
  - D9 ↔ K19  (sheet)
  - … +56 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=223 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=134 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8365 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
