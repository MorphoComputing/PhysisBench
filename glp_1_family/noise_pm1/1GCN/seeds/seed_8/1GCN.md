# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_8\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.143 A
- tm_score_ca_ordered: 0.2545471651503024
- heavy_atom_rmsd: 5.141 A
- sidechain_heavy_atom_rmsd: 6.348 A
- **all-atom quality (honest):** heavy 5.141 A, sidechain 6.348 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 300
- bin_accuracy: 0.710

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F5-T6 → 26 conflicts (79%); S10 → 4 conflicts (12%)
- explained: 30/33 conflicts by 2 root cause(s)
- metrics: hubs=9 (frac 0.333), conflicts/hub=3.7, max_incompat=3.44Å, chain_span=0.741
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F5-T6 + S10 — explain ~30/33 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R17** — severity 8.77, 8 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): F5@18.5Å(now 21.3,conf 0.47)
  - F5↔F21: targets 18.5/5.3Å but partners are 26.6Å apart → too_far_apart by 2.8Å
  - S1↔F5: targets 32.3/18.5Å but partners are 11.1Å apart → too_close_together by 2.7Å
  - F5↔Q23: targets 18.5/9.0Å but partners are 30.3Å apart → too_far_apart by 2.8Å
- **F5** — severity 8.66, 9 conflict(s); suspect input ~`R17` (group: pull_in)
  - pull-in (wants closer): R17@18.5Å(now 21.3,conf 0.47)
  - W24↔R17: targets 33.2/18.5Å but partners are 11.5Å apart → too_close_together by 3.2Å
  - N27↔R17: targets 35.0/18.5Å but partners are 14.1Å apart → too_close_together by 2.4Å
  - F21↔R17: targets 26.8/18.5Å but partners are 5.9Å apart → too_close_together by 2.3Å
- **L25** — severity 4.74, 4 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): S10@21.7Å(now 24.2,conf 0.54)
  - S1↔S10: targets 44.5/21.7Å but partners are 19.4Å apart → too_close_together by 3.4Å
  - S10↔Q2: targets 21.7/40.3Å but partners are 16.7Å apart → too_close_together by 1.9Å
  - G3↔S10: targets 38.6/21.7Å but partners are 15.1Å apart → too_close_together by 1.9Å
- **S15** — severity 4.45, 4 conflict(s); suspect input ~`T6` (group: push_out)
  - push-out (wants farther): T6@17.7Å(now 15.1,conf 0.46)
  - T6↔D8: targets 17.7/11.0Å but partners are 3.2Å apart → too_close_together by 3.4Å
  - K11↔T6: targets 6.7/17.7Å but partners are 8.6Å apart → too_close_together by 2.4Å
  - Y12↔T6: targets 5.1/17.7Å but partners are 10.4Å apart → too_close_together by 2.2Å
- **T6** — severity 3.26, 3 conflict(s); suspect input ~`D14` (group: push_out)
  - push-out (wants farther): S15@17.7Å(now 15.1,conf 0.46)
  - D14↔S15: targets 11.6/17.7Å but partners are 3.4Å apart → too_close_together by 2.7Å
  - S10↔S15: targets 6.3/17.7Å but partners are 9.1Å apart → too_close_together by 2.4Å
  - Y12↔S15: targets 10.4/17.7Å but partners are 5.1Å apart → too_close_together by 2.2Å
- **S10** — severity 1.95, 2 conflict(s); suspect input ~`T6` (group: pull_in)
  - pull-in (wants closer): L25@21.7Å(now 24.2,conf 0.54)
  - L25↔T6: targets 21.7/6.3Å but partners are 30.2Å apart → too_far_apart by 2.2Å
  - L25↔Q2: targets 21.7/15.8Å but partners are 39.4Å apart → too_far_apart by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=9 · 3-10(G)=1 · coil(C)=0

```
EEEEHEEHHGHEHHHHHHHHEHHHHHE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=10 · sheet=4
  - F5 ↔ Y9  (helix)
  - Y9 ↔ L13  (helix)
  - K11 ↔ S15  (helix)
  - D14 ↔ A18  (helix)
  - S15 ↔ Q19  (helix)
  - R16 ↔ D20  (helix)
  - A18 ↔ V22  (helix)
  - Q19 ↔ Q23  (helix)
  - D20 ↔ W24  (helix)
  - V22 ↔ M26  (helix)
  - Q2 ↔ S7  (sheet)
  - T6 ↔ Y12  (sheet)
  - S7 ↔ Y12  (sheet)
  - F21 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=65 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9397 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
