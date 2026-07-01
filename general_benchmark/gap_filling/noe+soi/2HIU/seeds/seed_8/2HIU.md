# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2HIU\seeds\seed_8\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 6.028 A
- tm_score_ca_ordered: 0.1792471812244473
- heavy_atom_rmsd: 7.012 A
- sidechain_heavy_atom_rmsd: 7.815 A
- **all-atom quality (honest):** heavy 7.012 A, sidechain 7.815 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 220
- bin_accuracy: 0.359

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C25 → 34 conflicts (48%); L24-G26 → 4 conflicts (6%); S27-C37 → 4 conflicts (6%)
- explained: 42/71 conflicts by 3 root cause(s)
- metrics: hubs=22 (frac 0.468), conflicts/hub=3.2, max_incompat=7.78Å, chain_span=0.872
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C25 + L24-G26 + S27-C37 — explain ~42/71 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 14.98, 12 conflict(s); suspect input ~`Q22` (group: pull_in)
  - pull-in (wants closer): H28@6.5Å(now 10.8,conf 0.82), V30@9.4Å(now 12.7,conf 0.67), E31@11.4Å(now 16.2,conf 0.66), L29@7.5Å(now 10.7,conf 0.58), Y44@4.3Å(now 14.6,conf 0.41), P46@4.5Å(now 14.9,conf 0.39), T45@4.5Å(now 13.7,conf 0.39)
  - Y18↔P46: targets 14.0/4.5Å but partners are 4.4Å apart → too_close_together by 5.2Å
  - C19↔Y44: targets 11.3/4.3Å but partners are 3.0Å apart → too_close_together by 4.0Å
  - Y44↔Y18: targets 4.3/14.0Å but partners are 5.9Å apart → too_close_together by 3.8Å
- **Y44** — severity 10.94, 6 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 14.6,conf 0.41)
  - push-out (wants farther): K47@10.7Å(now 8.1,conf 0.82), C37@9.2Å(now 5.0,conf 0.34)
  - G41↔C25: targets 8.9/4.3Å but partners are 21.0Å apart → too_far_apart by 7.8Å
  - R40↔C25: targets 10.0/4.3Å but partners are 20.9Å apart → too_far_apart by 6.6Å
  - C25↔E39: targets 4.3/10.7Å but partners are 20.8Å apart → too_far_apart by 5.8Å
- **P46** — severity 10.26, 5 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): E39@10.8Å(now 13.7,conf 0.49), C25@4.5Å(now 14.9,conf 0.39)
  - G41↔C25: targets 10.0/4.5Å but partners are 21.0Å apart → too_far_apart by 6.5Å
  - F42↔C25: targets 7.7/4.5Å but partners are 18.3Å apart → too_far_apart by 6.1Å
  - E39↔C25: targets 10.8/4.5Å but partners are 20.8Å apart → too_far_apart by 5.5Å
- **T45** — severity 10.08, 5 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): C25@4.5Å(now 13.7,conf 0.39), L24@4.5Å(now 7.5,conf 0.39)
  - R40↔C25: targets 10.1/4.5Å but partners are 20.9Å apart → too_far_apart by 6.3Å
  - G41↔C25: targets 10.2/4.5Å but partners are 21.0Å apart → too_far_apart by 6.3Å
  - F42↔C25: targets 8.5/4.5Å but partners are 18.3Å apart → too_far_apart by 5.3Å
- **C37** — severity 8.65, 6 conflict(s); suspect input ~`V20` (group: pull_in)
  - pull-in (wants closer): Y34@4.1Å(now 6.7,conf 0.43), V20@4.9Å(now 11.0,conf 0.36)
  - push-out (wants farther): F43@10.0Å(now 6.8,conf 0.67), F42@9.9Å(now 7.1,conf 0.49), Y44@9.2Å(now 5.0,conf 0.34)
  - Y34↔V20: targets 4.1/4.9Å but partners are 16.0Å apart → too_far_apart by 7.0Å
  - E31↔V20: targets 6.3/4.9Å but partners are 16.9Å apart → too_far_apart by 5.8Å
  - R40↔V20: targets 8.8/4.9Å but partners are 17.6Å apart → too_far_apart by 3.9Å
- **L33** — severity 6.46, 6 conflict(s); suspect input ~`S27` (group: push_out)
  - push-out (wants farther): H28@7.8Å(now 5.0,conf 0.69), G26@13.1Å(now 6.2,conf 0.67), S27@11.5Å(now 4.8,conf 0.58)
  - L29↔S27: targets 6.0/11.5Å but partners are 1.1Å apart → too_close_together by 4.3Å
  - S27↔V30: targets 11.5/3.9Å but partners are 5.3Å apart → too_close_together by 2.3Å
  - G26↔V36: targets 13.1/4.1Å but partners are 6.9Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=17 · 3-10(G)=3 · coil(C)=2

```
EHEHHHEEHHHHHHHEHEHGHHEHHEHGEEHHHHHHCEEEGECEHEE
```

## Backbone H-bond Network

- total=41 · helix(i→i+4)=9 · sheet=32
  - V2 ↔ C6  (helix)
  - C6 ↔ C10  (helix)
  - I9 ↔ Y13  (helix)
  - Y13 ↔ N17  (helix)
  - N17 ↔ N21  (helix)
  - N21 ↔ C25  (helix)
  - S27 ↔ E31  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - I1 ↔ E16  (sheet)
  - I1 ↔ Y18  (sheet)
  - E3 ↔ S8  (sheet)
  - E3 ↔ E16  (sheet)
  - E3 ↔ Y18  (sheet)
  - E3 ↔ H23  (sheet)
  - T7 ↔ E16  (sheet)
  - S8 ↔ E16  (sheet)
  - E16 ↔ H23  (sheet)
  - E16 ↔ G26  (sheet)
  - E16 ↔ L29  (sheet)
  - … +21 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=210 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=105 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.3681 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
