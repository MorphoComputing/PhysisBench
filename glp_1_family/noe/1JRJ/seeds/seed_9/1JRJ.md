# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe\1JRJ\seeds\seed_9\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 5.460 A
- tm_score_ca_ordered: 0.18886370241058104
- heavy_atom_rmsd: 6.728 A
- sidechain_heavy_atom_rmsd: 7.779 A
- **all-atom quality (honest):** heavy 6.728 A, sidechain 7.779 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 90
- bin_accuracy: 0.700

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q12-V18 → 41 conflicts (95%)
- explained: 41/43 conflicts by 1 root cause(s)
- metrics: hubs=12 (frac 0.324), conflicts/hub=3.6, max_incompat=6.95Å, chain_span=0.405
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q12-V18 — explain ~41/43 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q12** — severity 11.97, 9 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): E15@5.0Å(now 8.0,conf 0.40), D8@6.1Å(now 9.6,conf 0.33), E16@6.1Å(now 10.8,conf 0.33)
  - D8↔E16: targets 6.1/6.1Å but partners are 19.2Å apart → too_far_apart by 7.0Å
  - E15↔D8: targets 5.0/6.1Å but partners are 17.4Å apart → too_far_apart by 6.2Å
  - L9↔E16: targets 5.0/6.1Å but partners are 16.5Å apart → too_far_apart by 5.3Å
- **V18** — severity 9.04, 7 conflict(s); suspect input ~`E15` (group: pull_in)
  - pull-in (wants closer): E15@5.0Å(now 8.6,conf 0.40), F21@5.0Å(now 7.6,conf 0.40), E14@6.1Å(now 8.7,conf 0.33)
  - E15↔F21: targets 5.0/5.0Å but partners are 14.8Å apart → too_far_apart by 4.7Å
  - E15↔I22: targets 5.0/6.1Å but partners are 16.4Å apart → too_far_apart by 5.3Å
  - E14↔I22: targets 6.1/6.1Å but partners are 16.8Å apart → too_far_apart by 4.5Å
- **E16** — severity 7.88, 6 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): R19@5.4Å(now 8.0,conf 0.37), Q12@6.1Å(now 10.8,conf 0.33)
  - Q12↔L20: targets 6.1/6.1Å but partners are 17.9Å apart → too_far_apart by 5.6Å
  - R19↔Q12: targets 5.4/6.1Å but partners are 17.0Å apart → too_far_apart by 5.5Å
  - A17↔Q12: targets 3.8/6.1Å but partners are 14.5Å apart → too_far_apart by 4.6Å
- **E14** — severity 4.98, 5 conflict(s); suspect input ~`A17` (group: pull_in)
  - pull-in (wants closer): A17@5.4Å(now 8.6,conf 0.37), V18@6.1Å(now 8.7,conf 0.33)
  - K11↔A17: targets 5.4/5.4Å but partners are 14.9Å apart → too_far_apart by 4.1Å
  - Q12↔A17: targets 5.4/5.4Å but partners are 14.5Å apart → too_far_apart by 3.7Å
  - M13↔A17: targets 3.8/5.4Å but partners are 11.2Å apart → too_far_apart by 2.0Å
- **E15** — severity 3.85, 3 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): A17@5.4Å(now 8.1,conf 0.75), Q12@5.0Å(now 8.0,conf 0.40), V18@5.0Å(now 8.6,conf 0.40)
  - A17↔Q12: targets 5.4/5.0Å but partners are 14.5Å apart → too_far_apart by 4.1Å
  - Q12↔V18: targets 5.0/5.0Å but partners are 13.8Å apart → too_far_apart by 3.7Å
  - E16↔Q12: targets 3.8/5.0Å but partners are 10.8Å apart → too_far_apart by 1.9Å
- **A17** — severity 3.64, 4 conflict(s); suspect input ~`F21` (group: pull_in)
  - pull-in (wants closer): E15@5.4Å(now 8.1,conf 0.75), E14@5.4Å(now 8.6,conf 0.37)
  - E14↔F21: targets 5.4/6.1Å but partners are 14.8Å apart → too_far_apart by 3.2Å
  - E15↔F21: targets 5.4/6.1Å but partners are 14.8Å apart → too_far_apart by 3.2Å
  - E15↔L20: targets 5.4/5.0Å but partners are 12.6Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=9 · 3-10(G)=7 · coil(C)=1

```
CEHHEHHHHHHEGGGEHHGGHHGHHHEHHEHHHGEEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=10 · sheet=6
  - G3 ↔ S7  (helix)
  - T4 ↔ D8  (helix)
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - V18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - L25 ↔ G29  (helix)
  - G28 ↔ S32  (helix)
  - G29 ↔ G33  (helix)
  - N27 ↔ P35  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)
  - P30 ↔ P35  (sheet)
  - P30 ↔ P36  (sheet)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=111 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=24 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9509 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
