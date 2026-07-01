# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1VII\seeds\seed_3\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 3.544 A
- tm_score_ca_ordered: 0.23494280209219948
- heavy_atom_rmsd: 4.632 A
- sidechain_heavy_atom_rmsd: 5.375 A
- **all-atom quality (honest):** heavy 4.632 A, sidechain 5.375 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 167
- bin_accuracy: 0.491

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N27-K29 → 29 conflicts (55%); F17 → 15 conflicts (28%); L34 → 7 conflicts (13%)
- explained: 51/53 conflicts by 3 root cause(s)
- metrics: hubs=11 (frac 0.324), conflicts/hub=4.8, max_incompat=5.94Å, chain_span=0.912
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N27-K29 + F17 + L34 — explain ~51/53 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 16.22, 13 conflict(s); suspect input ~`R14` (group: pull_in)
  - pull-in (wants closer): G11@5.3Å(now 9.2,conf 0.82), R14@4.0Å(now 6.8,conf 0.45)
  - K24↔R14: targets 7.4/4.0Å but partners are 15.7Å apart → too_far_apart by 4.3Å
  - R14↔Q25: targets 4.0/4.7Å but partners are 13.6Å apart → too_far_apart by 5.0Å
  - G11↔Q25: targets 5.3/4.7Å but partners are 14.5Å apart → too_far_apart by 4.5Å
- **N27** — severity 14.91, 8 conflict(s); suspect input ~`W23` (group: pull_in)
  - pull-in (wants closer): L22@5.0Å(now 8.0,conf 0.94), K32@3.5Å(now 7.6,conf 0.82), G33@6.8Å(now 10.4,conf 0.82), L34@8.6Å(now 12.2,conf 0.67)
  - L22↔L34: targets 5.0/8.6Å but partners are 18.0Å apart → too_far_apart by 4.4Å
  - L22↔K32: targets 5.0/3.5Å but partners are 11.8Å apart → too_far_apart by 3.3Å
  - L22↔G33: targets 5.0/6.8Å but partners are 14.6Å apart → too_far_apart by 2.8Å
- **F10** — severity 8.01, 11 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 10.3,conf 0.35), L28@5.5Å(now 8.8,conf 0.24), G33@5.8Å(now 8.6,conf 0.22)
  - E4↔K29: targets 10.1/4.9Å but partners are 19.6Å apart → too_far_apart by 4.5Å
  - E4↔L28: targets 10.1/5.5Å but partners are 19.6Å apart → too_far_apart by 4.0Å
  - D5↔K29: targets 7.6/4.9Å but partners are 15.0Å apart → too_far_apart by 2.5Å
- **L1** — severity 5.42, 5 conflict(s); suspect input ~`L34` (group: push_out)
  - push-out (wants farther): L34@20.3Å(now 9.2,conf 0.43)
  - V9↔L34: targets 5.8/20.3Å but partners are 10.3Å apart → too_close_together by 4.3Å
  - L34↔F6: targets 20.3/4.7Å but partners are 12.2Å apart → too_close_together by 3.5Å
  - A8↔L34: targets 5.8/20.3Å but partners are 12.6Å apart → too_close_together by 2.0Å
- **R14** — severity 4.12, 5 conflict(s); suspect input ~`D3` (group: pull_in)
  - pull-in (wants closer): F17@4.0Å(now 6.8,conf 0.45)
  - F17↔D3: targets 4.0/5.2Å but partners are 13.2Å apart → too_far_apart by 3.9Å
  - N19↔F17: targets 11.6/4.0Å but partners are 5.6Å apart → too_close_together by 1.9Å
  - F17↔L20: targets 4.0/12.3Å but partners are 6.1Å apart → too_close_together by 2.2Å
- **V9** — severity 3.63, 3 conflict(s); suspect input ~`K32` (group: push_out)
  - pull-in (wants closer): E4@7.5Å(now 10.5,conf 0.67)
  - push-out (wants farther): L34@17.6Å(now 10.3,conf 0.34)
  - L34↔K32: targets 17.6/5.2Å but partners are 6.5Å apart → too_close_together by 5.9Å
  - E4↔K32: targets 7.5/5.2Å but partners are 17.3Å apart → too_far_apart by 4.7Å
  - L1↔L34: targets 5.8/17.6Å but partners are 9.2Å apart → too_close_together by 2.7Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=14 · 3-10(G)=2 · coil(C)=2

```
CEHHEHHHEEHEHEHEEGHHEHEHHEHHGHCEEE
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=6 · sheet=33
  - D3 ↔ K7  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - S15 ↔ N19  (helix)
  - L20 ↔ K24  (helix)
  - K24 ↔ L28  (helix)
  - S2 ↔ V9  (sheet)
  - S2 ↔ F10  (sheet)
  - S2 ↔ M12  (sheet)
  - S2 ↔ R14  (sheet)
  - S2 ↔ A16  (sheet)
  - S2 ↔ F17  (sheet)
  - D5 ↔ F10  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ R14  (sheet)
  - D5 ↔ A16  (sheet)
  - D5 ↔ F17  (sheet)
  - V9 ↔ R14  (sheet)
  - V9 ↔ A16  (sheet)
  - V9 ↔ F17  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=10 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=141 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=52 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.6125 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1VII.ensemble.pdb`)
- RMSF mean=3.82Å max=6.515Å (per-residue in .per_residue.csv)
- most flexible residues: 15, 19, 4, 11, 2

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=30.1 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 29, 30, 31, 32, 33, 34

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1VII.pae.csv`
- mean=2.109Å · max=7.192Å · AlphaFold-PAE analog (low block = rigid unit/domain)
