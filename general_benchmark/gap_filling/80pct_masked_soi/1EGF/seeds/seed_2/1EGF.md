# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1EGF\seeds\seed_2\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 3.545 A
- tm_score_ca_ordered: 0.4928346692407086
- heavy_atom_rmsd: 5.146 A
- sidechain_heavy_atom_rmsd: 6.279 A
- **all-atom quality (honest):** heavy 5.146 A, sidechain 6.279 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 413
- bin_accuracy: 0.620

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain_block reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.5451196049223985
- ga_delta_rmsd: 1.4366381839956728  ga_fitness_mode: energy
- pre_local_rmsd: 3.545486455110039  localized_anchor_rmsd: 3.545195080475458

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** R40-D45 → 14 conflicts (93%)
- explained: 14/15 conflicts by 1 root cause(s)
- metrics: hubs=6 (frac 0.118), conflicts/hub=2.5, max_incompat=3.44Å, chain_span=0.412
- **fix-first:** [LOW_CONFLICT] Root cause(s): R40-D45 — explain ~14/15 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R44** — severity 6.64, 5 conflict(s); suspect input ~`H21` (group: push_out)
  - push-out (wants farther): H21@20.5Å(now 17.1,conf 0.59), G16@10.6Å(now 7.9,conf 0.55)
  - D39↔H21: targets 11.1/20.5Å but partners are 6.1Å apart → too_close_together by 3.2Å
  - R40↔H21: targets 10.0/20.5Å but partners are 7.7Å apart → too_close_together by 2.8Å
  - G38↔H21: targets 9.0/20.5Å but partners are 9.6Å apart → too_close_together by 1.9Å
- **D45** — severity 5.40, 4 conflict(s); suspect input ~`M20` (group: push_out)
  - push-out (wants farther): M20@19.9Å(now 16.2,conf 0.58)
  - R40↔M20: targets 11.4/19.9Å but partners are 5.0Å apart → too_close_together by 3.4Å
  - Q42↔M20: targets 9.0/19.9Å but partners are 8.7Å apart → too_close_together by 2.2Å
  - M20↔S37: targets 19.9/7.2Å but partners are 10.6Å apart → too_close_together by 2.0Å
- **Y36** — severity 3.38, 3 conflict(s); suspect input ~`P3` (group: push_out)
  - push-out (wants farther): V33@5.5Å(now 2.5,conf 0.58), P3@19.7Å(now 16.6,conf 0.57)
  - R40↔P3: targets 8.6/19.7Å but partners are 8.7Å apart → too_close_together by 2.4Å
  - Q42↔P3: targets 6.0/19.7Å but partners are 11.9Å apart → too_close_together by 1.8Å
  - C41↔P3: targets 5.0/19.7Å but partners are 13.0Å apart → too_close_together by 1.7Å
- **S37** — severity 1.85, 1 conflict(s); suspect input ~`P3` (group: push_out)
  - push-out (wants farther): P3@17.1Å(now 14.1,conf 0.55)
  - R40↔P3: targets 5.0/17.1Å but partners are 8.7Å apart → too_close_together by 3.4Å
- **T43** — severity 1.18, 1 conflict(s); suspect input ~`C19` (group: push_out)
  - push-out (wants farther): C19@15.0Å(now 12.4,conf 0.55)
  - R40↔C19: targets 7.8/15.0Å but partners are 5.1Å apart → too_close_together by 2.2Å
- **S24** — severity 1.04, 1 conflict(s); suspect input ~`P3` (group: push_out)
  - push-out (wants farther): H21@9.4Å(now 6.8,conf 0.79), P3@13.0Å(now 8.4,conf 0.55)
  - S27↔P3: targets 7.4/13.0Å but partners are 3.6Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=23 · 3-10(G)=7 · coil(C)=5

```
EEEEGCHHCECEGGHEHGCEEGGHEHEHHEEEEHHEEEHEHEGHEHEHHEC
```

## Backbone H-bond Network

- total=79 · helix(i→i+4)=3 · sheet=76
  - S24 ↔ Y28  (helix)
  - G35 ↔ D39  (helix)
  - R44 ↔ W48  (helix)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - P3 ↔ Y12  (sheet)
  - P3 ↔ M20  (sheet)
  - P3 ↔ H21  (sheet)
  - G4 ↔ D10  (sheet)
  - G4 ↔ Y12  (sheet)
  - G4 ↔ M20  (sheet)
  - G4 ↔ H21  (sheet)
  - D10 ↔ M20  (sheet)
  - D10 ↔ C30  (sheet)
  - Y12 ↔ M20  (sheet)
  - Y12 ↔ H21  (sheet)
  - Y12 ↔ S27  (sheet)
  - Y12 ↔ C30  (sheet)
  - … +59 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=220 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=134 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5359 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
