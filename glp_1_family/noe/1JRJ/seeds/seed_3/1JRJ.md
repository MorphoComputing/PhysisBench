# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe\1JRJ\seeds\seed_3\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 5.606 A
- tm_score_ca_ordered: 0.13606944103159094
- heavy_atom_rmsd: 6.775 A
- sidechain_heavy_atom_rmsd: 7.753 A
- **all-atom quality (honest):** heavy 6.775 A, sidechain 7.753 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 90
- bin_accuracy: 0.644

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Q12-L20 → 53 conflicts (100%)
- explained: 53/53 conflicts by 1 root cause(s)
- metrics: hubs=10 (frac 0.27), conflicts/hub=5.3, max_incompat=7.19Å, chain_span=0.297
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Q12-L20 — explain ~53/53 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 15.12, 10 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): M13@5.4Å(now 9.6,conf 0.37), Q12@6.1Å(now 9.5,conf 0.33), L20@6.1Å(now 9.0,conf 0.33)
  - M13↔L20: targets 5.4/6.1Å but partners are 18.6Å apart → too_far_apart by 7.1Å
  - M13↔R19: targets 5.4/5.4Å but partners are 16.8Å apart → too_far_apart by 6.0Å
  - Q12↔L20: targets 6.1/6.1Å but partners are 18.1Å apart → too_far_apart by 5.8Å
- **V18** — severity 14.48, 9 conflict(s); suspect input ~`E14` (group: pull_in)
  - pull-in (wants closer): E15@5.0Å(now 9.0,conf 0.40), E14@6.1Å(now 11.3,conf 0.33), I22@6.1Å(now 9.5,conf 0.33)
  - E14↔I22: targets 6.1/6.1Å but partners are 19.4Å apart → too_far_apart by 7.2Å
  - E15↔F21: targets 5.0/5.0Å but partners are 16.0Å apart → too_far_apart by 5.9Å
  - E15↔I22: targets 5.0/6.1Å but partners are 18.0Å apart → too_far_apart by 6.8Å
- **E14** — severity 8.54, 6 conflict(s); suspect input ~`V18` (group: pull_in)
  - pull-in (wants closer): A17@5.4Å(now 10.3,conf 0.37), V18@6.1Å(now 11.3,conf 0.33)
  - K11↔A17: targets 5.4/5.4Å but partners are 16.1Å apart → too_far_apart by 5.2Å
  - M13↔A17: targets 3.8/5.4Å but partners are 13.9Å apart → too_far_apart by 4.7Å
  - K11↔V18: targets 5.4/6.1Å but partners are 16.5Å apart → too_far_apart by 5.0Å
- **A17** — severity 8.13, 6 conflict(s); suspect input ~`F21` (group: pull_in)
  - pull-in (wants closer): E15@5.4Å(now 8.8,conf 0.46), E14@5.4Å(now 10.3,conf 0.37)
  - E14↔F21: targets 5.4/6.1Å but partners are 17.7Å apart → too_far_apart by 6.2Å
  - L20↔E14: targets 5.0/5.4Å but partners are 15.0Å apart → too_far_apart by 4.6Å
  - E15↔F21: targets 5.4/6.1Å but partners are 16.0Å apart → too_far_apart by 4.4Å
- **E15** — severity 6.56, 5 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): A17@5.4Å(now 8.8,conf 0.46), V18@5.0Å(now 9.0,conf 0.40)
  - M13↔V18: targets 5.4/5.0Å but partners are 14.4Å apart → too_far_apart by 4.0Å
  - Q12↔V18: targets 5.0/5.0Å but partners are 13.6Å apart → too_far_apart by 3.5Å
  - A17↔M13: targets 5.4/5.4Å but partners are 13.9Å apart → too_far_apart by 3.0Å
- **I22** — severity 4.50, 4 conflict(s); suspect input ~`V18` (group: pull_in)
  - pull-in (wants closer): V18@6.1Å(now 9.5,conf 0.33)
  - V18↔K26: targets 6.1/6.1Å but partners are 16.9Å apart → too_far_apart by 4.6Å
  - L25↔V18: targets 5.0/6.1Å but partners are 15.8Å apart → too_far_apart by 4.6Å
  - E23↔V18: targets 3.8/6.1Å but partners are 12.3Å apart → too_far_apart by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=8 · 3-10(G)=4 · coil(C)=2

```
EHHHHHHHHHHHHEGEHHHHEGCCHHHHHEHHGEGEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=12 · sheet=7
  - E2 ↔ T6  (helix)
  - G3 ↔ S7  (helix)
  - T4 ↔ D8  (helix)
  - F5 ↔ L9  (helix)
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - D8 ↔ Q12  (helix)
  - L9 ↔ M13  (helix)
  - M13 ↔ A17  (helix)
  - L25 ↔ G29  (helix)
  - N27 ↔ S31  (helix)
  - G28 ↔ S32  (helix)
  - E16 ↔ F21  (sheet)
  - F21 ↔ P30  (sheet)
  - F21 ↔ A34  (sheet)
  - F21 ↔ P36  (sheet)
  - F21 ↔ P37  (sheet)
  - P30 ↔ P36  (sheet)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=118 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=29 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1249 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
