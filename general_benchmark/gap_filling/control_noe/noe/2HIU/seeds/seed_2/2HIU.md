# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2HIU\seeds\seed_2\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.096 A
- tm_score_ca_ordered: 0.16617438283475902
- heavy_atom_rmsd: 8.302 A
- sidechain_heavy_atom_rmsd: 9.450 A
- **all-atom quality (honest):** heavy 8.302 A, sidechain 9.450 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 25
- distogram_pairs: 25
- bin_accuracy: 0.320

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** N21-Q22 → 5 conflicts (83%)
- explained: 5/6 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.043), conflicts/hub=3.0, max_incompat=6.7Å, chain_span=0.021
- **fix-first:** [LOW_CONFLICT] Root cause(s): N21-Q22 — explain ~5/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 8.01, 5 conflict(s); suspect input ~`Q22` (group: pull_in)
  - pull-in (wants closer): Y44@4.3Å(now 9.5,conf 0.41), P46@4.5Å(now 11.9,conf 0.39), Q22@4.5Å(now 8.8,conf 0.39), T45@4.5Å(now 13.6,conf 0.39)
  - P46↔Q22: targets 4.5/4.5Å but partners are 15.7Å apart → too_far_apart by 6.7Å
  - Q22↔T45: targets 4.5/4.5Å but partners are 15.4Å apart → too_far_apart by 6.4Å
  - Y44↔Q22: targets 4.3/4.5Å but partners are 12.5Å apart → too_far_apart by 3.7Å
- **L24** — severity 1.32, 1 conflict(s); suspect input ~`T45` (group: pull_in)
  - pull-in (wants closer): T45@4.5Å(now 12.2,conf 0.39)
  - L29↔T45: targets 4.3/4.5Å but partners are 12.3Å apart → too_far_apart by 3.4Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=10 · 3-10(G)=4 · coil(C)=1

```
CHEHHHHHHHEHHEHHHEHEHHGHHGHHEGHHHHEHHHHHHEGHEHE
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=20 · sheet=20
  - V2 ↔ C6  (helix)
  - Q4 ↔ S8  (helix)
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - N17 ↔ N21  (helix)
  - N21 ↔ C25  (helix)
  - L24 ↔ H28  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - A32 ↔ V36  (helix)
  - L33 ↔ C37  (helix)
  - Y34 ↔ G38  (helix)
  - V36 ↔ R40  (helix)
  - C37 ↔ G41  (helix)
  - R40 ↔ Y44  (helix)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=17 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=379 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=243 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.6352 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=25 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
