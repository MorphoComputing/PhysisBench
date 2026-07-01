# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.327 A
- tm_score_ca_ordered: 0.11338813890095502
- heavy_atom_rmsd: 8.258 A
- sidechain_heavy_atom_rmsd: 8.988 A
- **all-atom quality (honest):** heavy 8.258 A, sidechain 8.988 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 221
- bin_accuracy: 0.299

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C25-H28 → 35 conflicts (59%); K47 → 10 conflicts (17%); V20 → 5 conflicts (8%)
- explained: 50/59 conflicts by 3 root cause(s)
- metrics: hubs=14 (frac 0.298), conflicts/hub=4.2, max_incompat=10.09Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C25-H28 + K47 + V20 — explain ~50/59 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 22.77, 14 conflict(s); suspect input ~`P46` (group: push_out)
  - pull-in (wants closer): H28@5.6Å(now 10.1,conf 0.69), C19@9.4Å(now 13.1,conf 0.49), V20@6.5Å(now 11.6,conf 0.49), P46@4.5Å(now 7.1,conf 0.39), N21@4.5Å(now 9.7,conf 0.39), Q22@4.5Å(now 10.4,conf 0.39)
  - push-out (wants farther): A32@12.1Å(now 9.0,conf 0.59)
  - P46↔Q22: targets 4.5/4.5Å but partners are 17.3Å apart → too_far_apart by 8.3Å
  - P46↔N21: targets 4.5/4.5Å but partners are 16.2Å apart → too_far_apart by 7.2Å
  - V20↔P46: targets 6.5/4.5Å but partners are 17.1Å apart → too_far_apart by 6.2Å
- **K47** — severity 21.65, 5 conflict(s); suspect input ~`F43` (group: pull_in)
  - pull-in (wants closer): F42@9.8Å(now 12.3,conf 0.34)
  - push-out (wants farther): I1@25.3Å(now 10.1,conf 0.66)
  - I1↔F43: targets 25.3/8.6Å but partners are 6.6Å apart → too_close_together by 10.1Å
  - I1↔G41: targets 25.3/10.8Å but partners are 5.6Å apart → too_close_together by 8.9Å
  - I1↔Y44: targets 25.3/7.7Å but partners are 8.0Å apart → too_close_together by 9.6Å
- **I1** — severity 14.62, 4 conflict(s); suspect input ~`K47` (group: push_out)
  - push-out (wants farther): C5@12.7Å(now 8.7,conf 0.84), C6@13.8Å(now 10.6,conf 0.67), K47@25.3Å(now 10.1,conf 0.66), T7@14.8Å(now 11.4,conf 0.34)
  - C6↔K47: targets 13.8/25.3Å but partners are 3.4Å apart → too_close_together by 8.2Å
  - C5↔K47: targets 12.7/25.3Å but partners are 6.6Å apart → too_close_together by 6.1Å
  - Q4↔K47: targets 9.6/25.3Å but partners are 10.1Å apart → too_close_together by 5.6Å
- **A32** — severity 12.14, 8 conflict(s); suspect input ~`L35` (group: push_out)
  - push-out (wants farther): E39@11.0Å(now 5.8,conf 0.94), H28@12.2Å(now 4.6,conf 0.69), G26@13.5Å(now 7.4,conf 0.67), L29@9.0Å(now 2.6,conf 0.67), C25@12.1Å(now 9.0,conf 0.59), S27@14.0Å(now 9.0,conf 0.59), G38@8.0Å(now 3.9,conf 0.59)
  - G26↔V36: targets 13.5/5.6Å but partners are 3.0Å apart → too_close_together by 4.9Å
  - H28↔V36: targets 12.2/5.6Å but partners are 3.4Å apart → too_close_together by 3.2Å
  - H28↔L35: targets 12.2/4.1Å but partners are 3.9Å apart → too_close_together by 4.2Å
- **Y44** — severity 6.60, 5 conflict(s); suspect input ~`S27` (group: pull_in)
  - pull-in (wants closer): C37@8.4Å(now 11.3,conf 0.49), S27@4.5Å(now 12.5,conf 0.39), H28@5.1Å(now 8.6,conf 0.27)
  - K47↔S27: targets 7.7/4.5Å but partners are 18.7Å apart → too_far_apart by 6.4Å
  - C25↔S27: targets 4.3/4.5Å but partners are 12.7Å apart → too_far_apart by 3.9Å
  - C37↔K47: targets 8.4/7.7Å but partners are 18.9Å apart → too_far_apart by 2.7Å
- **C37** — severity 5.42, 4 conflict(s); suspect input ~`V20` (group: pull_in)
  - pull-in (wants closer): Y44@8.4Å(now 11.3,conf 0.49), Y34@4.1Å(now 8.7,conf 0.43), V20@4.9Å(now 10.3,conf 0.36)
  - Y34↔V20: targets 4.1/4.9Å but partners are 14.4Å apart → too_far_apart by 5.4Å
  - E31↔V20: targets 5.4/4.9Å but partners are 14.1Å apart → too_far_apart by 3.8Å
  - R40↔V20: targets 8.3/4.9Å but partners are 16.3Å apart → too_far_apart by 3.1Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=17 · 3-10(G)=5 · coil(C)=1

```
CEEHEHEGHHGHHHEHHHHEGHHEHEHEHHEHGHEHHEGHHEEEEHE
```

## Backbone H-bond Network

- total=54 · helix(i→i+4)=12 · sheet=42
  - C6 ↔ C10  (helix)
  - I9 ↔ Y13  (helix)
  - C10 ↔ Q14  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - V36 ↔ R40  (helix)
  - C37 ↔ G41  (helix)
  - V2 ↔ T7  (sheet)
  - C5 ↔ L15  (sheet)
  - T7 ↔ L15  (sheet)
  - L15 ↔ V20  (sheet)
  - L15 ↔ L24  (sheet)
  - L15 ↔ G26  (sheet)
  - L15 ↔ H28  (sheet)
  - L15 ↔ L35  (sheet)
  - … +34 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=237 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=129 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.0954 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
