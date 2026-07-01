# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2KNM\seeds\seed_7\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 6.176 A
- tm_score_ca_ordered: 0.08034291566707566
- heavy_atom_rmsd: 6.832 A
- sidechain_heavy_atom_rmsd: 7.422 A
- **all-atom quality (honest):** heavy 6.832 A, sidechain 7.422 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 18
- distogram_pairs: 29
- bin_accuracy: 0.276

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** V25-Y27 → 4 conflicts (80%)
- explained: 4/5 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.143), conflicts/hub=1.2, max_incompat=3.88Å, chain_span=0.714
- **fix-first:** [LOW_CONFLICT] Root cause(s): V25-Y27 — explain ~4/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y27** — severity 2.38, 2 conflict(s); suspect input ~`I1` (group: pull_in)
  - pull-in (wants closer): P2@4.5Å(now 7.1,conf 0.39), I1@4.7Å(now 7.3,conf 0.38)
  - S20↔I1: targets 3.7/4.7Å but partners are 12.2Å apart → too_far_apart by 3.9Å
  - S20↔P2: targets 3.7/4.5Å but partners are 10.5Å apart → too_far_apart by 2.4Å
- **C26** — severity 1.02, 1 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 6.7,conf 0.58)
  - E5↔S20: targets 3.8/4.5Å but partners are 10.9Å apart → too_far_apart by 2.6Å
- **V25** — severity 1.01, 1 conflict(s); suspect input ~`C7` (group: pull_in)
  - pull-in (wants closer): C7@4.2Å(now 7.4,conf 0.43)
  - K22↔C7: targets 3.8/4.2Å but partners are 10.3Å apart → too_far_apart by 2.3Å
- **C7** — severity 0.69, 1 conflict(s); suspect input ~`V25` (group: pull_in)
  - pull-in (wants closer): V25@4.2Å(now 7.4,conf 0.43)
  - I10↔V25: targets 4.2/4.2Å but partners are 9.9Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=6 · 3-10(G)=5 · coil(C)=3

```
CEHHEHHHEHHGEHHHGGGHHHHCCEGE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=7 · sheet=7
  - C3 ↔ C7  (helix)
  - G4 ↔ V8  (helix)
  - S6 ↔ I10  (helix)
  - C7 ↔ P11  (helix)
  - I10 ↔ S14  (helix)
  - P11 ↔ S15  (helix)
  - A16 ↔ S20  (helix)
  - P2 ↔ W9  (sheet)
  - P2 ↔ I13  (sheet)
  - E5 ↔ I13  (sheet)
  - W9 ↔ C26  (sheet)
  - W9 ↔ R28  (sheet)
  - I13 ↔ C26  (sheet)
  - I13 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=206 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=125 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4584 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=18 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
