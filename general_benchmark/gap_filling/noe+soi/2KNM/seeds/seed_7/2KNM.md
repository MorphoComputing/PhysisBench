# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2KNM\seeds\seed_7\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 5.894 A
- tm_score_ca_ordered: 0.12030918351713664
- heavy_atom_rmsd: 6.820 A
- sidechain_heavy_atom_rmsd: 7.617 A
- **all-atom quality (honest):** heavy 6.820 A, sidechain 7.617 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 133
- bin_accuracy: 0.383

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** I17-S20 → 26 conflicts (70%); E5-S6 → 7 conflicts (19%)
- explained: 33/37 conflicts by 2 root cause(s)
- metrics: hubs=13 (frac 0.464), conflicts/hub=2.8, max_incompat=5.72Å, chain_span=0.893
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): I17-S20 + E5-S6 — explain ~33/37 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S14** — severity 18.89, 10 conflict(s); suspect input ~`E5` (group: push_out)
  - pull-in (wants closer): G18@3.4Å(now 6.8,conf 0.79), I10@8.4Å(now 12.7,conf 0.59), E5@3.8Å(now 9.6,conf 0.58), I17@3.8Å(now 6.7,conf 0.58)
  - push-out (wants farther): C21@8.8Å(now 5.7,conf 0.52)
  - G18↔E5: targets 3.4/3.8Å but partners are 13.0Å apart → too_far_apart by 5.7Å
  - G18↔I10: targets 3.4/8.4Å but partners are 17.0Å apart → too_far_apart by 5.2Å
  - W9↔G18: targets 11.1/3.4Å but partners are 17.9Å apart → too_far_apart by 3.3Å
- **I17** — severity 8.52, 5 conflict(s); suspect input ~`S14` (group: pull_in)
  - pull-in (wants closer): I10@11.4Å(now 15.2,conf 0.82), S14@3.8Å(now 6.7,conf 0.58)
  - push-out (wants farther): K24@13.2Å(now 10.5,conf 0.91), S23@14.3Å(now 10.7,conf 0.67), K22@13.1Å(now 9.4,conf 0.58)
  - S23↔C12: targets 14.3/7.1Å but partners are 4.0Å apart → too_close_together by 3.2Å
  - K24↔C12: targets 13.2/7.1Å but partners are 3.4Å apart → too_close_together by 2.8Å
  - C21↔S14: targets 12.7/3.8Å but partners are 5.7Å apart → too_close_together by 3.1Å
- **I13** — severity 8.08, 5 conflict(s); suspect input ~`S6` (group: push_out)
  - pull-in (wants closer): S6@5.5Å(now 9.6,conf 0.67), E5@3.8Å(now 7.1,conf 0.58)
  - push-out (wants farther): C19@6.8Å(now 3.7,conf 0.82)
  - G18↔S6: targets 6.4/5.5Å but partners are 14.8Å apart → too_far_apart by 3.0Å
  - S6↔V8: targets 5.5/11.7Å but partners are 3.3Å apart → too_close_together by 2.9Å
  - G18↔E5: targets 6.4/3.8Å but partners are 13.0Å apart → too_far_apart by 2.8Å
- **C26** — severity 4.37, 3 conflict(s); suspect input ~`S20` (group: push_out)
  - pull-in (wants closer): E5@3.8Å(now 6.8,conf 0.58), S6@4.2Å(now 7.9,conf 0.43)
  - push-out (wants farther): S23@8.6Å(now 5.8,conf 0.67)
  - S6↔S20: targets 4.2/4.5Å but partners are 13.0Å apart → too_far_apart by 4.4Å
  - E5↔S20: targets 3.8/4.5Å but partners are 12.3Å apart → too_far_apart by 4.0Å
  - C19↔S6: targets 6.4/4.2Å but partners are 13.1Å apart → too_far_apart by 2.6Å
- **Y27** — severity 3.85, 3 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): S20@3.7Å(now 7.7,conf 0.61)
  - S20↔C3: targets 3.7/3.7Å but partners are 10.1Å apart → too_far_apart by 2.7Å
  - S20↔P2: targets 3.7/4.5Å but partners are 10.9Å apart → too_far_apart by 2.8Å
  - S20↔I1: targets 3.7/4.7Å but partners are 11.2Å apart → too_far_apart by 2.9Å
- **K22** — severity 2.50, 2 conflict(s); suspect input ~`V25` (group: pull_in)
  - pull-in (wants closer): V25@3.8Å(now 7.2,conf 0.58)
  - push-out (wants farther): S15@9.4Å(now 5.5,conf 0.82), G18@11.0Å(now 7.6,conf 0.67), I17@13.1Å(now 9.4,conf 0.58)
  - A16↔V25: targets 11.6/3.8Å but partners are 5.3Å apart → too_close_together by 2.5Å
  - I17↔V25: targets 13.1/3.8Å but partners are 7.5Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=8 · 3-10(G)=4 · coil(C)=1

```
CEGHGHHHHEEHGHHHEGHEHHEHHHEE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=4 · sheet=14
  - G4 ↔ V8  (helix)
  - V8 ↔ C12  (helix)
  - C12 ↔ A16  (helix)
  - K22 ↔ C26  (helix)
  - P2 ↔ I10  (sheet)
  - P2 ↔ P11  (sheet)
  - P2 ↔ I17  (sheet)
  - P2 ↔ S20  (sheet)
  - I10 ↔ S23  (sheet)
  - P11 ↔ I17  (sheet)
  - P11 ↔ S20  (sheet)
  - P11 ↔ S23  (sheet)
  - P11 ↔ Y27  (sheet)
  - I17 ↔ S23  (sheet)
  - I17 ↔ Y27  (sheet)
  - I17 ↔ R28  (sheet)
  - S20 ↔ Y27  (sheet)
  - S20 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=156 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=99 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.8062 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
