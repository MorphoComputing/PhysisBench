# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2KNM\seeds\seed_6\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 4.507 A
- tm_score_ca_ordered: 0.1387400933526227
- heavy_atom_rmsd: 5.212 A
- sidechain_heavy_atom_rmsd: 5.615 A
- **all-atom quality (honest):** heavy 5.212 A, sidechain 5.615 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 133
- bin_accuracy: 0.436

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C26-Y27 → 14 conflicts (82%)
- explained: 14/17 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.179), conflicts/hub=3.4, max_incompat=4.4Å, chain_span=0.607
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C26-Y27 — explain ~14/17 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C26** — severity 13.02, 8 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): C3@3.8Å(now 9.3,conf 0.58), E5@3.8Å(now 9.0,conf 0.58)
  - K22↔E5: targets 6.4/3.8Å but partners are 14.4Å apart → too_far_apart by 4.2Å
  - K22↔C3: targets 6.4/3.8Å but partners are 14.4Å apart → too_far_apart by 4.2Å
  - C21↔C3: targets 5.1/3.8Å but partners are 12.3Å apart → too_far_apart by 3.4Å
- **Y27** — severity 8.23, 6 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): C3@3.7Å(now 6.7,conf 0.60), P2@4.5Å(now 7.2,conf 0.39), I1@4.7Å(now 7.4,conf 0.38)
  - S20↔C3: targets 3.7/3.7Å but partners are 10.9Å apart → too_far_apart by 3.5Å
  - K22↔C3: targets 7.9/3.7Å but partners are 14.4Å apart → too_far_apart by 2.8Å
  - S20↔I1: targets 3.7/4.7Å but partners are 11.6Å apart → too_far_apart by 3.3Å
- **I13** — severity 2.55, 1 conflict(s); suspect input ~`A16` (group: push_out)
  - push-out (wants farther): V8@13.6Å(now 9.3,conf 0.69)
  - V8↔A16: targets 13.6/3.8Å but partners are 5.3Å apart → too_close_together by 4.4Å
- **I10** — severity 0.89, 1 conflict(s); suspect input ~`S6` (group: push_out)
  - push-out (wants farther): S15@8.9Å(now 6.2,conf 0.84), A16@9.9Å(now 6.7,conf 0.67)
  - S15↔S6: targets 8.9/3.8Å but partners are 3.5Å apart → too_close_together by 1.5Å
- **V25** — severity 0.44, 1 conflict(s); suspect input ~`S6` (group: pull_in)
  - pull-in (wants closer): K22@3.8Å(now 6.4,conf 0.58), C7@4.2Å(now 6.7,conf 0.43)
  - K22↔S6: targets 3.8/5.2Å but partners are 10.7Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=5 · 3-10(G)=4 · coil(C)=1

```
CHHHHEHEHEHHHGHHHGGGHHHHHHEE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=8 · sheet=1
  - E5 ↔ W9  (helix)
  - W9 ↔ I13  (helix)
  - P11 ↔ S15  (helix)
  - C12 ↔ A16  (helix)
  - I13 ↔ I17  (helix)
  - I17 ↔ C21  (helix)
  - C21 ↔ V25  (helix)
  - K22 ↔ C26  (helix)
  - I10 ↔ Y27  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=155 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=92 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.4241 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
