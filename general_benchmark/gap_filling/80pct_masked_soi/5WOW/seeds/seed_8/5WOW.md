# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\5WOW\seeds\seed_8\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 4.042 A
- tm_score_ca_ordered: 0.3228967776349597
- heavy_atom_rmsd: 5.441 A
- sidechain_heavy_atom_rmsd: 6.528 A
- **all-atom quality (honest):** heavy 5.441 A, sidechain 6.528 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 253
- bin_accuracy: 0.545

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.041672054573589
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 4.041744661078657  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** I21 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.081), conflicts/hub=1.0, max_incompat=3.27Å, chain_span=0.541
- **fix-first:** [LOW_CONFLICT] Root cause(s): I21 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P35** — severity 1.79, 1 conflict(s); suspect input ~`I21` (group: push_out)
  - push-out (wants farther): P31@8.4Å(now 5.8,conf 0.69), I21@17.8Å(now 15.0,conf 0.55)
  - Y30↔I21: targets 9.4/17.8Å but partners are 5.1Å apart → too_close_together by 3.3Å
- **D15** — severity 1.18, 1 conflict(s); suspect input ~`Y30` (group: push_out)
  - push-out (wants farther): G29@11.2Å(now 7.9,conf 0.55), Y30@14.3Å(now 10.4,conf 0.55)
  - I21↔Y30: targets 7.0/14.3Å but partners are 5.1Å apart → too_close_together by 2.2Å
- **I21** — severity 1.00, 1 conflict(s); suspect input ~`Y27` (group: push_out)
  - push-out (wants farther): P35@17.8Å(now 15.0,conf 0.55), Y27@8.5Å(now 5.6,conf 0.55)
  - C28↔Y27: targets 4.6/8.5Å but partners are 2.1Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=14 · 3-10(G)=8 · coil(C)=3

```
CGHGEHCEEGGEHHEEHHHGHHGHEEEECEEEGHHGE
```

## Backbone H-bond Network

- total=32 · helix(i→i+4)=2 · sheet=30
  - S14 ↔ G18  (helix)
  - G18 ↔ C22  (helix)
  - K5 ↔ C16  (sheet)
  - Q8 ↔ D15  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ N25  (sheet)
  - Q8 ↔ G26  (sheet)
  - Q8 ↔ Y27  (sheet)
  - Q8 ↔ C28  (sheet)
  - R9 ↔ D15  (sheet)
  - R9 ↔ C16  (sheet)
  - R9 ↔ N25  (sheet)
  - R9 ↔ G26  (sheet)
  - R9 ↔ Y27  (sheet)
  - R9 ↔ C28  (sheet)
  - R12 ↔ N25  (sheet)
  - R12 ↔ G26  (sheet)
  - R12 ↔ Y27  (sheet)
  - R12 ↔ C28  (sheet)
  - R12 ↔ Y30  (sheet)
  - … +12 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=146 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=85 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.6803 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
