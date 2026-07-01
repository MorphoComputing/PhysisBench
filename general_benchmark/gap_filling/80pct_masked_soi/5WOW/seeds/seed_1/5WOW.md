# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\5WOW\seeds\seed_1\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 3.397 A
- tm_score_ca_ordered: 0.4764384050986242
- heavy_atom_rmsd: 4.525 A
- sidechain_heavy_atom_rmsd: 5.346 A
- **all-atom quality (honest):** heavy 4.525 A, sidechain 5.346 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 249
- bin_accuracy: 0.618

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=6 rmsd=3.9913850793781567 -> 3.7444873647598467 A
- topology_reconvergence: applied=True accepted=17/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.3966198087243287
- ga_delta_rmsd: -0.2655060874739039  ga_fitness_mode: energy
- pre_local_rmsd: 3.3966328651851345  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/3 conflicts by 0 root cause(s)
- metrics: hubs=3 (frac 0.081), conflicts/hub=1.0, max_incompat=2.59Å, chain_span=0.459
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S14** — severity 1.41, 1 conflict(s); suspect input ~`P31` (group: pull_in)
  - pull-in (wants closer): C20@7.4Å(now 10.1,conf 0.79), I21@6.4Å(now 9.1,conf 0.69)
  - C20↔P31: targets 7.4/16.2Å but partners are 6.2Å apart → too_close_together by 2.6Å
- **P31** — severity 1.03, 1 conflict(s); suspect input ~`I6` (group: pull_in)
  - pull-in (wants closer): I6@5.9Å(now 9.1,conf 0.55)
  - V34↔I6: targets 7.0/5.9Å but partners are 14.8Å apart → too_far_apart by 1.9Å
- **C20** — severity 0.85, 1 conflict(s); suspect input ~`P4` (group: pull_in)
  - pull-in (wants closer): S14@7.4Å(now 10.1,conf 0.79)
  - S14↔P4: targets 7.4/9.2Å but partners are 18.1Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=17 · 3-10(G)=2 · coil(C)=7

```
EEHHHCCEECHCEHEGEHHHECEGEEEEECEEHHHCE
```

## Backbone H-bond Network

- total=54 · helix(i→i+4)=1 · sheet=53
  - S14 ↔ G18  (helix)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ I21  (sheet)
  - V2 ↔ Q8  (sheet)
  - V2 ↔ R9  (sheet)
  - V2 ↔ I21  (sheet)
  - Q8 ↔ D13  (sheet)
  - Q8 ↔ D15  (sheet)
  - Q8 ↔ P17  (sheet)
  - Q8 ↔ I21  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ N25  (sheet)
  - Q8 ↔ G26  (sheet)
  - Q8 ↔ Y27  (sheet)
  - Q8 ↔ C28  (sheet)
  - R9 ↔ D15  (sheet)
  - R9 ↔ P17  (sheet)
  - R9 ↔ I21  (sheet)
  - R9 ↔ R23  (sheet)
  - … +34 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=10 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=128 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=64 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3257 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
