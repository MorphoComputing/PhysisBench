# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 3.158 A
- tm_score_ca_ordered: 0.26591570918711954
- heavy_atom_rmsd: 3.961 A
- sidechain_heavy_atom_rmsd: 4.562 A
- **all-atom quality (honest):** heavy 3.961 A, sidechain 4.562 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 134
- bin_accuracy: 0.455

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G18-S20 → 17 conflicts (68%); C26-Y27 → 4 conflicts (16%); S14 → 3 conflicts (12%)
- explained: 24/25 conflicts by 3 root cause(s)
- metrics: hubs=9 (frac 0.321), conflicts/hub=2.8, max_incompat=5.75Å, chain_span=0.821
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G18-S20 + C26-Y27 + S14 — explain ~24/25 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S14** — severity 8.73, 4 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): G18@3.8Å(now 9.6,conf 0.69), E5@3.8Å(now 7.0,conf 0.58), I17@3.8Å(now 8.2,conf 0.58)
  - G18↔E5: targets 3.8/3.8Å but partners are 13.3Å apart → too_far_apart by 5.8Å
  - E5↔I17: targets 3.8/3.8Å but partners are 11.1Å apart → too_far_apart by 3.5Å
  - E5↔C19: targets 3.8/3.8Å but partners are 10.6Å apart → too_far_apart by 3.0Å
- **C26** — severity 8.39, 6 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): C3@3.8Å(now 6.9,conf 0.58), E5@3.8Å(now 8.1,conf 0.58), S6@4.2Å(now 7.1,conf 0.43)
  - K22↔E5: targets 5.1/3.8Å but partners are 12.8Å apart → too_far_apart by 3.9Å
  - E5↔S20: targets 3.8/4.5Å but partners are 12.6Å apart → too_far_apart by 4.3Å
  - K22↔C3: targets 5.1/3.8Å but partners are 11.5Å apart → too_far_apart by 2.6Å
- **Y27** — severity 8.18, 6 conflict(s); suspect input ~`P2` (group: pull_in)
  - pull-in (wants closer): C3@3.7Å(now 6.6,conf 0.60), P2@4.5Å(now 9.0,conf 0.39), I1@4.7Å(now 7.8,conf 0.38)
  - S20↔C3: targets 3.7/3.7Å but partners are 10.8Å apart → too_far_apart by 3.5Å
  - S20↔P2: targets 3.7/4.5Å but partners are 13.4Å apart → too_far_apart by 5.2Å
  - S20↔I1: targets 3.7/4.7Å but partners are 12.1Å apart → too_far_apart by 3.8Å
- **G18** — severity 2.36, 2 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): S14@3.8Å(now 9.6,conf 0.69), S15@3.8Å(now 7.2,conf 0.58)
  - I13↔S15: targets 6.9/3.8Å but partners are 0.9Å apart → too_close_together by 2.2Å
  - S14↔V25: targets 3.8/11.0Å but partners are 5.4Å apart → too_close_together by 1.8Å
- **R28** — severity 1.93, 3 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): C21@7.6Å(now 10.1,conf 0.69), I1@3.7Å(now 6.7,conf 0.60), P2@4.3Å(now 8.5,conf 0.41)
  - P2↔C19: targets 4.3/4.7Å but partners are 11.3Å apart → too_far_apart by 2.2Å
  - P2↔S20: targets 4.3/6.1Å but partners are 13.4Å apart → too_far_apart by 3.0Å
  - I1↔S20: targets 3.7/6.1Å but partners are 12.1Å apart → too_far_apart by 2.3Å
- **S15** — severity 1.37, 1 conflict(s); suspect input ~`G18` (group: pull_in)
  - pull-in (wants closer): G18@3.8Å(now 7.2,conf 0.58)
  - W9↔G18: targets 11.8/3.8Å but partners are 18.0Å apart → too_far_apart by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=9 · 3-10(G)=4 · coil(C)=3

```
CEHHEEHCGGGCEHEHEHHGHEHHHHEE
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=3 · sheet=19
  - C3 ↔ C7  (helix)
  - S14 ↔ G18  (helix)
  - C19 ↔ S23  (helix)
  - P2 ↔ I13  (sheet)
  - P2 ↔ S15  (sheet)
  - P2 ↔ K22  (sheet)
  - E5 ↔ I13  (sheet)
  - E5 ↔ S15  (sheet)
  - E5 ↔ I17  (sheet)
  - S6 ↔ I13  (sheet)
  - S6 ↔ S15  (sheet)
  - S6 ↔ K22  (sheet)
  - I13 ↔ K22  (sheet)
  - I13 ↔ Y27  (sheet)
  - I13 ↔ R28  (sheet)
  - S15 ↔ K22  (sheet)
  - S15 ↔ Y27  (sheet)
  - S15 ↔ R28  (sheet)
  - I17 ↔ Y27  (sheet)
  - I17 ↔ R28  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=133 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=74 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.0732 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
