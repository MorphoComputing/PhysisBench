# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1OMB\seeds\seed_1\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 2.234 A
- tm_score_ca_ordered: 0.3949689219005644
- heavy_atom_rmsd: 3.471 A
- sidechain_heavy_atom_rmsd: 4.280 A
- **all-atom quality (honest):** heavy 3.471 A, sidechain 4.280 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 465
- bin_accuracy: 0.385

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.2341729330782423
- ga_delta_rmsd: -0.36341584554452133  ga_fitness_mode: energy
- pre_local_rmsd: 2.234176448143011  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C15-C32 → 153 conflicts (88%); I1-G12 → 20 conflicts (12%)
- explained: 173/174 conflicts by 2 root cause(s)
- metrics: hubs=33 (frac 1.0), conflicts/hub=5.3, max_incompat=7.37Å, chain_span=0.97
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C15-C32 + I1-G12 — explain ~173/174 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C15** — severity 10.38, 15 conflict(s); suspect input ~`W10` (group: pull_in)
  - pull-in (wants closer): R22@7.7Å(now 10.4,conf 0.23), C30@8.4Å(now 11.4,conf 0.20), T9@7.3Å(now 10.6,conf 0.26)
  - push-out (wants farther): R19@9.1Å(now 4.9,conf 0.18), M25@21.6Å(now 17.4,conf 0.29), A2@9.7Å(now 6.3,conf 0.17), W10@18.1Å(now 9.8,conf 0.18), E3@16.5Å(now 8.2,conf 0.15), N29@16.7Å(now 14.0,conf 0.15)
  - M25↔R22: targets 21.6/7.7Å but partners are 7.6Å apart → too_close_together by 6.3Å
  - T9↔W10: targets 7.3/18.1Å but partners are 3.4Å apart → too_close_together by 7.4Å
  - M25↔C30: targets 21.6/8.4Å but partners are 8.0Å apart → too_close_together by 5.2Å
- **E31** — severity 8.04, 12 conflict(s); suspect input ~`E3` (group: pull_in)
  - pull-in (wants closer): E3@7.0Å(now 10.1,conf 0.28), I1@7.0Å(now 10.2,conf 0.27)
  - push-out (wants farther): Y5@8.3Å(now 5.6,conf 0.21), G6@9.4Å(now 6.7,conf 0.17), R17@20.1Å(now 12.9,conf 0.23), G27@17.0Å(now 10.4,conf 0.16)
  - C23↔E3: targets 6.6/7.0Å but partners are 17.8Å apart → too_far_apart by 4.2Å
  - S24↔E3: targets 7.8/7.0Å but partners are 19.1Å apart → too_far_apart by 4.3Å
  - C23↔G27: targets 6.6/17.0Å but partners are 5.0Å apart → too_close_together by 5.5Å
- **N29** — severity 7.38, 12 conflict(s); suspect input ~`W10` (group: pull_in)
  - pull-in (wants closer): I1@9.3Å(now 14.6,conf 0.18)
  - push-out (wants farther): G12@19.1Å(now 14.2,conf 0.20), C15@16.7Å(now 14.0,conf 0.15), D4@17.9Å(now 13.6,conf 0.18), G11@19.7Å(now 15.1,conf 0.22)
  - T9↔G11: targets 7.6/19.7Å but partners are 7.4Å apart → too_close_together by 4.7Å
  - W10↔G11: targets 9.5/19.7Å but partners are 4.7Å apart → too_close_together by 5.5Å
  - G12↔T9: targets 19.1/7.6Å but partners are 7.1Å apart → too_close_together by 4.3Å
- **M25** — severity 7.07, 9 conflict(s); suspect input ~`C8` (group: pull_in)
  - pull-in (wants closer): E3@18.5Å(now 22.1,conf 0.19), C8@9.0Å(now 14.4,conf 0.18)
  - push-out (wants farther): C15@21.6Å(now 17.4,conf 0.29), R19@18.4Å(now 14.9,conf 0.19), C32@17.9Å(now 13.2,conf 0.18), T9@17.6Å(now 13.9,conf 0.17)
  - I1↔C8: targets 22.4/9.0Å but partners are 6.9Å apart → too_close_together by 6.5Å
  - C15↔R22: targets 21.6/7.0Å but partners are 10.4Å apart → too_close_together by 4.2Å
  - C15↔C8: targets 21.6/9.0Å but partners are 7.6Å apart → too_close_together by 5.0Å
- **I1** — severity 6.95, 9 conflict(s); suspect input ~`T28` (group: push_out)
  - pull-in (wants closer): N29@9.3Å(now 14.6,conf 0.18), R19@8.2Å(now 10.8,conf 0.21), E31@7.0Å(now 10.2,conf 0.27), G18@7.7Å(now 12.5,conf 0.23)
  - push-out (wants farther): T28@20.5Å(now 17.2,conf 0.24)
  - T28↔N29: targets 20.5/9.3Å but partners are 3.9Å apart → too_close_together by 7.3Å
  - T28↔E31: targets 20.5/7.0Å but partners are 9.5Å apart → too_close_together by 3.9Å
  - M25↔E31: targets 22.4/7.0Å but partners are 12.3Å apart → too_close_together by 3.0Å
- **C32** — severity 6.29, 10 conflict(s); suspect input ~`R17` (group: push_out)
  - pull-in (wants closer): G6@5.7Å(now 8.4,conf 0.37), T13@5.6Å(now 8.8,conf 0.38)
  - push-out (wants farther): C21@9.7Å(now 5.5,conf 0.16), R17@17.2Å(now 9.6,conf 0.16), M25@17.9Å(now 13.2,conf 0.18)
  - R19↔R17: targets 5.6/17.2Å but partners are 5.0Å apart → too_close_together by 6.5Å
  - C15↔R17: targets 5.9/17.2Å but partners are 6.1Å apart → too_close_together by 5.3Å
  - G6↔P20: targets 5.7/5.6Å but partners are 13.2Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=10 · 3-10(G)=8 · coil(C)=2

```
CEEEHHGGGEHEGHGGEGECHGHHHHHEHHEHE
```

## Backbone H-bond Network

- total=20 · helix(i→i+4)=4 · sheet=16
  - C21 ↔ M25  (helix)
  - C23 ↔ G27  (helix)
  - M25 ↔ N29  (helix)
  - I26 ↔ C30  (helix)
  - A2 ↔ G12  (sheet)
  - A2 ↔ R17  (sheet)
  - A2 ↔ R19  (sheet)
  - E3 ↔ G12  (sheet)
  - E3 ↔ R17  (sheet)
  - E3 ↔ R19  (sheet)
  - D4 ↔ R17  (sheet)
  - D4 ↔ R19  (sheet)
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

- contacts=101 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=43 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8225 (restraint satisfaction; lower=better)
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

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1OMB.ensemble.pdb`)
- RMSF mean=0.451Å max=1.57Å (per-residue in .per_residue.csv)
- most flexible residues: 4, 29, 2, 6, 28

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1OMB.pae.csv`
- mean=0.21Å · max=1.594Å · AlphaFold-PAE analog (low block = rigid unit/domain)
