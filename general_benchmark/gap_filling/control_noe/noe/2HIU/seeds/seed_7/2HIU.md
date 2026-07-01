# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2HIU\seeds\seed_7\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 8.074 A
- tm_score_ca_ordered: 0.09678682676716627
- heavy_atom_rmsd: 9.781 A
- sidechain_heavy_atom_rmsd: 11.209 A
- **all-atom quality (honest):** heavy 9.781 A, sidechain 11.209 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 23
- distogram_pairs: 25
- bin_accuracy: 0.640

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.021), conflicts/hub=1.0, max_incompat=3.43Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y44** — severity 0.91, 1 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 8.2,conf 0.41)
  - C25↔H28: targets 4.3/5.1Å but partners are 12.8Å apart → too_far_apart by 3.4Å

## Secondary Structure (DSSP-like)

- helix(H)=36 · strand(E)=9 · 3-10(G)=2 · coil(C)=0

```
EHEHHHHHHHEHEGHHHHHHEHGHHHEHHHHHHHEHHEHHHHHHHHE
```

## Backbone H-bond Network

- total=35 · helix(i→i+4)=19 · sheet=16
  - V2 ↔ C6  (helix)
  - Q4 ↔ S8  (helix)
  - S8 ↔ L12  (helix)
  - L12 ↔ E16  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - Y18 ↔ Q22  (helix)
  - V20 ↔ L24  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - H28 ↔ A32  (helix)
  - L29 ↔ L33  (helix)
  - V30 ↔ Y34  (helix)
  - A32 ↔ V36  (helix)
  - L33 ↔ C37  (helix)
  - V36 ↔ R40  (helix)
  - C37 ↔ G41  (helix)
  - G41 ↔ T45  (helix)
  - F42 ↔ P46  (helix)
  - I1 ↔ S11  (sheet)
  - … +15 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=376 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=231 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2501 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=23 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
