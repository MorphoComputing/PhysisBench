# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\3IOL\seeds\seed_5\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 3.165 A
- tm_score_ca_ordered: 0.12611424519486766
- heavy_atom_rmsd: 5.446 A
- sidechain_heavy_atom_rmsd: 6.918 A
- **all-atom quality (honest):** heavy 5.446 A, sidechain 6.918 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 138
- bin_accuracy: 0.768

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.042), conflicts/hub=1.0, max_incompat=2.55Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T1** — severity 2.03, 1 conflict(s); suspect input ~`L22` (group: pull_in)
  - pull-in (wants closer): K24@27.8Å(now 31.4,conf 0.93)
  - K24↔L22: targets 27.8/31.1Å but partners are 0.7Å apart → too_close_together by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=10 · 3-10(G)=1 · coil(C)=2

```
CEEGEHEHHHHHEEHCEHEHEHHE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=4 · sheet=8
  - V6 ↔ L10  (helix)
  - S8 ↔ G12  (helix)
  - E11 ↔ A15  (helix)
  - F18 ↔ L22  (helix)
  - F2 ↔ S7  (sheet)
  - D5 ↔ Q13  (sheet)
  - S7 ↔ Q13  (sheet)
  - S7 ↔ A14  (sheet)
  - Q13 ↔ I19  (sheet)
  - A14 ↔ I19  (sheet)
  - A14 ↔ W21  (sheet)
  - I19 ↔ K24  (sheet)

## Solvent Accessibility (burial)

- buried=9 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=59 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.1394 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
