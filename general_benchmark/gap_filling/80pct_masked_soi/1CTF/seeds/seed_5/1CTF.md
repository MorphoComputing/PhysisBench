# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CTF\seeds\seed_5\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 3.147 A
- tm_score_ca_ordered: 0.6623255320177317
- heavy_atom_rmsd: 4.263 A
- sidechain_heavy_atom_rmsd: 5.168 A
- **all-atom quality (honest):** heavy 4.263 A, sidechain 5.168 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 645
- bin_accuracy: 0.657

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.1465766946666993
- ga_delta_rmsd: -0.874566205772509  ga_fitness_mode: energy
- pre_local_rmsd: 3.1620921939841415  localized_anchor_rmsd: 3.1465773120701783

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F1-K6 → 65 conflicts (77%); V15-A22 → 11 conflicts (13%)
- explained: 76/84 conflicts by 2 root cause(s)
- metrics: hubs=28 (frac 0.424), conflicts/hub=3.0, max_incompat=7.24Å, chain_span=0.97
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F1-K6 + V15-A22 — explain ~76/84 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L27** — severity 19.85, 11 conflict(s); suspect input ~`K6` (group: push_out)
  - push-out (wants farther): V3@19.7Å(now 16.3,conf 0.57), K6@19.2Å(now 12.9,conf 0.56), I4@18.9Å(now 15.1,conf 0.56)
  - K6↔A30: targets 19.2/5.3Å but partners are 8.2Å apart → too_close_together by 5.7Å
  - K31↔K6: targets 6.0/19.2Å but partners are 7.7Å apart → too_close_together by 5.5Å
  - V34↔K6: targets 11.0/19.2Å but partners are 3.8Å apart → too_close_together by 4.4Å
- **A40** — severity 17.32, 10 conflict(s); suspect input ~`A60` (group: pull_in)
  - pull-in (wants closer): I4@4.4Å(now 10.5,conf 0.61), L5@6.3Å(now 10.1,conf 0.55)
  - I4↔A60: targets 4.4/17.0Å but partners are 6.9Å apart → too_close_together by 5.7Å
  - I4↔A18: targets 4.4/14.9Å but partners are 6.2Å apart → too_close_together by 4.2Å
  - I4↔G61: targets 4.4/16.7Å but partners are 8.3Å apart → too_close_together by 4.0Å
- **K17** — severity 16.64, 5 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): D2@19.7Å(now 12.0,conf 0.57), A10@13.7Å(now 10.0,conf 0.55)
  - A22↔D2: targets 9.0/19.7Å but partners are 3.5Å apart → too_close_together by 7.2Å
  - R20↔D2: targets 5.0/19.7Å but partners are 7.7Å apart → too_close_together by 7.0Å
  - D2↔G21: targets 19.7/6.3Å but partners are 7.2Å apart → too_close_together by 6.2Å
- **K12** — severity 15.89, 8 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): G9@7.0Å(now 3.8,conf 1.00), A7@9.0Å(now 6.3,conf 0.99), F1@23.3Å(now 20.4,conf 0.76), D2@20.5Å(now 17.6,conf 0.59)
  - F1↔V15: targets 23.3/4.0Å but partners are 15.2Å apart → too_close_together by 4.1Å
  - V15↔D2: targets 4.0/20.5Å but partners are 12.4Å apart → too_close_together by 4.1Å
  - V19↔F1: targets 9.4/23.3Å but partners are 10.7Å apart → too_close_together by 3.1Å
- **V19** — severity 11.63, 5 conflict(s); suspect input ~`F1` (group: push_out)
  - push-out (wants farther): F1@17.1Å(now 10.7,conf 0.55), V3@11.4Å(now 7.1,conf 0.55), G9@14.5Å(now 11.3,conf 0.55), D2@14.4Å(now 7.7,conf 0.55)
  - A22↔F1: targets 5.0/17.1Å but partners are 5.7Å apart → too_close_together by 6.4Å
  - A22↔D2: targets 5.0/14.4Å but partners are 3.5Å apart → too_close_together by 6.0Å
  - T23↔D2: targets 7.0/14.4Å but partners are 3.9Å apart → too_close_together by 3.5Å
- **V15** — severity 7.09, 4 conflict(s); suspect input ~`D2` (group: push_out)
  - push-out (wants farther): A8@7.1Å(now 4.0,conf 0.91), G9@9.4Å(now 6.5,conf 0.79), D2@17.5Å(now 12.4,conf 0.55)
  - V19↔D2: targets 6.1/17.5Å but partners are 7.7Å apart → too_close_together by 3.8Å
  - D2↔A22: targets 17.5/10.4Å but partners are 3.5Å apart → too_close_together by 3.6Å
  - A18↔D2: targets 5.0/17.5Å but partners are 9.1Å apart → too_close_together by 3.4Å

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=17 · 3-10(G)=6 · coil(C)=5

```
CECEEHEHHHHHHHGHGHHHHHHHEEGHEHHHHHHHEHEECEEHEEHHHEHHHHHHHHHGCEGGEC
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=20 · sheet=7
  - K6 ↔ A10  (helix)
  - A8 ↔ K12  (helix)
  - G9 ↔ V13  (helix)
  - A10 ↔ A14  (helix)
  - K12 ↔ I16  (helix)
  - A14 ↔ A18  (helix)
  - I16 ↔ R20  (helix)
  - A18 ↔ A22  (helix)
  - R20 ↔ G24  (helix)
  - G24 ↔ K28  (helix)
  - K28 ↔ D32  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - G44 ↔ D48  (helix)
  - K47 ↔ E51  (helix)
  - D48 ↔ A52  (helix)
  - E51 ↔ K55  (helix)
  - A52 ↔ A56  (helix)
  - K54 ↔ E58  (helix)
  - K55 ↔ E59  (helix)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=22 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=274 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=122 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8726 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
