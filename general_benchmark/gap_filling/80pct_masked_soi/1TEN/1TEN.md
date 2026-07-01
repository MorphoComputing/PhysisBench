# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TEN\sequence\1TEN.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TEN\seeds\seed_3\1TEN.pdb`
- residues: 88
- mode: oracle
- ca_rmsd: 3.250 A
- tm_score_ca_ordered: 0.6636909497753131
- heavy_atom_rmsd: 4.518 A
- sidechain_heavy_atom_rmsd: 5.373 A
- **all-atom quality (honest):** heavy 4.518 A, sidechain 5.373 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/79 (0.0)
- lj_severe: 0
- lj_near: 25
- distogram_pairs: 1073
- bin_accuracy: 0.654

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=48
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.2503878923215725
- ga_delta_rmsd: 2.5516186605909716  ga_fitness_mode: energy
- pre_local_rmsd: 3.260969520591757  localized_anchor_rmsd: 3.2504305987427164

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V40-T45 → 25 conflicts (49%); A83-T86 → 12 conflicts (24%); G36-I37 → 3 conflicts (6%)
- explained: 40/51 conflicts by 3 root cause(s)
- metrics: hubs=23 (frac 0.261), conflicts/hub=2.2, max_incompat=5.1Å, chain_span=0.966
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V40-T45 + A83-T86 + G36-I37 — explain ~40/51 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **G42** — severity 11.53, 7 conflict(s); suspect input ~`T88` (group: pull_in)
  - pull-in (wants closer): I37@8.9Å(now 11.6,conf 0.91), G36@8.0Å(now 11.1,conf 0.72)
  - push-out (wants farther): I7@23.0Å(now 18.9,conf 0.73), P82@17.9Å(now 11.3,conf 0.55), T86@16.4Å(now 8.8,conf 0.55), E68@12.3Å(now 9.7,conf 0.55)
  - G36↔T86: targets 8.0/16.4Å but partners are 3.3Å apart → too_close_together by 5.1Å
  - I37↔T88: targets 8.9/18.2Å but partners are 5.4Å apart → too_close_together by 4.0Å
  - G36↔T88: targets 8.0/18.2Å but partners are 7.2Å apart → too_close_together by 3.0Å
- **D77** — severity 9.52, 4 conflict(s); suspect input ~`T86` (group: push_out)
  - pull-in (wants closer): D64@27.5Å(now 33.8,conf 1.00), D14@27.5Å(now 34.2,conf 1.00), T65@27.5Å(now 30.4,conf 1.00), K10@27.5Å(now 30.3,conf 1.00)
  - push-out (wants farther): T86@27.4Å(now 21.6,conf 0.95), T46@17.6Å(now 14.7,conf 0.55)
  - T86↔S70: targets 27.4/17.1Å but partners are 6.4Å apart → too_close_together by 3.9Å
  - I72↔T86: targets 11.0/27.4Å but partners are 13.6Å apart → too_close_together by 2.8Å
  - L71↔T86: targets 15.0/27.4Å but partners are 10.3Å apart → too_close_together by 2.1Å
- **Q6** — severity 8.75, 5 conflict(s); suspect input ~`K84` (group: push_out)
  - pull-in (wants closer): K84@11.2Å(now 15.6,conf 0.55), S70@12.8Å(now 15.4,conf 0.55)
  - push-out (wants farther): Q55@11.5Å(now 8.8,conf 0.55)
  - T45↔K84: targets 21.3/11.2Å but partners are 5.8Å apart → too_close_together by 4.4Å
  - D43↔K84: targets 24.1/11.2Å but partners are 8.8Å apart → too_close_together by 4.1Å
  - T45↔S70: targets 21.3/12.8Å but partners are 4.5Å apart → too_close_together by 4.0Å
- **L1** — severity 4.50, 3 conflict(s); suspect input ~`D48` (group: pull_in)
  - pull-in (wants closer): T13@27.5Å(now 31.9,conf 1.00)
  - push-out (wants farther): T45@22.1Å(now 17.8,conf 0.64), Q55@19.3Å(now 16.7,conf 0.56), E53@17.1Å(now 13.9,conf 0.55), D48@16.3Å(now 10.9,conf 0.55)
  - R74↔D48: targets 7.4/16.3Å but partners are 5.6Å apart → too_close_together by 3.4Å
  - T45↔I72: targets 22.1/8.9Å but partners are 9.9Å apart → too_close_together by 3.2Å
  - T45↔L71: targets 22.1/12.2Å but partners are 8.3Å apart → too_close_together by 1.7Å
- **A83** — severity 4.48, 3 conflict(s); suspect input ~`I47` (group: push_out)
  - push-out (wants farther): K62@22.6Å(now 20.0,conf 0.69), I47@15.0Å(now 8.9,conf 0.55), Y67@14.2Å(now 11.6,conf 0.55)
  - L71↔I47: targets 5.5/15.0Å but partners are 5.3Å apart → too_close_together by 4.2Å
  - T86↔K62: targets 11.0/22.6Å but partners are 9.7Å apart → too_close_together by 1.9Å
  - K62↔G36: targets 22.6/14.6Å but partners are 6.4Å apart → too_close_together by 1.6Å
- **V40** — severity 3.81, 3 conflict(s); suspect input ~`T86` (group: push_out)
  - push-out (wants farther): T86@13.3Å(now 8.2,conf 0.55)
  - G36↔T86: targets 7.0/13.3Å but partners are 3.3Å apart → too_close_together by 3.0Å
  - D43↔T86: targets 6.6/13.3Å but partners are 4.7Å apart → too_close_together by 2.0Å
  - I37↔T86: targets 5.0/13.3Å but partners are 6.3Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=38 · 3-10(G)=21 · coil(C)=11

```
CEHEECGGHEGGEGCEEECEEEECHEEEHECGGCEEGEHEEHHHECEEGHHGHHEEGEEGGHGHEGGEGCGEGEGCHHEEECEGHHEE
```

## Backbone H-bond Network

- total=50 · helix(i→i+4)=3 · sheet=47
  - L25 ↔ D29  (helix)
  - D39 ↔ D43  (helix)
  - T50 ↔ N54  (helix)
  - D2 ↔ F22  (sheet)
  - P4 ↔ T20  (sheet)
  - P4 ↔ W21  (sheet)
  - P4 ↔ F22  (sheet)
  - P4 ↔ K23  (sheet)
  - S5 ↔ T20  (sheet)
  - S5 ↔ W21  (sheet)
  - S5 ↔ F22  (sheet)
  - S5 ↔ K23  (sheet)
  - K10 ↔ T16  (sheet)
  - K10 ↔ A17  (sheet)
  - K10 ↔ L18  (sheet)
  - K10 ↔ T20  (sheet)
  - K10 ↔ W21  (sheet)
  - T13 ↔ L18  (sheet)
  - T16 ↔ Y35  (sheet)
  - A17 ↔ Y35  (sheet)
  - … +30 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=25 · exposed=41 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=411 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=299 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.4223 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=25 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 79 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 10 superposed models (`1TEN.ensemble.pdb`)
- RMSF mean=4.479Å max=9.799Å (per-residue in .per_residue.csv)
- most flexible residues: 41, 42, 39, 40, 52

## Per-residue Confidence (descriptive)

- basis: ensemble self-consistency (RMSF) · mean=25.2 · written to PDB B-factor column
- **descriptive** — `p_err_lt_2A` (P(error<2.0Å)) provided as a guide, but the calibration gate did not pass for this regime
- low-confidence (<50) residues: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 70, 71, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1TEN.pae.csv`
- mean=1.765Å · max=5.609Å · AlphaFold-PAE analog (low block = rigid unit/domain)
