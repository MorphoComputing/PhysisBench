# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2HIU\seeds\seed_3\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.835 A
- tm_score_ca_ordered: 0.14381150590755842
- heavy_atom_rmsd: 9.280 A
- sidechain_heavy_atom_rmsd: 10.327 A
- **all-atom quality (honest):** heavy 9.280 A, sidechain 10.327 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 36
- distogram_pairs: 25
- bin_accuracy: 0.280

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** H23-H28 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.043), conflicts/hub=1.5, max_incompat=5.13Å, chain_span=0.511
- **fix-first:** [LOW_CONFLICT] Root cause(s): H23-H28 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y44** — severity 2.08, 2 conflict(s); suspect input ~`H28` (group: pull_in)
  - pull-in (wants closer): C25@4.3Å(now 9.5,conf 0.41)
  - C25↔H28: targets 4.3/5.1Å but partners are 14.5Å apart → too_far_apart by 5.1Å
  - C25↔S27: targets 4.3/4.5Å but partners are 10.7Å apart → too_far_apart by 1.9Å
- **V20** — severity 0.76, 1 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): C37@4.9Å(now 8.6,conf 0.36)
  - H23↔C37: targets 4.5/4.9Å but partners are 11.5Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=8 · 3-10(G)=6 · coil(C)=2

```
CHGHHHGHHHGHHHHHHEHCEHEHHEEHHHHHHHHHHHHGGHEGHEE
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=16 · sheet=11
  - V2 ↔ C6  (helix)
  - Q4 ↔ S8  (helix)
  - C6 ↔ C10  (helix)
  - S8 ↔ L12  (helix)
  - I9 ↔ Y13  (helix)
  - C10 ↔ Q14  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - L24 ↔ H28  (helix)
  - C25 ↔ L29  (helix)
  - H28 ↔ A32  (helix)
  - V30 ↔ Y34  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L35 ↔ E39  (helix)
  - Y18 ↔ H23  (sheet)
  - Y18 ↔ G26  (sheet)
  - Y18 ↔ S27  (sheet)
  - N21 ↔ G26  (sheet)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=19 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=423 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=291 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6204 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=36 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
