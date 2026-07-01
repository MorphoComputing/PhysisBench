# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2KNM\seeds\seed_4\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.563 A
- tm_score_ca_ordered: 0.06028367972415256
- heavy_atom_rmsd: 7.142 A
- sidechain_heavy_atom_rmsd: 7.411 A
- **all-atom quality (honest):** heavy 7.142 A, sidechain 7.411 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 15
- distogram_pairs: 29
- bin_accuracy: 0.345

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C19-S20 → 10 conflicts (83%)
- explained: 10/12 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.179), conflicts/hub=2.4, max_incompat=6.27Å, chain_span=0.786
- **fix-first:** [LOW_CONFLICT] Root cause(s): C19-S20 — explain ~10/12 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y27** — severity 7.70, 4 conflict(s); suspect input ~`C3` (group: pull_in)
  - pull-in (wants closer): S20@3.7Å(now 9.2,conf 0.61), P2@4.5Å(now 7.6,conf 0.39)
  - S20↔C3: targets 3.7/3.7Å but partners are 11.4Å apart → too_far_apart by 4.1Å
  - S20↔I1: targets 3.7/4.7Å but partners are 14.6Å apart → too_far_apart by 6.3Å
  - S20↔P2: targets 3.7/4.5Å but partners are 13.8Å apart → too_far_apart by 5.7Å
- **S14** — severity 3.06, 2 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 8.0,conf 0.58)
  - E5↔I17: targets 3.8/3.8Å but partners are 10.2Å apart → too_far_apart by 2.6Å
  - E5↔C19: targets 3.8/3.8Å but partners are 10.2Å apart → too_far_apart by 2.6Å
- **C26** — severity 2.58, 2 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 7.5,conf 0.58), S6@4.2Å(now 7.0,conf 0.43)
  - E5↔S20: targets 3.8/4.5Å but partners are 13.1Å apart → too_far_apart by 4.8Å
  - S6↔S20: targets 4.2/4.5Å but partners are 10.5Å apart → too_far_apart by 1.8Å
- **R28** — severity 2.45, 3 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): I1@3.7Å(now 6.3,conf 0.60), S20@6.1Å(now 9.4,conf 0.21)
  - I1↔S20: targets 3.7/6.1Å but partners are 14.6Å apart → too_far_apart by 4.8Å
  - I1↔C19: targets 3.7/4.7Å but partners are 10.4Å apart → too_far_apart by 2.0Å
  - P2↔S20: targets 4.3/6.1Å but partners are 13.8Å apart → too_far_apart by 3.4Å
- **S6** — severity 0.90, 1 conflict(s); suspect input ~`C26` (group: pull_in)
  - pull-in (wants closer): C26@4.2Å(now 7.0,conf 0.43)
  - I10↔C26: targets 3.8/4.2Å but partners are 10.0Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=4 · 3-10(G)=2 · coil(C)=2

```
CHHHEEHHHHEHHGHHHEHHHHHHHGHC
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=13 · sheet=4
  - C3 ↔ C7  (helix)
  - G4 ↔ V8  (helix)
  - V8 ↔ C12  (helix)
  - W9 ↔ I13  (helix)
  - C12 ↔ A16  (helix)
  - I13 ↔ I17  (helix)
  - S15 ↔ C19  (helix)
  - A16 ↔ S20  (helix)
  - I17 ↔ C21  (helix)
  - C19 ↔ S23  (helix)
  - S20 ↔ K24  (helix)
  - C21 ↔ V25  (helix)
  - S23 ↔ Y27  (helix)
  - E5 ↔ P11  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ G18  (sheet)
  - P11 ↔ G18  (sheet)

## Solvent Accessibility (burial)

- buried=6 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=185 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=102 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.9805 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=15 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
