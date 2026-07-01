# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2KNM\seeds\seed_5\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.519 A
- tm_score_ca_ordered: 0.08056472307562156
- heavy_atom_rmsd: 7.977 A
- sidechain_heavy_atom_rmsd: 8.611 A
- **all-atom quality (honest):** heavy 7.977 A, sidechain 8.611 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 12
- distogram_pairs: 29
- bin_accuracy: 0.517

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.036), conflicts/hub=1.0, max_incompat=2.32Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C19** — severity 0.86, 1 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): R28@4.7Å(now 7.9,conf 0.37)
  - S15↔R28: targets 4.0/4.7Å but partners are 11.1Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=6 · 3-10(G)=2 · coil(C)=1

```
CEEHHHHEHHEHHHHHHGHHHHEHGHHE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=9 · sheet=10
  - E5 ↔ W9  (helix)
  - S6 ↔ I10  (helix)
  - W9 ↔ I13  (helix)
  - I10 ↔ S14  (helix)
  - I13 ↔ I17  (helix)
  - A16 ↔ S20  (helix)
  - I17 ↔ C21  (helix)
  - S20 ↔ K24  (helix)
  - K22 ↔ C26  (helix)
  - P2 ↔ V8  (sheet)
  - P2 ↔ P11  (sheet)
  - C3 ↔ V8  (sheet)
  - C3 ↔ P11  (sheet)
  - C3 ↔ S23  (sheet)
  - V8 ↔ S23  (sheet)
  - V8 ↔ R28  (sheet)
  - P11 ↔ S23  (sheet)
  - P11 ↔ R28  (sheet)
  - S23 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=12 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=203 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=110 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3459 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=12 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
