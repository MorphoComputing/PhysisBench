# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_4\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.131 A
- tm_score_ca_ordered: 0.25873783353711205
- heavy_atom_rmsd: 5.016 A
- sidechain_heavy_atom_rmsd: 6.149 A
- **all-atom quality (honest):** heavy 5.016 A, sidechain 6.149 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 340
- bin_accuracy: 0.724

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** T6-D8 → 13 conflicts (100%)
- explained: 13/13 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.148), conflicts/hub=3.2, max_incompat=2.93Å, chain_span=0.593
- **fix-first:** [LOW_CONFLICT] Root cause(s): T6-D8 — explain ~13/13 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D8** — severity 5.14, 4 conflict(s); suspect input ~`V22` (group: pull_in)
  - pull-in (wants closer): V22@20.7Å(now 23.6,conf 0.51)
  - F5↔V22: targets 5.2/20.7Å but partners are 28.6Å apart → too_far_apart by 2.7Å
  - V22↔T4: targets 20.7/6.9Å but partners are 30.6Å apart → too_far_apart by 2.9Å
  - V22↔S1: targets 20.7/14.5Å but partners are 38.1Å apart → too_far_apart by 2.9Å
- **V22** — severity 4.11, 4 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): D8@20.7Å(now 23.6,conf 0.51)
  - T4↔D8: targets 31.1/20.7Å but partners are 7.6Å apart → too_close_together by 2.8Å
  - D8↔M26: targets 20.7/6.3Å but partners are 28.9Å apart → too_far_apart by 1.9Å
  - F5↔D8: targets 29.1/20.7Å but partners are 6.7Å apart → too_close_together by 1.7Å
- **T6** — severity 2.72, 3 conflict(s); suspect input ~`D14` (group: push_out)
  - push-out (wants farther): S15@17.7Å(now 15.1,conf 0.46)
  - S15↔D14: targets 17.7/11.6Å but partners are 3.6Å apart → too_close_together by 2.5Å
  - S15↔Y12: targets 17.7/10.4Å but partners are 5.4Å apart → too_close_together by 2.0Å
  - S10↔S15: targets 6.3/17.7Å but partners are 9.8Å apart → too_close_together by 1.6Å
- **S15** — severity 1.78, 2 conflict(s); suspect input ~`T6` (group: push_out)
  - push-out (wants farther): T6@17.7Å(now 15.1,conf 0.46)
  - Y12↔T6: targets 5.1/17.7Å but partners are 10.2Å apart → too_close_together by 2.4Å
  - K11↔T6: targets 6.7/17.7Å but partners are 9.5Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=6 · 3-10(G)=5 · coil(C)=1

```
EEECEHEHGHGHHHHHHGGGHHHHHHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=8 · sheet=1
  - T6 ↔ S10  (helix)
  - D8 ↔ Y12  (helix)
  - S10 ↔ D14  (helix)
  - Y12 ↔ R16  (helix)
  - L13 ↔ R17  (helix)
  - R17 ↔ F21  (helix)
  - F21 ↔ L25  (helix)
  - V22 ↔ M26  (helix)
  - Q2 ↔ S7  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=65 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.93 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
