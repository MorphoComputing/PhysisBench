# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm1\1JRJ\seeds\seed_6\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.393 A
- tm_score_ca_ordered: 0.5511217936131909
- heavy_atom_rmsd: 3.716 A
- sidechain_heavy_atom_rmsd: 4.593 A
- **all-atom quality (honest):** heavy 3.716 A, sidechain 4.593 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 633
- bin_accuracy: 0.714

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** R19 → 31 conflicts (39%); S7 → 17 conflicts (22%); L25 → 13 conflicts (16%)
- explained: 61/79 conflicts by 3 root cause(s)
- metrics: hubs=15 (frac 0.405), conflicts/hub=5.3, max_incompat=4.03Å, chain_span=0.919
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): R19 + S7 + L25 — explain ~61/79 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R19** — severity 14.31, 12 conflict(s); suspect input ~`G3` (group: pull_in)
  - pull-in (wants closer): G3@23.7Å(now 26.3,conf 0.58)
  - push-out (wants farther): S7@21.2Å(now 18.7,conf 0.53), S10@17.1Å(now 14.4,conf 0.45)
  - I22↔G3: targets 4.4/23.7Å but partners are 31.5Å apart → too_far_apart by 3.4Å
  - G1↔G3: targets 33.7/23.7Å but partners are 6.8Å apart → too_close_together by 3.1Å
  - G3↔G28: targets 23.7/12.9Å but partners are 40.0Å apart → too_far_apart by 3.4Å
- **G3** — severity 13.14, 11 conflict(s); suspect input ~`R19` (group: push_out)
  - pull-in (wants closer): R19@23.7Å(now 26.3,conf 0.58)
  - push-out (wants farther): M13@20.0Å(now 17.4,conf 0.50)
  - I22↔R19: targets 32.6/23.7Å but partners are 5.6Å apart → too_close_together by 3.3Å
  - G28↔R19: targets 41.2/23.7Å but partners are 14.2Å apart → too_close_together by 3.3Å
  - L25↔R19: targets 36.2/23.7Å but partners are 9.8Å apart → too_close_together by 2.6Å
- **S7** — severity 12.17, 10 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): P37@20.9Å(now 23.9,conf 0.52)
  - push-out (wants farther): R19@21.2Å(now 18.7,conf 0.53)
  - P35↔P37: targets 31.1/20.9Å but partners are 6.8Å apart → too_close_together by 3.5Å
  - P30↔P37: targets 35.3/20.9Å but partners are 11.3Å apart → too_close_together by 3.1Å
  - P36↔P37: targets 27.2/20.9Å but partners are 3.6Å apart → too_close_together by 2.8Å
- **P37** — severity 7.34, 6 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@20.9Å(now 23.9,conf 0.52)
  - T4↔S7: targets 29.5/20.9Å but partners are 5.8Å apart → too_close_together by 2.9Å
  - S7↔S31: targets 20.9/12.2Å but partners are 36.2Å apart → too_far_apart by 3.1Å
  - S7↔A34: targets 20.9/9.1Å but partners are 32.5Å apart → too_far_apart by 2.6Å
- **L25** — severity 5.81, 6 conflict(s); suspect input ~`V18` (group: push_out)
  - pull-in (wants closer): S31@7.2Å(now 10.7,conf 0.47)
  - push-out (wants farther): E15@18.1Å(now 15.5,conf 0.46)
  - S31↔V18: targets 7.2/9.3Å but partners are 19.7Å apart → too_far_apart by 3.1Å
  - E15↔V18: targets 18.1/9.3Å but partners are 6.1Å apart → too_close_together by 2.6Å
  - I22↔S31: targets 6.0/7.2Å but partners are 15.3Å apart → too_far_apart by 2.0Å
- **G33** — severity 5.64, 4 conflict(s); suspect input ~`K11` (group: push_out)
  - pull-in (wants closer): K11@26.3Å(now 29.3,conf 0.67)
  - push-out (wants farther): P30@8.0Å(now 4.2,conf 0.45)
  - T4↔K11: targets 41.6/26.3Å but partners are 12.8Å apart → too_close_together by 2.5Å
  - S7↔K11: targets 35.9/26.3Å but partners are 7.2Å apart → too_close_together by 2.4Å
  - D8↔K11: targets 34.0/26.3Å but partners are 5.9Å apart → too_close_together by 1.8Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=7 · 3-10(G)=6 · coil(C)=7

```
CECHHHHHHGGGCHHHHGHGEHGHCECCHEHHHECEE
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=4 · sheet=8
  - T4 ↔ D8  (helix)
  - F5 ↔ L9  (helix)
  - E15 ↔ R19  (helix)
  - G29 ↔ G33  (helix)
  - F21 ↔ K26  (sheet)
  - F21 ↔ P30  (sheet)
  - F21 ↔ A34  (sheet)
  - F21 ↔ P36  (sheet)
  - F21 ↔ P37  (sheet)
  - K26 ↔ P36  (sheet)
  - P30 ↔ P36  (sheet)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=104 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=8 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9057 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
