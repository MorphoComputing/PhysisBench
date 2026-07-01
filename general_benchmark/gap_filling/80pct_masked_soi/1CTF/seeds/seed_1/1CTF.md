# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CTF\seeds\seed_1\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 9.178 A
- tm_score_ca_ordered: 0.18166323912667315
- heavy_atom_rmsd: 9.959 A
- sidechain_heavy_atom_rmsd: 10.755 A
- **all-atom quality (honest):** heavy 9.959 A, sidechain 10.755 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 642
- bin_accuracy: 0.497

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.178172813226986
- ga_delta_rmsd: -2.1339272662334823  ga_fitness_mode: energy
- pre_local_rmsd: 9.185853366797405  localized_anchor_rmsd: 9.178207883158858

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F1-I4 → 188 conflicts (77%); A8 → 14 conflicts (6%)
- explained: 202/244 conflicts by 2 root cause(s)
- metrics: hubs=40 (frac 0.606), conflicts/hub=6.1, max_incompat=9.88Å, chain_span=0.985
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F1-I4 + A8 — explain ~202/244 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K12** — severity 53.84, 17 conflict(s); suspect input ~`F1` (group: push_out)
  - push-out (wants farther): A7@9.0Å(now 6.4,conf 0.99), F1@23.3Å(now 14.2,conf 0.76), D2@20.5Å(now 10.5,conf 0.59), K6@12.1Å(now 9.5,conf 0.55)
  - V15↔F1: targets 5.0/23.3Å but partners are 8.4Å apart → too_close_together by 9.9Å
  - L5↔F1: targets 11.0/23.3Å but partners are 6.0Å apart → too_close_together by 6.3Å
  - F1↔I16: targets 23.3/5.9Å but partners are 9.8Å apart → too_close_together by 7.6Å
- **F1** — severity 48.23, 20 conflict(s); suspect input ~`G44` (group: pull_in)
  - pull-in (wants closer): G44@5.2Å(now 13.7,conf 0.56), V45@5.2Å(now 12.4,conf 0.56), E43@6.1Å(now 11.0,conf 0.55), D49@8.8Å(now 12.3,conf 0.55)
  - push-out (wants farther): A8@21.0Å(now 14.9,conf 1.00), L5@13.0Å(now 6.0,conf 0.99), A7@19.0Å(now 11.4,conf 0.99), K6@15.1Å(now 10.0,conf 0.91), K12@23.3Å(now 14.2,conf 0.76), E59@19.7Å(now 11.5,conf 0.57), A37@18.2Å(now 8.5,conf 0.55), A62@18.1Å(now 8.8,conf 0.55), V19@17.1Å(now 10.0,conf 0.55), E58@16.9Å(now 10.2,conf 0.55), L53@11.2Å(now 8.6,conf 0.55)
  - V66↔G44: targets 7.0/5.2Å but partners are 19.7Å apart → too_far_apart by 7.5Å
  - I4↔G44: targets 10.6/5.2Å but partners are 22.8Å apart → too_far_apart by 7.0Å
  - V66↔A62: targets 7.0/18.1Å but partners are 4.8Å apart → too_close_together by 6.2Å
- **K42** — severity 45.82, 23 conflict(s); suspect input ~`D2` (group: push_out)
  - pull-in (wants closer): V3@5.3Å(now 12.2,conf 0.56), D2@5.7Å(now 15.4,conf 0.55), A7@15.0Å(now 17.9,conf 0.55), L5@9.3Å(now 12.7,conf 0.55)
  - push-out (wants farther): A37@14.6Å(now 12.0,conf 0.79)
  - V45↔D2: targets 7.0/5.7Å but partners are 21.2Å apart → too_far_apart by 8.6Å
  - S46↔D2: targets 10.9/5.7Å but partners are 24.6Å apart → too_far_apart by 8.1Å
  - K47↔D2: targets 12.0/5.7Å but partners are 23.4Å apart → too_far_apart by 5.7Å
- **A40** — severity 44.50, 20 conflict(s); suspect input ~`I4` (group: push_out)
  - pull-in (wants closer): I4@4.4Å(now 12.9,conf 0.61), L5@6.3Å(now 10.2,conf 0.55), K6@8.5Å(now 13.7,conf 0.55)
  - push-out (wants farther): I16@14.3Å(now 10.2,conf 0.55)
  - E43↔I4: targets 7.4/4.4Å but partners are 20.0Å apart → too_far_apart by 8.1Å
  - G44↔I4: targets 11.1/4.4Å but partners are 22.8Å apart → too_far_apart by 7.3Å
  - V45↔I4: targets 11.4/4.4Å but partners are 21.3Å apart → too_far_apart by 5.4Å
- **A8** — severity 42.81, 14 conflict(s); suspect input ~`L5` (group: pull_in)
  - pull-in (wants closer): E63@6.2Å(now 10.4,conf 0.55), E51@17.7Å(now 22.1,conf 0.55), K31@10.9Å(now 14.9,conf 0.55), P38@9.2Å(now 13.5,conf 0.55)
  - push-out (wants farther): F1@21.0Å(now 14.9,conf 1.00), V3@15.0Å(now 10.0,conf 0.99), I4@11.0Å(now 7.4,conf 0.99), D2@17.4Å(now 8.4,conf 0.79)
  - F1↔L5: targets 21.0/7.1Å but partners are 6.0Å apart → too_close_together by 7.9Å
  - V3↔L5: targets 15.0/7.1Å but partners are 1.6Å apart → too_close_together by 6.2Å
  - F1↔V15: targets 21.0/7.2Å but partners are 8.4Å apart → too_close_together by 5.4Å
- **G9** — severity 38.68, 15 conflict(s); suspect input ~`K6` (group: pull_in)
  - pull-in (wants closer): K31@12.6Å(now 15.8,conf 0.55)
  - push-out (wants farther): D2@21.0Å(now 8.7,conf 0.99), V3@17.0Å(now 9.1,conf 0.99), I4@14.9Å(now 6.9,conf 0.91), A14@9.4Å(now 6.0,conf 0.79), K6@10.0Å(now 6.3,conf 0.72), L5@10.9Å(now 7.9,conf 0.55), E58@12.1Å(now 9.2,conf 0.55)
  - D2↔K6: targets 21.0/10.0Å but partners are 3.0Å apart → too_close_together by 8.0Å
  - D2↔E63: targets 21.0/8.5Å but partners are 6.1Å apart → too_close_together by 6.4Å
  - D2↔V15: targets 21.0/8.8Å but partners are 8.4Å apart → too_close_together by 3.8Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=17 · 3-10(G)=12 · coil(C)=6

```
CEHHHHGHHHHEHECGEHHHGHEECCEHHHHHHHHHCEEEHEEGGEEGHHHGHEGEHHGHGGEGHC
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=10 · sheet=23
  - I4 ↔ A8  (helix)
  - L5 ↔ G9  (helix)
  - K6 ↔ A10  (helix)
  - G9 ↔ V13  (helix)
  - A18 ↔ A22  (helix)
  - K28 ↔ D32  (helix)
  - A30 ↔ V34  (helix)
  - D32 ↔ S36  (helix)
  - D49 ↔ L53  (helix)
  - L53 ↔ L57  (helix)
  - D2 ↔ K12  (sheet)
  - D2 ↔ A14  (sheet)
  - K12 ↔ K17  (sheet)
  - K17 ↔ T23  (sheet)
  - K17 ↔ G24  (sheet)
  - K17 ↔ L27  (sheet)
  - T23 ↔ A40  (sheet)
  - T23 ↔ K42  (sheet)
  - T23 ↔ E43  (sheet)
  - G24 ↔ K42  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=30 · exposed=16 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=300 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=128 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.4549 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
