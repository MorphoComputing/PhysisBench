# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1JRJ\seeds\seed_0\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.061 A
- tm_score_ca_ordered: 0.5481301835786748
- heavy_atom_rmsd: 4.072 A
- sidechain_heavy_atom_rmsd: 5.366 A
- **all-atom quality (honest):** heavy 4.072 A, sidechain 5.366 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 246
- bin_accuracy: 0.760

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.054), conflicts/hub=1.0, max_incompat=2.09Å, chain_span=0.162
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S7** — severity 1.52, 1 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): M13@9.9Å(now 12.4,conf 0.73)
  - E23↔M13: targets 25.9/9.9Å but partners are 13.9Å apart → too_close_together by 2.1Å
- **M13** — severity 1.40, 1 conflict(s); suspect input ~`A34` (group: pull_in)
  - pull-in (wants closer): S7@9.9Å(now 12.4,conf 0.73)
  - S7↔A34: targets 9.9/21.9Å but partners are 33.8Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=16 · 3-10(G)=4 · coil(C)=2

```
EEEEHEHGGHHEHEHEHEHHHHHEHEHCGGCEHEEEE
```

## Backbone H-bond Network

- total=24 · helix(i→i+4)=8 · sheet=16
  - S7 ↔ K11  (helix)
  - K11 ↔ E15  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - R19 ↔ E23  (helix)
  - F21 ↔ L25  (helix)
  - E23 ↔ N27  (helix)
  - T6 ↔ Q12  (sheet)
  - T6 ↔ E14  (sheet)
  - Q12 ↔ V18  (sheet)
  - V18 ↔ W24  (sheet)
  - V18 ↔ P36  (sheet)
  - V18 ↔ P37  (sheet)
  - W24 ↔ S32  (sheet)
  - W24 ↔ A34  (sheet)
  - W24 ↔ P35  (sheet)
  - W24 ↔ P36  (sheet)
  - W24 ↔ P37  (sheet)
  - K26 ↔ S32  (sheet)
  - … +4 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=108 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=13 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7804 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1JRJ.ensemble.pdb`)
- RMSF mean=2.315Å max=4.241Å (per-residue in .per_residue.csv)
- most flexible residues: 19, 1, 13, 11, 8

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=47.6 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 7, 8, 10, 11, 13, 15, 18, 19, 20, 23, 26, 27, 30, 33, 34

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1JRJ.pae.csv`
- mean=0.592Å · max=2.461Å · AlphaFold-PAE analog (low block = rigid unit/domain)
