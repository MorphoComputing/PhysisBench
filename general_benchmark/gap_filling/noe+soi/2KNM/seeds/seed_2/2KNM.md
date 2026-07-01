# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2KNM\seeds\seed_2\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.576 A
- tm_score_ca_ordered: 0.08127145971273228
- heavy_atom_rmsd: 7.355 A
- sidechain_heavy_atom_rmsd: 7.959 A
- **all-atom quality (honest):** heavy 7.355 A, sidechain 7.959 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 133
- bin_accuracy: 0.526

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C3-E5 → 11 conflicts (92%)
- explained: 11/12 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.107), conflicts/hub=4.0, max_incompat=3.78Å, chain_span=0.5
- **fix-first:** [LOW_CONFLICT] Root cause(s): C3-E5 — explain ~11/12 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C26** — severity 11.57, 8 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): C3@3.8Å(now 7.2,conf 0.58), E5@3.8Å(now 7.5,conf 0.58)
  - K22↔C3: targets 6.4/3.8Å but partners are 13.6Å apart → too_far_apart by 3.4Å
  - K22↔E5: targets 6.4/3.8Å but partners are 13.3Å apart → too_far_apart by 3.2Å
  - S23↔C3: targets 7.8/3.8Å but partners are 14.2Å apart → too_far_apart by 2.6Å
- **S14** — severity 5.21, 3 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 6.3,conf 0.58)
  - G18↔E5: targets 4.0/3.8Å but partners are 11.6Å apart → too_far_apart by 3.8Å
  - E5↔I17: targets 3.8/3.8Å but partners are 10.6Å apart → too_far_apart by 3.0Å
  - E5↔C19: targets 3.8/3.8Å but partners are 9.8Å apart → too_far_apart by 2.2Å
- **R28** — severity 0.42, 1 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): I1@3.7Å(now 6.3,conf 0.60), P2@4.3Å(now 7.2,conf 0.41)
  - I1↔S20: targets 3.7/6.1Å but partners are 11.8Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=4 · 3-10(G)=4 · coil(C)=5

```
CHHECCGGHHHHHHGHCCHEHHHGHEHE
```

## Backbone H-bond Network

- total=7 · helix(i→i+4)=4 · sheet=3
  - W9 ↔ I13  (helix)
  - C12 ↔ A16  (helix)
  - C19 ↔ S23  (helix)
  - S23 ↔ Y27  (helix)
  - G4 ↔ S20  (sheet)
  - S20 ↔ C26  (sheet)
  - S20 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=11 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=133 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=74 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.4124 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
