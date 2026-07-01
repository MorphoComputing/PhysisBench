# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\5WOW\seeds\seed_8\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 3.436 A
- tm_score_ca_ordered: 0.3206903720127325
- heavy_atom_rmsd: 4.804 A
- sidechain_heavy_atom_rmsd: 5.794 A
- **all-atom quality (honest):** heavy 4.804 A, sidechain 5.794 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 176
- bin_accuracy: 0.574

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** Y27-P35 → 23 conflicts (100%)
- explained: 23/23 conflicts by 1 root cause(s)
- metrics: hubs=8 (frac 0.216), conflicts/hub=2.9, max_incompat=6.69Å, chain_span=0.784
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): Y27-P35 — explain ~23/23 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C28** — severity 8.62, 7 conflict(s); suspect input ~`P31` (group: push_out)
  - pull-in (wants closer): Q8@3.8Å(now 8.8,conf 0.58), P31@5.7Å(now 8.4,conf 0.23)
  - push-out (wants farther): P35@19.0Å(now 12.7,conf 0.49)
  - D33↔P35: targets 12.6/19.0Å but partners are 1.7Å apart → too_close_together by 4.7Å
  - Y32↔P35: targets 10.8/19.0Å but partners are 5.2Å apart → too_close_together by 3.1Å
  - P35↔P31: targets 19.0/5.7Å but partners are 6.6Å apart → too_close_together by 6.7Å
- **Y30** — severity 5.83, 4 conflict(s); suspect input ~`P35` (group: pull_in)
  - pull-in (wants closer): C3@3.8Å(now 8.4,conf 0.58)
  - push-out (wants farther): P35@15.8Å(now 9.1,conf 0.66), D36@16.8Å(now 12.7,conf 0.52), Y37@18.2Å(now 7.8,conf 0.34)
  - D33↔P35: targets 10.2/15.8Å but partners are 1.7Å apart → too_close_together by 3.9Å
  - D33↔Y37: targets 10.2/18.2Å but partners are 3.8Å apart → too_close_together by 4.2Å
  - C3↔V34: targets 3.8/12.6Å but partners are 18.5Å apart → too_far_apart by 2.1Å
- **G29** — severity 4.16, 2 conflict(s); suspect input ~`P35` (group: push_out)
  - push-out (wants farther): P35@16.8Å(now 11.3,conf 0.67), D36@18.5Å(now 14.2,conf 0.40)
  - D33↔P35: targets 11.6/16.8Å but partners are 1.7Å apart → too_close_together by 3.6Å
  - Y32↔P35: targets 9.1/16.8Å but partners are 5.2Å apart → too_close_together by 2.6Å
- **Y27** — severity 3.81, 5 conflict(s); suspect input ~`R9` (group: pull_in)
  - pull-in (wants closer): R9@4.1Å(now 7.0,conf 0.43)
  - push-out (wants farther): G24@6.4Å(now 3.8,conf 0.69)
  - D33↔R9: targets 14.1/4.1Å but partners are 20.2Å apart → too_far_apart by 2.0Å
  - R23↔R9: targets 3.8/4.1Å but partners are 9.9Å apart → too_far_apart by 2.0Å
  - V34↔R9: targets 17.9/4.1Å but partners are 23.7Å apart → too_far_apart by 1.7Å
- **Q8** — severity 2.15, 2 conflict(s); suspect input ~`V2` (group: pull_in)
  - pull-in (wants closer): C28@3.8Å(now 8.8,conf 0.58)
  - C28↔V2: targets 3.8/11.9Å but partners are 4.9Å apart → too_close_together by 3.2Å
  - C28↔G1: targets 3.8/11.6Å but partners are 6.1Å apart → too_close_together by 1.7Å
- **P31** — severity 0.95, 1 conflict(s); suspect input ~`D36` (group: pull_in)
  - pull-in (wants closer): C28@5.7Å(now 8.4,conf 0.23)
  - push-out (wants farther): P35@12.8Å(now 6.6,conf 0.84), D36@14.9Å(now 11.2,conf 0.49), Y37@16.0Å(now 6.2,conf 0.49)
  - V34↔D36: targets 10.5/14.9Å but partners are 2.4Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=14 · 3-10(G)=3 · coil(C)=5

```
CHHHHHHEGHEHHHEEECGCECGHHEEECEEEEHHHE
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=4 · sheet=38
  - V2 ↔ I6  (helix)
  - C3 ↔ L7  (helix)
  - I6 ↔ C10  (helix)
  - C10 ↔ S14  (helix)
  - Q8 ↔ D15  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ P17  (sheet)
  - Q8 ↔ G26  (sheet)
  - Q8 ↔ Y27  (sheet)
  - Q8 ↔ C28  (sheet)
  - R11 ↔ C16  (sheet)
  - R11 ↔ P17  (sheet)
  - R11 ↔ I21  (sheet)
  - R11 ↔ G26  (sheet)
  - R11 ↔ Y27  (sheet)
  - R11 ↔ C28  (sheet)
  - D15 ↔ I21  (sheet)
  - D15 ↔ G26  (sheet)
  - D15 ↔ Y27  (sheet)
  - D15 ↔ C28  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=168 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=99 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.3799 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`5WOW.ensemble.pdb`)
- RMSF mean=4.565Å max=7.259Å (per-residue in .per_residue.csv)
- most flexible residues: 14, 18, 25, 13, 36

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=23.3 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `5WOW.pae.csv`
- mean=2.326Å · max=6.943Å · AlphaFold-PAE analog (low block = rigid unit/domain)
