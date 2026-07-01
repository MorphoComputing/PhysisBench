# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2CRD\seeds\seed_5\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.067 A
- tm_score_ca_ordered: 0.5276127383460112
- heavy_atom_rmsd: 3.556 A
- sidechain_heavy_atom_rmsd: 4.526 A
- **all-atom quality (honest):** heavy 3.556 A, sidechain 4.526 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 217
- bin_accuracy: 0.567

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.066846631532087
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 2.066839168903504  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K9 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.059), conflicts/hub=1.5, max_incompat=2.97Å, chain_span=0.029
- **fix-first:** [LOW_CONFLICT] Root cause(s): K9 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W12** — severity 3.64, 2 conflict(s); suspect input ~`K9` (group: pull_in)
  - pull-in (wants closer): L18@7.8Å(now 11.0,conf 0.69), H19@8.4Å(now 11.6,conf 0.69)
  - H19↔K9: targets 8.4/5.5Å but partners are 16.8Å apart → too_far_apart by 3.0Å
  - L18↔K9: targets 7.8/5.5Å but partners are 15.7Å apart → too_far_apart by 2.4Å
- **S13** — severity 0.87, 1 conflict(s); suspect input ~`K9` (group: pull_in)
  - pull-in (wants closer): L18@6.4Å(now 8.9,conf 0.59)
  - push-out (wants farther): T7@13.0Å(now 9.8,conf 0.94)
  - T7↔K9: targets 13.0/7.8Å but partners are 3.6Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=15 · 3-10(G)=5 · coil(C)=1

```
CEEEEEGHHEHHHHHHHGHGEGEEEEEHHHGEEE
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=3 · sheet=33
  - S8 ↔ W12  (helix)
  - C11 ↔ C15  (helix)
  - C15 ↔ H19  (helix)
  - N2 ↔ E10  (sheet)
  - V3 ↔ E10  (sheet)
  - V3 ↔ R23  (sheet)
  - S4 ↔ E10  (sheet)
  - S4 ↔ G24  (sheet)
  - C5 ↔ E10  (sheet)
  - C5 ↔ G24  (sheet)
  - C5 ↔ K25  (sheet)
  - T6 ↔ G24  (sheet)
  - T6 ↔ K25  (sheet)
  - T6 ↔ C26  (sheet)
  - E10 ↔ R23  (sheet)
  - E10 ↔ G24  (sheet)
  - E10 ↔ K25  (sheet)
  - E10 ↔ C26  (sheet)
  - E10 ↔ M27  (sheet)
  - T21 ↔ R32  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=148 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=82 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0584 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
