# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2HIU\seeds\seed_2\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 8.030 A
- tm_score_ca_ordered: 0.10807157708643007
- heavy_atom_rmsd: 9.224 A
- sidechain_heavy_atom_rmsd: 10.179 A
- **all-atom quality (honest):** heavy 9.224 A, sidechain 10.179 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 221
- bin_accuracy: 0.339

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C25 → 41 conflicts (56%)
- explained: 41/73 conflicts by 1 root cause(s)
- metrics: hubs=22 (frac 0.468), conflicts/hub=3.3, max_incompat=7.53Å, chain_span=0.915
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C25 — explain ~41/73 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 14.61, 12 conflict(s); suspect input ~`N21` (group: pull_in)
  - pull-in (wants closer): V30@8.7Å(now 13.4,conf 0.82), A32@11.5Å(now 14.4,conf 0.67), H28@6.1Å(now 12.7,conf 0.67), L29@6.0Å(now 9.2,conf 0.59), E31@10.0Å(now 15.4,conf 0.59), Y44@4.3Å(now 10.4,conf 0.41), C19@9.4Å(now 12.4,conf 0.40), P46@4.5Å(now 12.2,conf 0.39), N21@4.5Å(now 12.0,conf 0.39), Q22@4.5Å(now 9.1,conf 0.39), T45@4.5Å(now 10.5,conf 0.39)
  - P46↔N21: targets 4.5/4.5Å but partners are 15.8Å apart → too_far_apart by 6.8Å
  - P46↔Q22: targets 4.5/4.5Å but partners are 15.2Å apart → too_far_apart by 6.2Å
  - N21↔T45: targets 4.5/4.5Å but partners are 13.3Å apart → too_far_apart by 4.3Å
- **V30** — severity 12.76, 6 conflict(s); suspect input ~`L35` (group: pull_in)
  - pull-in (wants closer): C25@8.7Å(now 13.4,conf 0.82), H23@6.9Å(now 10.6,conf 0.67)
  - H23↔L35: targets 6.9/3.9Å but partners are 15.0Å apart → too_far_apart by 4.2Å
  - C25↔L35: targets 8.7/3.9Å but partners are 16.2Å apart → too_far_apart by 3.6Å
  - C25↔Y34: targets 8.7/4.5Å but partners are 19.2Å apart → too_far_apart by 6.0Å
- **Y44** — severity 12.61, 7 conflict(s); suspect input ~`C25` (group: push_out)
  - pull-in (wants closer): C25@4.3Å(now 10.4,conf 0.41), S27@4.5Å(now 9.6,conf 0.39)
  - push-out (wants farther): C37@8.4Å(now 4.3,conf 0.49)
  - C25↔S27: targets 4.3/4.5Å but partners are 15.3Å apart → too_far_apart by 6.5Å
  - G41↔C25: targets 9.0/4.3Å but partners are 19.1Å apart → too_far_apart by 5.8Å
  - E39↔C25: targets 9.3/4.3Å but partners are 19.3Å apart → too_far_apart by 5.7Å
- **L29** — severity 11.29, 6 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): L35@5.5Å(now 8.4,conf 0.82), C25@6.0Å(now 9.2,conf 0.59)
  - Y34↔C25: targets 8.1/6.0Å but partners are 19.2Å apart → too_far_apart by 5.1Å
  - L35↔C25: targets 5.5/6.0Å but partners are 16.2Å apart → too_far_apart by 4.7Å
  - L35↔H23: targets 5.5/6.4Å but partners are 15.0Å apart → too_far_apart by 3.1Å
- **C37** — severity 9.10, 7 conflict(s); suspect input ~`V20` (group: push_out)
  - pull-in (wants closer): Y34@4.1Å(now 10.3,conf 0.43), V20@4.9Å(now 10.6,conf 0.36), L33@5.6Å(now 8.2,conf 0.23)
  - push-out (wants farther): F43@8.5Å(now 5.4,conf 0.49), Y44@8.4Å(now 4.3,conf 0.49)
  - Y34↔V20: targets 4.1/4.9Å but partners are 16.5Å apart → too_far_apart by 7.5Å
  - R40↔V20: targets 8.2/4.9Å but partners are 16.6Å apart → too_far_apart by 3.5Å
  - A32↔V20: targets 7.4/4.9Å but partners are 15.6Å apart → too_far_apart by 3.4Å
- **T45** — severity 6.55, 5 conflict(s); suspect input ~`C25` (group: push_out)
  - pull-in (wants closer): C25@4.5Å(now 10.5,conf 0.39), L24@4.5Å(now 12.1,conf 0.39)
  - push-out (wants farther): G38@10.6Å(now 6.0,conf 0.49)
  - G41↔C25: targets 10.5/4.5Å but partners are 19.1Å apart → too_far_apart by 4.1Å
  - E39↔C25: targets 10.9/4.5Å but partners are 19.3Å apart → too_far_apart by 3.9Å
  - R40↔C25: targets 11.7/4.5Å but partners are 19.8Å apart → too_far_apart by 3.6Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=17 · 3-10(G)=4 · coil(C)=2

```
CHEHEHHEGEEHHHGEEHHHHHEHHEHEHEEHCEGEHHHHHHHEGEE
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=8 · sheet=34
  - V2 ↔ C6  (helix)
  - Q14 ↔ Y18  (helix)
  - Y18 ↔ Q22  (helix)
  - V20 ↔ L24  (helix)
  - N21 ↔ C25  (helix)
  - C25 ↔ L29  (helix)
  - C37 ↔ G41  (helix)
  - G38 ↔ F42  (helix)
  - E3 ↔ S8  (sheet)
  - E3 ↔ C10  (sheet)
  - E3 ↔ S11  (sheet)
  - C5 ↔ C10  (sheet)
  - C5 ↔ S11  (sheet)
  - E16 ↔ H23  (sheet)
  - E16 ↔ G26  (sheet)
  - E16 ↔ H28  (sheet)
  - E16 ↔ V30  (sheet)
  - E16 ↔ V36  (sheet)
  - N17 ↔ H23  (sheet)
  - N17 ↔ G26  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=221 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=131 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=5.4358 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
