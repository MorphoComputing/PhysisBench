# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm1\1JRJ\seeds\seed_9\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 1.326 A
- tm_score_ca_ordered: 0.6937217392693963
- heavy_atom_rmsd: 2.682 A
- sidechain_heavy_atom_rmsd: 3.355 A
- **all-atom quality (honest):** heavy 2.682 A, sidechain 3.355 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 634
- bin_accuracy: 0.716

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E16-V18 → 33 conflicts (55%); S7 → 17 conflicts (28%)
- explained: 50/60 conflicts by 2 root cause(s)
- metrics: hubs=13 (frac 0.351), conflicts/hub=4.6, max_incompat=4.3Å, chain_span=0.919
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E16-V18 + S7 — explain ~50/60 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 13.02, 12 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): G29@14.1Å(now 16.8,conf 0.44)
  - E2↔G29: targets 23.6/14.1Å but partners are 42.0Å apart → too_far_apart by 4.3Å
  - T4↔G29: targets 18.8/14.1Å but partners are 36.3Å apart → too_far_apart by 3.4Å
  - F5↔G29: targets 16.0/14.1Å but partners are 33.0Å apart → too_far_apart by 2.9Å
- **S7** — severity 11.93, 9 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): P37@20.9Å(now 23.6,conf 0.52)
  - P35↔P37: targets 31.1/20.9Å but partners are 6.7Å apart → too_close_together by 3.5Å
  - P30↔P37: targets 35.3/20.9Å but partners are 10.9Å apart → too_close_together by 3.5Å
  - A34↔P37: targets 32.7/20.9Å but partners are 9.0Å apart → too_close_together by 2.8Å
- **G29** — severity 10.26, 10 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): E16@14.1Å(now 16.8,conf 0.44)
  - M13↔E16: targets 22.2/14.1Å but partners are 4.9Å apart → too_close_together by 3.2Å
  - F5↔E16: targets 33.5/14.1Å but partners are 16.4Å apart → too_close_together by 3.0Å
  - T6↔E16: targets 32.2/14.1Å but partners are 15.4Å apart → too_close_together by 2.6Å
- **P37** — severity 7.92, 7 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@20.9Å(now 23.6,conf 0.52)
  - T4↔S7: targets 29.5/20.9Å but partners are 5.7Å apart → too_close_together by 2.9Å
  - S7↔S31: targets 20.9/12.2Å but partners are 36.2Å apart → too_far_apart by 3.1Å
  - G3↔S7: targets 32.3/20.9Å but partners are 9.0Å apart → too_close_together by 2.5Å
- **S32** — severity 5.40, 5 conflict(s); suspect input ~`F21` (group: push_out)
  - push-out (wants farther): V18@20.2Å(now 17.3,conf 0.50)
  - V18↔F21: targets 20.2/11.5Å but partners are 5.5Å apart → too_close_together by 3.2Å
  - V18↔L25: targets 20.2/7.3Å but partners are 10.3Å apart → too_close_together by 2.5Å
  - V18↔W24: targets 20.2/8.8Å but partners are 9.1Å apart → too_close_together by 2.2Å
- **V18** — severity 3.98, 4 conflict(s); suspect input ~`S32` (group: push_out)
  - push-out (wants farther): S32@20.2Å(now 17.3,conf 0.50), W24@11.7Å(now 9.1,conf 0.44)
  - F21↔S32: targets 5.7/20.2Å but partners are 11.9Å apart → too_close_together by 2.5Å
  - S32↔L25: targets 20.2/9.3Å but partners are 8.3Å apart → too_close_together by 2.5Å
  - F21↔W24: targets 5.7/11.7Å but partners are 4.0Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=11 · 3-10(G)=1 · coil(C)=2

```
EEEGCHHHHHHEHHHHHHHHHHHEHHEHEHHEHECEE
```

## Backbone H-bond Network

- total=25 · helix(i→i+4)=12 · sheet=13
  - T6 ↔ S10  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - K26 ↔ P30  (helix)
  - W24 ↔ G29  (sheet)
  - W24 ↔ S32  (sheet)
  - W24 ↔ A34  (sheet)
  - W24 ↔ P36  (sheet)
  - W24 ↔ P37  (sheet)
  - N27 ↔ S32  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P36  (sheet)
  - … +5 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=10 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.897 (restraint satisfaction; lower=better)
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
- RMSF mean=1.469Å max=3.364Å (per-residue in .per_residue.csv)
- most flexible residues: 31, 10, 11, 30, 29

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=62.3 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 10, 11, 20, 29, 30, 31

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1JRJ.pae.csv`
- mean=0.294Å · max=1.591Å · AlphaFold-PAE analog (low block = rigid unit/domain)
