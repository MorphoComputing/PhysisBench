# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1UBQ\sequence\1UBQ.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1UBQ\seeds\seed_9\1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 1.596 A
- tm_score_ca_ordered: 0.8924273771896812
- heavy_atom_rmsd: 2.992 A
- sidechain_heavy_atom_rmsd: 3.638 A
- **all-atom quality (honest):** heavy 2.992 A, sidechain 3.638 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 797
- bin_accuracy: 0.819

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.5960023761519562
- ga_delta_rmsd: 3.0322128110801234  ga_fitness_mode: energy
- pre_local_rmsd: 1.622169702343631  localized_anchor_rmsd: 1.5960749643658385

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** G74 → 15 conflicts (94%)
- explained: 15/16 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.054), conflicts/hub=4.0, max_incompat=4.36Å, chain_span=0.838
- **fix-first:** [LOW_CONFLICT] Root cause(s): G74 — explain ~15/16 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G74** — severity 17.33, 8 conflict(s); suspect input ~`L66` (group: push_out)
  - push-out (wants farther): L66@24.3Å(now 19.1,conf 0.72), I12@25.6Å(now 22.6,conf 0.70), R41@15.8Å(now 11.3,conf 0.55)
  - L68↔L66: targets 13.4/24.3Å but partners are 6.5Å apart → too_close_together by 4.4Å
  - V69↔L66: targets 10.9/24.3Å but partners are 9.9Å apart → too_close_together by 3.5Å
  - H67↔L66: targets 17.0/24.3Å but partners are 3.9Å apart → too_close_together by 3.4Å
- **L66** — severity 8.18, 4 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@24.3Å(now 19.1,conf 0.72)
  - V69↔G74: targets 10.6/24.3Å but partners are 9.5Å apart → too_close_together by 4.3Å
  - L70↔G74: targets 13.0/24.3Å but partners are 8.2Å apart → too_close_together by 3.1Å
  - G74↔R41: targets 24.3/9.9Å but partners are 11.3Å apart → too_close_together by 3.0Å
- **I12** — severity 4.09, 3 conflict(s); suspect input ~`G74` (group: push_out)
  - push-out (wants farther): G74@25.6Å(now 22.6,conf 0.70)
  - T6↔G74: targets 9.0/25.6Å but partners are 14.4Å apart → too_close_together by 2.3Å
  - G74↔L70: targets 25.6/14.5Å but partners are 8.2Å apart → too_close_together by 2.9Å
  - G74↔L7: targets 25.6/11.6Å but partners are 12.3Å apart → too_close_together by 1.7Å
- **D31** — severity 1.39, 1 conflict(s); suspect input ~`N24` (group: push_out)
  - push-out (wants farther): N24@10.6Å(now 7.5,conf 0.79)
  - K28↔N24: targets 5.0/10.6Å but partners are 3.8Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=25 · 3-10(G)=16 · coil(C)=7

```
EEEGGGHGCEEEEEGECHGGHEHHHHHHHHHECCEGHHHEECCEGHEGGEGHEEHHHEHHEEHEEGEGGGHHHC
```

## Backbone H-bond Network

- total=52 · helix(i→i+4)=9 · sheet=43
  - T21 ↔ V25  (helix)
  - E23 ↔ A27  (helix)
  - N24 ↔ K28  (helix)
  - V25 ↔ I29  (helix)
  - K26 ↔ Q30  (helix)
  - A27 ↔ D31  (helix)
  - G52 ↔ S56  (helix)
  - L55 ↔ N59  (helix)
  - N59 ↔ E63  (helix)
  - Q1 ↔ I12  (sheet)
  - Q1 ↔ T13  (sheet)
  - Q1 ↔ L14  (sheet)
  - Q1 ↔ V16  (sheet)
  - I2 ↔ T11  (sheet)
  - I2 ↔ I12  (sheet)
  - I2 ↔ T13  (sheet)
  - I2 ↔ L14  (sheet)
  - I2 ↔ V16  (sheet)
  - I2 ↔ I22  (sheet)
  - F3 ↔ K10  (sheet)
  - … +32 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=247 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=108 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8869 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
