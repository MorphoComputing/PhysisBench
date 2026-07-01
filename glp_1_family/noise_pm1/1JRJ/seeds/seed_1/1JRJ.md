# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm1\1JRJ\seeds\seed_1\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.428 A
- tm_score_ca_ordered: 0.554783814771798
- heavy_atom_rmsd: 4.050 A
- sidechain_heavy_atom_rmsd: 5.127 A
- **all-atom quality (honest):** heavy 4.050 A, sidechain 5.127 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 634
- bin_accuracy: 0.719

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E2-G3 → 32 conflicts (46%); S7 → 14 conflicts (20%); L25 → 9 conflicts (13%)
- explained: 55/70 conflicts by 3 root cause(s)
- metrics: hubs=16 (frac 0.432), conflicts/hub=4.4, max_incompat=4.12Å, chain_span=0.946
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E2-G3 + S7 + L25 — explain ~55/70 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P30** — severity 15.14, 13 conflict(s); suspect input ~`L9` (group: push_out)
  - push-out (wants farther): E2@46.1Å(now 43.5,conf 0.75), A34@7.1Å(now 4.3,conf 0.47), G33@8.0Å(now 4.1,conf 0.45), E23@12.8Å(now 10.1,conf 0.44)
  - E2↔L9: targets 46.1/28.1Å but partners are 15.6Å apart → too_close_together by 2.4Å
  - E2↔S10: targets 46.1/26.1Å but partners are 17.6Å apart → too_close_together by 2.4Å
  - E2↔M13: targets 46.1/22.3Å but partners are 21.2Å apart → too_close_together by 2.5Å
- **S7** — severity 10.91, 8 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): P37@20.9Å(now 23.7,conf 0.52)
  - P35↔P37: targets 31.1/20.9Å but partners are 6.8Å apart → too_close_together by 3.5Å
  - P30↔P37: targets 35.3/20.9Å but partners are 11.1Å apart → too_close_together by 3.3Å
  - A34↔P37: targets 32.7/20.9Å but partners are 8.9Å apart → too_close_together by 2.9Å
- **R19** — severity 10.51, 9 conflict(s); suspect input ~`G3` (group: push_out)
  - pull-in (wants closer): G3@23.7Å(now 26.6,conf 0.58)
  - push-out (wants farther): S10@17.1Å(now 14.6,conf 0.45)
  - I22↔G3: targets 4.4/23.7Å but partners are 31.3Å apart → too_far_apart by 3.1Å
  - G1↔G3: targets 33.7/23.7Å but partners are 7.0Å apart → too_close_together by 3.0Å
  - G3↔G28: targets 23.7/12.9Å but partners are 39.7Å apart → too_far_apart by 3.1Å
- **G3** — severity 9.26, 6 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): R19@23.7Å(now 26.6,conf 0.58)
  - I22↔R19: targets 32.6/23.7Å but partners are 4.8Å apart → too_close_together by 4.1Å
  - G28↔R19: targets 41.2/23.7Å but partners are 14.4Å apart → too_close_together by 3.1Å
  - L25↔R19: targets 36.2/23.7Å but partners are 9.8Å apart → too_close_together by 2.6Å
- **E2** — severity 8.33, 6 conflict(s); suspect input ~`E16` (group: push_out)
  - push-out (wants farther): P30@46.1Å(now 43.5,conf 0.75)
  - P30↔E16: targets 46.1/23.6Å but partners are 18.7Å apart → too_close_together by 3.9Å
  - F21↔P30: targets 33.1/46.1Å but partners are 10.8Å apart → too_close_together by 2.2Å
  - P30↔M13: targets 46.1/19.9Å but partners are 22.9Å apart → too_close_together by 3.3Å
- **P37** — severity 7.18, 6 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@20.9Å(now 23.7,conf 0.52)
  - S7↔S31: targets 20.9/12.2Å but partners are 36.3Å apart → too_far_apart by 3.2Å
  - T4↔S7: targets 29.5/20.9Å but partners are 5.9Å apart → too_close_together by 2.8Å
  - S7↔A34: targets 20.9/9.1Å but partners are 32.4Å apart → too_far_apart by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=27 · strand(E)=6 · 3-10(G)=2 · coil(C)=2

```
CEEHHHHHHGHHEHHGHHHHHHHHHHHHHHHHHECEE
```

## Backbone H-bond Network

- total=8 · helix(i→i+4)=8 · sheet=0
  - T4 ↔ D8  (helix)
  - F5 ↔ L9  (helix)
  - D8 ↔ Q12  (helix)
  - E15 ↔ R19  (helix)
  - L20 ↔ W24  (helix)
  - I22 ↔ K26  (helix)
  - K26 ↔ P30  (helix)
  - G29 ↔ G33  (helix)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=106 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=9 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8988 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
