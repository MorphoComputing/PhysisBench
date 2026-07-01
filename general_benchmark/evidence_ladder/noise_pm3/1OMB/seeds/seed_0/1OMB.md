# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1OMB\seeds\seed_0\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 2.669 A
- tm_score_ca_ordered: 0.36104614469019247
- heavy_atom_rmsd: 3.834 A
- sidechain_heavy_atom_rmsd: 4.576 A
- **all-atom quality (honest):** heavy 3.834 A, sidechain 4.576 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 465
- bin_accuracy: 0.366

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.6689256702815203
- ga_delta_rmsd: 0.35949051499144424  ga_fitness_mode: energy
- pre_local_rmsd: 2.6688857222114923  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C15-C32 → 157 conflicts (91%); I1-G12 → 15 conflicts (9%)
- explained: 172/172 conflicts by 2 root cause(s)
- metrics: hubs=32 (frac 0.97), conflicts/hub=5.4, max_incompat=7.91Å, chain_span=0.97
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C15-C32 + I1-G12 — explain ~172/172 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C15** — severity 9.81, 14 conflict(s); suspect input ~`W10` (group: pull_in)
  - pull-in (wants closer): C30@8.4Å(now 11.3,conf 0.20), T9@7.3Å(now 11.3,conf 0.26)
  - push-out (wants farther): R19@9.1Å(now 4.3,conf 0.18), M25@21.6Å(now 17.7,conf 0.29), W10@18.1Å(now 10.1,conf 0.18), E3@16.5Å(now 9.3,conf 0.15), N29@16.7Å(now 14.1,conf 0.15)
  - T9↔W10: targets 7.3/18.1Å but partners are 2.9Å apart → too_close_together by 7.9Å
  - M25↔R22: targets 21.6/7.7Å but partners are 8.1Å apart → too_close_together by 5.8Å
  - M25↔C30: targets 21.6/8.4Å but partners are 7.9Å apart → too_close_together by 5.3Å
- **N29** — severity 8.60, 14 conflict(s); suspect input ~`W10` (group: pull_in)
  - pull-in (wants closer): T9@7.6Å(now 10.4,conf 0.24), I1@9.3Å(now 15.3,conf 0.18)
  - push-out (wants farther): G12@19.1Å(now 15.7,conf 0.20), C15@16.7Å(now 14.1,conf 0.15), D4@17.9Å(now 13.2,conf 0.18), G11@19.7Å(now 16.9,conf 0.22)
  - T9↔G11: targets 7.6/19.7Å but partners are 7.4Å apart → too_close_together by 4.7Å
  - W10↔G11: targets 9.5/19.7Å but partners are 5.0Å apart → too_close_together by 5.2Å
  - G12↔T9: targets 19.1/7.6Å but partners are 7.2Å apart → too_close_together by 4.2Å
- **E31** — severity 8.29, 12 conflict(s); suspect input ~`E3` (group: pull_in)
  - pull-in (wants closer): E3@7.0Å(now 9.8,conf 0.28), I1@7.0Å(now 10.2,conf 0.27)
  - push-out (wants farther): Y5@8.3Å(now 5.7,conf 0.21), R17@20.1Å(now 13.3,conf 0.23), G27@17.0Å(now 10.1,conf 0.16)
  - C23↔E3: targets 6.6/7.0Å but partners are 17.8Å apart → too_far_apart by 4.3Å
  - S24↔E3: targets 7.8/7.0Å but partners are 18.9Å apart → too_far_apart by 4.1Å
  - C23↔G27: targets 6.6/17.0Å but partners are 5.0Å apart → too_close_together by 5.5Å
- **I1** — severity 7.43, 10 conflict(s); suspect input ~`N29` (group: push_out)
  - pull-in (wants closer): N29@9.3Å(now 15.3,conf 0.18), R19@8.2Å(now 10.7,conf 0.21), E31@7.0Å(now 10.2,conf 0.27), G18@7.7Å(now 13.0,conf 0.23)
  - push-out (wants farther): T28@20.5Å(now 17.9,conf 0.24)
  - T28↔N29: targets 20.5/9.3Å but partners are 4.2Å apart → too_close_together by 7.0Å
  - T28↔E31: targets 20.5/7.0Å but partners are 9.2Å apart → too_close_together by 4.2Å
  - T28↔K7: targets 20.5/7.0Å but partners are 10.0Å apart → too_close_together by 3.4Å
- **M25** — severity 7.10, 9 conflict(s); suspect input ~`C8` (group: pull_in)
  - pull-in (wants closer): E3@18.5Å(now 22.1,conf 0.19), C8@9.0Å(now 14.1,conf 0.18)
  - push-out (wants farther): C15@21.6Å(now 17.7,conf 0.29), R19@18.4Å(now 15.6,conf 0.19), C32@17.9Å(now 13.6,conf 0.18), T9@17.6Å(now 13.6,conf 0.17)
  - C15↔R22: targets 21.6/7.0Å but partners are 10.1Å apart → too_close_together by 4.5Å
  - I1↔C8: targets 22.4/9.0Å but partners are 7.3Å apart → too_close_together by 6.1Å
  - C15↔C8: targets 21.6/9.0Å but partners are 8.0Å apart → too_close_together by 4.6Å
- **C32** — severity 6.87, 11 conflict(s); suspect input ~`R17` (group: push_out)
  - pull-in (wants closer): G6@5.7Å(now 9.6,conf 0.37), T13@5.6Å(now 9.5,conf 0.38)
  - push-out (wants farther): C21@9.7Å(now 5.6,conf 0.16), R17@17.2Å(now 10.0,conf 0.16), M25@17.9Å(now 13.6,conf 0.18)
  - R19↔R17: targets 5.6/17.2Å but partners are 4.9Å apart → too_close_together by 6.6Å
  - C15↔R17: targets 5.9/17.2Å but partners are 5.7Å apart → too_close_together by 5.6Å
  - G6↔P20: targets 5.7/5.6Å but partners are 13.7Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=9 · 3-10(G)=5 · coil(C)=1

```
CEHHHEHGHEHEHHGHEGEGHGHHHHHEHHEHE
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=8 · sheet=12
  - E3 ↔ K7  (helix)
  - Y5 ↔ T9  (helix)
  - K7 ↔ G11  (helix)
  - T9 ↔ T13  (helix)
  - C21 ↔ M25  (helix)
  - C23 ↔ G27  (helix)
  - M25 ↔ N29  (helix)
  - I26 ↔ C30  (helix)
  - A2 ↔ G12  (sheet)
  - A2 ↔ R17  (sheet)
  - A2 ↔ R19  (sheet)
  - G6 ↔ G12  (sheet)
  - W10 ↔ R19  (sheet)
  - W10 ↔ T28  (sheet)
  - G12 ↔ R17  (sheet)
  - G12 ↔ R19  (sheet)
  - G12 ↔ E31  (sheet)
  - R17 ↔ T33  (sheet)
  - R19 ↔ E31  (sheet)
  - R19 ↔ T33  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=100 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=37 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8283 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
