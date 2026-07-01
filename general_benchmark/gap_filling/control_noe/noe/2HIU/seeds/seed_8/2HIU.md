# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2HIU\seeds\seed_8\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.050 A
- tm_score_ca_ordered: 0.14662974534276574
- heavy_atom_rmsd: 8.168 A
- sidechain_heavy_atom_rmsd: 9.086 A
- **all-atom quality (honest):** heavy 8.168 A, sidechain 9.086 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 29
- distogram_pairs: 25
- bin_accuracy: 0.360

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C25 → 5 conflicts (83%)
- explained: 5/6 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.064), conflicts/hub=2.0, max_incompat=4.61Å, chain_span=0.511
- **fix-first:** [LOW_CONFLICT] Root cause(s): C25 — explain ~5/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 2.80, 4 conflict(s); suspect input ~`Q22` (group: pull_in)
  - pull-in (wants closer): Y44@4.3Å(now 13.4,conf 0.41), P46@4.5Å(now 11.7,conf 0.39), T45@4.5Å(now 14.2,conf 0.39)
  - Y44↔Q22: targets 4.3/4.5Å but partners are 10.8Å apart → too_far_apart by 2.0Å
  - Q22↔T45: targets 4.5/4.5Å but partners are 10.9Å apart → too_far_apart by 1.9Å
  - N21↔T45: targets 4.5/4.5Å but partners are 10.7Å apart → too_far_apart by 1.7Å
- **V20** — severity 1.65, 1 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): H23@4.5Å(now 8.7,conf 0.39), C37@4.9Å(now 8.2,conf 0.36)
  - H23↔C37: targets 4.5/4.9Å but partners are 14.0Å apart → too_far_apart by 4.6Å
- **Y44** — severity 0.71, 1 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 13.4,conf 0.41)
  - C25↔H28: targets 4.3/5.1Å but partners are 12.0Å apart → too_far_apart by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=9 · 3-10(G)=6 · coil(C)=1

```
CHEGGHHHHGGHHGHHHEHEEHHHHEEHHHEHHHHHEHHHHHHGHHE
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=16 · sheet=21
  - V2 ↔ C6  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - C19 ↔ H23  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - A32 ↔ V36  (helix)
  - Y34 ↔ G38  (helix)
  - L35 ↔ E39  (helix)
  - V36 ↔ R40  (helix)
  - E39 ↔ F43  (helix)
  - E3 ↔ Y18  (sheet)
  - E3 ↔ V20  (sheet)
  - E3 ↔ N21  (sheet)
  - Y18 ↔ G26  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=420 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=283 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.5417 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=29 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
