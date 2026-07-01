# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm1\1JRJ\seeds\seed_4\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 1.399 A
- tm_score_ca_ordered: 0.7116533238830545
- heavy_atom_rmsd: 2.805 A
- sidechain_heavy_atom_rmsd: 3.475 A
- **all-atom quality (honest):** heavy 2.805 A, sidechain 3.475 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 634
- bin_accuracy: 0.713

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** P36-P37 → 33 conflicts (40%); E16 → 21 conflicts (25%); R19 → 16 conflicts (19%)
- explained: 70/83 conflicts by 3 root cause(s)
- metrics: hubs=15 (frac 0.405), conflicts/hub=5.5, max_incompat=4.54Å, chain_span=0.919
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): P36-P37 + E16 + R19 — explain ~70/83 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 12.73, 11 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): G29@14.1Å(now 16.9,conf 0.44)
  - E2↔G29: targets 23.6/14.1Å but partners are 42.2Å apart → too_far_apart by 4.5Å
  - T4↔G29: targets 18.8/14.1Å but partners are 36.4Å apart → too_far_apart by 3.5Å
  - F5↔G29: targets 16.0/14.1Å but partners are 33.1Å apart → too_far_apart by 3.0Å
- **S7** — severity 12.44, 9 conflict(s); suspect input ~`P37` (group: push_out)
  - pull-in (wants closer): P37@20.9Å(now 23.7,conf 0.52)
  - push-out (wants farther): G3@10.6Å(now 7.9,conf 0.44)
  - P30↔P37: targets 35.3/20.9Å but partners are 10.5Å apart → too_close_together by 3.9Å
  - P35↔P37: targets 31.1/20.9Å but partners are 6.8Å apart → too_close_together by 3.4Å
  - S31↔P37: targets 37.7/20.9Å but partners are 13.6Å apart → too_close_together by 3.3Å
- **R19** — severity 11.95, 10 conflict(s); suspect input ~`G3` (group: pull_in)
  - pull-in (wants closer): G3@23.7Å(now 26.4,conf 0.58), P37@7.7Å(now 10.4,conf 0.46)
  - I22↔G3: targets 4.4/23.7Å but partners are 31.4Å apart → too_far_apart by 3.2Å
  - G3↔G28: targets 23.7/12.9Å but partners are 40.2Å apart → too_far_apart by 3.6Å
  - G1↔G3: targets 33.7/23.7Å but partners are 7.5Å apart → too_close_together by 2.5Å
- **P37** — severity 11.92, 9 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@20.9Å(now 23.7,conf 0.52), R19@7.7Å(now 10.4,conf 0.46)
  - T4↔S7: targets 29.5/20.9Å but partners are 5.1Å apart → too_close_together by 3.5Å
  - G3↔S7: targets 32.3/20.9Å but partners are 7.9Å apart → too_close_together by 3.5Å
  - F5↔S7: targets 26.2/20.9Å but partners are 2.3Å apart → too_close_together by 3.1Å
- **G3** — severity 10.07, 7 conflict(s); suspect input ~`R19` (group: push_out)
  - pull-in (wants closer): R19@23.7Å(now 26.4,conf 0.58)
  - push-out (wants farther): S7@10.6Å(now 7.9,conf 0.44)
  - I22↔R19: targets 32.6/23.7Å but partners are 5.3Å apart → too_close_together by 3.6Å
  - G28↔R19: targets 41.2/23.7Å but partners are 14.2Å apart → too_close_together by 3.3Å
  - S32↔R19: targets 42.9/23.7Å but partners are 16.8Å apart → too_close_together by 2.4Å
- **G29** — severity 9.32, 9 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): E16@14.1Å(now 16.9,conf 0.44)
  - M13↔E16: targets 22.2/14.1Å but partners are 4.5Å apart → too_close_together by 3.6Å
  - F5↔E16: targets 33.5/14.1Å but partners are 16.7Å apart → too_close_together by 2.7Å
  - T6↔E16: targets 32.2/14.1Å but partners are 15.6Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=13 · 3-10(G)=5 · coil(C)=3

```
EEEGCHEHHEHEHHHEHHHGGHHHGHECEGHEHECEE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=8 · sheet=10
  - L9 ↔ M13  (helix)
  - K11 ↔ E15  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - E2 ↔ S7  (sheet)
  - S7 ↔ Q12  (sheet)
  - S10 ↔ E16  (sheet)
  - N27 ↔ S32  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P36  (sheet)
  - G29 ↔ A34  (sheet)
  - G29 ↔ P36  (sheet)
  - G29 ↔ P37  (sheet)
  - S32 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=103 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=8 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9016 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
