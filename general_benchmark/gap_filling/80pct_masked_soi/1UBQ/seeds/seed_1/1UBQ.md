# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1UBQ\seeds\seed_1\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 1.019 A
- tm_score_ca_ordered: 0.9557625129934783
- heavy_atom_rmsd: 3.006 A
- sidechain_heavy_atom_rmsd: 3.899 A
- **all-atom quality (honest):** heavy 3.006 A, sidechain 3.899 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.014
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 797
- bin_accuracy: 0.888

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.0188408563866123
- ga_delta_rmsd: 6.338083966442337  ga_fitness_mode: energy
- pre_local_rmsd: 1.0221712660613658  localized_anchor_rmsd: 1.0188038433720994

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G74 → 13 conflicts (100%)
- explained: 13/13 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.041), conflicts/hub=4.3, max_incompat=4.16Å, chain_span=0.838
- **fix-first:** [LOW_CONFLICT] Root cause(s): G74 — explain ~13/13 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G74** — severity 12.17, 7 conflict(s); suspect input ~`L66` (group: pull_in)
  - pull-in (wants closer): K62@27.5Å(now 30.4,conf 1.00)
  - push-out (wants farther): L66@24.3Å(now 20.0,conf 0.72), I12@25.6Å(now 23.0,conf 0.70), R41@15.8Å(now 11.7,conf 0.55)
  - V69↔L66: targets 11.2/24.3Å but partners are 10.0Å apart → too_close_together by 3.1Å
  - H67↔L66: targets 17.4/24.3Å but partners are 3.8Å apart → too_close_together by 3.0Å
  - L68↔L66: targets 15.0/24.3Å but partners are 6.5Å apart → too_close_together by 2.8Å
- **L66** — severity 7.94, 4 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@24.3Å(now 20.0,conf 0.72)
  - V69↔G74: targets 10.0/24.3Å but partners are 10.1Å apart → too_close_together by 4.2Å
  - L70↔G74: targets 13.0/24.3Å but partners are 8.5Å apart → too_close_together by 2.8Å
  - R71↔G74: targets 16.6/24.3Å but partners are 5.7Å apart → too_close_together by 2.1Å
- **I12** — severity 2.56, 2 conflict(s); suspect input ~`L70` (group: push_out)
  - push-out (wants farther): G74@25.6Å(now 23.0,conf 0.70)
  - G74↔L70: targets 25.6/14.5Å but partners are 8.5Å apart → too_close_together by 2.6Å
  - T6↔G74: targets 9.0/25.6Å but partners are 15.0Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=24 · 3-10(G)=21 · coil(C)=6

```
EEEGGEHEHEGGGECEGHHEEHHHHHHHHHHEGCEGGHCEEGCEHHEGGEGHEEHGHEGCEEHEEGGGGGGHHC
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=8 · sheet=27
  - P18 ↔ I22  (helix)
  - S19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - V25 ↔ I29  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - Q1 ↔ L14  (sheet)
  - Q1 ↔ V16  (sheet)
  - I2 ↔ L14  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ D20  (sheet)
  - F3 ↔ K10  (sheet)
  - F3 ↔ L14  (sheet)
  - F3 ↔ V16  (sheet)
  - L14 ↔ D20  (sheet)
  - L14 ↔ K32  (sheet)
  - V16 ↔ T21  (sheet)
  - I35 ↔ Q40  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=243 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=111 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.495 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0135

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
