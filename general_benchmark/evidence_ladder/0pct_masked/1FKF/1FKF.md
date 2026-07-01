# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1FKF/sequence/1FKF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/0pct_masked/1FKF/seeds/seed_0/1FKF.pdb`
- residues: 105
- mode: oracle
- ca_rmsd: 1.646 A
- tm_score_ca_ordered: 0.9030674978801819
- heavy_atom_rmsd: 3.085 A
- sidechain_heavy_atom_rmsd: 3.792 A
- **all-atom quality (honest):** heavy 3.085 A, sidechain 3.792 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/88 (0.0)
- lj_severe: 0
- lj_near: 9
- distogram_pairs: 3441
- bin_accuracy: 0.859

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.6457132148639313
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.678054555867961  localized_anchor_rmsd: 1.6456956136520484

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D10-R12 → 69 conflicts (92%)
- explained: 69/75 conflicts by 1 root cause(s)
- metrics: hubs=18 (frac 0.171), conflicts/hub=4.2, max_incompat=3.93Å, chain_span=0.819
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D10-R12 — explain ~69/75 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V23** — severity 17.58, 13 conflict(s); suspect input ~`D10` (group: push_out)
  - push-out (wants farther): R12@17.2Å(now 13.9,conf 0.55), G11@16.8Å(now 13.5,conf 0.55), D10@15.2Å(now 10.7,conf 0.55)
  - L103↔D10: targets 5.5/15.2Å but partners are 5.8Å apart → too_close_together by 3.9Å
  - L102↔D10: targets 4.8/15.2Å but partners are 7.0Å apart → too_close_together by 3.4Å
  - G11↔V67: targets 16.8/9.8Å but partners are 3.7Å apart → too_close_together by 3.3Å
- **V22** — severity 16.87, 12 conflict(s); suspect input ~`D10` (group: push_out)
  - push-out (wants farther): G11@17.0Å(now 13.5,conf 0.55), R12@16.7Å(now 12.7,conf 0.55), D10@15.4Å(now 10.7,conf 0.55)
  - L103↔D10: targets 5.7/15.4Å but partners are 5.8Å apart → too_close_together by 3.9Å
  - G11↔V67: targets 17.0/9.7Å but partners are 3.7Å apart → too_close_together by 3.7Å
  - K104↔D10: targets 5.4/15.4Å but partners are 6.4Å apart → too_close_together by 3.6Å
- **H24** — severity 12.68, 9 conflict(s); suspect input ~`L103` (group: push_out)
  - push-out (wants farther): R12@19.8Å(now 16.6,conf 0.57), D10@17.0Å(now 12.5,conf 0.55)
  - D10↔L103: targets 17.0/7.4Å but partners are 5.8Å apart → too_close_together by 3.8Å
  - L102↔D10: targets 7.0/17.0Å but partners are 7.0Å apart → too_close_together by 3.1Å
  - D10↔G68: targets 17.0/10.9Å but partners are 3.0Å apart → too_close_together by 3.1Å
- **L103** — severity 7.31, 5 conflict(s); suspect input ~`G11` (group: push_out)
  - push-out (wants farther): D10@11.0Å(now 5.8,conf 0.55), G11@13.5Å(now 9.4,conf 0.55), R12@13.8Å(now 9.7,conf 0.55)
  - V67↔G11: targets 6.1/13.5Å but partners are 3.7Å apart → too_close_together by 3.7Å
  - G68↔G11: targets 5.4/13.5Å but partners are 5.2Å apart → too_close_together by 2.9Å
  - G68↔D10: targets 5.4/11.0Å but partners are 3.0Å apart → too_close_together by 2.6Å
- **G85** — severity 7.07, 5 conflict(s); suspect input ~`P92` (group: push_out)
  - pull-in (wants closer): R12@27.5Å(now 32.7,conf 1.00), D10@27.5Å(now 30.7,conf 1.00), G11@27.5Å(now 31.9,conf 1.00), T13@27.5Å(now 31.2,conf 1.00), G9@27.5Å(now 30.1,conf 1.00), P8@27.5Å(now 30.3,conf 1.00)
  - push-out (wants farther): Q52@17.5Å(now 14.9,conf 0.55), E53@17.2Å(now 14.4,conf 0.55)
  - R12↔P92: targets 27.5/4.6Å but partners are 35.6Å apart → too_far_apart by 3.6Å
  - G11↔P92: targets 27.5/4.6Å but partners are 34.6Å apart → too_far_apart by 2.5Å
  - R12↔P91: targets 27.5/4.9Å but partners are 34.9Å apart → too_far_apart by 2.5Å
- **A83** — severity 5.73, 4 conflict(s); suspect input ~`P92` (group: push_out)
  - pull-in (wants closer): R12@27.5Å(now 33.9,conf 1.00), D10@27.5Å(now 32.6,conf 1.00), G11@27.5Å(now 33.1,conf 1.00), T13@27.5Å(now 31.8,conf 1.00), G9@27.5Å(now 31.7,conf 1.00), P8@27.5Å(now 32.0,conf 1.00), G68@27.5Å(now 31.1,conf 1.00), V67@27.5Å(now 30.1,conf 1.00)
  - push-out (wants farther): V54@17.5Å(now 13.2,conf 0.55), R56@15.1Å(now 12.0,conf 0.55), I55@14.2Å(now 10.7,conf 0.55)
  - R12↔P92: targets 27.5/4.7Å but partners are 35.6Å apart → too_far_apart by 3.5Å
  - G11↔P92: targets 27.5/4.7Å but partners are 34.6Å apart → too_far_apart by 2.4Å
  - R12↔H93: targets 27.5/4.9Å but partners are 34.6Å apart → too_far_apart by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=38 · 3-10(G)=26 · coil(C)=10

```
CEGGGHEEEHHHEEEECHECGCECEGEEGGHHEGHEEHHHGHEEGEEEGHEHHEEHHHHGHHHHEEGHEGECGGGEHHHEGHEGHEHCEEECGECEGGGGGGHEC
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=11 · sheet=50
  - I6 ↔ D10  (helix)
  - D31 ↔ F35  (helix)
  - F35 ↔ R39  (helix)
  - S38 ↔ N42  (helix)
  - Q52 ↔ R56  (helix)
  - E53 ↔ G57  (helix)
  - G57 ↔ G61  (helix)
  - W58 ↔ V62  (helix)
  - E59 ↔ A63  (helix)
  - Q64 ↔ G68  (helix)
  - D78 ↔ G82  (helix)
  - P8 ↔ T13  (sheet)
  - P8 ↔ F14  (sheet)
  - G9 ↔ F14  (sheet)
  - G9 ↔ P15  (sheet)
  - G9 ↔ V23  (sheet)
  - T13 ↔ Q19  (sheet)
  - F14 ↔ Q19  (sheet)
  - P15 ↔ V23  (sheet)
  - V23 ↔ S37  (sheet)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=53 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=440 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=260 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6776 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=9 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 88 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1FKF.ensemble.pdb`)
- RMSF mean=0.418Å max=3.947Å (per-residue in .per_residue.csv)
- most flexible residues: 12, 11, 10, 92, 84

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1FKF.pae.csv`
- mean=0.196Å · max=2.813Å · AlphaFold-PAE analog (low block = rigid unit/domain)
