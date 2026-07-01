# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\2HIU\seeds\seed_6\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.357 A
- tm_score_ca_ordered: 0.14676011463246916
- heavy_atom_rmsd: 8.624 A
- sidechain_heavy_atom_rmsd: 9.849 A
- **all-atom quality (honest):** heavy 8.624 A, sidechain 9.849 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 39
- distogram_pairs: 25
- bin_accuracy: 0.280

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.043), conflicts/hub=1.0, max_incompat=3.57Å, chain_span=0.106
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **V20** — severity 1.27, 1 conflict(s); suspect input ~`C37` (group: pull_in)
  - pull-in (wants closer): H23@4.5Å(now 8.1,conf 0.39), C37@4.9Å(now 8.3,conf 0.36)
  - H23↔C37: targets 4.5/4.9Å but partners are 12.9Å apart → too_far_apart by 3.6Å
- **C25** — severity 1.15, 1 conflict(s); suspect input ~`Q22` (group: pull_in)
  - pull-in (wants closer): P46@4.5Å(now 7.5,conf 0.39), T45@4.5Å(now 10.4,conf 0.39)
  - Q22↔T45: targets 4.5/4.5Å but partners are 11.9Å apart → too_far_apart by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=31 · strand(E)=8 · 3-10(G)=6 · coil(C)=2

```
EHEGEHHGHHCHEGHHHEHECHGHHHHHEHHHHGHHHHHHHHHGHHE
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=18 · sheet=15
  - V2 ↔ C6  (helix)
  - C6 ↔ C10  (helix)
  - L12 ↔ E16  (helix)
  - L15 ↔ C19  (helix)
  - Q22 ↔ G26  (helix)
  - L24 ↔ H28  (helix)
  - G26 ↔ V30  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L33 ↔ C37  (helix)
  - L35 ↔ E39  (helix)
  - V36 ↔ R40  (helix)
  - C37 ↔ G41  (helix)
  - G38 ↔ F42  (helix)
  - G41 ↔ T45  (helix)
  - F42 ↔ P46  (helix)
  - I1 ↔ Y13  (sheet)
  - I1 ↔ Y18  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=15 · exposed=24 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=464 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=316 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.0528 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=39 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
