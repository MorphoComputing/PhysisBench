# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1UBQ/sequence/1UBQ.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1UBQ/seeds/seed_1/1UBQ.pdb`
- residues: 74
- mode: oracle
- ca_rmsd: 4.465 A
- tm_score_ca_ordered: 0.5045715135548651
- heavy_atom_rmsd: 5.101 A
- sidechain_heavy_atom_rmsd: 5.750 A
- **all-atom quality (honest):** heavy 5.101 A, sidechain 5.750 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/67 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 511
- bin_accuracy: 0.489

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=9 rmsd=9.838103187095035 -> 9.11510819259137 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=567 mode=rotamer
- phase_b_ca_rmsd_after: 4.465232303827476
- ga_delta_rmsd: 3.7342878074705874  ga_fitness_mode: energy
- pre_local_rmsd: 4.526895566428162  localized_anchor_rmsd: 4.465304683465659

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E15-Q39 → 75 conflicts (89%); L7-T11 → 7 conflicts (8%)
- explained: 82/84 conflicts by 2 root cause(s)
- metrics: hubs=33 (frac 0.446), conflicts/hub=2.5, max_incompat=7.63Å, chain_span=0.905
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E15-Q39 + L7-T11 — explain ~82/84 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D57** — severity 11.64, 6 conflict(s); suspect input ~`S19` (group: push_out)
  - pull-in (wants closer): A27@18.4Å(now 21.1,conf 0.55), S19@8.6Å(now 14.1,conf 0.55), V25@13.7Å(now 16.2,conf 0.55), K26@16.0Å(now 19.2,conf 0.55)
  - push-out (wants farther): T11@22.8Å(now 19.8,conf 0.71)
  - T11↔S19: targets 22.8/8.6Å but partners are 9.1Å apart → too_close_together by 5.0Å
  - E15↔S19: targets 17.4/8.6Å but partners are 4.9Å apart → too_close_together by 3.8Å
  - I35↔K26: targets 23.5/16.0Å but partners are 3.8Å apart → too_close_together by 3.7Å
- **G52** — severity 11.42, 4 conflict(s); suspect input ~`N24` (group: push_out)
  - pull-in (wants closer): E23@6.5Å(now 10.0,conf 0.55), N24@9.1Å(now 15.9,conf 0.55)
  - push-out (wants farther): E17@14.7Å(now 7.9,conf 0.55)
  - E33↔N24: targets 21.5/9.1Å but partners are 4.7Å apart → too_close_together by 7.6Å
  - E23↔Q30: targets 6.5/17.1Å but partners are 5.7Å apart → too_close_together by 4.9Å
  - Q30↔N24: targets 17.1/9.1Å but partners are 3.6Å apart → too_close_together by 4.4Å
- **E17** — severity 8.53, 4 conflict(s); suspect input ~`T21` (group: push_out)
  - push-out (wants farther): Q39@22.4Å(now 15.7,conf 0.67), G34@20.8Å(now 17.7,conf 0.59), T6@20.6Å(now 17.8,conf 0.59), P37@18.7Å(now 14.1,conf 0.56), H67@17.8Å(now 15.2,conf 0.55), T13@13.1Å(now 10.6,conf 0.55), G52@14.7Å(now 7.9,conf 0.55), I29@14.3Å(now 11.7,conf 0.55)
  - Q39↔T21: targets 22.4/9.0Å but partners are 6.1Å apart → too_close_together by 7.4Å
  - P37↔T21: targets 18.7/9.0Å but partners are 5.1Å apart → too_close_together by 4.6Å
  - G34↔T21: targets 20.8/9.0Å but partners are 9.8Å apart → too_close_together by 2.0Å
- **T54** — severity 7.71, 5 conflict(s); suspect input ~`D20` (group: pull_in)
  - pull-in (wants closer): D20@5.3Å(now 9.8,conf 0.56)
  - push-out (wants farther): T11@21.1Å(now 17.1,conf 0.60)
  - T11↔L14: targets 21.1/15.0Å but partners are 2.1Å apart → too_close_together by 4.0Å
  - T11↔P18: targets 21.1/6.5Å but partners are 11.4Å apart → too_close_together by 3.1Å
  - D20↔D31: targets 5.3/18.8Å but partners are 10.9Å apart → too_close_together by 2.7Å
- **R73** — severity 7.70, 5 conflict(s); suspect input ~`V25` (group: push_out)
  - push-out (wants farther): V16@27.4Å(now 22.6,conf 0.97)
  - V16↔V25: targets 27.4/20.5Å but partners are 3.2Å apart → too_close_together by 3.7Å
  - V16↔D38: targets 27.4/8.9Å but partners are 15.5Å apart → too_close_together by 3.0Å
  - V16↔K32: targets 27.4/20.9Å but partners are 3.9Å apart → too_close_together by 2.7Å
- **D20** — severity 7.50, 2 conflict(s); suspect input ~`V25` (group: push_out)
  - pull-in (wants closer): T54@5.3Å(now 9.8,conf 0.56), L55@6.1Å(now 10.9,conf 0.55), E63@15.3Å(now 19.1,conf 0.55)
  - push-out (wants farther): L7@23.3Å(now 16.3,conf 0.76), G9@25.0Å(now 16.5,conf 0.69)
  - G9↔V25: targets 25.0/7.0Å but partners are 10.6Å apart → too_close_together by 7.4Å
  - L7↔V25: targets 23.3/7.0Å but partners are 10.0Å apart → too_close_together by 6.3Å

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=22 · 3-10(G)=12 · coil(C)=2

```
EHHGEHEGHEHHGHHEHHEEHHEHHHHHHEHGGEEHEHHEHHHHGHHEEEEHHHHGHEGECEGHEHGGEHHGHC
```

## Backbone H-bond Network

- total=59 · helix(i→i+4)=15 · sheet=44
  - I2 ↔ T6  (helix)
  - T11 ↔ E15  (helix)
  - L14 ↔ P18  (helix)
  - P18 ↔ I22  (helix)
  - T21 ↔ V25  (helix)
  - I22 ↔ K26  (helix)
  - N24 ↔ K28  (helix)
  - V25 ↔ I29  (helix)
  - A27 ↔ D31  (helix)
  - D38 ↔ L42  (helix)
  - Q39 ↔ I43  (helix)
  - L42 ↔ G46  (helix)
  - I43 ↔ K47  (helix)
  - R53 ↔ D57  (helix)
  - L66 ↔ L70  (helix)
  - Q1 ↔ K10  (sheet)
  - Q1 ↔ V16  (sheet)
  - Q1 ↔ S19  (sheet)
  - K5 ↔ K10  (sheet)
  - K5 ↔ V16  (sheet)
  - … +39 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=48 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=361 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=209 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0084 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 67 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
