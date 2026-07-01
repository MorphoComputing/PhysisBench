# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\3IOL\seeds\seed_8\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.439 A
- tm_score_ca_ordered: 0.18012935956345064
- heavy_atom_rmsd: 5.536 A
- sidechain_heavy_atom_rmsd: 6.896 A
- **all-atom quality (honest):** heavy 5.536 A, sidechain 6.896 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 121
- bin_accuracy: 0.736

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.042), conflicts/hub=1.0, max_incompat=1.79Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y9** — severity 1.10, 1 conflict(s); suspect input ~`T3` (group: pull_in)
  - pull-in (wants closer): A14@7.4Å(now 10.1,conf 0.82)
  - A14↔T3: targets 7.4/9.9Å but partners are 19.1Å apart → too_far_apart by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=9 · 3-10(G)=3 · coil(C)=0

```
EEHEHEEGHHHHEGHGHEHHHHEE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=4 · sheet=8
  - D5 ↔ Y9  (helix)
  - E11 ↔ A15  (helix)
  - A15 ↔ I19  (helix)
  - E17 ↔ W21  (helix)
  - T1 ↔ V6  (sheet)
  - T1 ↔ S7  (sheet)
  - F2 ↔ S7  (sheet)
  - V6 ↔ Q13  (sheet)
  - S7 ↔ Q13  (sheet)
  - Q13 ↔ F18  (sheet)
  - F18 ↔ V23  (sheet)
  - F18 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=8 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=56 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3344 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
