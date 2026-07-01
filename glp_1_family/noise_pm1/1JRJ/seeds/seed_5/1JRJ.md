# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm1\1JRJ\seeds\seed_5\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.126 A
- tm_score_ca_ordered: 0.5374199770969919
- heavy_atom_rmsd: 3.475 A
- sidechain_heavy_atom_rmsd: 4.346 A
- **all-atom quality (honest):** heavy 3.475 A, sidechain 4.346 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 633
- bin_accuracy: 0.720

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E16-R19 → 80 conflicts (63%); E2-S7 → 25 conflicts (20%)
- explained: 105/127 conflicts by 2 root cause(s)
- metrics: hubs=21 (frac 0.568), conflicts/hub=6.0, max_incompat=4.13Å, chain_span=0.946
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E16-R19 + E2-S7 — explain ~105/127 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 18.82, 19 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): E2@23.6Å(now 26.2,conf 0.58), G29@14.1Å(now 17.0,conf 0.44)
  - E2↔G29: targets 23.6/14.1Å but partners are 41.7Å apart → too_far_apart by 4.0Å
  - T4↔G29: targets 18.8/14.1Å but partners are 36.1Å apart → too_far_apart by 3.2Å
  - E2↔L25: targets 23.6/13.3Å but partners are 39.9Å apart → too_far_apart by 3.0Å
- **R19** — severity 12.82, 11 conflict(s); suspect input ~`G3` (group: push_out)
  - pull-in (wants closer): G3@23.7Å(now 26.9,conf 0.58)
  - push-out (wants farther): S10@17.1Å(now 14.5,conf 0.45)
  - I22↔G3: targets 4.4/23.7Å but partners are 31.5Å apart → too_far_apart by 3.4Å
  - G1↔G3: targets 33.7/23.7Å but partners are 7.1Å apart → too_close_together by 2.9Å
  - G3↔G28: targets 23.7/12.9Å but partners are 39.8Å apart → too_far_apart by 3.2Å
- **E2** — severity 11.68, 8 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): E16@23.6Å(now 26.2,conf 0.58)
  - V18↔E16: targets 31.8/23.6Å but partners are 4.1Å apart → too_close_together by 4.1Å
  - P30↔E16: targets 46.1/23.6Å but partners are 18.8Å apart → too_close_together by 3.8Å
  - W24↔E16: targets 38.6/23.6Å but partners are 12.7Å apart → too_close_together by 2.3Å
- **G3** — severity 11.54, 9 conflict(s); suspect input ~`R19` (group: push_out)
  - pull-in (wants closer): R19@23.7Å(now 26.9,conf 0.58)
  - push-out (wants farther): M13@20.0Å(now 17.5,conf 0.50)
  - I22↔R19: targets 32.6/23.7Å but partners are 4.9Å apart → too_close_together by 4.0Å
  - G28↔R19: targets 41.2/23.7Å but partners are 14.5Å apart → too_close_together by 3.0Å
  - L25↔R19: targets 36.2/23.7Å but partners are 9.8Å apart → too_close_together by 2.7Å
- **S7** — severity 11.49, 8 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): P37@20.9Å(now 23.7,conf 0.52)
  - P30↔P37: targets 35.3/20.9Å but partners are 10.8Å apart → too_close_together by 3.6Å
  - P35↔P37: targets 31.1/20.9Å but partners are 6.8Å apart → too_close_together by 3.5Å
  - S31↔P37: targets 37.7/20.9Å but partners are 13.6Å apart → too_close_together by 3.3Å
- **G29** — severity 9.94, 10 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): E16@14.1Å(now 17.0,conf 0.44)
  - M13↔E16: targets 22.2/14.1Å but partners are 5.3Å apart → too_close_together by 2.8Å
  - T6↔E16: targets 32.2/14.1Å but partners are 15.2Å apart → too_close_together by 2.8Å
  - F5↔E16: targets 33.5/14.1Å but partners are 16.9Å apart → too_close_together by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=19 · strand(E)=12 · 3-10(G)=4 · coil(C)=2

```
CEEHHHEHHHHHEHHEHHHEGHHGHEGHEHGEHECEE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=6 · sheet=13
  - T4 ↔ D8  (helix)
  - T6 ↔ S10  (helix)
  - D8 ↔ Q12  (helix)
  - S10 ↔ E14  (helix)
  - E15 ↔ R19  (helix)
  - R19 ↔ E23  (helix)
  - E2 ↔ S7  (sheet)
  - S7 ↔ M13  (sheet)
  - M13 ↔ L20  (sheet)
  - L20 ↔ K26  (sheet)
  - L20 ↔ G29  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - K26 ↔ S32  (sheet)
  - K26 ↔ P36  (sheet)
  - G29 ↔ A34  (sheet)
  - G29 ↔ P36  (sheet)
  - G29 ↔ P37  (sheet)
  - S32 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=21 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=107 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=10 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9144 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
