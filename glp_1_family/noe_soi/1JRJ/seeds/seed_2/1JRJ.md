# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_soi\1JRJ\seeds\seed_2\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.306 A
- tm_score_ca_ordered: 0.2209783954164087
- heavy_atom_rmsd: 5.432 A
- sidechain_heavy_atom_rmsd: 6.287 A
- **all-atom quality (honest):** heavy 5.432 A, sidechain 6.287 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 167
- bin_accuracy: 0.431

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S7-L25 → 164 conflicts (97%)
- explained: 164/169 conflicts by 1 root cause(s)
- metrics: hubs=18 (frac 0.486), conflicts/hub=9.4, max_incompat=14.1Å, chain_span=0.757
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S7-L25 — explain ~164/169 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P37** — severity 36.17, 7 conflict(s); suspect input ~`G1` (group: push_out)
  - pull-in (wants closer): G1@23.1Å(now 36.4,conf 0.57)
  - push-out (wants farther): W24@7.2Å(now 4.1,conf 0.20)
  - G33↔G1: targets 11.0/23.1Å but partners are 48.2Å apart → too_far_apart by 14.1Å
  - A34↔G1: targets 9.4/23.1Å but partners are 45.8Å apart → too_far_apart by 13.3Å
  - S32↔G1: targets 10.9/23.1Å but partners are 45.4Å apart → too_far_apart by 11.4Å
- **E16** — severity 33.46, 20 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): S10@7.5Å(now 10.4,conf 0.65), L9@8.7Å(now 12.8,conf 0.57), K11@7.2Å(now 10.0,conf 0.48), Q12@6.1Å(now 8.8,conf 0.31)
  - I22↔L9: targets 7.7/8.7Å but partners are 22.5Å apart → too_far_apart by 6.2Å
  - I22↔S10: targets 7.7/7.5Å but partners are 20.2Å apart → too_far_apart by 5.0Å
  - L9↔E23: targets 8.7/9.6Å but partners are 23.3Å apart → too_far_apart by 5.0Å
- **E14** — severity 33.19, 13 conflict(s); suspect input ~`F21` (group: pull_in)
  - pull-in (wants closer): L20@6.0Å(now 10.4,conf 0.73), S7@9.0Å(now 12.0,conf 0.73), F21@7.4Å(now 11.5,conf 0.57)
  - L20↔S7: targets 6.0/9.0Å but partners are 22.3Å apart → too_far_apart by 7.3Å
  - S7↔F21: targets 9.0/7.4Å but partners are 23.2Å apart → too_far_apart by 6.8Å
  - S7↔R19: targets 9.0/7.6Å but partners are 20.9Å apart → too_far_apart by 4.3Å
- **M13** — severity 29.54, 16 conflict(s); suspect input ~`T6` (group: pull_in)
  - pull-in (wants closer): S7@7.5Å(now 11.0,conf 0.85), L20@8.2Å(now 12.1,conf 0.57), T6@10.3Å(now 13.4,conf 0.57), R19@8.6Å(now 11.7,conf 0.57)
  - L20↔T6: targets 8.2/10.3Å but partners are 25.2Å apart → too_far_apart by 6.8Å
  - S7↔L20: targets 7.5/8.2Å but partners are 22.3Å apart → too_far_apart by 6.7Å
  - T6↔R19: targets 10.3/8.6Å but partners are 23.8Å apart → too_far_apart by 4.9Å
- **E15** — severity 20.66, 15 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): F21@8.6Å(now 11.2,conf 0.73), K11@6.8Å(now 9.8,conf 0.59), I22@8.6Å(now 12.3,conf 0.59), L9@9.0Å(now 11.9,conf 0.57), Q12@5.0Å(now 8.0,conf 0.39)
  - I22↔L9: targets 8.6/9.0Å but partners are 22.5Å apart → too_far_apart by 4.9Å
  - K11↔I22: targets 6.8/8.6Å but partners are 19.2Å apart → too_far_apart by 3.8Å
  - S10↔I22: targets 8.0/8.6Å but partners are 20.2Å apart → too_far_apart by 3.5Å
- **F21** — severity 18.78, 12 conflict(s); suspect input ~`E14` (group: pull_in)
  - pull-in (wants closer): E15@8.6Å(now 11.2,conf 0.73), E14@7.4Å(now 11.5,conf 0.57)
  - G28↔E14: targets 9.0/7.4Å but partners are 21.6Å apart → too_far_apart by 5.2Å
  - N27↔E14: targets 8.5/7.4Å but partners are 20.0Å apart → too_far_apart by 4.1Å
  - E14↔W24: targets 7.4/5.0Å but partners are 18.3Å apart → too_far_apart by 5.8Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=16 · 3-10(G)=3 · coil(C)=4

```
EEECEGEHHHEECCHEHEHHHHEGHHEHECHEHEEGE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=4 · sheet=21
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - F5 ↔ K11  (sheet)
  - F5 ↔ Q12  (sheet)
  - S7 ↔ Q12  (sheet)
  - K11 ↔ E16  (sheet)
  - Q12 ↔ V18  (sheet)
  - E16 ↔ E23  (sheet)
  - V18 ↔ E23  (sheet)
  - V18 ↔ P37  (sheet)
  - E23 ↔ G29  (sheet)
  - E23 ↔ S32  (sheet)
  - E23 ↔ A34  (sheet)
  - E23 ↔ P35  (sheet)
  - E23 ↔ P37  (sheet)
  - N27 ↔ S32  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P35  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=106 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=22 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.7377 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
