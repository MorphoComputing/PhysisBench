# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe\1JRJ\seeds\seed_5\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.523 A
- tm_score_ca_ordered: 0.08783472702177017
- heavy_atom_rmsd: 8.102 A
- sidechain_heavy_atom_rmsd: 8.508 A
- **all-atom quality (honest):** heavy 8.102 A, sidechain 8.508 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 90
- bin_accuracy: 0.678

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L9-V18 → 75 conflicts (99%)
- explained: 75/76 conflicts by 1 root cause(s)
- metrics: hubs=13 (frac 0.351), conflicts/hub=5.8, max_incompat=9.02Å, chain_span=0.351
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L9-V18 — explain ~75/76 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q12** — severity 21.09, 12 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): L9@5.0Å(now 8.8,conf 0.40), E15@5.0Å(now 9.2,conf 0.40), D8@6.1Å(now 9.8,conf 0.33), E16@6.1Å(now 11.5,conf 0.33)
  - L9↔E15: targets 5.0/5.0Å but partners are 17.8Å apart → too_far_apart by 7.7Å
  - D8↔E16: targets 6.1/6.1Å but partners are 21.3Å apart → too_far_apart by 9.0Å
  - L9↔E16: targets 5.0/6.1Å but partners are 19.9Å apart → too_far_apart by 8.7Å
- **E16** — severity 15.62, 12 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): M13@5.4Å(now 9.3,conf 0.37), R19@5.4Å(now 8.2,conf 0.37), Q12@6.1Å(now 11.5,conf 0.33), L20@6.1Å(now 9.4,conf 0.33)
  - R19↔Q12: targets 5.4/6.1Å but partners are 18.9Å apart → too_far_apart by 7.4Å
  - M13↔R19: targets 5.4/5.4Å but partners are 17.2Å apart → too_far_apart by 6.4Å
  - Q12↔L20: targets 6.1/6.1Å but partners are 18.5Å apart → too_far_apart by 6.2Å
- **E14** — severity 11.36, 8 conflict(s); suspect input ~`K11` (group: pull_in)
  - pull-in (wants closer): K11@5.4Å(now 10.0,conf 0.37), A17@5.4Å(now 8.6,conf 0.37), V18@6.1Å(now 9.6,conf 0.33)
  - K11↔A17: targets 5.4/5.4Å but partners are 17.8Å apart → too_far_apart by 7.0Å
  - K11↔V18: targets 5.4/6.1Å but partners are 19.0Å apart → too_far_apart by 7.5Å
  - K11↔E16: targets 5.4/5.4Å but partners are 15.3Å apart → too_far_apart by 4.5Å
- **M13** — severity 10.32, 8 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): S10@5.4Å(now 8.3,conf 0.37), E16@5.4Å(now 9.3,conf 0.37), L9@6.8Å(now 11.0,conf 0.23)
  - S10↔E16: targets 5.4/5.4Å but partners are 17.5Å apart → too_far_apart by 6.7Å
  - E16↔L9: targets 5.4/6.8Å but partners are 19.9Å apart → too_far_apart by 7.7Å
  - E15↔L9: targets 5.4/6.8Å but partners are 17.8Å apart → too_far_apart by 5.5Å
- **K11** — severity 8.41, 6 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): E14@5.4Å(now 10.0,conf 0.37), S7@6.1Å(now 9.3,conf 0.33)
  - E14↔S7: targets 5.4/6.1Å but partners are 19.1Å apart → too_far_apart by 7.6Å
  - D8↔E14: targets 5.0/5.4Å but partners are 16.0Å apart → too_far_apart by 5.5Å
  - S7↔M13: targets 6.1/5.4Å but partners are 15.6Å apart → too_far_apart by 4.0Å
- **L9** — severity 6.57, 7 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): Q12@5.0Å(now 8.8,conf 0.40), M13@6.8Å(now 11.0,conf 0.23)
  - Q12↔T6: targets 5.0/5.8Å but partners are 15.9Å apart → too_far_apart by 5.1Å
  - T6↔M13: targets 5.8/6.8Å but partners are 18.4Å apart → too_far_apart by 5.8Å
  - M13↔F5: targets 6.8/7.3Å but partners are 18.9Å apart → too_far_apart by 4.8Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=12 · 3-10(G)=7 · coil(C)=0

```
EEHHEGEGGGEEGEHEHEHHHHHHHHHHEGGHHHHEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=9 · sheet=7
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - R19 ↔ E23  (helix)
  - L20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ N27  (helix)
  - W24 ↔ G28  (helix)
  - G28 ↔ S32  (helix)
  - G1 ↔ S7  (sheet)
  - E2 ↔ S7  (sheet)
  - E16 ↔ P36  (sheet)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)
  - G29 ↔ P36  (sheet)
  - G29 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=111 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=22 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1958 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
