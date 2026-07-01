# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\5WOW\seeds\seed_9\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 2.661 A
- tm_score_ca_ordered: 0.45543550964631285
- heavy_atom_rmsd: 4.298 A
- sidechain_heavy_atom_rmsd: 5.393 A
- **all-atom quality (honest):** heavy 4.298 A, sidechain 5.393 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 247
- bin_accuracy: 0.628

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.6611216284360832
- ga_delta_rmsd: 2.9404824224398385  ga_fitness_mode: energy
- pre_local_rmsd: 2.661069097883805  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** I6 → 5 conflicts (71%)
- explained: 5/7 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.081), conflicts/hub=2.3, max_incompat=3.83Å, chain_span=0.676
- **fix-first:** [LOW_CONFLICT] Root cause(s): I6 — explain ~5/7 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P31** — severity 4.03, 3 conflict(s); suspect input ~`I6` (group: pull_in)
  - pull-in (wants closer): I6@5.9Å(now 10.7,conf 0.55)
  - V34↔I6: targets 6.9/5.9Å but partners are 16.3Å apart → too_far_apart by 3.5Å
  - Y37↔I6: targets 7.5/5.9Å but partners are 15.3Å apart → too_far_apart by 1.9Å
  - D36↔I6: targets 9.1/5.9Å but partners are 16.9Å apart → too_far_apart by 1.9Å
- **I6** — severity 2.95, 2 conflict(s); suspect input ~`G1` (group: push_out)
  - pull-in (wants closer): P31@5.9Å(now 10.7,conf 0.55), D33@8.3Å(now 13.2,conf 0.55)
  - push-out (wants farther): V2@10.9Å(now 7.3,conf 0.94)
  - P31↔G1: targets 5.9/13.3Å but partners are 3.6Å apart → too_close_together by 3.8Å
  - D33↔D36: targets 8.3/15.8Å but partners are 5.9Å apart → too_close_together by 1.6Å
- **D15** — severity 2.28, 2 conflict(s); suspect input ~`G1` (group: push_out)
  - push-out (wants farther): G1@14.8Å(now 12.0,conf 0.55)
  - C20↔G1: targets 7.6/14.8Å but partners are 5.0Å apart → too_close_together by 2.2Å
  - I21↔G1: targets 5.8/14.8Å but partners are 6.9Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=18 · 3-10(G)=4 · coil(C)=3

```
EHGHEECEECHEEHHEEEHEECEHHEEGHGGEEHHHE
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=3 · sheet=55
  - R11 ↔ D15  (helix)
  - D15 ↔ A19  (helix)
  - N25 ↔ G29  (helix)
  - G1 ↔ C16  (sheet)
  - G1 ↔ P17  (sheet)
  - G1 ↔ G18  (sheet)
  - G1 ↔ C20  (sheet)
  - G1 ↔ I21  (sheet)
  - K5 ↔ C16  (sheet)
  - K5 ↔ P17  (sheet)
  - K5 ↔ G18  (sheet)
  - K5 ↔ C20  (sheet)
  - K5 ↔ I21  (sheet)
  - I6 ↔ C16  (sheet)
  - I6 ↔ P17  (sheet)
  - I6 ↔ C20  (sheet)
  - I6 ↔ I21  (sheet)
  - Q8 ↔ D13  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ P17  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=124 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=55 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.832 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
