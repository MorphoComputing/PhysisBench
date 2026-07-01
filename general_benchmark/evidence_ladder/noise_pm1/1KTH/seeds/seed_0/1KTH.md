# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1KTH\seeds\seed_0\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.562 A
- tm_score_ca_ordered: 0.9536546892242701
- heavy_atom_rmsd: 3.252 A
- sidechain_heavy_atom_rmsd: 4.358 A
- **all-atom quality (honest):** heavy 3.252 A, sidechain 4.358 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1431
- bin_accuracy: 0.678

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=10 rmsd=2.3036884005147082 -> 1.781442964358013 A
- topology_reconvergence: applied=True accepted=9/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5618780321688076
- ga_delta_rmsd: -0.11728159402249216  ga_fitness_mode: energy
- pre_local_rmsd: 0.5750558886557592  localized_anchor_rmsd: 0.561950520748768

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Y21 → 17 conflicts (65%)
- explained: 17/26 conflicts by 1 root cause(s)
- metrics: hubs=8 (frac 0.143), conflicts/hub=3.2, max_incompat=4.34Å, chain_span=0.857
- **fix-first:** [LOW_CONFLICT] Root cause(s): Y21 — explain ~17/26 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E51** — severity 7.38, 9 conflict(s); suspect input ~`Y21` (group: pull_in)
  - pull-in (wants closer): Y21@6.2Å(now 8.7,conf 0.40)
  - E10↔Y21: targets 19.6/6.2Å but partners are 10.6Å apart → too_close_together by 2.9Å
  - G11↔Y21: targets 21.6/6.2Å but partners are 12.8Å apart → too_close_together by 2.6Å
  - T12↔Y21: targets 24.8/6.2Å but partners are 16.2Å apart → too_close_together by 2.4Å
- **Y21** — severity 5.97, 6 conflict(s); suspect input ~`D9` (group: pull_in)
  - pull-in (wants closer): E51@6.2Å(now 8.7,conf 0.40)
  - E51↔D9: targets 6.2/6.8Å but partners are 17.3Å apart → too_far_apart by 4.3Å
  - E51↔C37: targets 6.2/13.3Å but partners are 22.6Å apart → too_far_apart by 3.1Å
  - K8↔E51: targets 6.2/6.2Å but partners are 15.0Å apart → too_far_apart by 2.6Å
- **C29** — severity 2.22, 3 conflict(s); suspect input ~`E41` (group: push_out)
  - push-out (wants farther): E41@17.0Å(now 13.6,conf 0.35)
  - E41↔N42: targets 17.0/10.2Å but partners are 4.2Å apart → too_close_together by 2.6Å
  - Y21↔E41: targets 6.1/17.0Å but partners are 8.8Å apart → too_close_together by 2.1Å
  - Y22↔E41: targets 4.7/17.0Å but partners are 10.6Å apart → too_close_together by 1.7Å
- **K8** — severity 1.48, 2 conflict(s); suspect input ~`T1` (group: pull_in)
  - pull-in (wants closer): I3@8.1Å(now 11.5,conf 0.35)
  - T1↔I3: targets 16.2/8.1Å but partners are 5.4Å apart → too_close_together by 2.8Å
  - I3↔W33: targets 8.1/8.5Å but partners are 18.1Å apart → too_far_apart by 1.5Å
- **I3** — severity 1.33, 2 conflict(s); suspect input ~`G39` (group: pull_in)
  - pull-in (wants closer): K8@8.1Å(now 11.5,conf 0.35)
  - push-out (wants farther): G38@17.4Å(now 14.8,conf 0.35)
  - G38↔G39: targets 17.4/11.5Å but partners are 3.8Å apart → too_close_together by 2.1Å
  - G38↔N40: targets 17.4/8.9Å but partners are 6.6Å apart → too_close_together by 1.8Å
- **E41** — severity 1.26, 2 conflict(s); suspect input ~`Y22` (group: push_out)
  - push-out (wants farther): C29@17.0Å(now 13.6,conf 0.35)
  - C29↔Y22: targets 17.0/10.5Å but partners are 4.6Å apart → too_close_together by 1.9Å
  - Y21↔C29: targets 9.7/17.0Å but partners are 5.5Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=18 · 3-10(G)=15 · coil(C)=8

```
CEHHHEEGGGGEEGEEGCEEECGHHCHEGGGECCHEEHEGHHEGHEGHGHHGHCCE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=2 · sheet=23
  - G38 ↔ N42  (helix)
  - E41 ↔ G45  (helix)
  - D2 ↔ P7  (sheet)
  - D2 ↔ Y21  (sheet)
  - L6 ↔ W20  (sheet)
  - L6 ↔ Y21  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - F16 ↔ F32  (sheet)
  - F16 ↔ G36  (sheet)
  - K19 ↔ F32  (sheet)
  - K19 ↔ G36  (sheet)
  - K19 ↔ G39  (sheet)
  - W20 ↔ S28  (sheet)
  - W20 ↔ F32  (sheet)
  - W20 ↔ G39  (sheet)
  - Y21 ↔ S28  (sheet)
  - Y21 ↔ F32  (sheet)
  - Y21 ↔ G39  (sheet)
  - S28 ↔ S46  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=207 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=118 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1152 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
