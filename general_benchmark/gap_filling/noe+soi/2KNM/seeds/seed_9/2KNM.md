# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2KNM\seeds\seed_9\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 3.514 A
- tm_score_ca_ordered: 0.20072934788927954
- heavy_atom_rmsd: 4.515 A
- sidechain_heavy_atom_rmsd: 5.161 A
- **all-atom quality (honest):** heavy 4.515 A, sidechain 5.161 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 133
- bin_accuracy: 0.632

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** K22-C26 → 7 conflicts (88%)
- explained: 7/8 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.143), conflicts/hub=2.0, max_incompat=3.74Å, chain_span=0.821
- **fix-first:** [LOW_CONFLICT] Root cause(s): K22-C26 — explain ~7/8 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C26** — severity 6.55, 4 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): C3@3.8Å(now 7.9,conf 0.58), E5@3.8Å(now 7.4,conf 0.58)
  - S23↔C3: targets 7.1/3.8Å but partners are 14.7Å apart → too_far_apart by 3.7Å
  - K22↔C3: targets 6.8/3.8Å but partners are 13.9Å apart → too_far_apart by 3.3Å
  - K22↔E5: targets 6.8/3.8Å but partners are 13.1Å apart → too_far_apart by 2.4Å
- **K22** — severity 2.85, 2 conflict(s); suspect input ~`V25` (group: pull_in)
  - pull-in (wants closer): V25@3.8Å(now 7.5,conf 0.58)
  - S15↔V25: targets 11.6/3.8Å but partners are 4.9Å apart → too_close_together by 2.9Å
  - V25↔A16: targets 3.8/12.3Å but partners are 6.1Å apart → too_close_together by 2.4Å
- **G18** — severity 1.41, 1 conflict(s); suspect input ~`S15` (group: push_out)
  - push-out (wants farther): V25@11.1Å(now 8.2,conf 0.67)
  - V25↔S15: targets 11.1/3.8Å but partners are 4.9Å apart → too_close_together by 2.4Å
- **C3** — severity 0.84, 1 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): Y27@3.7Å(now 6.7,conf 0.60), C26@3.8Å(now 7.9,conf 0.58), R28@4.4Å(now 9.3,conf 0.41)
  - I10↔R28: targets 11.2/4.4Å but partners are 17.7Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=3 · strand(E)=15 · 3-10(G)=5 · coil(C)=5

```
CEGECEGHEEECCHEHEEEEECGEGGEE
```

## Backbone H-bond Network

- total=58 · helix(i→i+4)=0 · sheet=58
  - P2 ↔ P11  (sheet)
  - P2 ↔ S15  (sheet)
  - P2 ↔ I17  (sheet)
  - P2 ↔ G18  (sheet)
  - P2 ↔ C19  (sheet)
  - P2 ↔ S20  (sheet)
  - P2 ↔ C21  (sheet)
  - G4 ↔ I10  (sheet)
  - G4 ↔ P11  (sheet)
  - G4 ↔ S15  (sheet)
  - G4 ↔ I17  (sheet)
  - G4 ↔ G18  (sheet)
  - G4 ↔ C19  (sheet)
  - G4 ↔ S20  (sheet)
  - G4 ↔ C21  (sheet)
  - G4 ↔ K24  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ S15  (sheet)
  - S6 ↔ I17  (sheet)
  - S6 ↔ G18  (sheet)
  - … +38 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=150 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=96 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.7133 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
