# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2HIU\seeds\seed_5\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.665 A
- tm_score_ca_ordered: 0.12064696335559352
- heavy_atom_rmsd: 9.251 A
- sidechain_heavy_atom_rmsd: 10.516 A
- **all-atom quality (honest):** heavy 9.251 A, sidechain 10.516 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 26
- distogram_pairs: 25
- bin_accuracy: 0.360

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C25 → 3 conflicts (60%)
- explained: 3/5 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.064), conflicts/hub=1.7, max_incompat=4.84Å, chain_span=0.319
- **fix-first:** [LOW_CONFLICT] Root cause(s): C25 — explain ~3/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 4.03, 3 conflict(s); suspect input ~`Q22` (group: pull_in)
  - pull-in (wants closer): Y44@4.3Å(now 7.8,conf 0.41), P46@4.5Å(now 10.3,conf 0.39), T45@4.5Å(now 9.1,conf 0.39)
  - P46↔Q22: targets 4.5/4.5Å but partners are 13.8Å apart → too_far_apart by 4.8Å
  - P46↔N21: targets 4.5/4.5Å but partners are 12.5Å apart → too_far_apart by 3.5Å
  - Q22↔T45: targets 4.5/4.5Å but partners are 11.1Å apart → too_far_apart by 2.0Å
- **V20** — severity 1.06, 1 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): C37@4.9Å(now 10.6,conf 0.36)
  - H23↔C37: targets 4.5/4.9Å but partners are 12.3Å apart → too_far_apart by 3.0Å
- **L35** — severity 0.80, 1 conflict(s); suspect input ~`E31` (group: pull_in)
  - pull-in (wants closer): E31@4.1Å(now 6.9,conf 0.43)
  - E31↔G38: targets 4.1/4.1Å but partners are 10.1Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=7 · 3-10(G)=7 · coil(C)=1

```
CGEHHHHHHHHHHEHEHEHGGHHHHHEHHHHHHGHHHHHEHHGHGGE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=18 · sheet=7
  - Q4 ↔ S8  (helix)
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - T7 ↔ S11  (helix)
  - S8 ↔ L12  (helix)
  - S11 ↔ L15  (helix)
  - L15 ↔ C19  (helix)
  - C19 ↔ H23  (helix)
  - Q22 ↔ G26  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - G26 ↔ V30  (helix)
  - H28 ↔ A32  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L35 ↔ E39  (helix)
  - C37 ↔ G41  (helix)
  - G38 ↔ F42  (helix)
  - E3 ↔ Q14  (sheet)
  - E3 ↔ E16  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=439 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=292 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.3034 (restraint satisfaction; lower=better)
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
