# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_0\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.950 A
- tm_score_ca_ordered: 0.2757436545235335
- heavy_atom_rmsd: 5.181 A
- sidechain_heavy_atom_rmsd: 6.538 A
- **all-atom quality (honest):** heavy 5.181 A, sidechain 6.538 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 300
- bin_accuracy: 0.680

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** D8-Y12 → 21 conflicts (84%)
- explained: 21/25 conflicts by 1 root cause(s)
- metrics: hubs=10 (frac 0.37), conflicts/hub=2.5, max_incompat=3.46Å, chain_span=0.815
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): D8-Y12 — explain ~21/25 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y12** — severity 6.00, 6 conflict(s); suspect input ~`N27` (group: pull_in)
  - pull-in (wants closer): N27@20.0Å(now 22.6,conf 0.50)
  - S1↔N27: targets 21.8/20.0Å but partners are 44.6Å apart → too_far_apart by 2.9Å
  - N27↔T4: targets 20.0/14.2Å but partners are 36.6Å apart → too_far_apart by 2.3Å
  - N27↔D8: targets 20.0/7.2Å but partners are 29.4Å apart → too_far_apart by 2.1Å
- **L25** — severity 5.57, 4 conflict(s); suspect input ~`S10` (group: pull_in)
  - pull-in (wants closer): S10@21.7Å(now 24.6,conf 0.54)
  - S1↔S10: targets 44.5/21.7Å but partners are 19.4Å apart → too_close_together by 3.5Å
  - S10↔Q2: targets 21.7/40.3Å but partners are 16.1Å apart → too_close_together by 2.5Å
  - G3↔S10: targets 38.6/21.7Å but partners are 14.8Å apart → too_close_together by 2.2Å
- **N27** — severity 5.53, 5 conflict(s); suspect input ~`Y12` (group: pull_in)
  - pull-in (wants closer): Y12@20.0Å(now 22.6,conf 0.50)
  - Q2↔Y12: targets 43.1/20.0Å but partners are 19.7Å apart → too_close_together by 3.4Å
  - G3↔Y12: targets 40.2/20.0Å but partners are 17.9Å apart → too_close_together by 2.2Å
  - S1↔Y12: targets 44.5/20.0Å but partners are 22.2Å apart → too_close_together by 2.2Å
- **D8** — severity 3.09, 3 conflict(s); suspect input ~`V22` (group: pull_in)
  - pull-in (wants closer): F5@5.2Å(now 7.8,conf 0.55)
  - V22↔F5: targets 20.7/5.2Å but partners are 28.5Å apart → too_far_apart by 2.7Å
  - L25↔F5: targets 25.4/5.2Å but partners are 32.3Å apart → too_far_apart by 1.7Å
  - F5↔S15: targets 5.2/11.0Å but partners are 18.0Å apart → too_far_apart by 1.8Å
- **S10** — severity 2.10, 2 conflict(s); suspect input ~`T6` (group: pull_in)
  - pull-in (wants closer): L25@21.7Å(now 24.6,conf 0.54)
  - L25↔T6: targets 21.7/6.3Å but partners are 30.4Å apart → too_far_apart by 2.5Å
  - L25↔Q2: targets 21.7/15.8Å but partners are 39.5Å apart → too_far_apart by 2.0Å
- **F5** — severity 1.34, 1 conflict(s); suspect input ~`D8` (group: pull_in)
  - pull-in (wants closer): D8@5.2Å(now 7.8,conf 0.55)
  - W24↔D8: targets 33.2/5.2Å but partners are 25.6Å apart → too_close_together by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=7 · 3-10(G)=4 · coil(C)=3

```
CCCEGHEHEHEEHGHHHHHGEHHGHHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=6 · sheet=3
  - T6 ↔ S10  (helix)
  - L13 ↔ R17  (helix)
  - S15 ↔ Q19  (helix)
  - A18 ↔ V22  (helix)
  - Q19 ↔ Q23  (helix)
  - V22 ↔ M26  (helix)
  - T4 ↔ Y9  (sheet)
  - S7 ↔ Y12  (sheet)
  - F21 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=13 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=64 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9476 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
