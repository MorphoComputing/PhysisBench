# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1SHG\sequence\1SHG.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1SHG\seeds\seed_1\1SHG.pdb`
- residues: 55
- mode: oracle
- ca_rmsd: 0.435 A
- tm_score_ca_ordered: 0.9697480631633126
- heavy_atom_rmsd: 3.009 A
- sidechain_heavy_atom_rmsd: 3.924 A
- **all-atom quality (honest):** heavy 3.009 A, sidechain 3.924 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/50 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 1378
- bin_accuracy: 0.660

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=39
- rigid_domain_reconvergence: applied=True accepted=3 rmsd=0.539198758005719 -> 0.4993860127410856 A
- topology_reconvergence: applied=True accepted=2/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.4346546744472054
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.44768149239854127  localized_anchor_rmsd: 0.4347227860078673

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E11 → 9 conflicts (41%); V17 → 4 conflicts (18%)
- explained: 13/22 conflicts by 2 root cause(s)
- metrics: hubs=12 (frac 0.218), conflicts/hub=1.8, max_incompat=3.77Å, chain_span=0.873
- **fix-first:** [LOW_CONFLICT] Root cause(s): E11 + V17 — explain ~13/22 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E11** — severity 4.12, 5 conflict(s); suspect input ~`L28` (group: pull_in)
  - pull-in (wants closer): G45@6.3Å(now 9.1,conf 0.40)
  - L28↔G45: targets 18.8/6.3Å but partners are 9.3Å apart → too_close_together by 3.2Å
  - L27↔G45: targets 18.5/6.3Å but partners are 10.0Å apart → too_close_together by 2.2Å
  - N29↔G45: targets 18.0/6.3Å but partners are 9.6Å apart → too_close_together by 2.1Å
- **L28** — severity 2.73, 3 conflict(s); suspect input ~`V17` (group: pull_in)
  - pull-in (wants closer): V17@10.4Å(now 13.4,conf 0.34)
  - E11↔V17: targets 18.8/10.4Å but partners are 4.6Å apart → too_close_together by 3.8Å
  - T18↔V17: targets 16.4/10.4Å but partners are 3.8Å apart → too_close_together by 2.1Å
  - Q10↔V17: targets 19.2/10.4Å but partners are 6.7Å apart → too_close_together by 2.1Å
- **L2** — severity 2.12, 2 conflict(s); suspect input ~`A49` (group: push_out)
  - push-out (wants farther): A50@17.9Å(now 14.4,conf 0.36)
  - A49↔A50: targets 10.9/17.9Å but partners are 3.8Å apart → too_close_together by 3.2Å
  - A50↔V52: targets 17.9/9.3Å but partners are 5.5Å apart → too_close_together by 3.0Å
- **G45** — severity 2.02, 3 conflict(s); suspect input ~`L28` (group: pull_in)
  - pull-in (wants closer): E11@6.3Å(now 9.1,conf 0.40)
  - E11↔L28: targets 6.3/8.7Å but partners are 17.3Å apart → too_far_apart by 2.3Å
  - E11↔Q10: targets 6.3/12.0Å but partners are 3.8Å apart → too_close_together by 1.9Å
  - E11↔L27: targets 6.3/8.7Å but partners are 16.7Å apart → too_far_apart by 1.7Å
- **F46** — severity 1.28, 1 conflict(s); suspect input ~`M19` (group: push_out)
  - push-out (wants farther): K20@16.5Å(now 13.8,conf 0.35)
  - K20↔M19: targets 16.5/9.2Å but partners are 3.5Å apart → too_close_together by 3.7Å
- **A50** — severity 1.21, 1 conflict(s); suspect input ~`V3` (group: push_out)
  - push-out (wants farther): L2@17.9Å(now 14.4,conf 0.36)
  - V3↔L2: targets 10.5/17.9Å but partners are 3.8Å apart → too_close_together by 3.6Å

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=27 · 3-10(G)=11 · coil(C)=9

```
EEGEGHECEGCHEHCEEEEECHECEECEEHHEGEEEGEGGGCEGEEECHGHEGEC
```

## Backbone H-bond Network

- total=77 · helix(i→i+4)=0 · sheet=77
  - L4 ↔ Y9  (sheet)
  - L4 ↔ M19  (sheet)
  - L4 ↔ K20  (sheet)
  - L4 ↔ D23  (sheet)
  - Y7 ↔ T18  (sheet)
  - Y7 ↔ M19  (sheet)
  - Y7 ↔ K20  (sheet)
  - Y7 ↔ D23  (sheet)
  - Y9 ↔ E16  (sheet)
  - Y9 ↔ V17  (sheet)
  - Y9 ↔ T18  (sheet)
  - Y9 ↔ M19  (sheet)
  - Y9 ↔ K20  (sheet)
  - Y9 ↔ D23  (sheet)
  - S13 ↔ T18  (sheet)
  - E16 ↔ W35  (sheet)
  - E16 ↔ W36  (sheet)
  - V17 ↔ D23  (sheet)
  - V17 ↔ L25  (sheet)
  - V17 ↔ T26  (sheet)
  - … +57 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=201 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=120 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1985 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 50 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1SHG.ensemble.pdb`)
- RMSF mean=0.063Å max=0.121Å (per-residue in .per_residue.csv)
- most flexible residues: 55, 33, 34, 22, 21

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1SHG.pae.csv`
- mean=0.037Å · max=0.17Å · AlphaFold-PAE analog (low block = rigid unit/domain)
