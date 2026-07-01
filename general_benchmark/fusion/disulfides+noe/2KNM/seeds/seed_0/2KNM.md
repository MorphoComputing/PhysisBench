# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\fusion\disulfides+noe\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 7.083 A
- tm_score_ca_ordered: 0.08939802537236788
- heavy_atom_rmsd: 8.296 A
- sidechain_heavy_atom_rmsd: 8.878 A
- **all-atom quality (honest):** heavy 8.296 A, sidechain 8.878 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 13
- distogram_pairs: 32
- bin_accuracy: 0.344

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C19-S20 → 7 conflicts (88%)
- explained: 7/8 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.143), conflicts/hub=2.0, max_incompat=5.08Å, chain_span=0.5
- **fix-first:** [LOW_CONFLICT] Root cause(s): C19-S20 — explain ~7/8 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y27** — severity 4.90, 3 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): S20@3.7Å(now 7.4,conf 0.61)
  - S20↔I1: targets 3.7/4.7Å but partners are 13.4Å apart → too_far_apart by 5.1Å
  - S20↔C3: targets 3.7/3.7Å but partners are 10.1Å apart → too_far_apart by 2.8Å
  - S20↔P2: targets 3.7/4.5Å but partners are 11.5Å apart → too_far_apart by 3.4Å
- **S14** — severity 2.66, 2 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 6.6,conf 0.58)
  - E5↔C19: targets 3.8/3.8Å but partners are 9.9Å apart → too_far_apart by 2.3Å
  - E5↔I17: targets 3.8/3.8Å but partners are 9.9Å apart → too_far_apart by 2.3Å
- **R28** — severity 1.75, 2 conflict(s); suspect input ~`C19` (group: pull_in)
  - pull-in (wants closer): I1@3.7Å(now 6.3,conf 0.60), C19@4.7Å(now 8.1,conf 0.37)
  - I1↔C19: targets 3.7/4.7Å but partners are 11.2Å apart → too_far_apart by 2.7Å
  - I1↔S20: targets 3.7/6.1Å but partners are 13.4Å apart → too_far_apart by 3.6Å
- **C26** — severity 1.71, 1 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 8.2,conf 0.58)
  - E5↔S20: targets 3.8/4.5Å but partners are 12.7Å apart → too_far_apart by 4.4Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=5 · 3-10(G)=2 · coil(C)=1

```
CHHHEHHHHHGHHEHHEHHHHHEHHGHE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=10 · sheet=7
  - C3 ↔ C7  (helix)
  - G4 ↔ V8  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - C12 ↔ A16  (helix)
  - S15 ↔ C19  (helix)
  - A16 ↔ S20  (helix)
  - G18 ↔ K22  (helix)
  - S20 ↔ K24  (helix)
  - C21 ↔ V25  (helix)
  - E5 ↔ S14  (sheet)
  - E5 ↔ I17  (sheet)
  - S14 ↔ S23  (sheet)
  - S14 ↔ R28  (sheet)
  - I17 ↔ S23  (sheet)
  - I17 ↔ R28  (sheet)
  - S23 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=227 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=138 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.822 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=13 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
