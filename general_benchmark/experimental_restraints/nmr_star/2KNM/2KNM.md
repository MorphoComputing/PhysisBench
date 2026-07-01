# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\experimental_restraints\nmr_star\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 5.999 A
- tm_score_ca_ordered: 0.08531348424946991
- heavy_atom_rmsd: 7.131 A
- sidechain_heavy_atom_rmsd: 7.954 A
- **all-atom quality (honest):** heavy 7.131 A, sidechain 7.954 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 30
- bin_accuracy: 0.367

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** P2-S6 → 7 conflicts (88%)
- explained: 7/8 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.143), conflicts/hub=2.0, max_incompat=5.11Å, chain_span=0.786
- **fix-first:** [LOW_CONFLICT] Root cause(s): P2-S6 — explain ~7/8 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R28** — severity 6.30, 5 conflict(s); suspect input ~`P2` (group: pull_in)
  - pull-in (wants closer): S20@4.3Å(now 6.9,conf 0.41), P2@4.5Å(now 8.3,conf 0.39), G4@3.7Å(now 6.9,conf 0.30)
  - S20↔P2: targets 4.3/4.5Å but partners are 13.9Å apart → too_far_apart by 5.0Å
  - S20↔G4: targets 4.3/3.7Å but partners are 13.1Å apart → too_far_apart by 5.1Å
  - C21↔P2: targets 3.7/4.5Å but partners are 11.3Å apart → too_far_apart by 3.1Å
- **S15** — severity 0.94, 1 conflict(s); suspect input ~`S6` (group: pull_in)
  - pull-in (wants closer): S20@3.3Å(now 6.7,conf 0.36)
  - S6↔S20: targets 3.3/3.3Å but partners are 9.2Å apart → too_far_apart by 2.6Å
- **Y27** — severity 0.87, 1 conflict(s); suspect input ~`G4` (group: pull_in)
  - pull-in (wants closer): G4@3.3Å(now 7.7,conf 0.36)
  - C21↔G4: targets 4.5/3.3Å but partners are 10.2Å apart → too_far_apart by 2.4Å
- **S6** — severity 0.62, 1 conflict(s); suspect input ~`S14` (group: pull_in)
  - pull-in (wants closer): S14@3.3Å(now 6.5,conf 0.36)
  - Y27↔S14: targets 4.7/3.3Å but partners are 9.7Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=3 · 3-10(G)=2 · coil(C)=1

```
CEHHHHHHHHHHHGHHHHHGHHHEHHHE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=17 · sheet=0
  - C3 ↔ C7  (helix)
  - G4 ↔ V8  (helix)
  - E5 ↔ W9  (helix)
  - S6 ↔ I10  (helix)
  - C7 ↔ P11  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - P11 ↔ S15  (helix)
  - C12 ↔ A16  (helix)
  - I13 ↔ I17  (helix)
  - S15 ↔ C19  (helix)
  - I17 ↔ C21  (helix)
  - G18 ↔ K22  (helix)
  - C19 ↔ S23  (helix)
  - C21 ↔ V25  (helix)
  - K22 ↔ C26  (helix)
  - S23 ↔ Y27  (helix)

## Solvent Accessibility (burial)

- buried=9 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=218 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=125 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.9854 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=2.314Å max=5.016Å (per-residue in .per_residue.csv)
- most flexible residues: 7, 19, 27, 16, 25

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=1.059Å · max=4.374Å · AlphaFold-PAE analog (low block = rigid unit/domain)
