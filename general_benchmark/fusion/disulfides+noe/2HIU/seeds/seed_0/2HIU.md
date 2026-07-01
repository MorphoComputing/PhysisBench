# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\fusion\disulfides+noe\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 8.328 A
- tm_score_ca_ordered: 0.09871507428452243
- heavy_atom_rmsd: 9.805 A
- sidechain_heavy_atom_rmsd: 11.064 A
- **all-atom quality (honest):** heavy 9.805 A, sidechain 11.064 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 41
- distogram_pairs: 28
- bin_accuracy: 0.357

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C25 → 7 conflicts (70%)
- explained: 7/10 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.085), conflicts/hub=2.5, max_incompat=4.33Å, chain_span=0.298
- **fix-first:** [LOW_CONFLICT] Root cause(s): C25 — explain ~7/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 8.61, 7 conflict(s); suspect input ~`N21` (group: pull_in)
  - pull-in (wants closer): P46@4.5Å(now 10.3,conf 0.39), N21@4.5Å(now 8.8,conf 0.39), Q22@4.5Å(now 7.6,conf 0.39), T45@4.5Å(now 10.5,conf 0.39)
  - N21↔T45: targets 4.5/4.5Å but partners are 13.3Å apart → too_far_apart by 4.3Å
  - Q22↔T45: targets 4.5/4.5Å but partners are 12.7Å apart → too_far_apart by 3.7Å
  - C6↔P46: targets 5.5/4.5Å but partners are 13.4Å apart → too_far_apart by 3.4Å
- **L24** — severity 1.38, 1 conflict(s); suspect input ~`T45` (group: pull_in)
  - pull-in (wants closer): L29@4.3Å(now 6.9,conf 0.41), T45@4.5Å(now 10.8,conf 0.39)
  - L29↔T45: targets 4.3/4.5Å but partners are 12.5Å apart → too_far_apart by 3.6Å
- **Y34** — severity 1.23, 1 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): E31@4.0Å(now 7.9,conf 0.45), C37@4.1Å(now 7.2,conf 0.43), V30@4.5Å(now 8.6,conf 0.39)
  - E31↔C37: targets 4.0/4.1Å but partners are 11.0Å apart → too_far_apart by 2.8Å
- **V20** — severity 0.54, 1 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): C37@4.9Å(now 8.6,conf 0.36)
  - H23↔C37: targets 4.5/4.9Å but partners are 10.9Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=8 · 3-10(G)=2 · coil(C)=1

```
CHHEHHHHHHHHHHHHHHHHEEHHHHHHHHHHHEHHHEEHHHGHGEE
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=25 · sheet=15
  - V2 ↔ C6  (helix)
  - E3 ↔ T7  (helix)
  - C5 ↔ I9  (helix)
  - C6 ↔ C10  (helix)
  - T7 ↔ S11  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - C10 ↔ Q14  (helix)
  - S11 ↔ L15  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - Q14 ↔ Y18  (helix)
  - L15 ↔ C19  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=495 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=348 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2665 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=41 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
