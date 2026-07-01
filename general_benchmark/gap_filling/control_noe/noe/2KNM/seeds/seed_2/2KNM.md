# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2KNM\seeds\seed_2\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 5.499 A
- tm_score_ca_ordered: 0.14132701444394863
- heavy_atom_rmsd: 6.730 A
- sidechain_heavy_atom_rmsd: 7.836 A
- **all-atom quality (honest):** heavy 6.730 A, sidechain 7.836 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.036
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 29
- bin_accuracy: 0.586

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.036), conflicts/hub=1.0, max_incompat=1.54Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C19** — severity 0.57, 1 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): R28@4.7Å(now 7.3,conf 0.37)
  - S15↔R28: targets 4.0/4.7Å but partners are 10.3Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=7 · 3-10(G)=1 · coil(C)=3

```
CHHHEEHHHHHHHHHEHHHEEHHGCCEE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=10 · sheet=13
  - C3 ↔ C7  (helix)
  - G4 ↔ V8  (helix)
  - C7 ↔ P11  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - I10 ↔ S14  (helix)
  - P11 ↔ S15  (helix)
  - I13 ↔ I17  (helix)
  - S15 ↔ C19  (helix)
  - C19 ↔ S23  (helix)
  - E5 ↔ A16  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ C21  (sheet)
  - S6 ↔ A16  (sheet)
  - S6 ↔ S20  (sheet)
  - S6 ↔ C21  (sheet)
  - A16 ↔ C21  (sheet)
  - A16 ↔ Y27  (sheet)
  - A16 ↔ R28  (sheet)
  - S20 ↔ Y27  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=7 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=205 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=127 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3336 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0357

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
