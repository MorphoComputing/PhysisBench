# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\5WOW\seeds\seed_6\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.672 A
- tm_score_ca_ordered: 0.21994507358140022
- heavy_atom_rmsd: 6.290 A
- sidechain_heavy_atom_rmsd: 7.541 A
- **all-atom quality (honest):** heavy 6.290 A, sidechain 7.541 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 178
- bin_accuracy: 0.511

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Y37 → 10 conflicts (67%)
- explained: 10/15 conflicts by 1 root cause(s)
- metrics: hubs=8 (frac 0.216), conflicts/hub=1.9, max_incompat=5.42Å, chain_span=0.919
- **fix-first:** [LOW_CONFLICT] Root cause(s): Y37 — explain ~10/15 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y37** — severity 3.47, 5 conflict(s); suspect input ~`G1` (group: push_out)
  - push-out (wants farther): D33@11.0Å(now 7.1,conf 0.67), Y32@13.4Å(now 9.3,conf 0.49), G1@21.8Å(now 15.4,conf 0.40), P31@15.7Å(now 12.3,conf 0.40)
  - G1↔V34: targets 21.8/5.7Å but partners are 12.0Å apart → too_close_together by 4.0Å
  - Y32↔G1: targets 13.4/21.8Å but partners are 6.4Å apart → too_close_together by 2.0Å
  - D33↔G1: targets 11.0/21.8Å but partners are 9.1Å apart → too_close_together by 1.7Å
- **C16** — severity 2.27, 2 conflict(s); suspect input ~`Q8` (group: pull_in)
  - pull-in (wants closer): R9@7.2Å(now 10.7,conf 0.52), Q8@5.7Å(now 9.5,conf 0.23)
  - push-out (wants farther): I21@6.9Å(now 3.3,conf 0.94)
  - Y37↔Q8: targets 22.8/5.7Å but partners are 11.7Å apart → too_close_together by 5.4Å
  - R9↔Y37: targets 7.2/22.8Å but partners are 13.5Å apart → too_close_together by 2.1Å
- **P31** — severity 1.66, 2 conflict(s); suspect input ~`Y37` (group: push_out)
  - push-out (wants farther): Y37@15.7Å(now 12.3,conf 0.40)
  - V34↔Y37: targets 9.6/15.7Å but partners are 3.9Å apart → too_close_together by 2.2Å
  - P35↔Y37: targets 12.9/15.7Å but partners are 0.8Å apart → too_close_together by 2.0Å
- **Y30** — severity 1.17, 1 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): C3@3.8Å(now 6.6,conf 0.58)
  - Y27↔C3: targets 7.9/3.8Å but partners are 13.8Å apart → too_far_apart by 2.0Å
- **Y32** — severity 0.85, 1 conflict(s); suspect input ~`Y37` (group: push_out)
  - push-out (wants farther): C28@10.2Å(now 7.6,conf 0.52), Y37@13.4Å(now 9.3,conf 0.49)
  - P35↔Y37: targets 10.9/13.4Å but partners are 0.8Å apart → too_close_together by 1.7Å
- **C28** — severity 0.81, 1 conflict(s); suspect input ~`Y32` (group: push_out)
  - push-out (wants farther): Y32@10.2Å(now 7.6,conf 0.52)
  - Q8↔Y32: targets 3.8/10.2Å but partners are 4.9Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=18 · 3-10(G)=4 · coil(C)=4

```
EHHGEECCEECEHHEEEHEHHGEHHGEECHEEGEEHE
```

## Backbone H-bond Network

- total=59 · helix(i→i+4)=2 · sheet=57
  - S14 ↔ G18  (helix)
  - C20 ↔ G24  (helix)
  - G1 ↔ I6  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ D15  (sheet)
  - G1 ↔ C16  (sheet)
  - G1 ↔ P17  (sheet)
  - G1 ↔ A19  (sheet)
  - K5 ↔ D15  (sheet)
  - K5 ↔ C16  (sheet)
  - K5 ↔ A19  (sheet)
  - K5 ↔ R23  (sheet)
  - I6 ↔ D15  (sheet)
  - I6 ↔ C16  (sheet)
  - I6 ↔ R23  (sheet)
  - R9 ↔ D15  (sheet)
  - R9 ↔ C16  (sheet)
  - R9 ↔ P17  (sheet)
  - R9 ↔ A19  (sheet)
  - R9 ↔ R23  (sheet)
  - … +39 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=13 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=192 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=128 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.1562 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
