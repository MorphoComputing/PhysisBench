# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1ENH\sequence\1ENH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1ENH\seeds\seed_3\1ENH.pdb`
- residues: 52
- mode: oracle
- ca_rmsd: 9.991 A
- tm_score_ca_ordered: 0.1519365591650176
- heavy_atom_rmsd: 10.937 A
- sidechain_heavy_atom_rmsd: 11.580 A
- **all-atom quality (honest):** heavy 10.937 A, sidechain 11.580 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/47 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 438
- bin_accuracy: 0.418

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_local_chirality_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 9.991006030180538
- ga_delta_rmsd: -0.13700259547047722  ga_fitness_mode: energy
- pre_local_rmsd: 10.026907512295365  localized_anchor_rmsd: 9.990919968938407

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K43-F46 → 86 conflicts (54%); N38-A40 → 25 conflicts (16%); S33-E34 → 13 conflicts (8%)
- explained: 124/159 conflicts by 3 root cause(s)
- metrics: hubs=36 (frac 0.692), conflicts/hub=4.4, max_incompat=9.07Å, chain_span=0.981
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K43-F46 + N38-A40 + S33-E34 — explain ~124/159 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K52** — severity 48.55, 17 conflict(s); suspect input ~`E34` (group: push_out)
  - pull-in (wants closer): K49@5.0Å(now 8.6,conf 0.99), P1@17.0Å(now 20.4,conf 0.94), A4@18.1Å(now 22.8,conf 0.55)
  - push-out (wants farther): E34@24.5Å(now 18.5,conf 0.71), N38@21.4Å(now 18.0,conf 0.60), R28@19.8Å(now 17.1,conf 0.57), K43@14.4Å(now 11.1,conf 0.55)
  - K49↔E34: targets 5.0/24.5Å but partners are 10.4Å apart → too_close_together by 9.1Å
  - N48↔E34: targets 6.0/24.5Å but partners are 10.9Å apart → too_close_together by 7.5Å
  - W45↔E34: targets 10.8/24.5Å but partners are 6.3Å apart → too_close_together by 7.3Å
- **K49** — severity 26.30, 14 conflict(s); suspect input ~`S33` (group: pull_in)
  - pull-in (wants closer): K52@5.0Å(now 8.6,conf 0.99)
  - push-out (wants farther): I42@11.0Å(now 5.7,conf 0.99), I44@9.2Å(now 3.2,conf 0.82), K43@9.4Å(now 3.8,conf 0.79), S33@20.4Å(now 13.2,conf 0.59), Q29@18.3Å(now 12.5,conf 0.55), L35@17.6Å(now 11.7,conf 0.55), N38@16.9Å(now 10.7,conf 0.55)
  - W45↔S33: targets 5.4/20.4Å but partners are 9.6Å apart → too_close_together by 5.4Å
  - K52↔F5: targets 5.0/13.8Å but partners are 24.5Å apart → too_far_apart by 5.7Å
  - W45↔N38: targets 5.4/16.9Å but partners are 6.6Å apart → too_close_together by 4.8Å
- **I44** — severity 24.02, 11 conflict(s); suspect input ~`E34` (group: push_out)
  - push-out (wants farther): K49@9.2Å(now 3.2,conf 0.82), L37@11.4Å(now 6.6,conf 0.79), E19@17.4Å(now 14.7,conf 0.55), E34@17.1Å(now 7.5,conf 0.55), N20@15.2Å(now 12.4,conf 0.55), L31@13.3Å(now 7.1,conf 0.55), S33@16.4Å(now 11.4,conf 0.55), S32@12.6Å(now 9.5,conf 0.55)
  - Q41↔E34: targets 5.0/17.1Å but partners are 4.7Å apart → too_close_together by 7.4Å
  - A40↔E34: targets 5.4/17.1Å but partners are 4.9Å apart → too_close_together by 6.8Å
  - Q41↔L37: targets 5.0/11.4Å but partners are 3.3Å apart → too_close_together by 3.1Å
- **L10** — severity 18.55, 10 conflict(s); suspect input ~`S6` (group: push_out)
  - pull-in (wants closer): S6@4.4Å(now 7.4,conf 0.69), F46@11.2Å(now 14.2,conf 0.55)
  - push-out (wants farther): E34@12.7Å(now 9.3,conf 0.55)
  - S6↔F46: targets 4.4/11.2Å but partners are 21.0Å apart → too_far_apart by 5.4Å
  - F17↔S6: targets 10.6/4.4Å but partners are 18.9Å apart → too_far_apart by 3.9Å
  - S6↔R21: targets 4.4/14.2Å but partners are 22.6Å apart → too_far_apart by 4.0Å
- **S33** — severity 18.41, 10 conflict(s); suspect input ~`K49` (group: push_out)
  - push-out (wants farther): E39@8.9Å(now 4.4,conf 0.91), A40@12.9Å(now 8.7,conf 0.91), K49@20.4Å(now 13.2,conf 0.59), P1@20.0Å(now 14.1,conf 0.58), I44@16.4Å(now 11.4,conf 0.55), N38@8.5Å(now 3.8,conf 0.55), K43@13.7Å(now 10.4,conf 0.55)
  - Q30↔K49: targets 5.2/20.4Å but partners are 9.8Å apart → too_close_together by 5.5Å
  - P1↔G36: targets 20.0/5.6Å but partners are 9.4Å apart → too_close_together by 5.0Å
  - L37↔P1: targets 7.2/20.0Å but partners are 8.3Å apart → too_close_together by 4.6Å
- **N38** — severity 13.16, 7 conflict(s); suspect input ~`K49` (group: push_out)
  - push-out (wants farther): E34@11.0Å(now 3.6,conf 1.00), W45@11.0Å(now 6.6,conf 1.00), K52@21.4Å(now 18.0,conf 0.60), K49@16.9Å(now 10.7,conf 0.55), F46@12.8Å(now 10.3,conf 0.55), Q47@14.7Å(now 11.0,conf 0.55), S33@8.5Å(now 3.8,conf 0.55)
  - I42↔K49: targets 6.6/16.9Å but partners are 5.7Å apart → too_close_together by 4.6Å
  - Q41↔K49: targets 5.1/16.9Å but partners are 7.2Å apart → too_close_together by 4.5Å
  - K43↔K49: targets 9.0/16.9Å but partners are 3.8Å apart → too_close_together by 4.1Å

## Secondary Structure (DSSP-like)

- helix(H)=37 · strand(E)=9 · 3-10(G)=3 · coil(C)=3

```
EECCECHHHHHHHEHGHHHEEHHGHGHHHHHHHHHHHHEHHHHHHHEHHHHE
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=17 · sheet=5
  - S7 ↔ A11  (helix)
  - Q9 ↔ L13  (helix)
  - A11 ↔ R15  (helix)
  - R15 ↔ E19  (helix)
  - N18 ↔ Y22  (helix)
  - E19 ↔ L23  (helix)
  - L23 ↔ R27  (helix)
  - E25 ↔ Q29  (helix)
  - R27 ↔ L31  (helix)
  - Q29 ↔ S33  (helix)
  - L31 ↔ L35  (helix)
  - S33 ↔ L37  (helix)
  - G36 ↔ A40  (helix)
  - L37 ↔ Q41  (helix)
  - A40 ↔ I44  (helix)
  - I44 ↔ N48  (helix)
  - F46 ↔ R50  (helix)
  - F5 ↔ K14  (sheet)
  - K14 ↔ N20  (sheet)
  - K14 ↔ R21  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=20 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=239 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=90 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.6402 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 47 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
