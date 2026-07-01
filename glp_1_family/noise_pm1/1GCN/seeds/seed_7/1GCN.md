# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_7\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.706 A
- tm_score_ca_ordered: 0.19406033720636162
- heavy_atom_rmsd: 5.003 A
- sidechain_heavy_atom_rmsd: 6.332 A
- **all-atom quality (honest):** heavy 5.003 A, sidechain 6.332 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 340
- bin_accuracy: 0.741

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** V22 → 21 conflicts (51%); S7 → 13 conflicts (32%); S10 → 7 conflicts (17%)
- explained: 41/41 conflicts by 3 root cause(s)
- metrics: hubs=6 (frac 0.222), conflicts/hub=6.8, max_incompat=3.86Å, chain_span=0.778
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): V22 + S7 + S10 — explain ~41/41 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S15** — severity 11.03, 10 conflict(s); suspect input ~`V22` (group: pull_in)
  - pull-in (wants closer): V22@8.6Å(now 11.8,conf 0.45)
  - S1↔V22: targets 26.0/8.6Å but partners are 38.0Å apart → too_far_apart by 3.4Å
  - V22↔D8: targets 8.6/11.0Å but partners are 22.8Å apart → too_far_apart by 3.1Å
  - Q2↔V22: targets 23.9/8.6Å but partners are 35.2Å apart → too_far_apart by 2.6Å
- **V22** — severity 10.10, 9 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): S15@8.6Å(now 11.8,conf 0.45)
  - T4↔S15: targets 31.1/8.6Å but partners are 19.1Å apart → too_close_together by 3.4Å
  - K11↔S15: targets 18.5/8.6Å but partners are 7.0Å apart → too_close_together by 2.9Å
  - F5↔S15: targets 29.1/8.6Å but partners are 17.6Å apart → too_close_together by 2.8Å
- **S7** — severity 8.56, 8 conflict(s); suspect input ~`T4` (group: pull_in)
  - pull-in (wants closer): T4@4.8Å(now 8.0,conf 0.59)
  - W24↔T4: targets 25.8/4.8Å but partners are 33.2Å apart → too_far_apart by 2.7Å
  - T4↔D14: targets 4.8/9.4Å but partners are 17.5Å apart → too_far_apart by 3.3Å
  - Q23↔T4: targets 25.3/4.8Å but partners are 32.2Å apart → too_far_apart by 2.1Å
- **T4** — severity 6.97, 6 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@4.8Å(now 8.0,conf 0.59)
  - V22↔S7: targets 31.1/4.8Å but partners are 24.0Å apart → too_close_together by 2.4Å
  - M26↔S7: targets 36.8/4.8Å but partners are 29.8Å apart → too_close_together by 2.2Å
  - S7↔S10: targets 4.8/12.3Å but partners are 4.6Å apart → too_close_together by 2.9Å
- **L25** — severity 6.12, 4 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): S10@21.7Å(now 24.2,conf 0.54)
  - S1↔S10: targets 44.5/21.7Å but partners are 19.0Å apart → too_close_together by 3.9Å
  - Q2↔S10: targets 40.3/21.7Å but partners are 15.9Å apart → too_close_together by 2.8Å
  - S7↔S10: targets 28.6/21.7Å but partners are 4.6Å apart → too_close_together by 2.4Å
- **S10** — severity 3.75, 4 conflict(s); suspect input ~`T6` (group: pull_in)
  - pull-in (wants closer): L25@21.7Å(now 24.2,conf 0.54)
  - L25↔T6: targets 21.7/6.3Å but partners are 30.4Å apart → too_far_apart by 2.5Å
  - N27↔L25: targets 26.4/21.7Å but partners are 3.0Å apart → too_close_together by 1.8Å
  - L25↔Q2: targets 21.7/15.8Å but partners are 39.5Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=9 · 3-10(G)=1 · coil(C)=1

```
EECEEHEHHHEGHHHHEHHHHHEHHHE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=9 · sheet=4
  - T6 ↔ S10  (helix)
  - Y9 ↔ L13  (helix)
  - S10 ↔ D14  (helix)
  - D14 ↔ A18  (helix)
  - R16 ↔ D20  (helix)
  - A18 ↔ V22  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - V22 ↔ M26  (helix)
  - Q2 ↔ S7  (sheet)
  - F5 ↔ K11  (sheet)
  - K11 ↔ R17  (sheet)
  - R17 ↔ Q23  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=66 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9244 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
