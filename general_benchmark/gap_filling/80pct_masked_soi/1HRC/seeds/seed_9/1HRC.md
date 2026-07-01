# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HRC\sequence\1HRC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HRC\seeds\seed_9\1HRC.pdb`
- residues: 102
- mode: oracle
- ca_rmsd: 10.987 A
- tm_score_ca_ordered: 0.21270024957222344
- heavy_atom_rmsd: 11.671 A
- sidechain_heavy_atom_rmsd: 12.418 A
- **all-atom quality (honest):** heavy 11.671 A, sidechain 12.418 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/85 (0.0)
- lj_severe: 0
- lj_near: 43
- distogram_pairs: 1043
- bin_accuracy: 0.411

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 10.986916328429935
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 10.99093268289844  localized_anchor_rmsd: 10.98693921571234

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E91-N102 → 333 conflicts (45%); L31-K38 → 181 conflicts (25%); I74-F81 → 115 conflicts (16%)
- explained: 629/733 conflicts by 3 root cause(s)
- metrics: hubs=86 (frac 0.843), conflicts/hub=8.5, max_incompat=13.04Å, chain_span=0.98
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E91-N102 + L31-K38 + I74-F81 — explain ~629/733 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I74** — severity 110.77, 37 conflict(s); suspect input ~`K99` (group: pull_in)
  - pull-in (wants closer): I56@10.9Å(now 14.1,conf 0.55)
  - push-out (wants farther): F81@12.9Å(now 10.3,conf 0.91), K99@23.7Å(now 13.2,conf 0.75), A100@23.1Å(now 15.6,conf 0.75), A95@21.8Å(now 13.1,conf 0.62), K98@20.8Å(now 9.1,conf 0.59), T27@16.8Å(now 10.9,conf 0.55), P29@15.3Å(now 9.0,conf 0.55), G28@14.3Å(now 8.0,conf 0.55)
  - K71↔K99: targets 5.0/23.7Å but partners are 10.4Å apart → too_close_together by 8.2Å
  - M79↔K99: targets 9.1/23.7Å but partners are 6.5Å apart → too_close_together by 8.1Å
  - I80↔K99: targets 11.0/23.7Å but partners are 5.8Å apart → too_close_together by 6.9Å
- **T88** — severity 79.94, 32 conflict(s); suspect input ~`E91` (group: pull_in)
  - pull-in (wants closer): A95@10.9Å(now 13.5,conf 0.91), D92@5.4Å(now 8.6,conf 0.79), E91@4.9Å(now 8.9,conf 0.58), I94@9.8Å(now 13.2,conf 0.55), L97@14.1Å(now 17.4,conf 0.55)
  - push-out (wants farther): G83@13.0Å(now 10.2,conf 1.00), I84@9.0Å(now 6.5,conf 0.99), G76@27.1Å(now 23.6,conf 0.88), A82@15.4Å(now 11.0,conf 0.79), K85@8.6Å(now 6.0,conf 0.79), K78@25.3Å(now 20.2,conf 0.69), F81@18.1Å(now 11.8,conf 0.55), V10@16.7Å(now 14.1,conf 0.55)
  - K78↔E91: targets 25.3/4.9Å but partners are 11.4Å apart → too_close_together by 9.0Å
  - D92↔K78: targets 5.4/25.3Å but partners are 12.9Å apart → too_close_together by 7.0Å
  - E91↔F81: targets 4.9/18.1Å but partners are 4.8Å apart → too_close_together by 8.3Å
- **K21** — severity 77.00, 20 conflict(s); suspect input ~`P75` (group: push_out)
  - push-out (wants farther): P75@27.5Å(now 14.6,conf 0.98), A82@27.1Å(now 21.3,conf 0.87), G44@13.4Å(now 8.3,conf 0.55), K99@12.4Å(now 9.4,conf 0.55), F35@13.8Å(now 11.2,conf 0.55)
  - K24↔P75: targets 9.0/27.5Å but partners are 9.9Å apart → too_close_together by 8.6Å
  - P75↔N30: targets 27.5/8.3Å but partners are 6.1Å apart → too_close_together by 13.0Å
  - P75↔T18: targets 27.5/9.4Å but partners are 9.2Å apart → too_close_together by 8.9Å
- **K99** — severity 76.02, 22 conflict(s); suspect input ~`K72` (group: push_out)
  - push-out (wants farther): K72@26.6Å(now 14.5,conf 0.78), Y47@23.6Å(now 10.0,conf 0.76), I74@23.7Å(now 13.2,conf 0.75), G23@15.6Å(now 8.7,conf 0.55), L31@11.6Å(now 6.6,conf 0.55), K21@12.4Å(now 9.4,conf 0.55), A14@15.6Å(now 9.2,conf 0.55), F9@12.3Å(now 8.3,conf 0.55)
  - I94↔K72: targets 9.0/26.6Å but partners are 8.4Å apart → too_close_together by 9.2Å
  - N102↔Y47: targets 7.0/23.6Å but partners are 8.0Å apart → too_close_together by 8.6Å
  - N102↔K72: targets 7.0/26.6Å but partners are 11.9Å apart → too_close_together by 7.7Å
- **A100** — severity 70.03, 23 conflict(s); suspect input ~`L97` (group: pull_in)
  - pull-in (wants closer): V2@9.2Å(now 12.3,conf 0.55)
  - push-out (wants farther): G76@27.4Å(now 13.7,conf 0.94), I74@23.1Å(now 15.6,conf 0.75), K78@23.1Å(now 9.1,conf 0.74), L67@17.1Å(now 14.2,conf 0.55), K24@14.8Å(now 10.8,conf 0.55), A42@15.6Å(now 8.7,conf 0.55), V10@12.4Å(now 7.9,conf 0.55)
  - G76↔Y96: targets 27.4/5.1Å but partners are 15.1Å apart → too_close_together by 7.2Å
  - G76↔L97: targets 27.4/5.1Å but partners are 11.2Å apart → too_close_together by 11.0Å
  - G76↔E20: targets 27.4/7.0Å but partners are 9.0Å apart → too_close_together by 11.4Å
- **G76** — severity 62.15, 20 conflict(s); suspect input ~`A100` (group: push_out)
  - push-out (wants farther): V2@27.5Å(now 19.6,conf 1.00), A100@27.4Å(now 13.7,conf 0.94), T88@27.1Å(now 23.6,conf 0.88), P29@16.3Å(now 7.3,conf 0.55), G28@14.4Å(now 7.6,conf 0.55), T39@13.7Å(now 3.4,conf 0.55)
  - M79↔A100: targets 9.0/27.4Å but partners are 7.9Å apart → too_close_together by 10.5Å
  - K71↔A100: targets 7.0/27.4Å but partners are 11.8Å apart → too_close_together by 8.6Å
  - A100↔I80: targets 27.4/10.6Å but partners are 8.1Å apart → too_close_together by 8.7Å

## Secondary Structure (DSSP-like)

- helix(H)=55 · strand(E)=28 · 3-10(G)=15 · coil(C)=4

```
EGCGEGGHCHGHGHGHEEHHHHHEEGGHEGHHHHGHEHHEEHHHHHEHHGHHGHHCEEEHHHEHHHEHEGHHHHHHEHEEEHGEHCHHEEHHHHEHEHEHHE
```

## Backbone H-bond Network

- total=78 · helix(i→i+4)=20 · sheet=58
  - V10 ↔ A14  (helix)
  - C16 ↔ E20  (helix)
  - V19 ↔ G23  (helix)
  - G28 ↔ H32  (helix)
  - H32 ↔ G36  (helix)
  - L34 ↔ K38  (helix)
  - T39 ↔ P43  (helix)
  - G44 ↔ T48  (helix)
  - F45 ↔ D49  (helix)
  - T48 ↔ K52  (helix)
  - E60 ↔ M64  (helix)
  - T62 ↔ Y66  (helix)
  - M64 ↔ E68  (helix)
  - K71 ↔ P75  (helix)
  - K78 ↔ A82  (helix)
  - K87 ↔ E91  (helix)
  - T88 ↔ D92  (helix)
  - D92 ↔ Y96  (helix)
  - I94 ↔ K98  (helix)
  - Y96 ↔ A100  (helix)
  - … +58 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=706 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=472 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.5303 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=43 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 85 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
