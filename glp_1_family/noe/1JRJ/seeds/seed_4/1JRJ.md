# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe\1JRJ\seeds\seed_4\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.390 A
- tm_score_ca_ordered: 0.09762241820242712
- heavy_atom_rmsd: 7.016 A
- sidechain_heavy_atom_rmsd: 7.362 A
- **all-atom quality (honest):** heavy 7.016 A, sidechain 7.362 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 90
- bin_accuracy: 0.567

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L9-F21 → 77 conflicts (93%)
- explained: 77/83 conflicts by 1 root cause(s)
- metrics: hubs=15 (frac 0.405), conflicts/hub=5.5, max_incompat=9.91Å, chain_span=0.432
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L9-F21 — explain ~77/83 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q12** — severity 22.58, 12 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): L9@5.0Å(now 8.2,conf 0.40), E15@5.0Å(now 9.1,conf 0.40), D8@6.1Å(now 9.4,conf 0.33), E16@6.1Å(now 12.8,conf 0.33)
  - D8↔E16: targets 6.1/6.1Å but partners are 22.0Å apart → too_far_apart by 9.7Å
  - L9↔E16: targets 5.0/6.1Å but partners are 20.8Å apart → too_far_apart by 9.6Å
  - L9↔E15: targets 5.0/5.0Å but partners are 17.1Å apart → too_far_apart by 7.0Å
- **E14** — severity 16.43, 8 conflict(s); suspect input ~`K11` (group: pull_in)
  - pull-in (wants closer): K11@5.4Å(now 9.8,conf 0.37), A17@5.4Å(now 11.2,conf 0.37), V18@6.1Å(now 9.9,conf 0.33)
  - K11↔A17: targets 5.4/5.4Å but partners are 20.7Å apart → too_far_apart by 9.9Å
  - Q12↔A17: targets 5.4/5.4Å but partners are 17.2Å apart → too_far_apart by 6.3Å
  - K11↔V18: targets 5.4/6.1Å but partners are 18.7Å apart → too_far_apart by 7.2Å
- **E16** — severity 14.42, 8 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): M13@5.4Å(now 10.6,conf 0.37), Q12@6.1Å(now 12.8,conf 0.33)
  - Q12↔L20: targets 6.1/6.1Å but partners are 19.9Å apart → too_far_apart by 7.6Å
  - A17↔Q12: targets 3.8/6.1Å but partners are 17.2Å apart → too_far_apart by 7.2Å
  - A17↔M13: targets 3.8/5.4Å but partners are 15.0Å apart → too_far_apart by 5.8Å
- **E15** — severity 10.77, 5 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): A17@5.4Å(now 8.1,conf 0.75), Q12@5.0Å(now 9.1,conf 0.40)
  - A17↔M13: targets 5.4/5.4Å but partners are 15.0Å apart → too_far_apart by 4.2Å
  - A17↔Q12: targets 5.4/5.0Å but partners are 17.2Å apart → too_far_apart by 6.7Å
  - Q12↔V18: targets 5.0/5.0Å but partners are 15.3Å apart → too_far_apart by 5.2Å
- **M13** — severity 9.86, 6 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): E16@5.4Å(now 10.6,conf 0.37), L9@6.8Å(now 10.7,conf 0.23)
  - S10↔E16: targets 5.4/5.4Å but partners are 17.5Å apart → too_far_apart by 6.7Å
  - K11↔E16: targets 5.4/5.4Å but partners are 16.4Å apart → too_far_apart by 5.6Å
  - E16↔L9: targets 5.4/6.8Å but partners are 20.8Å apart → too_far_apart by 8.5Å
- **K11** — severity 7.64, 6 conflict(s); suspect input ~`E14` (group: pull_in)
  - pull-in (wants closer): E14@5.4Å(now 9.8,conf 0.37), S7@6.1Å(now 8.7,conf 0.33)
  - E14↔S7: targets 5.4/6.1Å but partners are 18.2Å apart → too_far_apart by 6.7Å
  - D8↔E14: targets 5.0/5.4Å but partners are 15.2Å apart → too_far_apart by 4.8Å
  - L9↔E14: targets 5.4/5.4Å but partners are 14.4Å apart → too_far_apart by 3.6Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=15 · 3-10(G)=1 · coil(C)=1

```
CEHHEHGHHHHEEEEEHHHHEEEHHHEHHEHHHEEHE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=8 · sheet=17
  - T4 ↔ D8  (helix)
  - T6 ↔ S10  (helix)
  - L20 ↔ W24  (helix)
  - W24 ↔ G28  (helix)
  - L25 ↔ G29  (helix)
  - G28 ↔ S32  (helix)
  - G29 ↔ G33  (helix)
  - S32 ↔ P36  (helix)
  - E16 ↔ F21  (sheet)
  - E16 ↔ I22  (sheet)
  - F21 ↔ N27  (sheet)
  - F21 ↔ P30  (sheet)
  - F21 ↔ P37  (sheet)
  - I22 ↔ N27  (sheet)
  - I22 ↔ P30  (sheet)
  - I22 ↔ P35  (sheet)
  - I22 ↔ P37  (sheet)
  - E23 ↔ P30  (sheet)
  - E23 ↔ P35  (sheet)
  - E23 ↔ P37  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=112 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=33 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2156 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
