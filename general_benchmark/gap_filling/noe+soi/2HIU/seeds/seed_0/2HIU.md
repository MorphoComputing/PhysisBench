# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.094 A
- tm_score_ca_ordered: 0.15612790767212356
- heavy_atom_rmsd: 7.948 A
- sidechain_heavy_atom_rmsd: 8.579 A
- **all-atom quality (honest):** heavy 7.948 A, sidechain 8.579 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 220
- bin_accuracy: 0.359

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** L24-C25 → 13 conflicts (59%)
- explained: 13/22 conflicts by 1 root cause(s)
- metrics: hubs=14 (frac 0.298), conflicts/hub=1.6, max_incompat=4.83Å, chain_span=0.979
- **fix-first:** [LOW_CONFLICT] Root cause(s): L24-C25 — explain ~13/22 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L24** — severity 3.45, 4 conflict(s); suspect input ~`Y18` (group: push_out)
  - push-out (wants farther): S27@6.2Å(now 2.2,conf 0.52), Y18@10.8Å(now 6.9,conf 0.34), N17@11.2Å(now 8.0,conf 0.34)
  - L29↔Y18: targets 4.3/10.8Å but partners are 3.2Å apart → too_close_together by 3.2Å
  - H28↔Y18: targets 4.5/10.8Å but partners are 3.5Å apart → too_close_together by 2.8Å
  - T45↔Y18: targets 4.5/10.8Å but partners are 4.1Å apart → too_close_together by 2.2Å
- **V20** — severity 3.23, 3 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): C37@4.9Å(now 7.7,conf 0.36)
  - push-out (wants farther): L15@12.8Å(now 7.9,conf 0.84), S27@9.5Å(now 6.4,conf 0.58), E16@11.9Å(now 8.4,conf 0.49)
  - L15↔N17: targets 12.8/9.0Å but partners are 1.5Å apart → too_close_together by 2.3Å
  - C25↔C37: targets 7.3/4.9Å but partners are 14.8Å apart → too_far_apart by 2.6Å
  - H23↔C37: targets 4.5/4.9Å but partners are 11.5Å apart → too_far_apart by 2.1Å
- **K47** — severity 2.38, 1 conflict(s); suspect input ~`I1` (group: push_out)
  - push-out (wants farther): I1@20.4Å(now 6.8,conf 0.49)
  - Y44↔I1: targets 9.6/20.4Å but partners are 6.0Å apart → too_close_together by 4.8Å
- **C25** — severity 2.12, 2 conflict(s); suspect input ~`Q22` (group: pull_in)
  - pull-in (wants closer): A32@10.8Å(now 14.1,conf 0.59), E31@9.8Å(now 13.8,conf 0.52), N21@4.5Å(now 9.7,conf 0.39), Q22@4.5Å(now 8.5,conf 0.39)
  - P46↔Q22: targets 4.5/4.5Å but partners are 11.7Å apart → too_far_apart by 2.7Å
  - P46↔N21: targets 4.5/4.5Å but partners are 11.7Å apart → too_far_apart by 2.7Å
- **L35** — severity 1.85, 2 conflict(s); suspect input ~`A32` (group: pull_in)
  - pull-in (wants closer): L29@7.0Å(now 9.8,conf 0.67), A32@4.1Å(now 7.9,conf 0.43)
  - A32↔G38: targets 4.1/4.1Å but partners are 11.0Å apart → too_far_apart by 2.7Å
  - G41↔A32: targets 11.0/4.1Å but partners are 16.6Å apart → too_far_apart by 1.5Å
- **Y44** — severity 1.52, 1 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): G38@9.1Å(now 12.0,conf 0.84)
  - G38↔C25: targets 9.1/4.3Å but partners are 17.1Å apart → too_far_apart by 3.7Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=17 · 3-10(G)=8 · coil(C)=3

```
CECHEHHGGHHHHEGEHHHGHEHEHGEGGCHHEHHHEHEEGEEEEEE
```

## Backbone H-bond Network

- total=51 · helix(i→i+4)=9 · sheet=42
  - C6 ↔ C10  (helix)
  - T7 ↔ S11  (helix)
  - Y13 ↔ N17  (helix)
  - N17 ↔ N21  (helix)
  - C19 ↔ H23  (helix)
  - N21 ↔ C25  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - Y34 ↔ G38  (helix)
  - V2 ↔ Q14  (sheet)
  - V2 ↔ E16  (sheet)
  - C5 ↔ Q14  (sheet)
  - C5 ↔ E16  (sheet)
  - C5 ↔ L24  (sheet)
  - Q14 ↔ L24  (sheet)
  - Q14 ↔ S27  (sheet)
  - E16 ↔ L24  (sheet)
  - E16 ↔ S27  (sheet)
  - E16 ↔ L33  (sheet)
  - Q22 ↔ S27  (sheet)
  - … +31 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=18 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=251 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=144 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.7194 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
