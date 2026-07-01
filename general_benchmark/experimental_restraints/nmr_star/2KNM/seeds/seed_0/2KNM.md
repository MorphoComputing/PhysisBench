# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\experimental_restraints\nmr_star\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.852 A
- tm_score_ca_ordered: 0.07820175933544894
- heavy_atom_rmsd: 8.194 A
- sidechain_heavy_atom_rmsd: 9.248 A
- **all-atom quality (honest):** heavy 8.194 A, sidechain 9.248 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 30
- bin_accuracy: 0.467

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.036), conflicts/hub=1.0, max_incompat=1.53Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G4** — severity 0.46, 1 conflict(s); suspect input ~`R28` (group: pull_in)
  - pull-in (wants closer): Y27@3.3Å(now 6.3,conf 0.36)
  - Y27↔R28: targets 3.3/3.7Å but partners are 8.5Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=3 · 3-10(G)=1 · coil(C)=1

```
CEEHHHHHHHHHHHHGHHHHHHHHHHHE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=14 · sheet=0
  - G4 ↔ V8  (helix)
  - E5 ↔ W9  (helix)
  - S6 ↔ I10  (helix)
  - C7 ↔ P11  (helix)
  - V8 ↔ C12  (helix)
  - I10 ↔ S14  (helix)
  - P11 ↔ S15  (helix)
  - S15 ↔ C19  (helix)
  - I17 ↔ C21  (helix)
  - C19 ↔ S23  (helix)
  - S20 ↔ K24  (helix)
  - C21 ↔ V25  (helix)
  - K22 ↔ C26  (helix)
  - S23 ↔ Y27  (helix)

## Solvent Accessibility (burial)

- buried=6 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=228 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=146 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.58 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
