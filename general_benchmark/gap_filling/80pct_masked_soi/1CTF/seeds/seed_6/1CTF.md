# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1CTF\sequence\1CTF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1CTF\seeds\seed_6\1CTF.pdb`
- residues: 66
- mode: oracle
- ca_rmsd: 6.823 A
- tm_score_ca_ordered: 0.3382008513899492
- heavy_atom_rmsd: 7.416 A
- sidechain_heavy_atom_rmsd: 7.881 A
- **all-atom quality (honest):** heavy 7.416 A, sidechain 7.881 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 644
- bin_accuracy: 0.523

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=39
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.823412728896472
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 6.823335472525097  localized_anchor_rmsd: 6.823335472525097

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P38-A40 → 77 conflicts (45%); S46 → 17 conflicts (10%); L33 → 11 conflicts (6%)
- explained: 105/170 conflicts by 3 root cause(s)
- metrics: hubs=34 (frac 0.515), conflicts/hub=5.0, max_incompat=7.38Å, chain_span=0.939
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P38-A40 + S46 + L33 — explain ~105/170 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L33** — severity 34.45, 16 conflict(s); suspect input ~`D48` (group: push_out)
  - pull-in (wants closer): A40@9.0Å(now 13.8,conf 0.99), A39@7.1Å(now 10.3,conf 0.94), G44@18.3Å(now 21.2,conf 0.55), A10@14.9Å(now 19.0,conf 0.55), V64@13.5Å(now 16.5,conf 0.55)
  - push-out (wants farther): D48@22.8Å(now 20.1,conf 0.71), A22@13.3Å(now 7.8,conf 0.55), R20@10.6Å(now 7.1,conf 0.55), L53@15.6Å(now 12.9,conf 0.55)
  - A39↔D48: targets 7.1/22.8Å but partners are 9.9Å apart → too_close_together by 5.8Å
  - A40↔D48: targets 9.0/22.8Å but partners are 8.4Å apart → too_close_together by 5.3Å
  - A40↔K47: targets 9.0/22.5Å but partners are 8.9Å apart → too_close_together by 4.6Å
- **S46** — severity 31.10, 15 conflict(s); suspect input ~`P38` (group: pull_in)
  - pull-in (wants closer): V19@17.7Å(now 21.2,conf 0.55), A22@14.5Å(now 17.1,conf 0.55)
  - push-out (wants farther): A37@22.2Å(now 17.6,conf 0.64), P38@20.8Å(now 16.1,conf 0.59), A39@18.4Å(now 13.3,conf 0.55), A40@14.9Å(now 9.8,conf 0.55)
  - A50↔A40: targets 5.1/14.9Å but partners are 4.4Å apart → too_close_together by 5.3Å
  - A50↔A39: targets 5.1/18.4Å but partners are 8.5Å apart → too_close_together by 4.8Å
  - D49↔P38: targets 5.0/20.8Å but partners are 11.5Å apart → too_close_together by 4.2Å
- **A40** — severity 23.86, 16 conflict(s); suspect input ~`K6` (group: pull_in)
  - pull-in (wants closer): L33@9.0Å(now 13.8,conf 0.99), I4@4.4Å(now 8.2,conf 0.61), A10@19.5Å(now 22.9,conf 0.57), L5@6.3Å(now 10.7,conf 0.55), K6@8.5Å(now 15.0,conf 0.55)
  - push-out (wants farther): V45@12.6Å(now 7.3,conf 0.79), K47@16.6Å(now 8.9,conf 0.79), A60@17.0Å(now 13.7,conf 0.55), S46@14.9Å(now 9.8,conf 0.55), E51@14.5Å(now 6.2,conf 0.55), G21@16.2Å(now 11.5,conf 0.55), L53@12.2Å(now 3.8,conf 0.55)
  - E43↔K6: targets 7.0/8.5Å but partners are 20.2Å apart → too_far_apart by 4.7Å
  - L5↔G61: targets 6.3/16.7Å but partners are 6.8Å apart → too_close_together by 3.6Å
  - E43↔L5: targets 7.0/6.3Å but partners are 16.9Å apart → too_far_apart by 3.6Å
- **E35** — severity 18.38, 7 conflict(s); suspect input ~`A52` (group: pull_in)
  - pull-in (wants closer): I4@13.3Å(now 16.8,conf 0.55)
  - push-out (wants farther): D49@23.0Å(now 19.2,conf 0.74), A52@21.9Å(now 16.4,conf 0.63)
  - A40↔A52: targets 12.6/21.9Å but partners are 3.5Å apart → too_close_together by 5.9Å
  - A52↔A39: targets 21.9/9.3Å but partners are 6.3Å apart → too_close_together by 6.2Å
  - A40↔D49: targets 12.6/23.0Å but partners are 6.1Å apart → too_close_together by 4.3Å
- **P38** — severity 16.09, 10 conflict(s); suspect input ~`A7` (group: pull_in)
  - pull-in (wants closer): A7@6.2Å(now 15.7,conf 0.55), A8@9.2Å(now 15.5,conf 0.55)
  - push-out (wants farther): S46@20.8Å(now 16.1,conf 0.59), V45@18.2Å(now 14.9,conf 0.55), K17@17.3Å(now 13.1,conf 0.55), R20@16.9Å(now 14.2,conf 0.55), T23@16.8Å(now 13.3,conf 0.55), L53@15.8Å(now 6.3,conf 0.55)
  - A7↔V34: targets 6.2/8.1Å but partners are 19.7Å apart → too_far_apart by 5.4Å
  - E35↔A7: targets 9.0/6.2Å but partners are 20.4Å apart → too_far_apart by 5.3Å
  - A7↔D32: targets 6.2/11.4Å but partners are 21.6Å apart → too_far_apart by 3.9Å
- **D49** — severity 14.66, 7 conflict(s); suspect input ~`S36` (group: pull_in)
  - pull-in (wants closer): G26@21.0Å(now 25.4,conf 0.60), G24@15.6Å(now 19.2,conf 0.55)
  - push-out (wants farther): E35@23.0Å(now 19.2,conf 0.74), S36@22.6Å(now 16.0,conf 0.68)
  - L53↔S36: targets 6.9/22.6Å but partners are 10.4Å apart → too_close_together by 5.3Å
  - A52↔S36: targets 5.0/22.6Å but partners are 13.2Å apart → too_close_together by 4.4Å
  - A56↔S36: targets 11.0/22.6Å but partners are 7.5Å apart → too_close_together by 4.1Å

## Secondary Structure (DSSP-like)

- helix(H)=34 · strand(E)=21 · 3-10(G)=7 · coil(C)=4

```
CECECHEEEHEEHEHHEHHHHHEHEGEHHHHHHHHHHHEHHHEGHEEHEHHEHHGHGHHGGEGEEC
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=11 · sheet=22
  - K6 ↔ A10  (helix)
  - V15 ↔ V19  (helix)
  - A18 ↔ A22  (helix)
  - R20 ↔ G24  (helix)
  - G24 ↔ K28  (helix)
  - K28 ↔ D32  (helix)
  - A30 ↔ V34  (helix)
  - V34 ↔ P38  (helix)
  - L41 ↔ V45  (helix)
  - A50 ↔ K54  (helix)
  - K54 ↔ E58  (helix)
  - I4 ↔ A14  (sheet)
  - A7 ↔ K12  (sheet)
  - A7 ↔ A14  (sheet)
  - A8 ↔ A14  (sheet)
  - G9 ↔ A14  (sheet)
  - N11 ↔ K17  (sheet)
  - K12 ↔ K17  (sheet)
  - A14 ↔ L27  (sheet)
  - K17 ↔ T23  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=288 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=142 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2206 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
