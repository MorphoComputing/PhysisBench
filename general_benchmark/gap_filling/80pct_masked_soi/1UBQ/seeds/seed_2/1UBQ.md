# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1UBQ\seeds\seed_2\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 1.066 A
- tm_score_ca_ordered: 0.9539837769837255
- heavy_atom_rmsd: 2.789 A
- sidechain_heavy_atom_rmsd: 3.531 A
- **all-atom quality (honest):** heavy 2.789 A, sidechain 3.531 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 797
- bin_accuracy: 0.900

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.066201690160372
- ga_delta_rmsd: 5.384821604734029  ga_fitness_mode: energy
- pre_local_rmsd: 1.069420751573269  localized_anchor_rmsd: 1.066146208664421

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G74 → 15 conflicts (100%)
- explained: 15/15 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.041), conflicts/hub=5.0, max_incompat=3.99Å, chain_span=0.838
- **fix-first:** [LOW_CONFLICT] Root cause(s): G74 — explain ~15/15 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G74** — severity 16.25, 8 conflict(s); suspect input ~`L66` (group: pull_in)
  - pull-in (wants closer): K62@27.5Å(now 30.4,conf 1.00)
  - push-out (wants farther): L66@24.3Å(now 19.6,conf 0.72), I12@25.6Å(now 22.6,conf 0.70), R41@15.8Å(now 11.3,conf 0.55)
  - H67↔L66: targets 17.0/24.3Å but partners are 3.7Å apart → too_close_together by 3.6Å
  - V69↔L66: targets 11.0/24.3Å but partners are 10.1Å apart → too_close_together by 3.2Å
  - R71↔L66: targets 5.0/24.3Å but partners are 16.0Å apart → too_close_together by 3.2Å
- **L66** — severity 7.89, 4 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@24.3Å(now 19.6,conf 0.72)
  - V69↔G74: targets 10.9/24.3Å but partners are 9.7Å apart → too_close_together by 3.8Å
  - L70↔G74: targets 13.0/24.3Å but partners are 8.2Å apart → too_close_together by 3.1Å
  - G74↔R41: targets 24.3/9.9Å but partners are 11.3Å apart → too_close_together by 3.0Å
- **I12** — severity 3.80, 3 conflict(s); suspect input ~`L70` (group: push_out)
  - push-out (wants farther): G74@25.6Å(now 22.6,conf 0.70)
  - G74↔L70: targets 25.6/14.5Å but partners are 8.2Å apart → too_close_together by 2.9Å
  - T6↔G74: targets 9.0/25.6Å but partners are 14.7Å apart → too_close_together by 2.0Å
  - G74↔L7: targets 25.6/11.6Å but partners are 12.5Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=25 · 3-10(G)=18 · coil(C)=5

```
EEEGGEHHCEEGGEGGGHHEEHHHHHHHHHHCGGEGHHHEEECEHHEGEEGGEEHHHEGCEEHEEGGEGGHHHC
```

## Backbone H-bond Network

- total=46 · helix(i→i+4)=8 · sheet=38
  - P18 ↔ I22  (helix)
  - S19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - V25 ↔ I29  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - Q1 ↔ L14  (sheet)
  - Q1 ↔ D20  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ L14  (sheet)
  - I2 ↔ D20  (sheet)
  - F3 ↔ K10  (sheet)
  - F3 ↔ T11  (sheet)
  - F3 ↔ L14  (sheet)
  - T6 ↔ T11  (sheet)
  - L14 ↔ D20  (sheet)
  - I35 ↔ Q40  (sheet)
  - I35 ↔ R41  (sheet)
  - … +26 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=243 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=112 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5374 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
