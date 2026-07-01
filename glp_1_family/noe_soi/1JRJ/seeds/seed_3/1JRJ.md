# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_soi\1JRJ\seeds\seed_3\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.918 A
- tm_score_ca_ordered: 0.187166464152449
- heavy_atom_rmsd: 6.317 A
- sidechain_heavy_atom_rmsd: 7.500 A
- **all-atom quality (honest):** heavy 6.317 A, sidechain 7.500 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 4
- distogram_pairs: 208
- bin_accuracy: 0.457

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S10-W24 → 216 conflicts (96%)
- explained: 216/226 conflicts by 1 root cause(s)
- metrics: hubs=25 (frac 0.676), conflicts/hub=9.0, max_incompat=18.29Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S10-W24 — explain ~216/226 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P37** — severity 50.12, 7 conflict(s); suspect input ~`G1` (group: push_out)
  - pull-in (wants closer): G1@19.8Å(now 37.0,conf 0.59)
  - push-out (wants farther): F21@5.8Å(now 3.2,conf 0.34), W24@7.2Å(now 3.8,conf 0.20)
  - G33↔G1: targets 11.4/19.8Å but partners are 49.5Å apart → too_far_apart by 18.3Å
  - A34↔G1: targets 9.0/19.8Å but partners are 45.8Å apart → too_far_apart by 17.0Å
  - G1↔P30: targets 19.8/12.6Å but partners are 47.6Å apart → too_far_apart by 15.2Å
- **L20** — severity 39.90, 19 conflict(s); suspect input ~`E15` (group: push_out)
  - pull-in (wants closer): E14@6.3Å(now 10.2,conf 0.59), M13@9.2Å(now 13.3,conf 0.57), E15@6.6Å(now 10.2,conf 0.57), N27@8.4Å(now 11.1,conf 0.57)
  - push-out (wants farther): I22@5.4Å(now 2.6,conf 0.18)
  - M13↔N27: targets 9.2/8.4Å but partners are 24.2Å apart → too_far_apart by 6.6Å
  - E14↔N27: targets 6.3/8.4Å but partners are 21.0Å apart → too_far_apart by 6.3Å
  - E15↔N27: targets 6.6/8.4Å but partners are 21.3Å apart → too_far_apart by 6.3Å
- **A17** — severity 35.33, 22 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): K11@8.3Å(now 12.0,conf 0.73), M13@6.6Å(now 9.1,conf 0.73), Q12@7.6Å(now 11.2,conf 0.65), S10@9.4Å(now 14.6,conf 0.48)
  - W24↔Q12: targets 10.6/7.6Å but partners are 23.5Å apart → too_far_apart by 5.3Å
  - K11↔W24: targets 8.3/10.6Å but partners are 23.6Å apart → too_far_apart by 4.7Å
  - M13↔W24: targets 6.6/10.6Å but partners are 21.5Å apart → too_far_apart by 4.3Å
- **E14** — severity 25.61, 18 conflict(s); suspect input ~`L20` (group: pull_in)
  - pull-in (wants closer): S7@9.1Å(now 12.9,conf 0.93), F21@8.9Å(now 11.8,conf 0.65), L20@6.3Å(now 10.2,conf 0.59)
  - S7↔L20: targets 9.1/6.3Å but partners are 20.9Å apart → too_far_apart by 5.5Å
  - S10↔L20: targets 8.7/6.3Å but partners are 19.5Å apart → too_far_apart by 4.5Å
  - L9↔L20: targets 7.8/6.3Å but partners are 18.3Å apart → too_far_apart by 4.3Å
- **M13** — severity 24.45, 23 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): R19@9.6Å(now 12.2,conf 0.74), S7@8.4Å(now 11.3,conf 0.74), V18@7.6Å(now 10.8,conf 0.74), A17@6.6Å(now 9.1,conf 0.73), L20@9.2Å(now 13.3,conf 0.57), S10@5.4Å(now 8.5,conf 0.36)
  - S7↔V18: targets 8.4/7.6Å but partners are 19.8Å apart → too_far_apart by 3.8Å
  - S7↔L20: targets 8.4/9.2Å but partners are 20.9Å apart → too_far_apart by 3.3Å
  - L20↔S10: targets 9.2/5.4Å but partners are 19.5Å apart → too_far_apart by 4.8Å
- **R19** — severity 20.63, 10 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): M13@9.6Å(now 12.2,conf 0.74), Q12@9.8Å(now 14.3,conf 0.59)
  - K26↔Q12: targets 8.1/9.8Å but partners are 23.9Å apart → too_far_apart by 6.0Å
  - W24↔Q12: targets 8.4/9.8Å but partners are 23.5Å apart → too_far_apart by 5.4Å
  - Q12↔L25: targets 9.8/6.7Å but partners are 22.0Å apart → too_far_apart by 5.5Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=15 · 3-10(G)=1 · coil(C)=0

```
EEEEEEHHEHEEEHHEHHHHHHHGHHEHHEHHHHHEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=10 · sheet=9
  - S10 ↔ E14  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - F21 ↔ L25  (helix)
  - L25 ↔ G29  (helix)
  - G28 ↔ S32  (helix)
  - G29 ↔ G33  (helix)
  - S31 ↔ P35  (helix)
  - T4 ↔ L9  (sheet)
  - F5 ↔ K11  (sheet)
  - T6 ↔ K11  (sheet)
  - T6 ↔ Q12  (sheet)
  - K11 ↔ E16  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)
  - P30 ↔ P36  (sheet)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=18 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=109 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=27 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.9017 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=4 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
