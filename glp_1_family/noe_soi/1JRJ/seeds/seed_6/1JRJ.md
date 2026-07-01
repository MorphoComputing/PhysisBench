# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_soi\1JRJ\seeds\seed_6\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.367 A
- tm_score_ca_ordered: 0.19224748218632662
- heavy_atom_rmsd: 5.468 A
- sidechain_heavy_atom_rmsd: 6.323 A
- **all-atom quality (honest):** heavy 5.468 A, sidechain 6.323 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 207
- bin_accuracy: 0.502

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L9-L20 → 170 conflicts (96%)
- explained: 170/178 conflicts by 1 root cause(s)
- metrics: hubs=18 (frac 0.486), conflicts/hub=9.9, max_incompat=18.04Å, chain_span=0.784
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L9-L20 — explain ~170/178 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P37** — severity 40.99, 7 conflict(s); suspect input ~`G1` (group: pull_in)
  - pull-in (wants closer): G33@11.0Å(now 13.6,conf 0.59), G1@21.2Å(now 36.6,conf 0.43)
  - G33↔G1: targets 11.0/21.2Å but partners are 50.2Å apart → too_far_apart by 18.0Å
  - G1↔S31: targets 21.2/12.0Å but partners are 49.9Å apart → too_far_apart by 16.7Å
  - A34↔G1: targets 9.5/21.2Å but partners are 47.1Å apart → too_far_apart by 16.5Å
- **V18** — severity 35.27, 19 conflict(s); suspect input ~`W24` (group: pull_in)
  - pull-in (wants closer): Q12@9.1Å(now 11.8,conf 0.73), L25@8.4Å(now 11.5,conf 0.65), K11@9.2Å(now 14.5,conf 0.57), W24@8.0Å(now 10.9,conf 0.51), E14@6.1Å(now 8.7,conf 0.31)
  - L25↔K11: targets 8.4/9.2Å but partners are 24.2Å apart → too_far_apart by 6.7Å
  - K11↔W24: targets 9.2/8.0Å but partners are 24.6Å apart → too_far_apart by 7.3Å
  - E23↔K11: targets 6.8/9.2Å but partners are 21.4Å apart → too_far_apart by 5.3Å
- **A17** — severity 33.91, 18 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): W24@9.0Å(now 12.5,conf 0.59), S10@8.4Å(now 12.9,conf 0.57), K11@8.9Å(now 12.2,conf 0.43)
  - W24↔S10: targets 9.0/8.4Å but partners are 25.1Å apart → too_far_apart by 7.8Å
  - E23↔S10: targets 7.2/8.4Å but partners are 22.1Å apart → too_far_apart by 6.5Å
  - W24↔K11: targets 9.0/8.9Å but partners are 24.6Å apart → too_far_apart by 6.7Å
- **R19** — severity 25.32, 16 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): M13@8.6Å(now 11.3,conf 0.57), Q12@8.8Å(now 11.7,conf 0.48), E14@7.0Å(now 9.6,conf 0.48)
  - K26↔M13: targets 8.4/8.6Å but partners are 21.4Å apart → too_far_apart by 4.4Å
  - L25↔M13: targets 8.8/8.6Å but partners are 21.3Å apart → too_far_apart by 3.9Å
  - W24↔M13: targets 8.7/8.6Å but partners are 21.2Å apart → too_far_apart by 3.8Å
- **E14** — severity 21.72, 17 conflict(s); suspect input ~`V18` (group: pull_in)
  - pull-in (wants closer): L20@8.2Å(now 11.8,conf 0.64), D8@8.5Å(now 11.6,conf 0.59), L9@7.2Å(now 9.8,conf 0.57), R19@7.0Å(now 9.6,conf 0.48), S7@9.8Å(now 12.8,conf 0.48), V18@6.1Å(now 8.7,conf 0.31)
  - L20↔L9: targets 8.2/7.2Å but partners are 19.5Å apart → too_far_apart by 4.1Å
  - F21↔L9: targets 9.7/7.2Å but partners are 20.4Å apart → too_far_apart by 3.5Å
  - S10↔L20: targets 7.1/8.2Å but partners are 18.3Å apart → too_far_apart by 3.0Å
- **E23** — severity 19.81, 10 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): P30@7.1Å(now 9.9,conf 0.93), G28@6.7Å(now 9.2,conf 0.85), E16@8.9Å(now 12.0,conf 0.73)
  - P30↔E16: targets 7.1/8.9Å but partners are 21.4Å apart → too_far_apart by 5.5Å
  - P30↔V18: targets 7.1/6.8Å but partners are 16.9Å apart → too_far_apart by 3.0Å
  - G28↔E16: targets 6.7/8.9Å but partners are 18.9Å apart → too_far_apart by 3.3Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=12 · 3-10(G)=3 · coil(C)=1

```
EEHEEGEHEHEHHHHHHHHHHHHHHHEGGHCHHEEEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=10 · sheet=6
  - D8 ↔ Q12  (helix)
  - S10 ↔ E14  (helix)
  - Q12 ↔ E16  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - K26 ↔ P30  (helix)
  - T4 ↔ L9  (sheet)
  - F5 ↔ K11  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P35  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=21 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=125 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=32 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.6955 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
