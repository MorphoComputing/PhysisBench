# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\5WOW\seeds\seed_0\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 3.784 A
- tm_score_ca_ordered: 0.3921917661875862
- heavy_atom_rmsd: 4.959 A
- sidechain_heavy_atom_rmsd: 5.867 A
- **all-atom quality (honest):** heavy 4.959 A, sidechain 5.867 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 248
- bin_accuracy: 0.621

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.7841320129498155
- ga_delta_rmsd: -0.35498596397664883  ga_fitness_mode: energy
- pre_local_rmsd: 3.784179584111583  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Y30-P35 → 4 conflicts (100%)
- explained: 4/4 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.081), conflicts/hub=1.3, max_incompat=3.07Å, chain_span=0.784
- **fix-first:** [LOW_CONFLICT] Root cause(s): Y30-P35 — explain ~4/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P35** — severity 2.88, 2 conflict(s); suspect input ~`I21` (group: push_out)
  - push-out (wants farther): I21@17.8Å(now 13.6,conf 0.55)
  - Y30↔I21: targets 9.1/17.8Å but partners are 5.6Å apart → too_close_together by 3.1Å
  - P31↔I21: targets 9.0/17.8Å but partners are 6.6Å apart → too_close_together by 2.2Å
- **P31** — severity 1.32, 1 conflict(s); suspect input ~`I6` (group: pull_in)
  - pull-in (wants closer): I6@5.9Å(now 8.7,conf 0.55)
  - V34↔I6: targets 7.0/5.9Å but partners are 15.3Å apart → too_far_apart by 2.4Å
- **I6** — severity 1.03, 1 conflict(s); suspect input ~`D33` (group: pull_in)
  - pull-in (wants closer): P31@5.9Å(now 8.7,conf 0.55), D33@8.3Å(now 13.0,conf 0.55)
  - push-out (wants farther): V2@8.9Å(now 4.4,conf 0.69), G1@13.3Å(now 5.6,conf 0.55)
  - R9↔D33: targets 9.0/8.3Å but partners are 19.2Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=21 · 3-10(G)=5 · coil(C)=1

```
EEHHEECEGEGEEHHGEHHEEGEHHEEGEEEEEHEHE
```

## Backbone H-bond Network

- total=71 · helix(i→i+4)=1 · sheet=70
  - S14 ↔ G18  (helix)
  - G1 ↔ I6  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ C10  (sheet)
  - G1 ↔ C20  (sheet)
  - G1 ↔ I21  (sheet)
  - V2 ↔ Q8  (sheet)
  - V2 ↔ P17  (sheet)
  - V2 ↔ C20  (sheet)
  - V2 ↔ I21  (sheet)
  - K5 ↔ P17  (sheet)
  - K5 ↔ C20  (sheet)
  - K5 ↔ I21  (sheet)
  - I6 ↔ P17  (sheet)
  - I6 ↔ C20  (sheet)
  - I6 ↔ I21  (sheet)
  - Q8 ↔ D13  (sheet)
  - Q8 ↔ P17  (sheet)
  - Q8 ↔ C20  (sheet)
  - Q8 ↔ I21  (sheet)
  - … +51 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=132 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=66 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4363 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
