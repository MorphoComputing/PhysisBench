# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2HIU\seeds\seed_9\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.046 A
- tm_score_ca_ordered: 0.16014270690554028
- heavy_atom_rmsd: 8.333 A
- sidechain_heavy_atom_rmsd: 9.426 A
- **all-atom quality (honest):** heavy 8.333 A, sidechain 9.426 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 221
- bin_accuracy: 0.335

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V20 → 12 conflicts (32%); C5-T7 → 9 conflicts (24%); C25 → 8 conflicts (22%)
- explained: 29/37 conflicts by 3 root cause(s)
- metrics: hubs=16 (frac 0.34), conflicts/hub=2.3, max_incompat=7.95Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V20 + C5-T7 + C25 — explain ~29/37 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K47** — severity 11.28, 4 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): G41@14.2Å(now 16.8,conf 0.43)
  - push-out (wants farther): I1@25.3Å(now 13.1,conf 0.66)
  - Y44↔I1: targets 10.2/25.3Å but partners are 7.1Å apart → too_close_together by 8.0Å
  - I1↔F43: targets 25.3/11.2Å but partners are 7.8Å apart → too_close_together by 6.2Å
  - I1↔F42: targets 25.3/12.8Å but partners are 6.8Å apart → too_close_together by 5.6Å
- **Y44** — severity 5.44, 5 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 7.7,conf 0.41)
  - G38↔C25: targets 9.2/4.3Å but partners are 18.3Å apart → too_far_apart by 4.7Å
  - E39↔C25: targets 11.3/4.3Å but partners are 18.2Å apart → too_far_apart by 2.6Å
  - R40↔C25: targets 11.0/4.3Å but partners are 17.8Å apart → too_far_apart by 2.5Å
- **C37** — severity 5.40, 4 conflict(s); suspect input ~`V20` (group: pull_in)
  - pull-in (wants closer): V20@4.9Å(now 13.7,conf 0.36)
  - push-out (wants farther): R40@9.5Å(now 4.7,conf 0.58), G41@9.8Å(now 5.1,conf 0.52), F42@8.6Å(now 5.3,conf 0.49)
  - Y34↔V20: targets 4.1/4.9Å but partners are 15.3Å apart → too_far_apart by 6.3Å
  - E31↔V20: targets 7.2/4.9Å but partners are 15.9Å apart → too_far_apart by 3.9Å
  - R40↔V20: targets 9.5/4.9Å but partners are 17.0Å apart → too_far_apart by 2.7Å
- **V20** — severity 4.84, 4 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): C37@4.9Å(now 13.7,conf 0.36)
  - push-out (wants farther): Q14@11.6Å(now 6.8,conf 0.67), E16@11.7Å(now 3.3,conf 0.67), N17@9.5Å(now 6.4,conf 0.58), L15@10.8Å(now 6.1,conf 0.34)
  - N17↔C37: targets 9.5/4.9Å but partners are 19.1Å apart → too_far_apart by 4.8Å
  - Y13↔C37: targets 10.8/4.9Å but partners are 19.8Å apart → too_far_apart by 4.1Å
  - C25↔C37: targets 6.7/4.9Å but partners are 14.6Å apart → too_far_apart by 3.1Å
- **S11** — severity 4.35, 3 conflict(s); suspect input ~`T7` (group: push_out)
  - push-out (wants farther): Q14@10.2Å(now 6.3,conf 0.69), C5@16.9Å(now 8.7,conf 0.67), T7@12.8Å(now 9.1,conf 0.52), Q4@18.0Å(now 12.2,conf 0.34)
  - C5↔T7: targets 16.9/12.8Å but partners are 0.6Å apart → too_close_together by 3.6Å
  - C5↔S8: targets 16.9/10.0Å but partners are 4.5Å apart → too_close_together by 2.5Å
  - E16↔Q4: targets 11.1/18.0Å but partners are 3.8Å apart → too_close_together by 3.1Å
- **C10** — severity 3.32, 2 conflict(s); suspect input ~`Q4` (group: push_out)
  - push-out (wants farther): T7@10.0Å(now 5.4,conf 0.72), Q4@17.0Å(now 8.6,conf 0.67), Y13@9.0Å(now 5.2,conf 0.58), C6@12.8Å(now 9.4,conf 0.52), Q14@11.2Å(now 5.5,conf 0.49), L15@12.6Å(now 7.4,conf 0.49), C5@14.3Å(now 4.8,conf 0.43), E3@16.5Å(now 8.4,conf 0.43), E16@12.0Å(now 6.3,conf 0.26), N17@11.8Å(now 9.1,conf 0.26)
  - T7↔Q4: targets 10.0/17.0Å but partners are 4.5Å apart → too_close_together by 2.6Å
  - T7↔C5: targets 10.0/14.3Å but partners are 0.6Å apart → too_close_together by 3.7Å

## Secondary Structure (DSSP-like)

- helix(H)=26 · strand(E)=17 · 3-10(G)=3 · coil(C)=1

```
CEEHHHHEHHHHHEHEHEHEEGHHHEHEGEHEHEHHHHHEEEGHHHE
```

## Backbone H-bond Network

- total=65 · helix(i→i+4)=12 · sheet=53
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - T7 ↔ S11  (helix)
  - I9 ↔ Y13  (helix)
  - S11 ↔ L15  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - S27 ↔ E31  (helix)
  - E31 ↔ L35  (helix)
  - L35 ↔ E39  (helix)
  - V2 ↔ S8  (sheet)
  - V2 ↔ E16  (sheet)
  - V2 ↔ Y18  (sheet)
  - V2 ↔ V20  (sheet)
  - V2 ↔ N21  (sheet)
  - E3 ↔ S8  (sheet)
  - E3 ↔ Q14  (sheet)
  - E3 ↔ E16  (sheet)
  - … +45 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=23 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=281 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=172 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.2459 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
