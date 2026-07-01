# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\5WOW\seeds\seed_4\5WOW.pdb`
- residues: 37
- mode: oracle
- ca_rmsd: 3.464 A
- tm_score_ca_ordered: 0.40446327851873143
- heavy_atom_rmsd: 5.149 A
- sidechain_heavy_atom_rmsd: 6.439 A
- **all-atom quality (honest):** heavy 5.149 A, sidechain 6.439 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 247
- bin_accuracy: 0.534

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.464037624338718
- ga_delta_rmsd: 1.3644764474647992  ga_fitness_mode: energy
- pre_local_rmsd: 3.464073069423424  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G29-D36 → 4 conflicts (100%)
- explained: 4/4 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.081), conflicts/hub=1.3, max_incompat=2.95Å, chain_span=0.676
- **fix-first:** [LOW_CONFLICT] Root cause(s): G29-D36 — explain ~4/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P31** — severity 2.56, 2 conflict(s); suspect input ~`N25` (group: pull_in)
  - pull-in (wants closer): N25@14.2Å(now 17.5,conf 0.69), R23@11.8Å(now 14.6,conf 0.55)
  - N25↔V34: targets 14.2/6.4Å but partners are 22.9Å apart → too_far_apart by 2.3Å
  - V34↔R23: targets 6.4/11.8Å but partners are 19.9Å apart → too_far_apart by 1.7Å
- **I6** — severity 1.60, 1 conflict(s); suspect input ~`D36` (group: pull_in)
  - pull-in (wants closer): D33@8.3Å(now 12.2,conf 0.55)
  - D33↔D36: targets 8.3/15.8Å but partners are 4.6Å apart → too_close_together by 3.0Å
- **G29** — severity 0.87, 1 conflict(s); suspect input ~`D15` (group: push_out)
  - push-out (wants farther): D15@11.2Å(now 8.7,conf 0.55)
  - C22↔D15: targets 6.0/11.2Å but partners are 3.6Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=14 · 3-10(G)=6 · coil(C)=2

```
CGHHHHHEGGHEEHEEHHHGGEEHHEGEEEEECHHHE
```

## Backbone H-bond Network

- total=44 · helix(i→i+4)=3 · sheet=41
  - C3 ↔ L7  (helix)
  - L7 ↔ R11  (helix)
  - S14 ↔ G18  (helix)
  - Q8 ↔ D13  (sheet)
  - Q8 ↔ D15  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ C22  (sheet)
  - Q8 ↔ R23  (sheet)
  - Q8 ↔ G26  (sheet)
  - Q8 ↔ C28  (sheet)
  - R12 ↔ C22  (sheet)
  - R12 ↔ R23  (sheet)
  - R12 ↔ G26  (sheet)
  - R12 ↔ C28  (sheet)
  - R12 ↔ G29  (sheet)
  - D13 ↔ C22  (sheet)
  - D13 ↔ R23  (sheet)
  - D13 ↔ G26  (sheet)
  - D13 ↔ C28  (sheet)
  - D13 ↔ G29  (sheet)
  - … +24 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=146 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=78 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.4626 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
