# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe\1JRJ\seeds\seed_6\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 7.055 A
- tm_score_ca_ordered: 0.13768132402382724
- heavy_atom_rmsd: 7.861 A
- sidechain_heavy_atom_rmsd: 8.402 A
- **all-atom quality (honest):** heavy 7.861 A, sidechain 8.402 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 90
- bin_accuracy: 0.789

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Q12 → 6 conflicts (100%)
- explained: 6/6 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.054), conflicts/hub=3.0, max_incompat=4.58Å, chain_span=0.108
- **fix-first:** [LOW_CONFLICT] Root cause(s): Q12 — explain ~6/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q12** — severity 3.47, 3 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): E16@6.1Å(now 9.3,conf 0.33)
  - D8↔E16: targets 6.1/6.1Å but partners are 16.8Å apart → too_far_apart by 4.6Å
  - L9↔E16: targets 5.0/6.1Å but partners are 15.2Å apart → too_far_apart by 4.0Å
  - K11↔E16: targets 3.8/6.1Å but partners are 11.9Å apart → too_far_apart by 1.9Å
- **E16** — severity 2.96, 3 conflict(s); suspect input ~`Q12` (group: pull_in)
  - pull-in (wants closer): Q12@6.1Å(now 9.3,conf 0.33)
  - Q12↔L20: targets 6.1/6.1Å but partners are 16.4Å apart → too_far_apart by 4.2Å
  - R19↔Q12: targets 5.4/6.1Å but partners are 14.2Å apart → too_far_apart by 2.7Å
  - A17↔Q12: targets 3.8/6.1Å but partners are 12.1Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=7 · 3-10(G)=7 · coil(C)=4

```
CHHHEHHHECGCGCGGHHHGHHGHHHEHHHEHHEGEE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=11 · sheet=5
  - E2 ↔ T6  (helix)
  - G3 ↔ S7  (helix)
  - T4 ↔ D8  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - L25 ↔ G29  (helix)
  - K26 ↔ P30  (helix)
  - G28 ↔ S32  (helix)
  - G29 ↔ G33  (helix)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)
  - S31 ↔ P36  (sheet)
  - S31 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=21 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=159 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=57 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8655 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1JRJ.ensemble.pdb`)
- RMSF mean=5.87Å max=8.648Å (per-residue in .per_residue.csv)
- most flexible residues: 33, 2, 4, 1, 32

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=15.5 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1JRJ.pae.csv`
- mean=4.86Å · max=13.304Å · AlphaFold-PAE analog (low block = rigid unit/domain)
