# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2KNM\seeds\seed_8\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.801 A
- tm_score_ca_ordered: 0.059930068489027974
- heavy_atom_rmsd: 8.232 A
- sidechain_heavy_atom_rmsd: 9.354 A
- **all-atom quality (honest):** heavy 8.232 A, sidechain 9.354 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 22
- distogram_pairs: 29
- bin_accuracy: 0.379

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.036), conflicts/hub=2.0, max_incompat=2.21Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y27** — severity 1.51, 2 conflict(s); suspect input ~`P2` (group: pull_in)
  - pull-in (wants closer): S20@3.7Å(now 7.6,conf 0.61), P2@4.5Å(now 7.5,conf 0.39)
  - S20↔P2: targets 3.7/4.5Å but partners are 10.3Å apart → too_far_apart by 2.2Å
  - S20↔I1: targets 3.7/4.7Å but partners are 10.0Å apart → too_far_apart by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=8 · 3-10(G)=2 · coil(C)=1

```
CEHEHHHHHHGHEHEHGHHHEHHEHHEE
```

## Backbone H-bond Network

- total=28 · helix(i→i+4)=11 · sheet=17
  - C3 ↔ C7  (helix)
  - E5 ↔ W9  (helix)
  - S6 ↔ I10  (helix)
  - V8 ↔ C12  (helix)
  - I10 ↔ S14  (helix)
  - C12 ↔ A16  (helix)
  - S14 ↔ G18  (helix)
  - A16 ↔ S20  (helix)
  - G18 ↔ K22  (helix)
  - C19 ↔ S23  (helix)
  - K22 ↔ C26  (helix)
  - P2 ↔ I13  (sheet)
  - P2 ↔ S15  (sheet)
  - P2 ↔ C21  (sheet)
  - G4 ↔ I13  (sheet)
  - G4 ↔ S15  (sheet)
  - G4 ↔ C21  (sheet)
  - G4 ↔ K24  (sheet)
  - I13 ↔ C21  (sheet)
  - I13 ↔ K24  (sheet)
  - … +8 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=258 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=163 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4085 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=22 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
