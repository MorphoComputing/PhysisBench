# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1KTH\sequence\1KTH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1KTH\seeds\seed_1\1KTH.pdb`
- residues: 56
- mode: oracle
- ca_rmsd: 0.481 A
- tm_score_ca_ordered: 0.9651420377449865
- heavy_atom_rmsd: 3.227 A
- sidechain_heavy_atom_rmsd: 4.202 A
- **all-atom quality (honest):** heavy 3.227 A, sidechain 4.202 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/48 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1431
- bin_accuracy: 0.674

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=36
- rigid_domain_reconvergence: applied=True accepted=7 rmsd=0.6362007959935698 -> 0.5110936728425202 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4813783546373274
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.48980725022818367  localized_anchor_rmsd: 0.48142931493043667

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Y21 → 16 conflicts (62%)
- explained: 16/26 conflicts by 1 root cause(s)
- metrics: hubs=8 (frac 0.143), conflicts/hub=3.2, max_incompat=4.46Å, chain_span=0.857
- **fix-first:** [LOW_CONFLICT] Root cause(s): Y21 — explain ~16/26 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E51** — severity 7.06, 8 conflict(s); suspect input ~`Y21` (group: pull_in)
  - pull-in (wants closer): Y21@6.2Å(now 8.8,conf 0.40)
  - E10↔Y21: targets 19.6/6.2Å but partners are 10.5Å apart → too_close_together by 2.9Å
  - G11↔Y21: targets 21.6/6.2Å but partners are 12.7Å apart → too_close_together by 2.7Å
  - T12↔Y21: targets 24.8/6.2Å but partners are 16.2Å apart → too_close_together by 2.4Å
- **Y21** — severity 6.14, 6 conflict(s); suspect input ~`D9` (group: pull_in)
  - pull-in (wants closer): E51@6.2Å(now 8.8,conf 0.40)
  - E51↔D9: targets 6.2/6.8Å but partners are 17.4Å apart → too_far_apart by 4.5Å
  - E51↔C37: targets 6.2/13.3Å but partners are 22.7Å apart → too_far_apart by 3.2Å
  - K8↔E51: targets 6.2/6.2Å but partners are 15.1Å apart → too_far_apart by 2.7Å
- **C37** — severity 2.80, 3 conflict(s); suspect input ~`D9` (group: push_out)
  - pull-in (wants closer): D23@18.3Å(now 20.8,conf 0.37)
  - push-out (wants farther): K8@16.2Å(now 13.6,conf 0.35)
  - K8↔D9: targets 16.2/9.4Å but partners are 3.8Å apart → too_close_together by 3.0Å
  - K27↔D23: targets 26.5/18.3Å but partners are 5.7Å apart → too_close_together by 2.6Å
  - E10↔K8: targets 7.5/16.2Å but partners are 6.3Å apart → too_close_together by 2.3Å
- **C29** — severity 2.38, 3 conflict(s); suspect input ~`E41` (group: push_out)
  - push-out (wants farther): E41@17.0Å(now 13.6,conf 0.35)
  - E41↔N42: targets 17.0/10.2Å but partners are 4.1Å apart → too_close_together by 2.7Å
  - Y21↔E41: targets 6.1/17.0Å but partners are 8.5Å apart → too_close_together by 2.4Å
  - Y22↔E41: targets 4.7/17.0Å but partners are 10.5Å apart → too_close_together by 1.8Å
- **I3** — severity 1.31, 2 conflict(s); suspect input ~`G39` (group: pull_in)
  - pull-in (wants closer): K8@8.1Å(now 11.4,conf 0.35)
  - push-out (wants farther): G38@17.4Å(now 14.8,conf 0.35)
  - G38↔G39: targets 17.4/11.5Å but partners are 3.9Å apart → too_close_together by 2.0Å
  - G38↔N40: targets 17.4/8.9Å but partners are 6.6Å apart → too_close_together by 1.8Å
- **E41** — severity 1.28, 2 conflict(s); suspect input ~`Y22` (group: push_out)
  - push-out (wants farther): C29@17.0Å(now 13.6,conf 0.35)
  - C29↔Y22: targets 17.0/10.5Å but partners are 4.5Å apart → too_close_together by 2.0Å
  - Y21↔C29: targets 9.7/17.0Å but partners are 5.6Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=23 · 3-10(G)=9 · coil(C)=6

```
EEHHHEEGGGEEEHCCECEEECGHHGHEEEGEEGHGEHEEHHEGHEHHEHHHHCCE
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=4 · sheet=48
  - G38 ↔ N42  (helix)
  - E41 ↔ G45  (helix)
  - Q47 ↔ E51  (helix)
  - K48 ↔ K52  (helix)
  - T1 ↔ L6  (sheet)
  - D2 ↔ P7  (sheet)
  - D2 ↔ Y21  (sheet)
  - L6 ↔ W20  (sheet)
  - L6 ↔ Y21  (sheet)
  - P7 ↔ W20  (sheet)
  - P7 ↔ Y21  (sheet)
  - G11 ↔ I17  (sheet)
  - G11 ↔ K19  (sheet)
  - T12 ↔ I17  (sheet)
  - C13 ↔ W33  (sheet)
  - I17 ↔ F32  (sheet)
  - I17 ↔ W33  (sheet)
  - I17 ↔ C37  (sheet)
  - K19 ↔ C29  (sheet)
  - K19 ↔ A30  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=210 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=120 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1151 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C4–C54, C13–C37, C29–C50

## Side-chain Rotamers (χ1/χ2)

- 48 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1KTH.ensemble.pdb`)
- RMSF mean=0.095Å max=0.225Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 17, 53, 21, 36

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1KTH.pae.csv`
- mean=0.054Å · max=0.321Å · AlphaFold-PAE analog (low block = rigid unit/domain)
