# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm1\3IOL\seeds\seed_9\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 1.999 A
- tm_score_ca_ordered: 0.2645892657478232
- heavy_atom_rmsd: 3.334 A
- sidechain_heavy_atom_rmsd: 3.925 A
- **all-atom quality (honest):** heavy 3.334 A, sidechain 3.925 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 274
- bin_accuracy: 0.741

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** A20-K24 → 6 conflicts (100%)
- explained: 6/6 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.167), conflicts/hub=1.5, max_incompat=3.34Å, chain_span=0.75
- **fix-first:** [LOW_CONFLICT] Root cause(s): A20-K24 — explain ~6/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L22** — severity 2.61, 2 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@21.1Å(now 23.7,conf 0.53)
  - T3↔S7: targets 31.1/21.1Å but partners are 6.6Å apart → too_close_together by 3.3Å
  - T1↔S7: targets 31.7/21.1Å but partners are 8.9Å apart → too_close_together by 1.6Å
- **A20** — severity 1.82, 2 conflict(s); suspect input ~`K24` (group: pull_in)
  - pull-in (wants closer): S4@21.4Å(now 24.0,conf 0.53)
  - S4↔K24: targets 21.4/6.6Å but partners are 30.0Å apart → too_far_apart by 2.0Å
  - V23↔S4: targets 5.4/21.4Å but partners are 28.5Å apart → too_far_apart by 1.6Å
- **S4** — severity 1.59, 1 conflict(s); suspect input ~`A20` (group: pull_in)
  - pull-in (wants closer): A20@21.4Å(now 24.0,conf 0.53)
  - K24↔A20: targets 30.5/21.4Å but partners are 6.2Å apart → too_close_together by 3.0Å
- **S7** — severity 1.49, 1 conflict(s); suspect input ~`T3` (group: pull_in)
  - pull-in (wants closer): L22@21.1Å(now 23.7,conf 0.53)
  - L22↔T3: targets 21.1/5.6Å but partners are 29.5Å apart → too_far_apart by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=4 · 3-10(G)=1 · coil(C)=1

```
CHHHEHEHHHHGHHHHEHHHHHHE
```

## Backbone H-bond Network

- total=10 · helix(i→i+4)=9 · sheet=1
  - S4 ↔ S8  (helix)
  - Y9 ↔ Q13  (helix)
  - L10 ↔ A14  (helix)
  - E11 ↔ A15  (helix)
  - A14 ↔ F18  (helix)
  - A15 ↔ I19  (helix)
  - K16 ↔ A20  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)
  - E17 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=67 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9883 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
