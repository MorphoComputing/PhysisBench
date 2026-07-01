# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HRC\seeds\seed_1\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 6.268 A
- tm_score_ca_ordered: 0.39263636813341773
- heavy_atom_rmsd: 7.263 A
- sidechain_heavy_atom_rmsd: 8.124 A
- **all-atom quality (honest):** heavy 7.263 A, sidechain 8.124 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 39
- distogram_pairs: 1043
- bin_accuracy: 0.416

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=insufficient_rmsd_improvement tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 6.267670659537752
- ga_delta_rmsd: 3.2767614269768446  ga_fitness_mode: energy
- pre_local_rmsd: 6.315193939035139  localized_anchor_rmsd: 6.267650196468249

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E91-A100 → 304 conflicts (46%); P70-K78 → 130 conflicts (20%); V2-G5 → 57 conflicts (9%)
- explained: 491/665 conflicts by 3 root cause(s)
- metrics: hubs=83 (frac 0.814), conflicts/hub=8.0, max_incompat=14.38Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E91-A100 + P70-K78 + V2-G5 — explain ~491/665 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G76** — severity 126.48, 31 conflict(s); suspect input ~`A100` (group: pull_in)
  - pull-in (wants closer): T48@7.4Å(now 10.5,conf 0.55)
  - push-out (wants farther): V2@27.5Å(now 16.6,conf 1.00), A100@27.4Å(now 15.1,conf 0.94), T88@27.1Å(now 20.9,conf 0.88), T39@13.7Å(now 8.1,conf 0.55)
  - V2↔K71: targets 27.5/7.0Å but partners are 11.1Å apart → too_close_together by 9.4Å
  - V2↔P70: targets 27.5/9.0Å but partners are 9.4Å apart → too_close_together by 9.1Å
  - P70↔A100: targets 9.0/27.4Å but partners are 9.5Å apart → too_close_together by 8.9Å
- **I74** — severity 115.12, 39 conflict(s); suspect input ~`A95` (group: pull_in)
  - pull-in (wants closer): T27@16.8Å(now 19.3,conf 0.55), K52@9.7Å(now 12.8,conf 0.55)
  - push-out (wants farther): F81@12.9Å(now 8.7,conf 0.91), M79@9.4Å(now 6.9,conf 0.79), K99@23.7Å(now 9.2,conf 0.75), A100@23.1Å(now 12.8,conf 0.75), A95@21.8Å(now 10.3,conf 0.62), K98@20.8Å(now 6.6,conf 0.59)
  - P70↔K99: targets 6.6/23.7Å but partners are 6.2Å apart → too_close_together by 10.9Å
  - K71↔K99: targets 5.0/23.7Å but partners are 8.8Å apart → too_close_together by 9.9Å
  - P70↔A95: targets 6.6/21.8Å but partners are 3.9Å apart → too_close_together by 11.3Å
- **K99** — severity 81.94, 20 conflict(s); suspect input ~`K72` (group: pull_in)
  - pull-in (wants closer): D1@10.8Å(now 14.6,conf 0.55), K6@9.9Å(now 13.3,conf 0.55)
  - push-out (wants farther): K72@26.6Å(now 8.1,conf 0.78), Y47@23.6Å(now 11.7,conf 0.76), I74@23.7Å(now 9.2,conf 0.75), L31@11.6Å(now 6.3,conf 0.55), G33@10.3Å(now 6.8,conf 0.55), E61@15.9Å(now 11.2,conf 0.55)
  - A95↔K72: targets 7.0/26.6Å but partners are 8.3Å apart → too_close_together by 11.3Å
  - Y96↔K72: targets 5.0/26.6Å but partners are 10.6Å apart → too_close_together by 10.9Å
  - I94↔K72: targets 9.0/26.6Å but partners are 6.9Å apart → too_close_together by 10.7Å
- **T88** — severity 75.76, 28 conflict(s); suspect input ~`E91` (group: pull_in)
  - pull-in (wants closer): E91@4.9Å(now 7.4,conf 0.58), V10@16.7Å(now 19.3,conf 0.55), I94@9.8Å(now 12.7,conf 0.55), L97@14.1Å(now 16.9,conf 0.55), K4@10.0Å(now 13.9,conf 0.55)
  - push-out (wants farther): G83@13.0Å(now 7.6,conf 0.99), I84@9.0Å(now 4.8,conf 0.99), K85@9.0Å(now 2.9,conf 0.99), G76@27.1Å(now 20.9,conf 0.88), A82@16.0Å(now 10.7,conf 0.72), K78@25.3Å(now 20.1,conf 0.69), F81@18.1Å(now 11.5,conf 0.55), E68@11.3Å(now 8.0,conf 0.55)
  - G76↔E91: targets 27.1/4.9Å but partners are 14.0Å apart → too_close_together by 8.2Å
  - E91↔F81: targets 4.9/18.1Å but partners are 4.5Å apart → too_close_together by 8.6Å
  - K78↔E91: targets 25.3/4.9Å but partners are 12.8Å apart → too_close_together by 7.6Å
- **K72** — severity 70.93, 19 conflict(s); suspect input ~`K99` (group: push_out)
  - push-out (wants farther): Y66@7.1Å(now 3.3,conf 0.91), M79@12.6Å(now 8.7,conf 0.79), K99@26.6Å(now 8.1,conf 0.78), K59@17.6Å(now 7.3,conf 0.55), E61@15.2Å(now 6.3,conf 0.55), M64@12.6Å(now 4.8,conf 0.55), G40@16.4Å(now 12.7,conf 0.55)
  - K99↔N69: targets 26.6/5.4Å but partners are 6.8Å apart → too_close_together by 14.4Å
  - Y66↔K99: targets 7.1/26.6Å but partners are 9.3Å apart → too_close_together by 10.2Å
  - L67↔K99: targets 9.1/26.6Å but partners are 8.9Å apart → too_close_together by 8.6Å
- **T77** — severity 59.42, 20 conflict(s); suspect input ~`A95` (group: pull_in)
  - pull-in (wants closer): G28@10.8Å(now 14.3,conf 0.55), Y47@8.4Å(now 13.2,conf 0.55)
  - push-out (wants farther): A95@23.2Å(now 11.9,conf 0.76), G5@23.2Å(now 15.9,conf 0.75), E89@21.9Å(now 18.2,conf 0.62)
  - P70↔A95: targets 8.9/23.2Å but partners are 3.9Å apart → too_close_together by 10.4Å
  - K71↔A95: targets 7.0/23.2Å but partners are 6.7Å apart → too_close_together by 9.5Å
  - F81↔A95: targets 10.9/23.2Å but partners are 5.9Å apart → too_close_together by 6.4Å

## Secondary Structure (DSSP-like)

- helix(H)=45 · strand(E)=28 · 3-10(G)=20 · coil(C)=9

```
EHHHEHHHHHHGHEHHEGCCEHEEGEGGECCHHHHHEGEGCECHEGECHHEHHEGEEEEHHHHHGHHHHEGGHHHEEHGHHHGGEHHCGGGHCHEGEHEHGE
```

## Backbone H-bond Network

- total=69 · helix(i→i+4)=16 · sheet=53
  - V2 ↔ K6  (helix)
  - E3 ↔ K7  (helix)
  - K7 ↔ Q11  (helix)
  - F9 ↔ C13  (helix)
  - Q11 ↔ Q15  (helix)
  - H32 ↔ G36  (helix)
  - D49 ↔ N53  (helix)
  - E60 ↔ M64  (helix)
  - T62 ↔ Y66  (helix)
  - L63 ↔ L67  (helix)
  - M64 ↔ E68  (helix)
  - N69 ↔ Y73  (helix)
  - I74 ↔ K78  (helix)
  - K78 ↔ A82  (helix)
  - A82 ↔ K86  (helix)
  - I94 ↔ K98  (helix)
  - D1 ↔ A14  (sheet)
  - D1 ↔ H17  (sheet)
  - G5 ↔ A14  (sheet)
  - G5 ↔ H17  (sheet)
  - … +49 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=49 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=672 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=429 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.6211 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=39 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
