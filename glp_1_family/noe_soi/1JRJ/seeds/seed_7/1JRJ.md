# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_soi\1JRJ\seeds\seed_7\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.783 A
- tm_score_ca_ordered: 0.26874027152047797
- heavy_atom_rmsd: 5.418 A
- sidechain_heavy_atom_rmsd: 6.693 A
- **all-atom quality (honest):** heavy 5.418 A, sidechain 6.693 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 216
- bin_accuracy: 0.565

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** L9-F21 → 238 conflicts (96%)
- explained: 238/247 conflicts by 1 root cause(s)
- metrics: hubs=21 (frac 0.568), conflicts/hub=11.8, max_incompat=18.75Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): L9-F21 — explain ~238/247 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 55.52, 25 conflict(s); suspect input ~`L9` (group: pull_in)
  - pull-in (wants closer): E23@8.8Å(now 11.4,conf 0.85), F21@5.5Å(now 9.6,conf 0.73), S10@8.0Å(now 12.8,conf 0.59), K11@8.0Å(now 10.5,conf 0.57), L9@8.4Å(now 13.9,conf 0.53)
  - F21↔S10: targets 5.5/8.0Å but partners are 22.2Å apart → too_far_apart by 8.7Å
  - F21↔L9: targets 5.5/8.4Å but partners are 22.8Å apart → too_far_apart by 8.9Å
  - E23↔S10: targets 8.8/8.0Å but partners are 23.5Å apart → too_far_apart by 6.7Å
- **Q12** — severity 54.94, 25 conflict(s); suspect input ~`A17` (group: pull_in)
  - pull-in (wants closer): R19@7.6Å(now 13.3,conf 0.73), F5@7.5Å(now 11.9,conf 0.64), A17@7.3Å(now 10.1,conf 0.59), V18@8.4Å(now 11.5,conf 0.43)
  - R19↔F5: targets 7.6/7.5Å but partners are 25.1Å apart → too_far_apart by 10.0Å
  - T6↔R19: targets 6.4/7.6Å but partners are 21.8Å apart → too_far_apart by 7.8Å
  - F5↔A17: targets 7.5/7.3Å but partners are 21.7Å apart → too_far_apart by 6.9Å
- **E15** — severity 48.72, 23 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): L20@7.0Å(now 9.7,conf 0.71), F21@8.2Å(now 12.1,conf 0.59), L9@7.6Å(now 11.3,conf 0.59), D8@9.7Å(now 12.3,conf 0.57), S10@7.0Å(now 10.4,conf 0.48)
  - F21↔L9: targets 8.2/7.6Å but partners are 22.8Å apart → too_far_apart by 7.0Å
  - L20↔L9: targets 7.0/7.6Å but partners are 20.4Å apart → too_far_apart by 5.8Å
  - F21↔S10: targets 8.2/7.0Å but partners are 22.2Å apart → too_far_apart by 7.0Å
- **A17** — severity 46.49, 21 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): K11@9.9Å(now 13.0,conf 0.73), Q12@7.3Å(now 10.1,conf 0.59), W24@8.0Å(now 11.3,conf 0.57), S10@8.6Å(now 15.2,conf 0.48)
  - W24↔S10: targets 8.0/8.6Å but partners are 26.5Å apart → too_far_apart by 9.9Å
  - K11↔W24: targets 9.9/8.0Å but partners are 24.3Å apart → too_far_apart by 6.4Å
  - E23↔S10: targets 7.3/8.6Å but partners are 23.5Å apart → too_far_apart by 7.5Å
- **P37** — severity 43.74, 7 conflict(s); suspect input ~`G1` (group: pull_in)
  - pull-in (wants closer): G1@17.1Å(now 34.1,conf 0.43)
  - G33↔G1: targets 11.6/17.1Å but partners are 47.4Å apart → too_far_apart by 18.8Å
  - S32↔G1: targets 12.7/17.1Å but partners are 47.0Å apart → too_far_apart by 17.2Å
  - A34↔G1: targets 10.9/17.1Å but partners are 44.6Å apart → too_far_apart by 16.6Å
- **M13** — severity 38.83, 19 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): T6@7.4Å(now 10.9,conf 0.85), R19@7.6Å(now 11.1,conf 0.71), L20@8.6Å(now 12.3,conf 0.57)
  - T6↔R19: targets 7.4/7.6Å but partners are 21.8Å apart → too_far_apart by 6.8Å
  - T6↔L20: targets 7.4/8.6Å but partners are 22.7Å apart → too_far_apart by 6.7Å
  - D8↔R19: targets 6.9/7.6Å but partners are 19.6Å apart → too_far_apart by 5.1Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=16 · 3-10(G)=5 · coil(C)=3

```
EEEEEGHEGGCEHHEGHGHEHHEHHHEHCCHEHEEEE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=5 · sheet=18
  - M13 ↔ A17  (helix)
  - A17 ↔ F21  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - G3 ↔ D8  (sheet)
  - F5 ↔ Q12  (sheet)
  - D8 ↔ E15  (sheet)
  - E15 ↔ L20  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ P35  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - E23 ↔ S32  (sheet)
  - E23 ↔ A34  (sheet)
  - E23 ↔ P35  (sheet)
  - E23 ↔ P36  (sheet)
  - E23 ↔ P37  (sheet)
  - N27 ↔ S32  (sheet)
  - N27 ↔ A34  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=106 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=21 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.7404 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
