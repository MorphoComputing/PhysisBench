# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked\1JRJ\seeds\seed_5\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 6.903 A
- tm_score_ca_ordered: 0.10994774933745677
- heavy_atom_rmsd: 7.581 A
- sidechain_heavy_atom_rmsd: 8.061 A
- **all-atom quality (honest):** heavy 7.581 A, sidechain 8.061 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 16
- distogram_pairs: 126
- bin_accuracy: 0.230

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K11-A17 → 107 conflicts (52%); G1-G3 → 61 conflicts (30%); S32-P35 → 12 conflicts (6%)
- explained: 180/206 conflicts by 3 root cause(s)
- metrics: hubs=30 (frac 0.811), conflicts/hub=6.9, max_incompat=18.77Å, chain_span=0.946
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K11-A17 + G1-G3 + S32-P35 — explain ~180/206 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E2** — severity 165.79, 35 conflict(s); suspect input ~`T6` (group: push_out)
  - push-out (wants farther): G33@47.3Å(now 35.9,conf 0.93), S32@47.0Å(now 28.0,conf 0.89), P35@41.8Å(now 35.4,conf 0.87), G28@43.8Å(now 37.8,conf 0.81), E14@23.2Å(now 18.9,conf 0.79), K11@19.0Å(now 16.1,conf 0.63), S10@17.1Å(now 13.4,conf 0.62)
  - S32↔T6: targets 47.0/11.3Å but partners are 16.9Å apart → too_close_together by 18.8Å
  - S32↔D8: targets 47.0/14.2Å but partners are 14.3Å apart → too_close_together by 18.6Å
  - S32↔S7: targets 47.0/12.5Å but partners are 16.2Å apart → too_close_together by 18.3Å
- **P35** — severity 42.47, 16 conflict(s); suspect input ~`P30` (group: push_out)
  - push-out (wants farther): G3@37.5Å(now 28.2,conf 0.98), E2@41.8Å(now 35.4,conf 0.87), L9@26.4Å(now 21.7,conf 0.79), Q12@22.4Å(now 18.1,conf 0.72), W24@8.4Å(now 3.6,conf 0.62)
  - G3↔S10: targets 37.5/24.0Å but partners are 6.9Å apart → too_close_together by 6.6Å
  - G3↔P30: targets 37.5/6.8Å but partners are 22.9Å apart → too_close_together by 7.8Å
  - G3↔A17: targets 37.5/13.9Å but partners are 17.1Å apart → too_close_together by 6.5Å
- **T4** — severity 39.65, 11 conflict(s); suspect input ~`I22` (group: push_out)
  - push-out (wants farther): N27@37.4Å(now 31.8,conf 0.96), P30@37.6Å(now 25.2,conf 0.95), P37@27.8Å(now 24.0,conf 0.92), L20@26.4Å(now 23.4,conf 0.80)
  - F21↔P30: targets 27.5/37.6Å but partners are 3.6Å apart → too_close_together by 6.6Å
  - P30↔I22: targets 37.6/27.8Å but partners are 3.9Å apart → too_close_together by 6.0Å
  - P30↔L20: targets 37.6/26.4Å but partners are 5.0Å apart → too_close_together by 6.2Å
- **G29** — severity 38.14, 13 conflict(s); suspect input ~`S32` (group: push_out)
  - push-out (wants farther): F5@32.6Å(now 25.3,conf 0.97), G3@37.7Å(now 28.0,conf 0.94), Q12@22.6Å(now 16.8,conf 0.74), A17@14.5Å(now 12.0,conf 0.62)
  - G3↔S32: targets 37.7/5.5Å but partners are 21.1Å apart → too_close_together by 11.2Å
  - F5↔S32: targets 32.6/5.5Å but partners are 18.5Å apart → too_close_together by 8.6Å
  - Q12↔S32: targets 22.6/5.5Å but partners are 10.2Å apart → too_close_together by 6.9Å
- **G28** — severity 35.76, 6 conflict(s); suspect input ~`S10` (group: push_out)
  - push-out (wants farther): G1@47.5Å(now 32.1,conf 0.98), S10@27.7Å(now 24.9,conf 0.93), E2@43.8Å(now 37.8,conf 0.81), I22@10.2Å(now 7.2,conf 0.62)
  - G1↔S10: targets 47.5/27.7Å but partners are 7.8Å apart → too_close_together by 11.9Å
  - G1↔E14: targets 47.5/21.7Å but partners are 13.9Å apart → too_close_together by 11.8Å
  - G1↔I22: targets 47.5/10.2Å but partners are 26.7Å apart → too_close_together by 10.6Å
- **E14** — severity 32.27, 10 conflict(s); suspect input ~`A17` (group: push_out)
  - push-out (wants farther): E2@23.2Å(now 18.9,conf 0.79), S32@23.1Å(now 12.9,conf 0.78), P30@20.9Å(now 14.9,conf 0.66)
  - S32↔A17: targets 23.1/5.4Å but partners are 5.8Å apart → too_close_together by 11.9Å
  - P30↔A17: targets 20.9/5.4Å but partners are 7.7Å apart → too_close_together by 7.8Å
  - S32↔V18: targets 23.1/6.8Å but partners are 8.8Å apart → too_close_together by 7.5Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=8 · 3-10(G)=4 · coil(C)=0

```
EEHHEHHHHHGEHGHEHHEEHHHHGHHGHHHHHHHHE
```

## Backbone H-bond Network

- total=19 · helix(i→i+4)=14 · sheet=5
  - G3 ↔ S7  (helix)
  - T4 ↔ D8  (helix)
  - T6 ↔ S10  (helix)
  - L9 ↔ M13  (helix)
  - M13 ↔ A17  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - E23 ↔ N27  (helix)
  - K26 ↔ P30  (helix)
  - N27 ↔ S31  (helix)
  - P30 ↔ A34  (helix)
  - S31 ↔ P35  (helix)
  - S32 ↔ P36  (helix)
  - F5 ↔ Q12  (sheet)
  - Q12 ↔ R19  (sheet)
  - Q12 ↔ L20  (sheet)
  - R19 ↔ P37  (sheet)
  - L20 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=21 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=183 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=85 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.4586 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=16 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
