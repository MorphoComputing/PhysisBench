# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1VII\seeds\seed_9\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 4.629 A
- tm_score_ca_ordered: 0.2049064794470666
- heavy_atom_rmsd: 6.004 A
- sidechain_heavy_atom_rmsd: 7.085 A
- **all-atom quality (honest):** heavy 6.004 A, sidechain 7.085 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 162
- bin_accuracy: 0.475

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F10-M12 → 61 conflicts (57%); F17 → 19 conflicts (18%); K32 → 13 conflicts (12%)
- explained: 93/106 conflicts by 3 root cause(s)
- metrics: hubs=17 (frac 0.5), conflicts/hub=6.2, max_incompat=10.96Å, chain_span=0.941
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F10-M12 + F17 + K32 — explain ~93/106 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 63.56, 33 conflict(s); suspect input ~`M12` (group: push_out)
  - pull-in (wants closer): G11@5.0Å(now 12.9,conf 0.94), M12@4.7Å(now 9.5,conf 0.38), Q25@4.7Å(now 7.8,conf 0.38), F6@4.9Å(now 8.8,conf 0.35)
  - push-out (wants farther): L34@16.6Å(now 9.9,conf 0.49)
  - G11↔P21: targets 5.0/8.7Å but partners are 23.4Å apart → too_far_apart by 9.7Å
  - G11↔Q25: targets 5.0/4.7Å but partners are 20.6Å apart → too_far_apart by 11.0Å
  - G11↔L20: targets 5.0/4.7Å but partners are 18.8Å apart → too_far_apart by 9.1Å
- **A18** — severity 27.88, 10 conflict(s); suspect input ~`G11` (group: pull_in)
  - pull-in (wants closer): G11@8.1Å(now 15.4,conf 0.67), K24@7.0Å(now 9.5,conf 0.58), M12@7.8Å(now 11.4,conf 0.52)
  - P21↔G11: targets 8.4/8.1Å but partners are 23.4Å apart → too_far_apart by 7.0Å
  - W23↔G11: targets 10.3/8.1Å but partners are 24.7Å apart → too_far_apart by 6.3Å
  - G11↔K24: targets 8.1/7.0Å but partners are 21.9Å apart → too_far_apart by 6.8Å
- **F10** — severity 13.04, 12 conflict(s); suspect input ~`K29` (group: push_out)
  - pull-in (wants closer): E4@10.6Å(now 14.4,conf 0.49), K29@4.9Å(now 9.3,conf 0.35), L1@5.2Å(now 8.3,conf 0.26), L28@5.5Å(now 10.0,conf 0.24)
  - push-out (wants farther): S15@8.8Å(now 3.4,conf 0.52)
  - E4↔K29: targets 10.6/4.9Å but partners are 21.8Å apart → too_far_apart by 6.3Å
  - D3↔K29: targets 9.3/4.9Å but partners are 19.1Å apart → too_far_apart by 4.9Å
  - E4↔L28: targets 10.6/5.5Å but partners are 22.3Å apart → too_far_apart by 6.2Å
- **N27** — severity 10.28, 9 conflict(s); suspect input ~`W23` (group: pull_in)
  - pull-in (wants closer): K32@5.0Å(now 10.7,conf 0.67), L34@9.0Å(now 14.9,conf 0.67), G33@7.5Å(now 13.5,conf 0.58), E31@4.0Å(now 7.6,conf 0.45)
  - K32↔W23: targets 5.0/4.0Å but partners are 12.6Å apart → too_far_apart by 3.6Å
  - L22↔K32: targets 6.2/5.0Å but partners are 13.5Å apart → too_far_apart by 2.3Å
  - G33↔W23: targets 7.5/4.0Å but partners are 14.9Å apart → too_far_apart by 3.4Å
- **K29** — severity 6.78, 7 conflict(s); suspect input ~`F10` (group: pull_in)
  - pull-in (wants closer): F10@4.9Å(now 9.3,conf 0.35)
  - push-out (wants farther): L34@12.4Å(now 8.9,conf 0.52), G33@9.4Å(now 6.6,conf 0.49)
  - W23↔F10: targets 9.1/4.9Å but partners are 17.8Å apart → too_far_apart by 3.8Å
  - L22↔F10: targets 9.1/4.9Å but partners are 17.5Å apart → too_far_apart by 3.5Å
  - F10↔Q26: targets 4.9/5.2Å but partners are 14.1Å apart → too_far_apart by 4.0Å
- **L28** — severity 6.11, 6 conflict(s); suspect input ~`F10` (group: pull_in)
  - pull-in (wants closer): F10@5.5Å(now 10.0,conf 0.24)
  - K24↔F10: targets 4.0/5.5Å but partners are 15.1Å apart → too_far_apart by 5.5Å
  - W23↔F10: targets 7.0/5.5Å but partners are 17.8Å apart → too_far_apart by 5.2Å
  - L22↔F10: targets 7.1/5.5Å but partners are 17.5Å apart → too_far_apart by 4.9Å

## Secondary Structure (DSSP-like)

- helix(H)=21 · strand(E)=8 · 3-10(G)=3 · coil(C)=2

```
EHHHEHHEHHHEHGHHHGHHHHHHHEHCGHEEEC
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=8 · sheet=6
  - S2 ↔ F6  (helix)
  - D3 ↔ K7  (helix)
  - F6 ↔ F10  (helix)
  - K7 ↔ G11  (helix)
  - G11 ↔ S15  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - W23 ↔ N27  (helix)
  - L1 ↔ A8  (sheet)
  - L1 ↔ M12  (sheet)
  - D5 ↔ M12  (sheet)
  - Q26 ↔ E31  (sheet)
  - Q26 ↔ K32  (sheet)
  - Q26 ↔ G33  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=130 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=40 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.7794 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
