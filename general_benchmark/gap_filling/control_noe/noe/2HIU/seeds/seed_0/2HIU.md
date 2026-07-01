# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.862 A
- tm_score_ca_ordered: 0.1310747746557563
- heavy_atom_rmsd: 9.604 A
- sidechain_heavy_atom_rmsd: 11.022 A
- **all-atom quality (honest):** heavy 9.604 A, sidechain 11.022 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 26
- distogram_pairs: 25
- bin_accuracy: 0.280

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** H23-C25 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.064), conflicts/hub=1.0, max_incompat=4.11Å, chain_span=0.511
- **fix-first:** [LOW_CONFLICT] Root cause(s): H23-C25 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y44** — severity 1.09, 1 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 9.0,conf 0.41), H28@5.1Å(now 7.9,conf 0.27)
  - C25↔H28: targets 4.3/5.1Å but partners are 13.5Å apart → too_far_apart by 4.1Å
- **V20** — severity 0.93, 1 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): C37@4.9Å(now 8.6,conf 0.36)
  - H23↔C37: targets 4.5/4.9Å but partners are 12.0Å apart → too_far_apart by 2.6Å
- **H28** — severity 0.45, 1 conflict(s); suspect input ~`F42` (group: pull_in)
  - pull-in (wants closer): L24@4.5Å(now 9.6,conf 0.39), Y44@5.1Å(now 7.9,conf 0.27)
  - L24↔F42: targets 4.5/5.7Å but partners are 12.2Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=14 · 3-10(G)=4 · coil(C)=1

```
CHEHEHEHHEHHHHHEEEHEHHGHHEEGHHHGHEHHEEHHHHHGHHE
```

## Backbone H-bond Network

- total=61 · helix(i→i+4)=14 · sheet=47
  - V2 ↔ C6  (helix)
  - Q4 ↔ S8  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - S11 ↔ L15  (helix)
  - L15 ↔ C19  (helix)
  - N21 ↔ C25  (helix)
  - C25 ↔ L29  (helix)
  - L29 ↔ L33  (helix)
  - E31 ↔ L35  (helix)
  - L35 ↔ E39  (helix)
  - V36 ↔ R40  (helix)
  - G41 ↔ T45  (helix)
  - F42 ↔ P46  (helix)
  - E3 ↔ C10  (sheet)
  - E3 ↔ E16  (sheet)
  - E3 ↔ N17  (sheet)
  - E3 ↔ Y18  (sheet)
  - E3 ↔ V20  (sheet)
  - C5 ↔ C10  (sheet)
  - … +41 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=389 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=257 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.4147 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=26 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
