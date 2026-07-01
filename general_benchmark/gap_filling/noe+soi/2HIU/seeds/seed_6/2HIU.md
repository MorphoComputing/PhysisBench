# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2HIU\seeds\seed_6\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 8.137 A
- tm_score_ca_ordered: 0.11611647308972377
- heavy_atom_rmsd: 9.557 A
- sidechain_heavy_atom_rmsd: 10.719 A
- **all-atom quality (honest):** heavy 9.557 A, sidechain 10.719 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 8
- distogram_pairs: 221
- bin_accuracy: 0.339

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C25 → 50 conflicts (45%); T45 → 11 conflicts (10%)
- explained: 61/112 conflicts by 2 root cause(s)
- metrics: hubs=28 (frac 0.596), conflicts/hub=4.0, max_incompat=10.55Å, chain_span=0.979
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C25 + T45 — explain ~61/112 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 42.74, 22 conflict(s); suspect input ~`N21` (group: push_out)
  - pull-in (wants closer): E31@10.8Å(now 17.4,conf 0.82), V30@8.4Å(now 15.7,conf 0.69), L29@6.0Å(now 13.3,conf 0.59), H28@5.5Å(now 8.8,conf 0.58), A32@12.4Å(now 16.6,conf 0.52), Y44@4.3Å(now 10.2,conf 0.41), P46@4.5Å(now 13.7,conf 0.39), T45@4.5Å(now 12.5,conf 0.39)
  - push-out (wants farther): Y18@10.1Å(now 4.0,conf 0.49)
  - P46↔N21: targets 4.5/4.5Å but partners are 19.6Å apart → too_far_apart by 10.6Å
  - P46↔Q22: targets 4.5/4.5Å but partners are 18.7Å apart → too_far_apart by 9.7Å
  - N21↔T45: targets 4.5/4.5Å but partners are 18.2Å apart → too_far_apart by 9.2Å
- **Y44** — severity 15.52, 8 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 10.2,conf 0.41), S27@4.5Å(now 12.4,conf 0.39)
  - G41↔C25: targets 8.6/4.3Å but partners are 19.2Å apart → too_far_apart by 6.3Å
  - G38↔C25: targets 9.5/4.3Å but partners are 19.6Å apart → too_far_apart by 5.8Å
  - R40↔C25: targets 8.4/4.3Å but partners are 18.1Å apart → too_far_apart by 5.4Å
- **L24** — severity 13.97, 8 conflict(s); suspect input ~`T45` (group: pull_in)
  - pull-in (wants closer): T45@4.5Å(now 13.7,conf 0.39)
  - push-out (wants farther): C19@8.4Å(now 3.9,conf 0.59), Y18@10.6Å(now 6.9,conf 0.49), S27@5.8Å(now 2.8,conf 0.40)
  - L29↔T45: targets 4.3/4.5Å but partners are 15.6Å apart → too_far_apart by 6.7Å
  - N21↔T45: targets 7.0/4.5Å but partners are 18.2Å apart → too_far_apart by 6.7Å
  - V30↔T45: targets 6.4/4.5Å but partners are 17.3Å apart → too_far_apart by 6.4Å
- **C37** — severity 12.56, 7 conflict(s); suspect input ~`V20` (group: pull_in)
  - pull-in (wants closer): V20@4.9Å(now 15.5,conf 0.36)
  - push-out (wants farther): A32@9.0Å(now 5.5,conf 0.94), V30@8.5Å(now 5.7,conf 0.82), E31@8.8Å(now 4.2,conf 0.82)
  - Y34↔V20: targets 4.1/4.9Å but partners are 17.3Å apart → too_far_apart by 8.3Å
  - R40↔V20: targets 9.0/4.9Å but partners are 21.1Å apart → too_far_apart by 7.3Å
  - G41↔V20: targets 11.0/4.9Å but partners are 22.6Å apart → too_far_apart by 6.8Å
- **H28** — severity 11.71, 14 conflict(s); suspect input ~`L35` (group: push_out)
  - pull-in (wants closer): N21@8.4Å(now 11.4,conf 0.69), C25@5.5Å(now 8.8,conf 0.58), F43@5.2Å(now 9.9,conf 0.26), F42@5.7Å(now 9.4,conf 0.23)
  - push-out (wants farther): A32@11.8Å(now 8.6,conf 0.52)
  - C25↔L35: targets 5.5/9.8Å but partners are 18.2Å apart → too_far_apart by 3.0Å
  - E31↔C25: targets 9.6/5.5Å but partners are 17.4Å apart → too_far_apart by 2.3Å
  - N21↔L35: targets 8.4/9.8Å but partners are 20.6Å apart → too_far_apart by 2.5Å
- **T45** — severity 9.46, 7 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): C25@4.5Å(now 12.5,conf 0.39), L24@4.5Å(now 13.7,conf 0.39), G38@8.8Å(now 13.4,conf 0.34)
  - C25↔G38: targets 4.5/8.8Å but partners are 19.6Å apart → too_far_apart by 6.3Å
  - E39↔C25: targets 9.5/4.5Å but partners are 18.3Å apart → too_far_apart by 4.3Å
  - G41↔C25: targets 10.4/4.5Å but partners are 19.2Å apart → too_far_apart by 4.2Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=19 · 3-10(G)=5 · coil(C)=4

```
EEEEEHHHEHEHHGGHHHHCGECHHEHHEEEGHEHHEGECHEHCEEE
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=5 · sheet=29
  - C6 ↔ C10  (helix)
  - S8 ↔ L12  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L24 ↔ H28  (helix)
  - I1 ↔ I9  (sheet)
  - I1 ↔ S11  (sheet)
  - V2 ↔ I9  (sheet)
  - V2 ↔ S11  (sheet)
  - E3 ↔ I9  (sheet)
  - E3 ↔ S11  (sheet)
  - Q4 ↔ I9  (sheet)
  - Q4 ↔ S11  (sheet)
  - C5 ↔ S11  (sheet)
  - C5 ↔ Q22  (sheet)
  - I9 ↔ Q22  (sheet)
  - I9 ↔ G26  (sheet)
  - S11 ↔ G26  (sheet)
  - Q22 ↔ L29  (sheet)
  - G26 ↔ E31  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=182 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=83 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.8569 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=8 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
