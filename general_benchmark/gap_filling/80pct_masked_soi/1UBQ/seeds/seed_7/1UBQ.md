# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1UBQ\seeds\seed_7\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 1.442 A
- tm_score_ca_ordered: 0.8801151618368908
- heavy_atom_rmsd: 2.925 A
- sidechain_heavy_atom_rmsd: 3.645 A
- **all-atom quality (honest):** heavy 2.925 A, sidechain 3.645 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 798
- bin_accuracy: 0.808

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.4422592581483855
- ga_delta_rmsd: 5.59918178599188  ga_fitness_mode: energy
- pre_local_rmsd: 1.454853536781508  localized_anchor_rmsd: 1.4422302108143497

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G74 → 15 conflicts (94%)
- explained: 15/16 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.054), conflicts/hub=4.0, max_incompat=3.91Å, chain_span=0.838
- **fix-first:** [LOW_CONFLICT] Root cause(s): G74 — explain ~15/16 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G74** — severity 17.17, 9 conflict(s); suspect input ~`L66` (group: push_out)
  - pull-in (wants closer): K62@27.5Å(now 30.7,conf 1.00), P18@27.5Å(now 30.2,conf 1.00)
  - push-out (wants farther): L66@24.3Å(now 20.1,conf 0.72), I12@25.6Å(now 22.5,conf 0.70), R41@15.8Å(now 11.9,conf 0.55)
  - H67↔L66: targets 17.1/24.3Å but partners are 3.3Å apart → too_close_together by 3.9Å
  - V69↔L66: targets 11.0/24.3Å but partners are 10.0Å apart → too_close_together by 3.3Å
  - L70↔I12: targets 8.6/25.6Å but partners are 14.1Å apart → too_close_together by 3.0Å
- **L66** — severity 5.89, 3 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@24.3Å(now 20.1,conf 0.72)
  - V69↔G74: targets 10.0/24.3Å but partners are 10.4Å apart → too_close_together by 3.9Å
  - L70↔G74: targets 13.0/24.3Å but partners are 8.8Å apart → too_close_together by 2.5Å
  - G74↔R41: targets 24.3/9.9Å but partners are 11.9Å apart → too_close_together by 2.4Å
- **I12** — severity 3.50, 3 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@25.6Å(now 22.5,conf 0.70)
  - T6↔G74: targets 9.0/25.6Å but partners are 14.8Å apart → too_close_together by 1.9Å
  - G74↔L70: targets 25.6/14.5Å but partners are 8.8Å apart → too_close_together by 2.3Å
  - G74↔L7: targets 25.6/11.6Å but partners are 12.3Å apart → too_close_together by 1.7Å
- **Y58** — severity 1.05, 1 conflict(s); suspect input ~`Q1` (group: push_out)
  - push-out (wants farther): Q1@15.7Å(now 11.1,conf 0.55)
  - Q61↔Q1: targets 9.0/15.7Å but partners are 4.8Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=27 · 3-10(G)=21 · coil(C)=9

```
CEGGGEGGCEEGCEGGGHHEEGHHHHHGHGHEGGEGGHHEEECEHCECEEGGEEHHHEGCCEHEEEGEGCEHEE
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=4 · sheet=33
  - S19 ↔ E23  (helix)
  - E23 ↔ A27  (helix)
  - V25 ↔ I29  (helix)
  - A27 ↔ D31  (helix)
  - I2 ↔ T11  (sheet)
  - I2 ↔ L14  (sheet)
  - I2 ↔ D20  (sheet)
  - T6 ↔ T11  (sheet)
  - L14 ↔ D20  (sheet)
  - L14 ↔ K32  (sheet)
  - I35 ↔ Q40  (sheet)
  - I35 ↔ R41  (sheet)
  - I35 ↔ L42  (sheet)
  - Q40 ↔ L49  (sheet)
  - Q40 ↔ E50  (sheet)
  - R41 ↔ K47  (sheet)
  - R41 ↔ L49  (sheet)
  - R41 ↔ E50  (sheet)
  - L42 ↔ K47  (sheet)
  - L42 ↔ L49  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=35 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=268 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=135 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5825 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
