# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 3.146 A
- tm_score_ca_ordered: 0.29978858683752546
- heavy_atom_rmsd: 4.168 A
- sidechain_heavy_atom_rmsd: 4.917 A
- **all-atom quality (honest):** heavy 4.168 A, sidechain 4.917 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 136
- bin_accuracy: 0.647

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** E5-S6 → 6 conflicts (100%)
- explained: 6/6 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.143), conflicts/hub=1.5, max_incompat=2.9Å, chain_span=0.75
- **fix-first:** [LOW_CONFLICT] Root cause(s): E5-S6 — explain ~6/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S6** — severity 2.40, 3 conflict(s); suspect input ~`C26` (group: pull_in)
  - pull-in (wants closer): C26@4.2Å(now 6.9,conf 0.43)
  - P2↔C26: targets 10.9/4.2Å but partners are 4.5Å apart → too_close_together by 2.3Å
  - I10↔C26: targets 3.8/4.2Å but partners are 9.6Å apart → too_far_apart by 1.6Å
  - W9↔C26: targets 6.0/4.2Å but partners are 11.8Å apart → too_far_apart by 1.6Å
- **E5** — severity 1.69, 1 conflict(s); suspect input ~`S14` (group: pull_in)
  - pull-in (wants closer): S14@3.8Å(now 6.6,conf 0.58)
  - I1↔S14: targets 11.5/3.8Å but partners are 4.8Å apart → too_close_together by 2.9Å
- **S14** — severity 1.09, 1 conflict(s); suspect input ~`E5` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 6.6,conf 0.58), I17@3.8Å(now 7.7,conf 0.58)
  - W9↔E5: targets 14.7/3.8Å but partners are 9.0Å apart → too_close_together by 1.9Å
- **C26** — severity 0.76, 1 conflict(s); suspect input ~`S20` (group: pull_in)
  - pull-in (wants closer): S6@4.2Å(now 6.9,conf 0.43)
  - S6↔S20: targets 4.2/4.5Å but partners are 10.6Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=9 · strand(E)=12 · 3-10(G)=4 · coil(C)=3

```
CEGGHECHGEECEHEHHEEHHEHHEGEE
```

## Backbone H-bond Network

- total=40 · helix(i→i+4)=1 · sheet=39
  - I17 ↔ C21  (helix)
  - P2 ↔ I10  (sheet)
  - P2 ↔ P11  (sheet)
  - P2 ↔ I13  (sheet)
  - P2 ↔ S15  (sheet)
  - P2 ↔ G18  (sheet)
  - P2 ↔ C19  (sheet)
  - P2 ↔ K22  (sheet)
  - S6 ↔ P11  (sheet)
  - S6 ↔ I13  (sheet)
  - S6 ↔ S15  (sheet)
  - S6 ↔ G18  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ K22  (sheet)
  - S6 ↔ V25  (sheet)
  - I10 ↔ S15  (sheet)
  - I10 ↔ V25  (sheet)
  - P11 ↔ G18  (sheet)
  - P11 ↔ C19  (sheet)
  - P11 ↔ V25  (sheet)
  - … +20 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=136 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=82 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.865 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=3.464Å max=6.714Å (per-residue in .per_residue.csv)
- most flexible residues: 1, 2, 4, 17, 18

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=34.3 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 27, 28

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=1.357Å · max=3.716Å · AlphaFold-PAE analog (low block = rigid unit/domain)
