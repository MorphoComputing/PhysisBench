# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1CTF/sequence/1CTF.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1CTF/seeds/seed_0/1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 8.862 A
- tm_score_ca_ordered: 0.21720369675970028
- heavy_atom_rmsd: 9.237 A
- sidechain_heavy_atom_rmsd: 9.471 A
- **all-atom quality (honest):** heavy 9.237 A, sidechain 9.471 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 403
- bin_accuracy: 0.444

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.862391280580155
- ga_delta_rmsd: -2.642412811864923  ga_fitness_mode: energy
- pre_local_rmsd: 8.898389232451082  localized_anchor_rmsd: 8.86246092121669

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** A56-A60 → 52 conflicts (52%); F1-D2 → 25 conflicts (25%)
- explained: 77/101 conflicts by 2 root cause(s)
- metrics: hubs=31 (frac 0.47), conflicts/hub=3.3, max_incompat=9.85Å, chain_span=0.939
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): A56-A60 + F1-D2 — explain ~77/101 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A40** — severity 22.87, 8 conflict(s); suspect input ~`G61` (group: push_out)
  - pull-in (wants closer): I4@4.4Å(now 12.5,conf 0.61), L5@6.3Å(now 9.5,conf 0.55), K6@8.5Å(now 13.7,conf 0.55)
  - push-out (wants farther): A60@17.0Å(now 9.3,conf 0.55), G61@16.7Å(now 9.8,conf 0.55)
  - I4↔G61: targets 4.4/16.7Å but partners are 3.1Å apart → too_close_together by 9.2Å
  - L5↔G61: targets 6.3/16.7Å but partners are 3.0Å apart → too_close_together by 7.3Å
  - L5↔A60: targets 6.3/17.0Å but partners are 3.5Å apart → too_close_together by 7.3Å
- **V45** — severity 17.12, 7 conflict(s); suspect input ~`F1` (group: pull_in)
  - pull-in (wants closer): F1@5.2Å(now 12.4,conf 0.56), L25@17.2Å(now 19.8,conf 0.55)
  - push-out (wants farther): G9@24.7Å(now 21.7,conf 0.70), V64@14.8Å(now 12.1,conf 0.55)
  - G9↔F1: targets 24.7/5.2Å but partners are 11.5Å apart → too_close_together by 8.0Å
  - A10↔F1: targets 27.4/5.2Å but partners are 15.4Å apart → too_close_together by 6.7Å
  - A14↔F1: targets 22.4/5.2Å but partners are 11.9Å apart → too_close_together by 5.3Å
- **K12** — severity 16.07, 6 conflict(s); suspect input ~`A60` (group: pull_in)
  - pull-in (wants closer): A60@8.6Å(now 11.5,conf 0.55), E58@11.9Å(now 16.4,conf 0.55)
  - push-out (wants farther): F1@23.3Å(now 12.9,conf 0.76), D2@20.5Å(now 10.2,conf 0.59), K6@12.1Å(now 9.6,conf 0.55)
  - F1↔A60: targets 23.3/8.6Å but partners are 4.8Å apart → too_close_together by 9.8Å
  - D2↔A60: targets 20.5/8.6Å but partners are 7.3Å apart → too_close_together by 4.6Å
  - F1↔E58: targets 23.3/11.9Å but partners are 7.2Å apart → too_close_together by 4.3Å
- **E59** — severity 14.15, 5 conflict(s); suspect input ~`K42` (group: pull_in)
  - pull-in (wants closer): A56@5.3Å(now 8.4,conf 0.56), A22@13.1Å(now 16.2,conf 0.55), V15@8.8Å(now 14.5,conf 0.55)
  - push-out (wants farther): F1@19.7Å(now 9.8,conf 0.57), K42@17.3Å(now 9.5,conf 0.55), A62@7.4Å(now 2.9,conf 0.55), E65@13.6Å(now 3.5,conf 0.55), A50@14.2Å(now 11.2,conf 0.55)
  - A56↔K42: targets 5.3/17.3Å but partners are 3.8Å apart → too_close_together by 8.2Å
  - F1↔A56: targets 19.7/5.3Å but partners are 8.4Å apart → too_close_together by 6.0Å
  - A56↔A50: targets 5.3/14.2Å but partners are 4.0Å apart → too_close_together by 4.9Å
- **K42** — severity 13.36, 7 conflict(s); suspect input ~`A7` (group: push_out)
  - pull-in (wants closer): V3@5.3Å(now 11.7,conf 0.56), D2@5.7Å(now 15.1,conf 0.55)
  - push-out (wants farther): E59@17.3Å(now 9.5,conf 0.55), A62@14.7Å(now 9.0,conf 0.55)
  - D2↔D49: targets 5.7/9.7Å but partners are 19.7Å apart → too_far_apart by 4.3Å
  - V3↔A62: targets 5.3/14.7Å but partners are 5.5Å apart → too_close_together by 3.9Å
  - V3↔E59: targets 5.3/17.3Å but partners are 8.2Å apart → too_close_together by 3.8Å
- **A60** — severity 12.67, 8 conflict(s); suspect input ~`A40` (group: push_out)
  - pull-in (wants closer): A14@5.3Å(now 12.0,conf 0.56), K12@8.6Å(now 11.5,conf 0.55), L27@16.2Å(now 18.8,conf 0.55), K17@8.3Å(now 12.6,conf 0.55)
  - push-out (wants farther): A40@17.0Å(now 9.3,conf 0.55), D49@16.7Å(now 13.2,conf 0.55), V3@14.8Å(now 3.9,conf 0.55), K6@13.3Å(now 7.9,conf 0.55)
  - A14↔A56: targets 5.3/6.4Å but partners are 16.6Å apart → too_far_apart by 4.8Å
  - L57↔A14: targets 5.0/5.3Å but partners are 13.7Å apart → too_far_apart by 3.3Å
  - L57↔V3: targets 5.0/14.8Å but partners are 6.7Å apart → too_close_together by 3.0Å

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=12 · 3-10(G)=12 · coil(C)=4

```
CEHHHHHHEHHEHHGHHGHHHGCEGHEHHHGHEHHGEHCEHEGHHHGEHHHGHEHHGHHHGHHEGC
```

## Backbone H-bond Network

- total=28 · helix(i→i+4)=16 · sheet=12
  - I4 ↔ A8  (helix)
  - K6 ↔ A10  (helix)
  - A10 ↔ A14  (helix)
  - I16 ↔ R20  (helix)
  - G26 ↔ A30  (helix)
  - K28 ↔ D32  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - L41 ↔ V45  (helix)
  - V45 ↔ D49  (helix)
  - S46 ↔ A50  (helix)
  - D49 ↔ L53  (helix)
  - K55 ↔ E59  (helix)
  - A56 ↔ A60  (helix)
  - E58 ↔ A62  (helix)
  - E59 ↔ E63  (helix)
  - D2 ↔ G9  (sheet)
  - D2 ↔ K12  (sheet)
  - G24 ↔ L33  (sheet)
  - L27 ↔ L33  (sheet)
  - … +8 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=304 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=121 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.3176 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
