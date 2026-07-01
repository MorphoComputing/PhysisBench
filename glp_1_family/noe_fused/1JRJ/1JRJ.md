# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_fused\1JRJ\seeds\seed_4\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.096 A
- tm_score_ca_ordered: 0.5229201044771544
- heavy_atom_rmsd: 2.849 A
- sidechain_heavy_atom_rmsd: 3.279 A
- **all-atom quality (honest):** heavy 2.849 A, sidechain 3.279 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 196
- bin_accuracy: 0.908

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E23-W24 → 5 conflicts (100%)
- explained: 5/5 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.054), conflicts/hub=2.5, max_incompat=2.7Å, chain_span=0.162
- **fix-first:** [LOW_CONFLICT] Root cause(s): E23-W24 — explain ~5/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W24** — severity 3.96, 3 conflict(s); suspect input ~`P30` (group: pull_in)
  - pull-in (wants closer): P30@5.4Å(now 8.0,conf 0.70)
  - E23↔P30: targets 3.8/5.4Å but partners are 11.8Å apart → too_far_apart by 2.6Å
  - P30↔R19: targets 5.4/8.6Å but partners are 15.7Å apart → too_far_apart by 1.7Å
  - G3↔P30: targets 33.3/5.4Å but partners are 40.2Å apart → too_far_apart by 1.5Å
- **P30** — severity 2.98, 2 conflict(s); suspect input ~`E23` (group: pull_in)
  - pull-in (wants closer): W24@5.4Å(now 8.0,conf 0.70)
  - W24↔E23: targets 5.4/12.0Å but partners are 3.9Å apart → too_close_together by 2.7Å
  - W24↔L20: targets 5.4/13.7Å but partners are 6.1Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=9 · 3-10(G)=2 · coil(C)=2

```
CEEEHHHHHHHHHHHHHHHHHHHHHHEHEGHEGCEEE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=19 · sheet=7
  - F5 ↔ L9  (helix)
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - D8 ↔ Q12  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - E16 ↔ L20  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - L20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - W24 ↔ G28  (helix)
  - N27 ↔ S32  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=97 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=8 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6289 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1JRJ.ensemble.pdb`)
- RMSF mean=2.472Å max=3.93Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 15, 13, 11, 19

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=45.0 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15, 18, 19, 20, 23, 25, 26, 29, 30, 31, 33, 35, 36, 37

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1JRJ.pae.csv`
- mean=0.652Å · max=3.05Å · AlphaFold-PAE analog (low block = rigid unit/domain)
