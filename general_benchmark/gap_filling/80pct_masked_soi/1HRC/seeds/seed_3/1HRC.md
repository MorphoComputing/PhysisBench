# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HRC\seeds\seed_3\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 11.111 A
- tm_score_ca_ordered: 0.19108603121373438
- heavy_atom_rmsd: 12.062 A
- sidechain_heavy_atom_rmsd: 13.012 A
- **all-atom quality (honest):** heavy 12.062 A, sidechain 13.012 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 73
- distogram_pairs: 1043
- bin_accuracy: 0.360

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=residue_block reason=accepted tested=54
- rigid_domain_reconvergence: applied=True accepted=11 rmsd=11.86450152905265 -> 10.789831908978256 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 11.111257875642393
- ga_delta_rmsd: -0.3124641105621908  ga_fitness_mode: energy
- pre_local_rmsd: 11.12778621732405  localized_anchor_rmsd: 11.111249855005633

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P70-K78 → 517 conflicts (40%); Y47-I56 → 404 conflicts (32%); D92-A95 → 85 conflicts (7%)
- explained: 1006/1280 conflicts by 3 root cause(s)
- metrics: hubs=94 (frac 0.922), conflicts/hub=13.6, max_incompat=17.39Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P70-K78 + Y47-I56 + D92-A95 — explain ~1006/1280 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T88** — severity 203.10, 50 conflict(s); suspect input ~`K78` (group: pull_in)
  - pull-in (wants closer): D92@5.0Å(now 7.8,conf 0.99), L93@8.0Å(now 11.2,conf 0.72), K7@13.3Å(now 17.9,conf 0.55), K4@10.0Å(now 13.4,conf 0.55)
  - push-out (wants farther): K24@27.5Å(now 24.7,conf 0.99), A82@17.0Å(now 10.1,conf 0.99), G83@13.0Å(now 3.5,conf 0.94), G76@27.1Å(now 7.1,conf 0.88), I84@9.4Å(now 6.8,conf 0.79), K85@8.6Å(now 4.0,conf 0.79), K78@25.3Å(now 11.8,conf 0.69), F81@18.1Å(now 8.9,conf 0.55), E68@11.3Å(now 7.3,conf 0.55)
  - D92↔G76: targets 5.0/27.1Å but partners are 6.2Å apart → too_close_together by 15.9Å
  - G76↔E91: targets 27.1/4.9Å but partners are 4.9Å apart → too_close_together by 17.4Å
  - D92↔K78: targets 5.0/25.3Å but partners are 7.8Å apart → too_close_together by 12.6Å
- **G76** — severity 190.04, 45 conflict(s); suspect input ~`T88` (group: pull_in)
  - pull-in (wants closer): A50@5.9Å(now 15.8,conf 0.55), T48@7.4Å(now 16.9,conf 0.55)
  - push-out (wants farther): V2@27.5Å(now 12.0,conf 1.00), N69@13.0Å(now 8.2,conf 0.99), P70@9.0Å(now 5.0,conf 0.99), M79@9.0Å(now 5.6,conf 0.99), G83@15.0Å(now 5.0,conf 0.99), A100@27.4Å(now 10.7,conf 0.94), F81@12.9Å(now 3.9,conf 0.91), A82@13.1Å(now 10.4,conf 0.91), T88@27.1Å(now 7.1,conf 0.88), K72@9.2Å(now 3.8,conf 0.82), K71@7.0Å(now 3.3,conf 0.67), E65@16.4Å(now 10.6,conf 0.55)
  - Y73↔T88: targets 9.0/27.1Å but partners are 3.3Å apart → too_close_together by 14.8Å
  - T88↔K72: targets 27.1/9.2Å but partners are 5.0Å apart → too_close_together by 12.9Å
  - T88↔K71: targets 27.1/7.0Å but partners are 5.6Å apart → too_close_together by 14.6Å
- **K7** — severity 160.79, 43 conflict(s); suspect input ~`C13` (group: pull_in)
  - pull-in (wants closer): T88@13.3Å(now 17.9,conf 0.55)
  - push-out (wants farther): G55@27.5Å(now 19.1,conf 1.00), K54@27.5Å(now 13.9,conf 0.99), T48@27.5Å(now 17.6,conf 0.98), V2@8.6Å(now 6.0,conf 0.79), M64@17.5Å(now 14.9,conf 0.55), D1@10.2Å(now 4.6,conf 0.55)
  - E3↔K54: targets 5.0/27.5Å but partners are 14.1Å apart → too_close_together by 8.4Å
  - K54↔C13: targets 27.5/9.1Å but partners are 9.5Å apart → too_close_together by 8.9Å
  - K54↔V2: targets 27.5/8.6Å but partners are 9.3Å apart → too_close_together by 9.6Å
- **T77** — severity 145.15, 44 conflict(s); suspect input ~`A95` (group: pull_in)
  - pull-in (wants closer): G28@10.8Å(now 16.6,conf 0.55), Y47@8.4Å(now 19.1,conf 0.55)
  - push-out (wants farther): G83@13.0Å(now 9.2,conf 0.99), A95@23.2Å(now 9.7,conf 0.76), G5@23.2Å(now 15.5,conf 0.75), F81@10.0Å(now 3.3,conf 0.72), E89@21.9Å(now 13.1,conf 0.62), K86@21.6Å(now 13.3,conf 0.61), L34@17.0Å(now 12.8,conf 0.55), T57@16.5Å(now 11.7,conf 0.55), E65@14.8Å(now 11.7,conf 0.55), L63@14.7Å(now 4.5,conf 0.55), A82@12.1Å(now 9.6,conf 0.55)
  - P70↔A95: targets 7.0/23.2Å but partners are 3.9Å apart → too_close_together by 12.4Å
  - A95↔I74: targets 23.2/5.4Å but partners are 4.9Å apart → too_close_together by 12.9Å
  - I80↔A95: targets 7.0/23.2Å but partners are 7.3Å apart → too_close_together by 8.9Å
- **A100** — severity 143.60, 30 conflict(s); suspect input ~`L97` (group: push_out)
  - push-out (wants farther): G76@27.4Å(now 10.7,conf 0.94), I74@23.1Å(now 11.0,conf 0.75), K78@23.1Å(now 8.7,conf 0.74), A42@15.6Å(now 9.0,conf 0.55)
  - A95↔G76: targets 9.0/27.4Å but partners are 6.4Å apart → too_close_together by 12.0Å
  - G76↔Y96: targets 27.4/6.6Å but partners are 7.3Å apart → too_close_together by 13.5Å
  - K78↔L97: targets 23.1/5.1Å but partners are 3.2Å apart → too_close_together by 14.8Å
- **I74** — severity 136.02, 45 conflict(s); suspect input ~`A95` (group: pull_in)
  - pull-in (wants closer): T27@16.8Å(now 19.7,conf 0.55), T48@9.6Å(now 16.3,conf 0.55), K52@9.7Å(now 15.7,conf 0.55)
  - push-out (wants farther): K78@9.0Å(now 4.8,conf 1.00), M79@9.1Å(now 6.2,conf 0.91), L67@10.6Å(now 5.7,conf 0.79), K99@23.7Å(now 7.6,conf 0.75), A100@23.1Å(now 11.0,conf 0.75), F81@12.0Å(now 3.8,conf 0.72), A95@21.8Å(now 4.9,conf 0.62), K98@20.8Å(now 6.1,conf 0.59), E68@11.6Å(now 8.6,conf 0.55), L63@11.7Å(now 6.3,conf 0.55)
  - P70↔A95: targets 5.4/21.8Å but partners are 3.9Å apart → too_close_together by 12.5Å
  - K78↔K99: targets 9.0/23.7Å but partners are 4.5Å apart → too_close_together by 10.1Å
  - P70↔K99: targets 5.4/23.7Å but partners are 9.1Å apart → too_close_together by 9.2Å

## Secondary Structure (DSSP-like)

- helix(H)=71 · strand(E)=23 · 3-10(G)=7 · coil(C)=1

```
EEHHEHCGHEHGHHHHHEEHHHHHEHEHEEGHGEHHHEGEHHEHEHHHHHHEHEHHHEHGHHHHHHEHHEHHHHHHHHHHHHHHHGHHHHHHHHEHHHEHHE
```

## Backbone H-bond Network

- total=100 · helix(i→i+4)=39 · sheet=61
  - F9 ↔ C13  (helix)
  - Q11 ↔ Q15  (helix)
  - C13 ↔ H17  (helix)
  - C16 ↔ E20  (helix)
  - E20 ↔ K24  (helix)
  - G22 ↔ K26  (helix)
  - K24 ↔ G28  (helix)
  - G28 ↔ H32  (helix)
  - H32 ↔ G36  (helix)
  - R37 ↔ Q41  (helix)
  - G44 ↔ T48  (helix)
  - Y47 ↔ N51  (helix)
  - D49 ↔ N53  (helix)
  - N51 ↔ G55  (helix)
  - N53 ↔ T57  (helix)
  - G55 ↔ K59  (helix)
  - T57 ↔ E61  (helix)
  - K59 ↔ L63  (helix)
  - E61 ↔ E65  (helix)
  - E65 ↔ N69  (helix)
  - … +80 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=28 · exposed=37 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=866 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=613 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.792 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=73 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
