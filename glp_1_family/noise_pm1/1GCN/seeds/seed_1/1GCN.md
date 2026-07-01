# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_1\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.975 A
- tm_score_ca_ordered: 0.2564653511669691
- heavy_atom_rmsd: 5.433 A
- sidechain_heavy_atom_rmsd: 6.817 A
- **all-atom quality (honest):** heavy 5.433 A, sidechain 6.817 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 340
- bin_accuracy: 0.721

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S15-R17 → 36 conflicts (62%); S1 → 22 conflicts (38%)
- explained: 58/58 conflicts by 2 root cause(s)
- metrics: hubs=6 (frac 0.222), conflicts/hub=9.7, max_incompat=4.01Å, chain_span=0.889
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S15-R17 + S1 — explain ~58/58 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S1** — severity 17.72, 13 conflict(s); suspect input ~`L25` (group: push_out)
  - push-out (wants farther): L25@44.5Å(now 41.9,conf 0.74)
  - D20↔L25: targets 33.2/44.5Å but partners are 8.2Å apart → too_close_together by 3.1Å
  - L25↔A18: targets 44.5/30.9Å but partners are 10.9Å apart → too_close_together by 2.7Å
  - L25↔S15: targets 44.5/26.0Å but partners are 15.7Å apart → too_close_together by 2.8Å
- **L25** — severity 17.14, 12 conflict(s); suspect input ~`S1` (group: push_out)
  - push-out (wants farther): S1@44.5Å(now 41.9,conf 0.74)
  - S1↔D8: targets 44.5/25.4Å but partners are 15.2Å apart → too_close_together by 4.0Å
  - S1↔S10: targets 44.5/21.7Å but partners are 18.9Å apart → too_close_together by 4.0Å
  - F5↔S1: targets 31.9/44.5Å but partners are 9.8Å apart → too_close_together by 2.9Å
- **V22** — severity 12.06, 12 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): Q19@5.8Å(now 8.3,conf 0.51), S15@8.6Å(now 11.3,conf 0.45)
  - T4↔S15: targets 31.1/8.6Å but partners are 19.4Å apart → too_close_together by 3.1Å
  - F5↔S15: targets 29.1/8.6Å but partners are 17.6Å apart → too_close_together by 2.9Å
  - K11↔S15: targets 18.5/8.6Å but partners are 7.0Å apart → too_close_together by 2.9Å
- **S15** — severity 9.47, 9 conflict(s); suspect input ~`V22` (group: pull_in)
  - pull-in (wants closer): V22@8.6Å(now 11.3,conf 0.45)
  - S1↔V22: targets 26.0/8.6Å but partners are 37.5Å apart → too_far_apart by 2.8Å
  - K11↔V22: targets 6.7/8.6Å but partners are 18.1Å apart → too_far_apart by 2.8Å
  - V22↔D8: targets 8.6/11.0Å but partners are 22.5Å apart → too_far_apart by 2.8Å
- **R17** — severity 9.41, 7 conflict(s); suspect input ~`F5` (group: push_out)
  - pull-in (wants closer): F5@18.5Å(now 21.5,conf 0.47)
  - push-out (wants farther): Q19@5.4Å(now 2.8,conf 0.31)
  - S1↔F5: targets 32.3/18.5Å but partners are 9.8Å apart → too_close_together by 4.0Å
  - Q2↔F5: targets 29.7/18.5Å but partners are 7.3Å apart → too_close_together by 3.9Å
  - F5↔W24: targets 18.5/10.4Å but partners are 31.7Å apart → too_far_apart by 2.8Å
- **F5** — severity 5.56, 5 conflict(s); suspect input ~`R17` (group: pull_in)
  - pull-in (wants closer): R17@18.5Å(now 21.5,conf 0.47)
  - W24↔R17: targets 33.2/18.5Å but partners are 11.0Å apart → too_close_together by 3.7Å
  - D20↔R17: targets 25.4/18.5Å but partners are 4.7Å apart → too_close_together by 2.2Å
  - Q19↔R17: targets 23.5/18.5Å but partners are 2.8Å apart → too_close_together by 2.2Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=6 · 3-10(G)=5 · coil(C)=1

```
EEHHHHHHGHHHGHHGGGHEEHEHHCE
```

## Backbone H-bond Network

- total=6 · helix(i→i+4)=4 · sheet=2
  - G3 ↔ S7  (helix)
  - D8 ↔ Y12  (helix)
  - S10 ↔ D14  (helix)
  - S15 ↔ Q19  (helix)
  - D20 ↔ N27  (sheet)
  - F21 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=64 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9246 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
