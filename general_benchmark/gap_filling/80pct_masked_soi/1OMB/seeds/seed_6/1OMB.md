# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1OMB\seeds\seed_6\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 2.975 A
- tm_score_ca_ordered: 0.30775086610988894
- heavy_atom_rmsd: 4.617 A
- sidechain_heavy_atom_rmsd: 5.548 A
- **all-atom quality (honest):** heavy 4.617 A, sidechain 5.548 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 206
- bin_accuracy: 0.558

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.9747609079437187
- ga_delta_rmsd: 1.4692808698844249  ga_fitness_mode: energy
- pre_local_rmsd: 2.9747773411545047  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C15 → 3 conflicts (75%)
- explained: 3/4 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.091), conflicts/hub=1.3, max_incompat=2.97Å, chain_span=0.424
- **fix-first:** [LOW_CONFLICT] Root cause(s): C15 — explain ~3/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C15** — severity 2.71, 2 conflict(s); suspect input ~`A2` (group: pull_in)
  - pull-in (wants closer): A2@6.3Å(now 13.2,conf 0.55)
  - push-out (wants farther): G18@5.6Å(now 1.9,conf 0.69)
  - R19↔A2: targets 5.2/6.3Å but partners are 14.4Å apart → too_far_apart by 3.0Å
  - G12↔A2: targets 9.6/6.3Å but partners are 17.9Å apart → too_far_apart by 2.0Å
- **C8** — severity 1.27, 1 conflict(s); suspect input ~`G18` (group: push_out)
  - push-out (wants farther): K14@6.8Å(now 4.2,conf 0.82), G18@12.0Å(now 9.3,conf 0.55)
  - C15↔G18: targets 7.8/12.0Å but partners are 1.9Å apart → too_close_together by 2.3Å
- **I1** — severity 1.00, 1 conflict(s); suspect input ~`T13` (group: pull_in)
  - pull-in (wants closer): T13@6.9Å(now 11.4,conf 0.55)
  - D4↔T13: targets 8.0/6.9Å but partners are 16.7Å apart → too_far_apart by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=8 · strand(E)=18 · 3-10(G)=3 · coil(C)=4

```
CEECEGEEEEHHEHEGHEHEHEEEECHECGEHE
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=1 · sheet=52
  - R17 ↔ C21  (helix)
  - A2 ↔ K7  (sheet)
  - A2 ↔ C8  (sheet)
  - E3 ↔ C8  (sheet)
  - Y5 ↔ P20  (sheet)
  - Y5 ↔ R22  (sheet)
  - Y5 ↔ C23  (sheet)
  - K7 ↔ T13  (sheet)
  - K7 ↔ C15  (sheet)
  - K7 ↔ G18  (sheet)
  - K7 ↔ P20  (sheet)
  - K7 ↔ R22  (sheet)
  - K7 ↔ C23  (sheet)
  - K7 ↔ S24  (sheet)
  - C8 ↔ T13  (sheet)
  - C8 ↔ C15  (sheet)
  - C8 ↔ G18  (sheet)
  - C8 ↔ P20  (sheet)
  - C8 ↔ R22  (sheet)
  - C8 ↔ C23  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=117 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=62 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2149 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
