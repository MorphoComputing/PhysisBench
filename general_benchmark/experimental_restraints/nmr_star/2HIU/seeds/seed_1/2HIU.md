# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\experimental_restraints\nmr_star\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.772 A
- tm_score_ca_ordered: 0.12002655829487155
- heavy_atom_rmsd: 8.974 A
- sidechain_heavy_atom_rmsd: 9.987 A
- **all-atom quality (honest):** heavy 8.974 A, sidechain 9.987 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 57
- distogram_pairs: 58
- bin_accuracy: 0.328

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C6-C19 → 25 conflicts (96%)
- explained: 25/26 conflicts by 1 root cause(s)
- metrics: hubs=10 (frac 0.213), conflicts/hub=2.6, max_incompat=7.56Å, chain_span=0.298
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C6-C19 — explain ~25/26 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L15** — severity 5.00, 4 conflict(s); suspect input ~`Y13` (group: pull_in)
  - pull-in (wants closer): C19@4.5Å(now 9.4,conf 0.39), S11@3.5Å(now 6.9,conf 0.16)
  - Y13↔C19: targets 4.5/4.5Å but partners are 14.9Å apart → too_far_apart by 5.8Å
  - C19↔S11: targets 4.5/3.5Å but partners are 15.6Å apart → too_far_apart by 7.6Å
  - L12↔C19: targets 4.5/4.5Å but partners are 11.7Å apart → too_far_apart by 2.7Å
- **Q14** — severity 3.71, 5 conflict(s); suspect input ~`C6` (group: pull_in)
  - pull-in (wants closer): C6@4.0Å(now 9.9,conf 0.23), C10@3.5Å(now 7.9,conf 0.16), Y18@3.5Å(now 6.3,conf 0.16)
  - N17↔C6: targets 4.5/4.0Å but partners are 14.0Å apart → too_far_apart by 5.5Å
  - C6↔Y18: targets 4.0/3.5Å but partners are 11.9Å apart → too_far_apart by 4.4Å
  - N17↔C10: targets 4.5/3.5Å but partners are 12.4Å apart → too_far_apart by 4.4Å
- **N17** — severity 2.56, 2 conflict(s); suspect input ~`Y13` (group: pull_in)
  - pull-in (wants closer): Y13@4.5Å(now 10.2,conf 0.39)
  - Y13↔C19: targets 4.5/4.5Å but partners are 14.9Å apart → too_far_apart by 5.8Å
  - Y13↔V20: targets 4.5/3.5Å but partners are 9.8Å apart → too_far_apart by 1.8Å
- **Y13** — severity 2.53, 3 conflict(s); suspect input ~`N17` (group: pull_in)
  - pull-in (wants closer): N17@4.5Å(now 10.2,conf 0.39), E16@4.5Å(now 7.4,conf 0.39)
  - N17↔C10: targets 4.5/4.5Å but partners are 12.4Å apart → too_far_apart by 3.4Å
  - N17↔I9: targets 4.5/3.5Å but partners are 13.3Å apart → too_far_apart by 5.2Å
  - E16↔I9: targets 4.5/3.5Å but partners are 10.4Å apart → too_far_apart by 2.3Å
- **L12** — severity 2.14, 3 conflict(s); suspect input ~`S8` (group: pull_in)
  - pull-in (wants closer): S8@3.5Å(now 10.3,conf 0.16)
  - L24↔S8: targets 5.5/3.5Å but partners are 14.5Å apart → too_far_apart by 5.4Å
  - L15↔S8: targets 4.5/3.5Å but partners are 12.5Å apart → too_far_apart by 4.5Å
  - E16↔S8: targets 6.1/3.5Å but partners are 13.3Å apart → too_far_apart by 3.7Å
- **S11** — severity 1.74, 2 conflict(s); suspect input ~`S8` (group: pull_in)
  - pull-in (wants closer): G26@5.8Å(now 9.7,conf 0.23), L15@3.5Å(now 6.9,conf 0.16)
  - G26↔S8: targets 5.8/3.5Å but partners are 14.8Å apart → too_far_apart by 5.5Å
  - S8↔L15: targets 3.5/3.5Å but partners are 12.5Å apart → too_far_apart by 5.4Å

## Secondary Structure (DSSP-like)

- helix(H)=35 · strand(E)=4 · 3-10(G)=7 · coil(C)=1

```
CHGHHHHHHHEHEGHHGHHHHHGGHEHHGGHHHHHHHHHHHHHHHHE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=21 · sheet=2
  - V2 ↔ C6  (helix)
  - Q4 ↔ S8  (helix)
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - S8 ↔ L12  (helix)
  - L12 ↔ E16  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - Y18 ↔ Q22  (helix)
  - N21 ↔ C25  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L33 ↔ C37  (helix)
  - L35 ↔ E39  (helix)
  - V36 ↔ R40  (helix)
  - C37 ↔ G41  (helix)
  - G38 ↔ F42  (helix)
  - E39 ↔ F43  (helix)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=20 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=426 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=281 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.9947 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=57 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
