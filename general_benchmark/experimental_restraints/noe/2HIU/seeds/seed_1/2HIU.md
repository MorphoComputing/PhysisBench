# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\experimental_restraints\noe\2HIU\seeds\seed_1\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.321 A
- tm_score_ca_ordered: 0.15907032417139347
- heavy_atom_rmsd: 8.486 A
- sidechain_heavy_atom_rmsd: 9.435 A
- **all-atom quality (honest):** heavy 8.486 A, sidechain 9.435 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 28
- distogram_pairs: 25
- bin_accuracy: 0.320

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C25 → 7 conflicts (88%)
- explained: 7/8 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.064), conflicts/hub=2.7, max_incompat=8.3Å, chain_span=0.426
- **fix-first:** [LOW_CONFLICT] Root cause(s): C25 — explain ~7/8 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 11.74, 5 conflict(s); suspect input ~`N21` (group: pull_in)
  - pull-in (wants closer): Y44@4.3Å(now 10.2,conf 0.41), P46@4.5Å(now 9.3,conf 0.39), N21@4.5Å(now 10.2,conf 0.39), Q22@4.5Å(now 9.5,conf 0.39), T45@4.5Å(now 8.6,conf 0.39)
  - P46↔N21: targets 4.5/4.5Å but partners are 17.3Å apart → too_far_apart by 8.3Å
  - N21↔T45: targets 4.5/4.5Å but partners are 16.0Å apart → too_far_apart by 7.0Å
  - P46↔Q22: targets 4.5/4.5Å but partners are 14.7Å apart → too_far_apart by 5.7Å
- **Y44** — severity 2.06, 2 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 10.2,conf 0.41)
  - C25↔H28: targets 4.3/5.1Å but partners are 13.6Å apart → too_far_apart by 4.2Å
  - C25↔S27: targets 4.3/4.5Å but partners are 11.3Å apart → too_far_apart by 2.5Å
- **L24** — severity 0.77, 1 conflict(s); suspect input ~`T45` (group: pull_in)
  - pull-in (wants closer): T45@4.5Å(now 10.6,conf 0.39)
  - H28↔T45: targets 4.5/4.5Å but partners are 11.0Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=28 · strand(E)=12 · 3-10(G)=6 · coil(C)=1

```
CHEHHHHHHGGHHGHHHGHEHEHEHEHHHHHGHEHHHGHEHEHEEEE
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=17 · sheet=25
  - V2 ↔ C6  (helix)
  - Q4 ↔ S8  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - N17 ↔ N21  (helix)
  - C19 ↔ H23  (helix)
  - N21 ↔ C25  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - E31 ↔ L35  (helix)
  - L33 ↔ C37  (helix)
  - C37 ↔ G41  (helix)
  - V20 ↔ G26  (sheet)
  - V20 ↔ Y34  (sheet)
  - V20 ↔ R40  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=405 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=262 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.3239 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=28 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
