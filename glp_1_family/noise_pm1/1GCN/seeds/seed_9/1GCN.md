# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_9\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.954 A
- tm_score_ca_ordered: 0.26828241305952844
- heavy_atom_rmsd: 5.187 A
- sidechain_heavy_atom_rmsd: 6.500 A
- **all-atom quality (honest):** heavy 5.187 A, sidechain 6.500 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 340
- bin_accuracy: 0.715

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** S15-R17 → 42 conflicts (86%)
- explained: 42/49 conflicts by 1 root cause(s)
- metrics: hubs=7 (frac 0.259), conflicts/hub=7.0, max_incompat=4.06Å, chain_span=0.741
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): S15-R17 — explain ~42/49 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S15** — severity 15.67, 14 conflict(s); suspect input ~`V22` (group: pull_in)
  - pull-in (wants closer): V22@8.6Å(now 11.2,conf 0.45)
  - push-out (wants farther): T6@17.7Å(now 15.0,conf 0.46)
  - S1↔V22: targets 26.0/8.6Å but partners are 38.0Å apart → too_far_apart by 3.3Å
  - K11↔V22: targets 6.7/8.6Å but partners are 18.3Å apart → too_far_apart by 3.0Å
  - V22↔D8: targets 8.6/11.0Å but partners are 22.6Å apart → too_far_apart by 3.0Å
- **R17** — severity 10.58, 8 conflict(s); suspect input ~`F5` (group: push_out)
  - pull-in (wants closer): F5@18.5Å(now 21.4,conf 0.47)
  - push-out (wants farther): Q19@5.4Å(now 2.4,conf 0.31)
  - Q2↔F5: targets 29.7/18.5Å but partners are 7.2Å apart → too_close_together by 4.1Å
  - S1↔F5: targets 32.3/18.5Å but partners are 9.8Å apart → too_close_together by 3.9Å
  - F5↔Q23: targets 18.5/9.0Å but partners are 30.5Å apart → too_far_apart by 3.0Å
- **V22** — severity 10.17, 10 conflict(s); suspect input ~`S15` (group: pull_in)
  - pull-in (wants closer): S15@8.6Å(now 11.2,conf 0.45)
  - F5↔S15: targets 29.1/8.6Å but partners are 17.6Å apart → too_close_together by 2.9Å
  - T4↔S15: targets 31.1/8.6Å but partners are 19.7Å apart → too_close_together by 2.8Å
  - K11↔S15: targets 18.5/8.6Å but partners are 7.2Å apart → too_close_together by 2.7Å
- **F5** — severity 7.75, 7 conflict(s); suspect input ~`R17` (group: pull_in)
  - pull-in (wants closer): R17@18.5Å(now 21.4,conf 0.47)
  - W24↔R17: targets 33.2/18.5Å but partners are 11.6Å apart → too_close_together by 3.1Å
  - N27↔R17: targets 35.0/18.5Å but partners are 13.7Å apart → too_close_together by 2.8Å
  - Q19↔R17: targets 23.5/18.5Å but partners are 2.4Å apart → too_close_together by 2.6Å
- **L25** — severity 7.39, 5 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): S10@21.7Å(now 24.5,conf 0.54)
  - S1↔S10: targets 44.5/21.7Å but partners are 19.1Å apart → too_close_together by 3.7Å
  - G3↔S10: targets 38.6/21.7Å but partners are 13.8Å apart → too_close_together by 3.1Å
  - Q2↔S10: targets 40.3/21.7Å but partners are 15.9Å apart → too_close_together by 2.8Å
- **T6** — severity 2.88, 3 conflict(s); suspect input ~`Y12` (group: push_out)
  - push-out (wants farther): S15@17.7Å(now 15.0,conf 0.46)
  - S15↔Y12: targets 17.7/10.4Å but partners are 4.8Å apart → too_close_together by 2.5Å
  - S15↔D14: targets 17.7/11.6Å but partners are 3.9Å apart → too_close_together by 2.2Å
  - S10↔S15: targets 6.3/17.7Å but partners are 9.7Å apart → too_close_together by 1.7Å

## Secondary Structure (DSSP-like)

- helix(H)=20 · strand(E)=6 · 3-10(G)=1 · coil(C)=0

```
EEHGHHHHHHEHHHHHEHHHHHHHHEE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=12 · sheet=1
  - G3 ↔ S7  (helix)
  - T6 ↔ S10  (helix)
  - D8 ↔ Y12  (helix)
  - S10 ↔ D14  (helix)
  - Y12 ↔ R16  (helix)
  - D14 ↔ A18  (helix)
  - S15 ↔ Q19  (helix)
  - R16 ↔ D20  (helix)
  - A18 ↔ V22  (helix)
  - Q19 ↔ Q23  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - K11 ↔ R17  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=65 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9338 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
