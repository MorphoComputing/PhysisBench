# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\control_noe\noe\1TIT\seeds\seed_2\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 10.276 A
- tm_score_ca_ordered: 0.15920509021014895
- heavy_atom_rmsd: 10.999 A
- sidechain_heavy_atom_rmsd: 11.838 A
- **all-atom quality (honest):** heavy 10.999 A, sidechain 11.838 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 122
- distogram_pairs: 118
- bin_accuracy: 0.246

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F20-L24 → 29 conflicts (51%); C46-E47 → 10 conflicts (18%); L7 → 6 conflicts (10%)
- explained: 45/57 conflicts by 3 root cause(s)
- metrics: hubs=26 (frac 0.299), conflicts/hub=2.2, max_incompat=8.31Å, chain_span=0.897
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F20-L24 + C46-E47 + L7 — explain ~45/57 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L59** — severity 7.36, 4 conflict(s); suspect input ~`H19` (group: pull_in)
  - pull-in (wants closer): C46@4.5Å(now 10.9,conf 0.39), E47@4.5Å(now 9.1,conf 0.39)
  - A18↔C46: targets 4.2/4.5Å but partners are 14.2Å apart → too_far_apart by 5.6Å
  - C46↔H19: targets 4.5/4.7Å but partners are 14.5Å apart → too_far_apart by 5.3Å
  - A18↔E47: targets 4.2/4.5Å but partners are 13.2Å apart → too_far_apart by 4.5Å
- **V70** — severity 6.37, 6 conflict(s); suspect input ~`F20` (group: pull_in)
  - pull-in (wants closer): A81@4.1Å(now 10.9,conf 0.43), L7@4.5Å(now 10.1,conf 0.39), F20@5.5Å(now 10.2,conf 0.24)
  - L35↔A81: targets 4.0/4.1Å but partners are 12.6Å apart → too_far_apart by 4.5Å
  - L35↔L7: targets 4.0/4.5Å but partners are 13.0Å apart → too_far_apart by 4.5Å
  - L35↔F20: targets 4.0/5.5Å but partners are 13.3Å apart → too_far_apart by 3.8Å
- **C46** — severity 5.65, 2 conflict(s); suspect input ~`L59` (group: pull_in)
  - pull-in (wants closer): H60@4.4Å(now 8.6,conf 0.41), L59@4.5Å(now 10.9,conf 0.39)
  - S43↔L59: targets 4.2/4.5Å but partners are 16.9Å apart → too_far_apart by 8.3Å
  - S43↔H60: targets 4.2/4.4Å but partners are 14.4Å apart → too_far_apart by 5.9Å
- **H55** — severity 5.28, 6 conflict(s); suspect input ~`L24` (group: pull_in)
  - pull-in (wants closer): I22@4.3Å(now 7.2,conf 0.41), L24@4.8Å(now 7.3,conf 0.36)
  - I22↔D51: targets 4.3/4.7Å but partners are 12.7Å apart → too_far_apart by 3.7Å
  - E50↔I22: targets 4.0/4.3Å but partners are 10.8Å apart → too_far_apart by 2.5Å
  - D51↔L24: targets 4.7/4.8Å but partners are 12.1Å apart → too_far_apart by 2.6Å
- **W33** — severity 4.23, 5 conflict(s); suspect input ~`E21` (group: pull_in)
  - pull-in (wants closer): E21@4.9Å(now 9.0,conf 0.35), F20@5.0Å(now 11.5,conf 0.27), L7@5.2Å(now 9.4,conf 0.26)
  - F72↔E21: targets 3.8/4.9Å but partners are 11.5Å apart → too_far_apart by 2.8Å
  - F72↔F20: targets 3.8/5.0Å but partners are 12.4Å apart → too_far_apart by 3.5Å
  - F20↔I48: targets 5.0/5.2Å but partners are 13.7Å apart → too_far_apart by 3.5Å
- **L7** — severity 4.10, 6 conflict(s); suspect input ~`A81` (group: pull_in)
  - pull-in (wants closer): V70@4.5Å(now 10.1,conf 0.39), A81@4.8Å(now 8.8,conf 0.36), S71@4.9Å(now 8.4,conf 0.35), W33@5.2Å(now 9.4,conf 0.26)
  - F20↔A81: targets 4.7/4.8Å but partners are 12.2Å apart → too_far_apart by 2.7Å
  - V70↔S79: targets 4.5/4.7Å but partners are 11.4Å apart → too_far_apart by 2.2Å
  - E21↔S71: targets 4.8/4.9Å but partners are 11.8Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=67 · strand(E)=15 · 3-10(G)=4 · coil(C)=1

```
CEHHHHHHHHHEGHHHHHGHHHHEHHEEHHHEGHHEHEHHHHHHHEHHHHHHHHHHEHGHHHHEHHHHHHEHHEHHHEHHHHHHHHE
```

## Backbone H-bond Network

- total=71 · helix(i→i+4)=44 · sheet=27
  - V3 ↔ L7  (helix)
  - E4 ↔ Y8  (helix)
  - K5 ↔ G9  (helix)
  - L7 ↔ E11  (helix)
  - V10 ↔ V14  (helix)
  - E11 ↔ G15  (helix)
  - V14 ↔ A18  (helix)
  - E16 ↔ F20  (helix)
  - T17 ↔ E21  (helix)
  - A18 ↔ I22  (helix)
  - E21 ↔ S25  (helix)
  - I22 ↔ E26  (helix)
  - S25 ↔ V29  (helix)
  - E26 ↔ H30  (helix)
  - G31 ↔ L35  (helix)
  - L35 ↔ P39  (helix)
  - G37 ↔ T41  (helix)
  - P39 ↔ S43  (helix)
  - L40 ↔ P44  (helix)
  - T41 ↔ D45  (helix)
  - … +51 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=31 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=1257 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=989 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.312 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=122 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1TIT.ensemble.pdb`)
- RMSF mean=5.766Å max=11.142Å (per-residue in .per_residue.csv)
- most flexible residues: 75, 76, 74, 77, 78

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=16.0 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1TIT.pae.csv`
- mean=3.043Å · max=7.911Å · AlphaFold-PAE analog (low block = rigid unit/domain)
