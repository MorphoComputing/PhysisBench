# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_2\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 3.211 A
- tm_score_ca_ordered: 0.19968874858134705
- heavy_atom_rmsd: 5.575 A
- sidechain_heavy_atom_rmsd: 6.955 A
- **all-atom quality (honest):** heavy 5.575 A, sidechain 6.955 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 300
- bin_accuracy: 0.653

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D14-R17 → 68 conflicts (68%); V22-L25 → 32 conflicts (32%)
- explained: 100/100 conflicts by 2 root cause(s)
- metrics: hubs=13 (frac 0.481), conflicts/hub=7.7, max_incompat=3.82Å, chain_span=0.741
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D14-R17 + V22-L25 — explain ~100/100 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **D8** — severity 17.12, 15 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): L25@25.4Å(now 28.2,conf 0.64), V22@20.7Å(now 23.4,conf 0.51), S15@11.0Å(now 13.7,conf 0.44)
  - L25↔F5: targets 25.4/5.2Å but partners are 33.5Å apart → too_far_apart by 2.9Å
  - V22↔F5: targets 20.7/5.2Å but partners are 28.9Å apart → too_far_apart by 3.0Å
  - L25↔S1: targets 25.4/14.5Å but partners are 43.1Å apart → too_far_apart by 3.2Å
- **R17** — severity 16.05, 14 conflict(s); suspect input ~`F5` (group: pull_in)
  - pull-in (wants closer): F5@18.5Å(now 21.5,conf 0.47), F21@5.3Å(now 7.9,conf 0.55), W24@10.4Å(now 13.1,conf 0.44)
  - F5↔L25: targets 18.5/11.2Å but partners are 33.5Å apart → too_far_apart by 3.8Å
  - F5↔W24: targets 18.5/10.4Å but partners are 32.4Å apart → too_far_apart by 3.5Å
  - F5↔F21: targets 18.5/5.3Å but partners are 27.1Å apart → too_far_apart by 3.3Å
- **S15** — severity 14.60, 13 conflict(s); suspect input ~`V22` (group: pull_in)
  - pull-in (wants closer): V22@8.6Å(now 11.8,conf 0.45), D8@11.0Å(now 13.7,conf 0.44)
  - V22↔D8: targets 8.6/11.0Å but partners are 23.4Å apart → too_far_apart by 3.8Å
  - S1↔V22: targets 26.0/8.6Å but partners are 38.2Å apart → too_far_apart by 3.5Å
  - Y12↔V22: targets 5.1/8.6Å but partners are 16.8Å apart → too_far_apart by 3.1Å
- **V22** — severity 12.46, 12 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): D8@20.7Å(now 23.4,conf 0.51), S15@8.6Å(now 11.8,conf 0.45)
  - F5↔D8: targets 29.1/20.7Å but partners are 5.7Å apart → too_close_together by 2.6Å
  - D8↔M26: targets 20.7/6.3Å but partners are 29.6Å apart → too_far_apart by 2.6Å
  - T4↔S15: targets 31.1/8.6Å but partners are 19.7Å apart → too_close_together by 2.8Å
- **D14** — severity 12.19, 11 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): S7@9.4Å(now 12.2,conf 0.45)
  - S7↔D20: targets 9.4/8.3Å but partners are 21.3Å apart → too_far_apart by 3.6Å
  - L25↔S7: targets 16.6/9.4Å but partners are 29.1Å apart → too_far_apart by 3.1Å
  - S7↔F5: targets 9.4/17.2Å but partners are 4.9Å apart → too_close_together by 2.9Å
- **L25** — severity 10.08, 8 conflict(s); suspect input ~`S10` (group: push_out)
  - pull-in (wants closer): D8@25.4Å(now 28.2,conf 0.64), S10@21.7Å(now 24.5,conf 0.54)
  - push-out (wants farther): R16@16.8Å(now 14.1,conf 0.45)
  - S1↔D8: targets 44.5/25.4Å but partners are 16.1Å apart → too_close_together by 3.0Å
  - S1↔S10: targets 44.5/21.7Å but partners are 19.6Å apart → too_close_together by 3.2Å
  - D8↔G3: targets 25.4/38.6Å but partners are 11.0Å apart → too_close_together by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=11 · 3-10(G)=1 · coil(C)=1

```
CEEEHHHHEHEGHEHEHEHHEHEHHHE
```

## Backbone H-bond Network

- total=15 · helix(i→i+4)=5 · sheet=10
  - T6 ↔ S10  (helix)
  - L13 ↔ R17  (helix)
  - S15 ↔ Q19  (helix)
  - D20 ↔ W24  (helix)
  - V22 ↔ M26  (helix)
  - T4 ↔ Y9  (sheet)
  - Y9 ↔ D14  (sheet)
  - Y9 ↔ R16  (sheet)
  - K11 ↔ R16  (sheet)
  - K11 ↔ A18  (sheet)
  - D14 ↔ F21  (sheet)
  - R16 ↔ F21  (sheet)
  - R16 ↔ Q23  (sheet)
  - A18 ↔ Q23  (sheet)
  - F21 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=63 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9667 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
