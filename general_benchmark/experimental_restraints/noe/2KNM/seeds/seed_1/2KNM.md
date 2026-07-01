# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\experimental_restraints\noe\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.951 A
- tm_score_ca_ordered: 0.09399439982763864
- heavy_atom_rmsd: 8.625 A
- sidechain_heavy_atom_rmsd: 9.651 A
- **all-atom quality (honest):** heavy 8.625 A, sidechain 9.651 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 19
- distogram_pairs: 29
- bin_accuracy: 0.379

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** I1-C7 → 4 conflicts (100%)
- explained: 4/4 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.107), conflicts/hub=1.3, max_incompat=3.11Å, chain_span=0.464
- **fix-first:** [LOW_CONFLICT] Root cause(s): I1-C7 — explain ~4/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y27** — severity 2.15, 2 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): S20@3.7Å(now 6.5,conf 0.61)
  - S20↔C3: targets 3.7/3.7Å but partners are 9.2Å apart → too_far_apart by 1.8Å
  - S20↔I1: targets 3.7/4.7Å but partners are 11.1Å apart → too_far_apart by 2.8Å
- **V25** — severity 1.34, 1 conflict(s); suspect input ~`C7` (group: pull_in)
  - pull-in (wants closer): K22@3.8Å(now 6.8,conf 0.58), C7@4.2Å(now 8.4,conf 0.43)
  - K22↔C7: targets 3.8/4.2Å but partners are 11.1Å apart → too_far_apart by 3.1Å
- **S14** — severity 1.11, 1 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 7.0,conf 0.58), C19@3.8Å(now 7.1,conf 0.58)
  - E5↔C19: targets 3.8/3.8Å but partners are 9.5Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=5 · 3-10(G)=5 · coil(C)=2

```
CEHGGHHHHHHHHEHHGHHGHHEGCEHE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=8 · sheet=5
  - C3 ↔ C7  (helix)
  - S6 ↔ I10  (helix)
  - C7 ↔ P11  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - P11 ↔ S15  (helix)
  - C12 ↔ A16  (helix)
  - G18 ↔ K22  (helix)
  - P2 ↔ S14  (sheet)
  - S14 ↔ S23  (sheet)
  - S14 ↔ C26  (sheet)
  - S14 ↔ R28  (sheet)
  - S23 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=5 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=197 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=117 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8465 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=19 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
