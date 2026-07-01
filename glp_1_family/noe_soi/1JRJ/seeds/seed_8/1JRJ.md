# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_soi\1JRJ\seeds\seed_8\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.537 A
- tm_score_ca_ordered: 0.09599555441053761
- heavy_atom_rmsd: 7.259 A
- sidechain_heavy_atom_rmsd: 7.894 A
- **all-atom quality (honest):** heavy 7.259 A, sidechain 7.894 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 167
- bin_accuracy: 0.323

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D8-L25 → 332 conflicts (98%)
- explained: 332/340 conflicts by 1 root cause(s)
- metrics: hubs=22 (frac 0.595), conflicts/hub=15.5, max_incompat=12.79Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D8-L25 — explain ~332/340 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A17** — severity 104.64, 25 conflict(s); suspect input ~`W24` (group: pull_in)
  - pull-in (wants closer): K11@8.9Å(now 16.5,conf 0.88), M13@7.0Å(now 12.3,conf 0.73), S10@9.5Å(now 19.5,conf 0.73), Q12@7.8Å(now 14.8,conf 0.59), E14@5.4Å(now 10.4,conf 0.36)
  - E23↔S10: targets 7.3/9.5Å but partners are 28.7Å apart → too_far_apart by 11.9Å
  - K11↔E23: targets 8.9/7.3Å but partners are 25.8Å apart → too_far_apart by 9.5Å
  - I22↔S10: targets 6.4/9.5Å but partners are 26.9Å apart → too_far_apart by 10.9Å
- **E15** — severity 103.91, 25 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): L9@8.7Å(now 13.2,conf 0.73), L20@7.3Å(now 11.7,conf 0.73), K11@6.5Å(now 10.3,conf 0.64), I22@9.0Å(now 14.2,conf 0.64), S10@8.3Å(now 13.0,conf 0.57), F21@8.6Å(now 14.7,conf 0.57), D8@8.6Å(now 15.7,conf 0.48), Q12@5.0Å(now 7.9,conf 0.39)
  - L9↔L20: targets 8.7/7.3Å but partners are 24.4Å apart → too_far_apart by 8.4Å
  - F21↔D8: targets 8.6/8.6Å but partners are 29.8Å apart → too_far_apart by 12.6Å
  - S10↔F21: targets 8.3/8.6Å but partners are 27.3Å apart → too_far_apart by 10.4Å
- **E14** — severity 97.85, 25 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): R19@7.3Å(now 12.3,conf 0.73), F21@10.4Å(now 17.7,conf 0.73), L9@6.4Å(now 10.9,conf 0.65), L20@9.4Å(now 14.8,conf 0.59), D8@7.9Å(now 13.3,conf 0.57), S7@9.2Å(now 16.2,conf 0.48), A17@5.4Å(now 10.4,conf 0.36), V18@6.1Å(now 9.4,conf 0.31)
  - F21↔L9: targets 10.4/6.4Å but partners are 27.4Å apart → too_far_apart by 10.6Å
  - F21↔D8: targets 10.4/7.9Å but partners are 29.8Å apart → too_far_apart by 11.5Å
  - F21↔S7: targets 10.4/9.2Å but partners are 32.4Å apart → too_far_apart by 12.8Å
- **M13** — severity 89.10, 25 conflict(s); suspect input ~`T6` (group: pull_in)
  - pull-in (wants closer): V18@7.0Å(now 11.8,conf 0.76), A17@7.0Å(now 12.3,conf 0.73), D8@6.9Å(now 10.8,conf 0.73), S7@9.4Å(now 13.3,conf 0.59), L20@9.4Å(now 17.0,conf 0.59), T6@10.0Å(now 13.1,conf 0.57), R19@8.6Å(now 14.9,conf 0.57), E16@5.4Å(now 9.7,conf 0.36)
  - S7↔L20: targets 9.4/9.4Å but partners are 29.4Å apart → too_far_apart by 10.7Å
  - D8↔L20: targets 6.9/9.4Å but partners are 26.8Å apart → too_far_apart by 10.5Å
  - A17↔D8: targets 7.0/6.9Å but partners are 22.0Å apart → too_far_apart by 8.1Å
- **V18** — severity 87.99, 24 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): E23@7.0Å(now 10.3,conf 0.96), M13@7.0Å(now 11.8,conf 0.76), W24@8.6Å(now 12.8,conf 0.73), K11@9.0Å(now 16.3,conf 0.71), L25@9.2Å(now 14.1,conf 0.65), Q12@8.7Å(now 14.1,conf 0.59), F21@5.0Å(now 8.6,conf 0.39), E14@6.1Å(now 9.4,conf 0.31)
  - K11↔L25: targets 9.0/9.2Å but partners are 29.0Å apart → too_far_apart by 10.8Å
  - E23↔K11: targets 7.0/9.0Å but partners are 25.8Å apart → too_far_apart by 9.8Å
  - W24↔K11: targets 8.6/9.0Å but partners are 26.9Å apart → too_far_apart by 9.3Å
- **E16** — severity 77.72, 25 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): K11@8.6Å(now 14.2,conf 0.85), L9@10.0Å(now 17.3,conf 0.65), S10@10.1Å(now 17.1,conf 0.48), M13@5.4Å(now 9.7,conf 0.36), Q12@6.1Å(now 12.1,conf 0.31)
  - F21↔L9: targets 8.7/10.0Å but partners are 27.4Å apart → too_far_apart by 8.8Å
  - I22↔K11: targets 9.0/8.6Å but partners are 24.0Å apart → too_far_apart by 6.4Å
  - E23↔L9: targets 10.4/10.0Å but partners are 28.5Å apart → too_far_apart by 8.0Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=15 · 3-10(G)=7 · coil(C)=2

```
CEHHEGHEHGCGGEEEHGGEHHEHHEEHHEHGHEEEE
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=6 · sheet=24
  - G3 ↔ S7  (helix)
  - A17 ↔ F21  (helix)
  - F21 ↔ L25  (helix)
  - W24 ↔ G28  (helix)
  - L25 ↔ G29  (helix)
  - G29 ↔ G33  (helix)
  - E2 ↔ D8  (sheet)
  - E15 ↔ L20  (sheet)
  - E16 ↔ E23  (sheet)
  - L20 ↔ K26  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ P35  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - E23 ↔ P30  (sheet)
  - E23 ↔ A34  (sheet)
  - E23 ↔ P35  (sheet)
  - E23 ↔ P36  (sheet)
  - E23 ↔ P37  (sheet)
  - K26 ↔ A34  (sheet)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=114 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=27 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=7.5897 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
