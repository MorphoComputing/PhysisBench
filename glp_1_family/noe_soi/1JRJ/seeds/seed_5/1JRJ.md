# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_soi\1JRJ\seeds\seed_5\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.653 A
- tm_score_ca_ordered: 0.0919536764200033
- heavy_atom_rmsd: 7.865 A
- sidechain_heavy_atom_rmsd: 7.771 A
- **all-atom quality (honest):** heavy 7.865 A, sidechain 7.771 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 212
- bin_accuracy: 0.552

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L9-L25 → 219 conflicts (100%)
- explained: 219/219 conflicts by 1 root cause(s)
- metrics: hubs=16 (frac 0.432), conflicts/hub=13.7, max_incompat=8.95Å, chain_span=0.432
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L9-L25 — explain ~219/219 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A17** — severity 61.42, 26 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): M13@7.1Å(now 10.7,conf 0.88), W24@8.5Å(now 12.7,conf 0.64), S10@10.5Å(now 16.5,conf 0.59), Q12@7.8Å(now 12.6,conf 0.59), K11@9.6Å(now 15.6,conf 0.57), E14@5.4Å(now 8.0,conf 0.36)
  - W24↔S10: targets 8.5/10.5Å but partners are 27.4Å apart → too_far_apart by 8.4Å
  - W24↔K11: targets 8.5/9.6Å but partners are 26.5Å apart → too_far_apart by 8.3Å
  - W24↔Q12: targets 8.5/7.8Å but partners are 23.9Å apart → too_far_apart by 7.6Å
- **E16** — severity 55.29, 26 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): K11@8.0Å(now 12.3,conf 0.65), S10@8.2Å(now 13.0,conf 0.59), I22@6.7Å(now 9.4,conf 0.57), L9@9.2Å(now 16.4,conf 0.57), Q12@6.1Å(now 9.3,conf 0.31)
  - I22↔L9: targets 6.7/9.2Å but partners are 24.9Å apart → too_far_apart by 8.9Å
  - F21↔L9: targets 7.4/9.2Å but partners are 24.9Å apart → too_far_apart by 8.3Å
  - E23↔L9: targets 10.2/9.2Å but partners are 26.8Å apart → too_far_apart by 7.3Å
- **V18** — severity 50.75, 20 conflict(s); suspect input ~`W24` (group: pull_in)
  - pull-in (wants closer): M13@7.0Å(now 9.6,conf 0.88), K11@10.6Å(now 14.1,conf 0.73), L25@9.0Å(now 12.5,conf 0.73), W24@8.0Å(now 12.7,conf 0.65), Q12@8.5Å(now 11.3,conf 0.64)
  - K11↔W24: targets 10.6/8.0Å but partners are 26.5Å apart → too_far_apart by 7.9Å
  - W24↔Q12: targets 8.0/8.5Å but partners are 23.9Å apart → too_far_apart by 7.4Å
  - M13↔W24: targets 7.0/8.0Å but partners are 22.3Å apart → too_far_apart by 7.2Å
- **E15** — severity 48.33, 21 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): L20@7.1Å(now 10.8,conf 0.85), F21@8.7Å(now 12.3,conf 0.85), D8@9.7Å(now 12.8,conf 0.73), L9@9.4Å(now 13.3,conf 0.59), I22@9.4Å(now 13.0,conf 0.59)
  - F21↔D8: targets 8.7/9.7Å but partners are 24.1Å apart → too_far_apart by 5.7Å
  - L20↔D8: targets 7.1/9.7Å but partners are 22.4Å apart → too_far_apart by 5.6Å
  - L20↔L9: targets 7.1/9.4Å but partners are 23.4Å apart → too_far_apart by 6.9Å
- **E14** — severity 29.94, 16 conflict(s); suspect input ~`F21` (group: pull_in)
  - pull-in (wants closer): L9@8.9Å(now 12.3,conf 0.88), L20@9.3Å(now 12.5,conf 0.59), F21@9.4Å(now 13.7,conf 0.57), A17@5.4Å(now 8.0,conf 0.36)
  - L9↔F21: targets 8.9/9.4Å but partners are 24.9Å apart → too_far_apart by 6.7Å
  - L9↔L20: targets 8.9/9.3Å but partners are 23.4Å apart → too_far_apart by 5.2Å
  - S10↔F21: targets 7.3/9.4Å but partners are 21.6Å apart → too_far_apart by 5.0Å
- **L20** — severity 27.40, 15 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): E15@7.1Å(now 10.8,conf 0.85), E14@9.3Å(now 12.5,conf 0.59), M13@9.0Å(now 14.5,conf 0.51)
  - N27↔E15: targets 10.8/7.1Å but partners are 21.8Å apart → too_far_apart by 3.9Å
  - N27↔M13: targets 10.8/9.0Å but partners are 25.3Å apart → too_far_apart by 5.5Å
  - E15↔W24: targets 7.1/8.6Å but partners are 18.8Å apart → too_far_apart by 3.1Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=15 · 3-10(G)=5 · coil(C)=5

```
CEEECECEHGHEHEGEHGGECHEHHGHHHEHEHCEEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=6 · sheet=13
  - L9 ↔ M13  (helix)
  - M13 ↔ A17  (helix)
  - W24 ↔ G28  (helix)
  - L25 ↔ G29  (helix)
  - N27 ↔ S31  (helix)
  - G29 ↔ G33  (helix)
  - T4 ↔ Q12  (sheet)
  - T6 ↔ Q12  (sheet)
  - E16 ↔ E23  (sheet)
  - L20 ↔ P35  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - E23 ↔ P30  (sheet)
  - E23 ↔ S32  (sheet)
  - E23 ↔ P35  (sheet)
  - E23 ↔ P36  (sheet)
  - E23 ↔ P37  (sheet)
  - P30 ↔ P35  (sheet)
  - P30 ↔ P36  (sheet)

## Solvent Accessibility (burial)

- buried=11 · exposed=18 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=110 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=26 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.8965 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
