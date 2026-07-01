# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm1\1JRJ\seeds\seed_8\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.249 A
- tm_score_ca_ordered: 0.5335502933411213
- heavy_atom_rmsd: 3.544 A
- sidechain_heavy_atom_rmsd: 4.465 A
- **all-atom quality (honest):** heavy 3.544 A, sidechain 4.465 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 595
- bin_accuracy: 0.709

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V18-R19 → 27 conflicts (46%); P36-P37 → 25 conflicts (42%); K11-M13 → 7 conflicts (12%)
- explained: 59/59 conflicts by 3 root cause(s)
- metrics: hubs=12 (frac 0.324), conflicts/hub=4.9, max_incompat=3.84Å, chain_span=0.919
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V18-R19 + P36-P37 + K11-M13 — explain ~59/59 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R19** — severity 11.59, 8 conflict(s); suspect input ~`G3` (group: pull_in)
  - pull-in (wants closer): G3@23.7Å(now 27.0,conf 0.58)
  - G3↔I22: targets 23.7/4.4Å but partners are 31.6Å apart → too_far_apart by 3.5Å
  - G1↔G3: targets 33.7/23.7Å but partners are 6.7Å apart → too_close_together by 3.2Å
  - G3↔G28: targets 23.7/12.9Å but partners are 40.2Å apart → too_far_apart by 3.6Å
- **G3** — severity 10.72, 8 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): R19@23.7Å(now 27.0,conf 0.58)
  - G28↔R19: targets 41.2/23.7Å but partners are 13.7Å apart → too_close_together by 3.8Å
  - I22↔R19: targets 32.6/23.7Å but partners are 5.5Å apart → too_close_together by 3.4Å
  - S32↔R19: targets 42.9/23.7Å but partners are 16.2Å apart → too_close_together by 3.0Å
- **S7** — severity 10.69, 7 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): P37@20.9Å(now 23.7,conf 0.52)
  - P30↔P37: targets 35.3/20.9Å but partners are 10.7Å apart → too_close_together by 3.7Å
  - P37↔P35: targets 20.9/31.1Å but partners are 6.9Å apart → too_close_together by 3.4Å
  - S31↔P37: targets 37.7/20.9Å but partners are 13.6Å apart → too_close_together by 3.3Å
- **P37** — severity 8.38, 7 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@20.9Å(now 23.7,conf 0.52)
  - T4↔S7: targets 29.5/20.9Å but partners are 5.3Å apart → too_close_together by 3.4Å
  - G3↔S7: targets 32.3/20.9Å but partners are 8.7Å apart → too_close_together by 2.8Å
  - S7↔S31: targets 20.9/12.2Å but partners are 36.1Å apart → too_far_apart by 3.0Å
- **M13** — severity 6.00, 7 conflict(s); suspect input ~`P36` (group: pull_in)
  - pull-in (wants closer): S10@5.8Å(now 8.4,conf 0.52), P36@15.0Å(now 17.6,conf 0.44)
  - G1↔P36: targets 22.1/15.0Å but partners are 39.6Å apart → too_far_apart by 2.5Å
  - E2↔P36: targets 19.9/15.0Å but partners are 37.0Å apart → too_far_apart by 2.1Å
  - P36↔T4: targets 15.0/14.8Å but partners are 31.8Å apart → too_far_apart by 2.0Å
- **G33** — severity 5.76, 4 conflict(s); suspect input ~`K11` (group: pull_in)
  - pull-in (wants closer): K11@26.3Å(now 29.3,conf 0.67)
  - T4↔K11: targets 41.6/26.3Å but partners are 12.6Å apart → too_close_together by 2.7Å
  - S7↔K11: targets 35.9/26.3Å but partners are 7.4Å apart → too_close_together by 2.2Å
  - F5↔K11: targets 38.7/26.3Å but partners are 10.2Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=13 · 3-10(G)=1 · coil(C)=5

```
CCCHHHEHHHEECEHEHHHEHHHEHEEHEHGHHECEE
```

## Backbone H-bond Network

- total=30 · helix(i→i+4)=8 · sheet=22
  - T4 ↔ D8  (helix)
  - T6 ↔ S10  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - F21 ↔ L25  (helix)
  - G28 ↔ S32  (helix)
  - S7 ↔ Q12  (sheet)
  - S7 ↔ E14  (sheet)
  - K11 ↔ E16  (sheet)
  - E14 ↔ L20  (sheet)
  - E16 ↔ W24  (sheet)
  - L20 ↔ K26  (sheet)
  - L20 ↔ N27  (sheet)
  - L20 ↔ G29  (sheet)
  - L20 ↔ A34  (sheet)
  - L20 ↔ P36  (sheet)
  - L20 ↔ P37  (sheet)
  - W24 ↔ G29  (sheet)
  - … +10 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=108 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=10 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9147 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
