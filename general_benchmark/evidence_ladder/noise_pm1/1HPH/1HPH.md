# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\1HPH\seeds\seed_1\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 1.320 A
- tm_score_ca_ordered: 0.7408037322676665
- heavy_atom_rmsd: 2.945 A
- sidechain_heavy_atom_rmsd: 3.570 A
- **all-atom quality (honest):** heavy 2.945 A, sidechain 3.570 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 528
- bin_accuracy: 0.689

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.3203002892781621
- ga_delta_rmsd: 0.2173303109337168  ga_fitness_mode: energy
- pre_local_rmsd: 1.3202437996610292  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** W22-K26 → 10 conflicts (83%)
- explained: 10/12 conflicts by 1 root cause(s)
- metrics: hubs=6 (frac 0.171), conflicts/hub=2.0, max_incompat=2.66Å, chain_span=0.543
- **fix-first:** [LOW_CONFLICT] Root cause(s): W22-K26 — explain ~10/12 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K26** — severity 3.41, 4 conflict(s); suspect input ~`M17` (group: push_out)
  - push-out (wants farther): L14@16.0Å(now 12.9,conf 0.34), M17@16.6Å(now 14.0,conf 0.35)
  - W22↔M17: targets 5.8/16.6Å but partners are 8.1Å apart → too_close_together by 2.7Å
  - M17↔R19: targets 16.6/8.8Å but partners are 5.2Å apart → too_close_together by 2.6Å
  - V20↔M17: targets 8.7/16.6Å but partners are 5.4Å apart → too_close_together by 2.5Å
- **L14** — severity 1.47, 2 conflict(s); suspect input ~`K26` (group: pull_in)
  - pull-in (wants closer): R24@10.2Å(now 13.0,conf 0.34)
  - push-out (wants farther): K26@16.0Å(now 12.9,conf 0.34)
  - K26↔W22: targets 16.0/7.5Å but partners are 6.0Å apart → too_close_together by 2.5Å
  - R24↔I4: targets 10.2/12.3Å but partners are 24.4Å apart → too_far_apart by 1.8Å
- **R24** — severity 1.35, 2 conflict(s); suspect input ~`L14` (group: pull_in)
  - pull-in (wants closer): L14@10.2Å(now 13.0,conf 0.34)
  - L14↔H13: targets 10.2/16.2Å but partners are 3.5Å apart → too_close_together by 2.5Å
  - H8↔L14: targets 22.1/10.2Å but partners are 10.3Å apart → too_close_together by 1.5Å
- **M17** — severity 1.25, 2 conflict(s); suspect input ~`K26` (group: push_out)
  - push-out (wants farther): K26@16.6Å(now 14.0,conf 0.35)
  - V20↔K26: targets 5.1/16.6Å but partners are 9.6Å apart → too_close_together by 2.0Å
  - E21↔K26: targets 6.5/16.6Å but partners are 8.5Å apart → too_close_together by 1.6Å
- **L10** — severity 0.65, 1 conflict(s); suspect input ~`V1` (group: push_out)
  - push-out (wants farther): V1@14.2Å(now 11.4,conf 0.34)
  - V1↔E3: targets 14.2/8.3Å but partners are 4.0Å apart → too_close_together by 1.9Å
- **M7** — severity 0.64, 1 conflict(s); suspect input ~`V1` (group: push_out)
  - push-out (wants farther): V1@10.9Å(now 7.6,conf 0.34)
  - E3↔V1: targets 5.0/10.9Å but partners are 4.0Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=6 · 3-10(G)=8 · coil(C)=3

```
CEHHHGHHGCEGGCEHHHGHHGHGGHHHHHHEHEE
```

## Backbone H-bond Network

- total=6 · helix(i→i+4)=6 · sheet=0
  - E3 ↔ M7  (helix)
  - S16 ↔ V20  (helix)
  - M17 ↔ E21  (helix)
  - L23 ↔ L27  (helix)
  - L27 ↔ H31  (helix)
  - D29 ↔ F33  (helix)

## Solvent Accessibility (burial)

- buried=15 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=88 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=6 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0124 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1HPH.ensemble.pdb`)
- RMSF mean=1.898Å max=5.932Å (per-residue in .per_residue.csv)
- most flexible residues: 12, 6, 5, 13, 1

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1HPH.pae.csv`
- mean=0.316Å · max=2.293Å · AlphaFold-PAE analog (low block = rigid unit/domain)
