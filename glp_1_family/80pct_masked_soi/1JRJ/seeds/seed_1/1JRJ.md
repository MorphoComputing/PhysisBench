# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1JRJ\seeds\seed_1\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.449 A
- tm_score_ca_ordered: 0.47881157008183356
- heavy_atom_rmsd: 4.380 A
- sidechain_heavy_atom_rmsd: 5.617 A
- **all-atom quality (honest):** heavy 4.380 A, sidechain 5.617 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 260
- bin_accuracy: 0.819

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=1.0, max_incompat=2.23Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **M13** — severity 1.52, 1 conflict(s); suspect input ~`A34` (group: push_out)
  - pull-in (wants closer): A34@21.9Å(now 24.8,conf 0.68)
  - push-out (wants farther): S10@8.3Å(now 5.6,conf 0.51)
  - S7↔A34: targets 10.4/21.9Å but partners are 34.5Å apart → too_far_apart by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=18 · 3-10(G)=1 · coil(C)=3

```
CEEEHEHEEHHEHHEGHEHCEHHHEHECHEHEHEEEE
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=4 · sheet=30
  - S7 ↔ K11  (helix)
  - M13 ↔ A17  (helix)
  - I22 ↔ K26  (helix)
  - G29 ↔ G33  (helix)
  - G3 ↔ D8  (sheet)
  - G3 ↔ L9  (sheet)
  - T4 ↔ L9  (sheet)
  - T6 ↔ Q12  (sheet)
  - D8 ↔ E15  (sheet)
  - L9 ↔ E15  (sheet)
  - Q12 ↔ V18  (sheet)
  - E15 ↔ F21  (sheet)
  - V18 ↔ L25  (sheet)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)
  - F21 ↔ N27  (sheet)
  - F21 ↔ P30  (sheet)
  - F21 ↔ P35  (sheet)
  - F21 ↔ P36  (sheet)
  - F21 ↔ P37  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=98 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=13 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.5014 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
