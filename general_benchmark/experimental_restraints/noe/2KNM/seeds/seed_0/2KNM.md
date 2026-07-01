# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\experimental_restraints\noe\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 5.879 A
- tm_score_ca_ordered: 0.06669322051184112
- heavy_atom_rmsd: 6.914 A
- sidechain_heavy_atom_rmsd: 7.897 A
- **all-atom quality (honest):** heavy 6.914 A, sidechain 7.897 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 29
- bin_accuracy: 0.379

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** S20 → 5 conflicts (71%)
- explained: 5/7 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.143), conflicts/hub=1.8, max_incompat=4.43Å, chain_span=0.464
- **fix-first:** [LOW_CONFLICT] Root cause(s): S20 — explain ~5/7 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y27** — severity 3.98, 3 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): S20@3.7Å(now 6.2,conf 0.61)
  - S20↔C3: targets 3.7/3.7Å but partners are 9.9Å apart → too_far_apart by 2.5Å
  - S20↔P2: targets 3.7/4.5Å but partners are 11.7Å apart → too_far_apart by 3.6Å
  - S20↔I1: targets 3.7/4.7Å but partners are 11.1Å apart → too_far_apart by 2.8Å
- **C26** — severity 2.34, 2 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): C3@3.8Å(now 6.9,conf 0.58), E5@3.8Å(now 7.8,conf 0.58)
  - E5↔S20: targets 3.8/4.5Å but partners are 12.7Å apart → too_far_apart by 4.4Å
  - C3↔S20: targets 3.8/4.5Å but partners are 9.9Å apart → too_far_apart by 1.6Å
- **S14** — severity 1.68, 1 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): C19@3.8Å(now 6.5,conf 0.58)
  - E5↔C19: targets 3.8/3.8Å but partners are 10.5Å apart → too_far_apart by 2.9Å
- **V25** — severity 1.00, 1 conflict(s); suspect input ~`C7` (group: pull_in)
  - pull-in (wants closer): K22@3.8Å(now 6.5,conf 0.58)
  - K22↔C7: targets 3.8/4.2Å but partners are 10.3Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=6 · 3-10(G)=4 · coil(C)=1

```
CEHHEHHHHHGHHGHHEHHHGHGEHHEE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=9 · sheet=6
  - G4 ↔ V8  (helix)
  - S6 ↔ I10  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - C12 ↔ A16  (helix)
  - S15 ↔ C19  (helix)
  - A16 ↔ S20  (helix)
  - G18 ↔ K22  (helix)
  - K22 ↔ C26  (helix)
  - P2 ↔ I17  (sheet)
  - E5 ↔ I17  (sheet)
  - E5 ↔ K24  (sheet)
  - I17 ↔ K24  (sheet)
  - I17 ↔ Y27  (sheet)
  - I17 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=218 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=127 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6881 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
