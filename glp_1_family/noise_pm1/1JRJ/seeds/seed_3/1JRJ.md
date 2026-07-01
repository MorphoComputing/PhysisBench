# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm1\1JRJ\seeds\seed_3\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.034 A
- tm_score_ca_ordered: 0.5895502389542888
- heavy_atom_rmsd: 3.579 A
- sidechain_heavy_atom_rmsd: 4.330 A
- **all-atom quality (honest):** heavy 3.579 A, sidechain 4.330 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 633
- bin_accuracy: 0.722

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G29 → 22 conflicts (36%); P37 → 17 conflicts (28%); L25 → 11 conflicts (18%)
- explained: 50/61 conflicts by 3 root cause(s)
- metrics: hubs=14 (frac 0.378), conflicts/hub=4.4, max_incompat=4.24Å, chain_span=0.919
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G29 + P37 + L25 — explain ~50/61 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 12.74, 12 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): G29@14.1Å(now 16.8,conf 0.44)
  - E2↔G29: targets 23.6/14.1Å but partners are 41.9Å apart → too_far_apart by 4.2Å
  - T4↔G29: targets 18.8/14.1Å but partners are 36.2Å apart → too_far_apart by 3.3Å
  - F5↔G29: targets 16.0/14.1Å but partners are 32.9Å apart → too_far_apart by 2.8Å
- **S7** — severity 11.24, 8 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): P37@20.9Å(now 23.6,conf 0.52)
  - P30↔P37: targets 35.3/20.9Å but partners are 10.8Å apart → too_close_together by 3.6Å
  - P35↔P37: targets 31.1/20.9Å but partners are 7.0Å apart → too_close_together by 3.2Å
  - A34↔P37: targets 32.7/20.9Å but partners are 8.8Å apart → too_close_together by 3.0Å
- **G29** — severity 9.67, 9 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): E16@14.1Å(now 16.8,conf 0.44)
  - M13↔E16: targets 22.2/14.1Å but partners are 4.7Å apart → too_close_together by 3.4Å
  - F5↔E16: targets 33.5/14.1Å but partners are 16.3Å apart → too_close_together by 3.1Å
  - G1↔E16: targets 45.2/14.1Å but partners are 28.4Å apart → too_close_together by 2.6Å
- **P37** — severity 8.63, 7 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@20.9Å(now 23.6,conf 0.52), R19@7.7Å(now 10.6,conf 0.46)
  - T4↔S7: targets 29.5/20.9Å but partners are 5.4Å apart → too_close_together by 3.2Å
  - S7↔S31: targets 20.9/12.2Å but partners are 36.5Å apart → too_far_apart by 3.4Å
  - G3↔S7: targets 32.3/20.9Å but partners are 8.7Å apart → too_close_together by 2.7Å
- **E15** — severity 4.96, 4 conflict(s); suspect input ~`E23` (group: push_out)
  - push-out (wants farther): L25@18.1Å(now 15.4,conf 0.46)
  - L25↔E23: targets 18.1/10.5Å but partners are 3.4Å apart → too_close_together by 4.2Å
  - L25↔I22: targets 18.1/9.1Å but partners are 5.6Å apart → too_close_together by 3.3Å
  - R19↔L25: targets 6.5/18.1Å but partners are 9.7Å apart → too_close_together by 1.9Å
- **V18** — severity 4.75, 4 conflict(s); suspect input ~`P30` (group: push_out)
  - push-out (wants farther): S32@20.2Å(now 17.3,conf 0.50)
  - S32↔P30: targets 20.2/15.2Å but partners are 1.4Å apart → too_close_together by 3.6Å
  - F21↔S32: targets 5.7/20.2Å but partners are 11.8Å apart → too_close_together by 2.6Å
  - S32↔L25: targets 20.2/9.3Å but partners are 8.2Å apart → too_close_together by 2.6Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=12 · 3-10(G)=3 · coil(C)=0

```
EEEHHHHHHHEEHHHHHHHGHHHHEHEGGEHEHEHEE
```

## Backbone H-bond Network

- total=22 · helix(i→i+4)=11 · sheet=11
  - T4 ↔ D8  (helix)
  - F5 ↔ L9  (helix)
  - T6 ↔ S10  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - V18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - S31 ↔ P35  (helix)
  - L25 ↔ P30  (sheet)
  - L25 ↔ S32  (sheet)
  - L25 ↔ A34  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - N27 ↔ S32  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P36  (sheet)
  - P30 ↔ P36  (sheet)
  - … +2 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=105 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=10 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9051 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
