# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CTF\seeds\seed_7\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 4.263 A
- tm_score_ca_ordered: 0.468764057380462
- heavy_atom_rmsd: 5.330 A
- sidechain_heavy_atom_rmsd: 6.522 A
- **all-atom quality (honest):** heavy 5.330 A, sidechain 6.522 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 645
- bin_accuracy: 0.481

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.262841659330982
- ga_delta_rmsd: 1.772129416016175  ga_fitness_mode: energy
- pre_local_rmsd: 4.3771690630678215  localized_anchor_rmsd: 4.2628431461847605

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F1-D2 → 98 conflicts (42%); V15 → 19 conflicts (8%); A37 → 17 conflicts (7%)
- explained: 134/236 conflicts by 3 root cause(s)
- metrics: hubs=44 (frac 0.667), conflicts/hub=5.4, max_incompat=8.59Å, chain_span=0.985
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F1-D2 + V15 + A37 — explain ~134/236 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K12** — severity 48.95, 16 conflict(s); suspect input ~`F1` (group: push_out)
  - push-out (wants farther): F1@23.3Å(now 14.1,conf 0.76), D2@20.5Å(now 11.9,conf 0.59)
  - V15↔F1: targets 5.0/23.3Å but partners are 9.7Å apart → too_close_together by 8.6Å
  - F1↔V19: targets 23.3/10.0Å but partners are 5.2Å apart → too_close_together by 8.0Å
  - V15↔D2: targets 5.0/20.5Å but partners are 7.8Å apart → too_close_together by 7.7Å
- **V15** — severity 38.16, 22 conflict(s); suspect input ~`V34` (group: push_out)
  - pull-in (wants closer): G61@6.4Å(now 10.4,conf 0.55), V34@7.5Å(now 11.2,conf 0.55), E59@8.8Å(now 14.2,conf 0.55)
  - push-out (wants farther): D2@17.5Å(now 7.8,conf 0.55)
  - D2↔V34: targets 17.5/7.5Å but partners are 3.5Å apart → too_close_together by 6.5Å
  - V19↔D2: targets 6.1/17.5Å but partners are 6.2Å apart → too_close_together by 5.3Å
  - G61↔V34: targets 6.4/7.5Å but partners are 17.8Å apart → too_far_apart by 3.9Å
- **V45** — severity 25.68, 12 conflict(s); suspect input ~`F1` (group: push_out)
  - pull-in (wants closer): F1@5.2Å(now 10.8,conf 0.56), V64@14.8Å(now 17.8,conf 0.55)
  - push-out (wants farther): E35@22.6Å(now 19.7,conf 0.69)
  - K31↔F1: targets 22.0/5.2Å but partners are 9.7Å apart → too_close_together by 7.1Å
  - E35↔F1: targets 22.6/5.2Å but partners are 11.3Å apart → too_close_together by 6.1Å
  - K17↔F1: targets 20.2/5.2Å but partners are 10.1Å apart → too_close_together by 4.8Å
- **A8** — severity 20.73, 10 conflict(s); suspect input ~`F1` (group: pull_in)
  - pull-in (wants closer): E63@6.2Å(now 11.5,conf 0.55), K31@10.9Å(now 14.0,conf 0.55), P38@9.2Å(now 15.8,conf 0.55)
  - push-out (wants farther): F1@21.0Å(now 15.8,conf 1.00), D2@17.0Å(now 13.5,conf 0.99), N11@5.1Å(now 2.5,conf 0.91)
  - F1↔V15: targets 21.0/7.0Å but partners are 9.7Å apart → too_close_together by 4.3Å
  - F1↔L5: targets 21.0/7.4Å but partners are 10.3Å apart → too_close_together by 3.3Å
  - F1↔I4: targets 21.0/11.0Å but partners are 7.4Å apart → too_close_together by 2.6Å
- **G44** — severity 18.74, 8 conflict(s); suspect input ~`A37` (group: push_out)
  - pull-in (wants closer): E63@19.6Å(now 22.7,conf 0.57), F1@5.2Å(now 11.8,conf 0.56), E65@13.9Å(now 17.6,conf 0.55)
  - push-out (wants farther): A37@19.0Å(now 14.8,conf 0.99)
  - A40↔A37: targets 11.0/19.0Å but partners are 3.8Å apart → too_close_together by 4.2Å
  - F1↔V19: targets 5.2/16.7Å but partners are 5.2Å apart → too_close_together by 6.2Å
  - A37↔F1: targets 19.0/5.2Å but partners are 8.3Å apart → too_close_together by 5.5Å
- **K17** — severity 18.22, 10 conflict(s); suspect input ~`D2` (group: push_out)
  - pull-in (wants closer): E63@15.1Å(now 17.9,conf 0.55), A56@10.6Å(now 14.1,conf 0.55), A62@11.6Å(now 17.9,conf 0.55), A60@8.3Å(now 13.9,conf 0.55)
  - push-out (wants farther): D2@19.7Å(now 9.4,conf 0.57)
  - R20↔D2: targets 5.1/19.7Å but partners are 7.6Å apart → too_close_together by 7.0Å
  - D2↔G21: targets 19.7/6.3Å but partners are 9.6Å apart → too_close_together by 3.8Å
  - A14↔D2: targets 5.0/19.7Å but partners are 11.2Å apart → too_close_together by 3.5Å

## Secondary Structure (DSSP-like)

- helix(H)=38 · strand(E)=21 · 3-10(G)=3 · coil(C)=4

```
CEEHHHEHHHHEHHHHEHHHHHEHEHHEGHHEGHHEHHGEHEEHEEHEHEHHEHHHHEHHCEECHC
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=19 · sheet=39
  - I4 ↔ A8  (helix)
  - L5 ↔ G9  (helix)
  - K6 ↔ A10  (helix)
  - G9 ↔ V13  (helix)
  - A10 ↔ A14  (helix)
  - N11 ↔ V15  (helix)
  - A14 ↔ A18  (helix)
  - I16 ↔ R20  (helix)
  - A18 ↔ A22  (helix)
  - R20 ↔ G24  (helix)
  - A22 ↔ G26  (helix)
  - G26 ↔ A30  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - K47 ↔ E51  (helix)
  - E51 ↔ K55  (helix)
  - A52 ↔ A56  (helix)
  - K55 ↔ E59  (helix)
  - A56 ↔ A60  (helix)
  - D2 ↔ A7  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=22 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=306 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=146 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.1353 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
