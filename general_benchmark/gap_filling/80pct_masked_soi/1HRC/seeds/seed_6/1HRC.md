# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HRC\seeds\seed_6\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 8.145 A
- tm_score_ca_ordered: 0.3633962468442157
- heavy_atom_rmsd: 9.211 A
- sidechain_heavy_atom_rmsd: 10.107 A
- **all-atom quality (honest):** heavy 9.211 A, sidechain 10.107 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 53
- distogram_pairs: 1043
- bin_accuracy: 0.403

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_local_chirality_regression tested=51
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 8.145219850027276
- ga_delta_rmsd: 2.4305737386240196  ga_fitness_mode: energy
- pre_local_rmsd: 8.154117070054578  localized_anchor_rmsd: 8.145218119050892

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y66-G76 → 398 conflicts (48%); Y47-K52 → 140 conflicts (17%); A95-A100 → 106 conflicts (13%)
- explained: 644/823 conflicts by 3 root cause(s)
- metrics: hubs=92 (frac 0.902), conflicts/hub=8.9, max_incompat=17.25Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y66-G76 + Y47-K52 + A95-A100 — explain ~644/823 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I74** — severity 140.88, 42 conflict(s); suspect input ~`K99` (group: pull_in)
  - pull-in (wants closer): I56@10.9Å(now 18.5,conf 0.55), T48@9.6Å(now 13.9,conf 0.55), K52@9.7Å(now 17.0,conf 0.55)
  - push-out (wants farther): I80@11.0Å(now 8.0,conf 0.99), F81@13.0Å(now 3.9,conf 0.94), K99@23.7Å(now 11.5,conf 0.75), A100@23.1Å(now 13.5,conf 0.75), M79@10.0Å(now 4.3,conf 0.72), A95@21.8Å(now 9.5,conf 0.62), K98@20.8Å(now 10.1,conf 0.59), T27@16.8Å(now 10.5,conf 0.55), P29@15.3Å(now 11.5,conf 0.55), G28@14.3Å(now 9.2,conf 0.55)
  - P70↔K99: targets 6.9/23.7Å but partners are 5.9Å apart → too_close_together by 10.9Å
  - K71↔K99: targets 5.1/23.7Å but partners are 8.5Å apart → too_close_together by 10.1Å
  - L67↔K99: targets 10.9/23.7Å but partners are 3.4Å apart → too_close_together by 9.4Å
- **G76** — severity 98.63, 29 conflict(s); suspect input ~`A100` (group: pull_in)
  - pull-in (wants closer): A50@5.9Å(now 20.1,conf 0.55), T48@7.4Å(now 20.1,conf 0.55), T39@13.7Å(now 18.5,conf 0.55)
  - push-out (wants farther): G83@15.0Å(now 12.4,conf 1.00), V2@27.5Å(now 21.1,conf 1.00), F81@13.0Å(now 7.1,conf 0.99), A100@27.4Å(now 17.8,conf 0.94), A82@13.1Å(now 10.3,conf 0.91), T88@27.1Å(now 23.9,conf 0.88), I80@9.3Å(now 3.6,conf 0.82)
  - K71↔A100: targets 7.0/27.4Å but partners are 11.3Å apart → too_close_together by 9.0Å
  - K72↔A100: targets 9.0/27.4Å but partners are 11.3Å apart → too_close_together by 7.1Å
  - N69↔A100: targets 13.0/27.4Å but partners are 7.7Å apart → too_close_together by 6.7Å
- **K99** — severity 87.00, 26 conflict(s); suspect input ~`K72` (group: pull_in)
  - pull-in (wants closer): D1@10.8Å(now 17.0,conf 0.55), F9@12.3Å(now 17.0,conf 0.55), K6@9.9Å(now 19.2,conf 0.55)
  - push-out (wants farther): I94@9.0Å(now 6.5,conf 1.00), K72@26.6Å(now 8.9,conf 0.78), Y47@23.6Å(now 19.3,conf 0.76), I74@23.7Å(now 11.5,conf 0.75), G23@15.6Å(now 12.0,conf 0.55), R90@14.4Å(now 10.7,conf 0.55), E61@15.9Å(now 13.0,conf 0.55)
  - Y96↔K72: targets 5.4/26.6Å but partners are 8.0Å apart → too_close_together by 13.1Å
  - A95↔K72: targets 7.0/26.6Å but partners are 8.7Å apart → too_close_together by 10.9Å
  - I94↔K72: targets 9.0/26.6Å but partners are 8.6Å apart → too_close_together by 8.9Å
- **K72** — severity 73.42, 14 conflict(s); suspect input ~`K99` (group: pull_in)
  - pull-in (wants closer): D49@15.2Å(now 18.4,conf 0.55)
  - push-out (wants farther): K78@12.9Å(now 9.0,conf 0.91), M79@12.6Å(now 4.4,conf 0.79), K99@26.6Å(now 8.9,conf 0.78), I80@11.3Å(now 7.7,conf 0.55)
  - E68↔K99: targets 9.0/26.6Å but partners are 3.1Å apart → too_close_together by 14.4Å
  - L67↔K99: targets 9.1/26.6Å but partners are 3.4Å apart → too_close_together by 14.1Å
  - Y66↔K99: targets 7.4/26.6Å but partners are 5.7Å apart → too_close_together by 13.5Å
- **A50** — severity 72.82, 24 conflict(s); suspect input ~`G76` (group: pull_in)
  - pull-in (wants closer): N53@5.0Å(now 7.5,conf 0.94), G76@5.9Å(now 20.1,conf 0.55), A82@17.6Å(now 21.3,conf 0.55), M79@11.1Å(now 14.2,conf 0.55)
  - push-out (wants farther): P43@17.0Å(now 8.0,conf 0.99), F45@15.0Å(now 7.0,conf 0.99), T57@15.0Å(now 5.6,conf 0.99), T46@12.9Å(now 7.2,conf 0.91), K59@18.5Å(now 10.6,conf 0.55), G44@16.9Å(now 8.8,conf 0.55), T27@16.6Å(now 13.1,conf 0.55), W58@15.1Å(now 6.7,conf 0.55), I56@11.7Å(now 5.6,conf 0.55), L63@16.1Å(now 8.5,conf 0.55)
  - K54↔G76: targets 5.2/5.9Å but partners are 25.5Å apart → too_far_apart by 14.4Å
  - G55↔G76: targets 9.0/5.9Å but partners are 29.1Å apart → too_far_apart by 14.2Å
  - N53↔G76: targets 5.0/5.9Å but partners are 24.1Å apart → too_far_apart by 13.2Å
- **T48** — severity 70.88, 29 conflict(s); suspect input ~`G76` (group: pull_in)
  - pull-in (wants closer): A82@18.0Å(now 21.0,conf 0.55), G76@7.4Å(now 20.1,conf 0.55), I74@9.6Å(now 13.9,conf 0.55), P75@9.9Å(now 17.3,conf 0.55)
  - push-out (wants farther): E3@27.5Å(now 22.5,conf 1.00), A42@11.0Å(now 5.2,conf 0.99), F45@9.0Å(now 5.7,conf 0.99), K7@27.5Å(now 21.9,conf 0.98), D92@27.4Å(now 19.8,conf 0.95), G44@11.1Å(now 8.2,conf 0.91), P43@12.9Å(now 7.0,conf 0.84), Q41@9.2Å(now 6.3,conf 0.82), K26@15.0Å(now 9.0,conf 0.55), G55@12.8Å(now 9.1,conf 0.55)
  - N51↔G76: targets 5.4/7.4Å but partners are 23.5Å apart → too_far_apart by 10.8Å
  - K54↔G76: targets 9.1/7.4Å but partners are 25.5Å apart → too_far_apart by 9.0Å
  - G76↔G55: targets 7.4/12.8Å but partners are 29.1Å apart → too_far_apart by 8.9Å

## Secondary Structure (DSSP-like)

- helix(H)=58 · strand(E)=31 · 3-10(G)=8 · coil(C)=5

```
EEHHEHHEGHHHEHHEEEEEHHHHHGHEEHHHEEHCHECCEEGHHHHHHHHHHEHEEEEHHGHHEHEHEEHHHHEHHHHHGGGCCEHHHHHHHHHEGHEHHE
```

## Backbone H-bond Network

- total=89 · helix(i→i+4)=26 · sheet=63
  - E3 ↔ K7  (helix)
  - K6 ↔ V10  (helix)
  - K7 ↔ Q11  (helix)
  - V10 ↔ A14  (helix)
  - Q11 ↔ Q15  (helix)
  - G23 ↔ T27  (helix)
  - T27 ↔ L31  (helix)
  - L31 ↔ F35  (helix)
  - G44 ↔ T48  (helix)
  - T46 ↔ A50  (helix)
  - Y47 ↔ N51  (helix)
  - T48 ↔ K52  (helix)
  - D49 ↔ N53  (helix)
  - N51 ↔ G55  (helix)
  - E60 ↔ M64  (helix)
  - M64 ↔ E68  (helix)
  - E68 ↔ K72  (helix)
  - K72 ↔ G76  (helix)
  - Y73 ↔ T77  (helix)
  - I74 ↔ K78  (helix)
  - … +69 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=26 · exposed=47 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=723 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=472 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.5555 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=53 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
