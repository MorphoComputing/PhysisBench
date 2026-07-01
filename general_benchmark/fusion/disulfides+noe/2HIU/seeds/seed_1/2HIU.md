# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\fusion\disulfides+noe\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.313 A
- tm_score_ca_ordered: 0.16946225178137994
- heavy_atom_rmsd: 8.594 A
- sidechain_heavy_atom_rmsd: 9.629 A
- **all-atom quality (honest):** heavy 8.594 A, sidechain 9.629 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 35
- distogram_pairs: 28
- bin_accuracy: 0.536

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C25 → 4 conflicts (67%)
- explained: 4/6 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.085), conflicts/hub=1.5, max_incompat=5.84Å, chain_span=0.511
- **fix-first:** [LOW_CONFLICT] Root cause(s): C25 — explain ~4/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 5.23, 3 conflict(s); suspect input ~`Y44` (group: pull_in)
  - pull-in (wants closer): Y44@4.3Å(now 13.4,conf 0.41), P46@4.5Å(now 10.6,conf 0.39), N21@4.5Å(now 9.6,conf 0.39), T45@4.5Å(now 12.5,conf 0.39)
  - C6↔Y44: targets 5.5/4.3Å but partners are 15.7Å apart → too_far_apart by 5.8Å
  - C6↔T45: targets 5.5/4.5Å but partners are 14.7Å apart → too_far_apart by 4.7Å
  - C6↔P46: targets 5.5/4.5Å but partners are 12.6Å apart → too_far_apart by 2.5Å
- **V20** — severity 1.71, 1 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): C37@4.9Å(now 10.9,conf 0.36)
  - H23↔C37: targets 4.5/4.9Å but partners are 14.2Å apart → too_far_apart by 4.8Å
- **Y44** — severity 1.13, 1 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 13.4,conf 0.41)
  - C25↔H28: targets 4.3/5.1Å but partners are 13.6Å apart → too_far_apart by 4.2Å
- **C37** — severity 0.95, 1 conflict(s); suspect input ~`V20` (group: pull_in)
  - pull-in (wants closer): V20@4.9Å(now 10.9,conf 0.36)
  - Y34↔V20: targets 4.1/4.9Å but partners are 11.7Å apart → too_far_apart by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=9 · 3-10(G)=6 · coil(C)=1

```
CHEGHHHHHHEHHEHHHEHHEEHHHHEGHHHHHHHHGGHEHGHGHHE
```

## Backbone H-bond Network

- total=36 · helix(i→i+4)=18 · sheet=18
  - V2 ↔ C6  (helix)
  - C6 ↔ C10  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - C19 ↔ H23  (helix)
  - V20 ↔ L24  (helix)
  - C25 ↔ L29  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L35 ↔ E39  (helix)
  - E39 ↔ F43  (helix)
  - G41 ↔ T45  (helix)
  - E3 ↔ S11  (sheet)
  - E3 ↔ Q14  (sheet)
  - … +16 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=416 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=278 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.1489 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=35 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
