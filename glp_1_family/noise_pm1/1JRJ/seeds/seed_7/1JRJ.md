# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm1\1JRJ\seeds\seed_7\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.689 A
- tm_score_ca_ordered: 0.4245758595849486
- heavy_atom_rmsd: 4.337 A
- sidechain_heavy_atom_rmsd: 5.454 A
- **all-atom quality (honest):** heavy 4.337 A, sidechain 5.454 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 634
- bin_accuracy: 0.715

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V18-R19 → 32 conflicts (50%); S7 → 17 conflicts (27%); K11 → 9 conflicts (14%)
- explained: 58/64 conflicts by 3 root cause(s)
- metrics: hubs=15 (frac 0.405), conflicts/hub=4.3, max_incompat=4.52Å, chain_span=0.919
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V18-R19 + S7 + K11 — explain ~58/64 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R19** — severity 12.95, 10 conflict(s); suspect input ~`G3` (group: push_out)
  - pull-in (wants closer): G3@23.7Å(now 26.9,conf 0.58)
  - push-out (wants farther): S10@17.1Å(now 14.3,conf 0.45)
  - I22↔G3: targets 4.4/23.7Å but partners are 31.3Å apart → too_far_apart by 3.2Å
  - G1↔G3: targets 33.7/23.7Å but partners are 7.0Å apart → too_close_together by 3.0Å
  - G3↔G28: targets 23.7/12.9Å but partners are 40.1Å apart → too_far_apart by 3.5Å
- **S7** — severity 10.71, 8 conflict(s); suspect input ~`P37` (group: pull_in)
  - pull-in (wants closer): P37@20.9Å(now 23.7,conf 0.52)
  - P35↔P37: targets 31.1/20.9Å but partners are 6.8Å apart → too_close_together by 3.4Å
  - P30↔P37: targets 35.3/20.9Å but partners are 11.2Å apart → too_close_together by 3.2Å
  - P36↔P37: targets 27.2/20.9Å but partners are 3.5Å apart → too_close_together by 2.9Å
- **G3** — severity 9.92, 7 conflict(s); suspect input ~`R19` (group: pull_in)
  - pull-in (wants closer): R19@23.7Å(now 26.9,conf 0.58)
  - I22↔R19: targets 32.6/23.7Å but partners are 5.0Å apart → too_close_together by 4.0Å
  - G28↔R19: targets 41.2/23.7Å but partners are 14.5Å apart → too_close_together by 3.0Å
  - L25↔R19: targets 36.2/23.7Å but partners are 9.9Å apart → too_close_together by 2.6Å
- **P37** — severity 9.44, 8 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@20.9Å(now 23.7,conf 0.52)
  - T4↔S7: targets 29.5/20.9Å but partners are 5.5Å apart → too_close_together by 3.1Å
  - G3↔S7: targets 32.3/20.9Å but partners are 8.4Å apart → too_close_together by 3.1Å
  - S7↔S31: targets 20.9/12.2Å but partners are 36.1Å apart → too_far_apart by 3.0Å
- **G33** — severity 8.30, 5 conflict(s); suspect input ~`K11` (group: push_out)
  - pull-in (wants closer): K11@26.3Å(now 29.3,conf 0.67)
  - push-out (wants farther): P30@8.0Å(now 4.3,conf 0.45)
  - T4↔K11: targets 41.6/26.3Å but partners are 12.4Å apart → too_close_together by 2.9Å
  - F5↔K11: targets 38.7/26.3Å but partners are 9.6Å apart → too_close_together by 2.7Å
  - D8↔K11: targets 34.0/26.3Å but partners are 5.1Å apart → too_close_together by 2.5Å
- **K11** — severity 5.49, 5 conflict(s); suspect input ~`T4` (group: push_out)
  - pull-in (wants closer): G33@26.3Å(now 29.3,conf 0.67)
  - push-out (wants farther): E23@21.0Å(now 18.3,conf 0.52)
  - G33↔T4: targets 26.3/11.4Å but partners are 40.9Å apart → too_far_apart by 3.2Å
  - E23↔R19: targets 21.0/11.8Å but partners are 6.4Å apart → too_close_together by 2.8Å
  - E23↔E15: targets 21.0/6.4Å but partners are 12.3Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=11 · 3-10(G)=5 · coil(C)=3

```
EEEGEHGGHHHHEHHHHHHGHHHHEHECHCHEGCEEE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=9 · sheet=8
  - T6 ↔ S10  (helix)
  - S10 ↔ E14  (helix)
  - Q12 ↔ E16  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - I22 ↔ K26  (helix)
  - F5 ↔ M13  (sheet)
  - L25 ↔ S32  (sheet)
  - L25 ↔ P35  (sheet)
  - L25 ↔ P36  (sheet)
  - L25 ↔ P37  (sheet)
  - N27 ↔ S32  (sheet)
  - N27 ↔ P35  (sheet)
  - N27 ↔ P36  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=104 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=8 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9073 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
