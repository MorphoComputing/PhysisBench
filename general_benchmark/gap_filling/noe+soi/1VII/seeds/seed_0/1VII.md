# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1VII\seeds\seed_0\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 6.897 A
- tm_score_ca_ordered: 0.08292541581394675
- heavy_atom_rmsd: 7.879 A
- sidechain_heavy_atom_rmsd: 8.467 A
- **all-atom quality (honest):** heavy 7.879 A, sidechain 8.467 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 11
- distogram_pairs: 160
- bin_accuracy: 0.594

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** F17 → 21 conflicts (54%); F10 → 13 conflicts (33%)
- explained: 34/39 conflicts by 2 root cause(s)
- metrics: hubs=8 (frac 0.235), conflicts/hub=4.9, max_incompat=5.96Å, chain_span=0.735
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): F17 + F10 — explain ~34/39 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **F17** — severity 18.84, 14 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): R14@4.0Å(now 7.4,conf 0.45), Q25@4.7Å(now 7.7,conf 0.38), K29@5.2Å(now 7.8,conf 0.26)
  - R14↔Q25: targets 4.0/4.7Å but partners are 14.6Å apart → too_far_apart by 6.0Å
  - T13↔Q25: targets 4.7/4.7Å but partners are 14.5Å apart → too_far_apart by 5.2Å
  - K24↔R14: targets 9.0/4.0Å but partners are 17.1Å apart → too_far_apart by 4.1Å
- **F10** — severity 8.68, 8 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): K29@4.9Å(now 10.4,conf 0.35), R14@5.2Å(now 8.7,conf 0.26)
  - T13↔K29: targets 5.1/4.9Å but partners are 14.8Å apart → too_far_apart by 4.8Å
  - D5↔K29: targets 7.3/4.9Å but partners are 16.8Å apart → too_far_apart by 4.6Å
  - E4↔K29: targets 10.1/4.9Å but partners are 18.5Å apart → too_far_apart by 3.6Å
- **R14** — severity 4.73, 6 conflict(s); suspect input ~`F17` (group: pull_in)
  - pull-in (wants closer): F17@4.0Å(now 7.4,conf 0.45), F10@5.2Å(now 8.7,conf 0.26)
  - L20↔F17: targets 13.2/4.0Å but partners are 6.2Å apart → too_close_together by 2.9Å
  - F17↔P21: targets 4.0/15.0Å but partners are 8.9Å apart → too_close_together by 2.1Å
  - A18↔F17: targets 8.7/4.0Å but partners are 2.8Å apart → too_close_together by 1.9Å
- **L1** — severity 3.89, 3 conflict(s); suspect input ~`L34` (group: push_out)
  - push-out (wants farther): E4@8.0Å(now 4.8,conf 0.72), K7@6.5Å(now 3.2,conf 0.67), L34@16.2Å(now 9.7,conf 0.34)
  - F6↔L34: targets 4.7/16.2Å but partners are 6.2Å apart → too_close_together by 5.3Å
  - L34↔F10: targets 16.2/5.2Å but partners are 6.6Å apart → too_close_together by 4.3Å
  - L34↔R14: targets 16.2/5.2Å but partners are 7.2Å apart → too_close_together by 3.8Å
- **D3** — severity 2.56, 2 conflict(s); suspect input ~`F6` (group: pull_in)
  - pull-in (wants closer): F6@4.0Å(now 8.0,conf 0.45)
  - V9↔F6: targets 8.7/4.0Å but partners are 1.6Å apart → too_close_together by 3.0Å
  - F10↔F6: targets 11.1/4.0Å but partners are 4.4Å apart → too_close_together by 2.7Å
- **F6** — severity 2.54, 4 conflict(s); suspect input ~`F17` (group: push_out)
  - pull-in (wants closer): S2@4.4Å(now 8.8,conf 0.69), D3@4.0Å(now 8.0,conf 0.45)
  - push-out (wants farther): V9@4.3Å(now 1.6,conf 0.41)
  - S2↔F17: targets 4.4/4.9Å but partners are 11.7Å apart → too_far_apart by 2.5Å
  - D3↔F17: targets 4.0/4.9Å but partners are 11.1Å apart → too_far_apart by 2.1Å
  - S2↔M12: targets 4.4/5.5Å but partners are 11.9Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=14 · 3-10(G)=1 · coil(C)=3

```
CHHHEHHEEEGEECHEEEHHHHHEHHHEHHEEEC
```

## Backbone H-bond Network

- total=53 · helix(i→i+4)=7 · sheet=46
  - S2 ↔ F6  (helix)
  - D3 ↔ K7  (helix)
  - S15 ↔ N19  (helix)
  - N19 ↔ W23  (helix)
  - P21 ↔ Q25  (helix)
  - W23 ↔ N27  (helix)
  - Q25 ↔ K29  (helix)
  - D5 ↔ F10  (sheet)
  - D5 ↔ M12  (sheet)
  - D5 ↔ T13  (sheet)
  - D5 ↔ A16  (sheet)
  - D5 ↔ F17  (sheet)
  - D5 ↔ A18  (sheet)
  - A8 ↔ T13  (sheet)
  - A8 ↔ A16  (sheet)
  - A8 ↔ F17  (sheet)
  - A8 ↔ A18  (sheet)
  - A8 ↔ L28  (sheet)
  - V9 ↔ A16  (sheet)
  - V9 ↔ F17  (sheet)
  - … +33 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=182 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=95 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.2032 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=11 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
